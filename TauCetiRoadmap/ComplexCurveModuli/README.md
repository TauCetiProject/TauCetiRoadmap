# Roadmap: analytic families and moduli of complex curves

**Summary.** This roadmap builds the analytic theory of compact complex curves with nodes and marked
points, their holomorphic families, and the Deligne–Mumford moduli of stable pointed curves, using
Robbin and Salamon's Hardy-gluing method. A *prestable curve* of genus g with n marks is given by
finitely many compact connected Riemann surfaces (the components of its normalization), finitely
many pairs of distinct points on them, each pair glued to a node, and n ordered distinct marks away
from the nodes, the glued space being connected. Its genus is the sum of the genera of the
components plus the first Betti number of the dual graph. It is *stable* when every component of
genus g_v with n_v special points (marks and node branches) has 2g_v − 2 + n_v > 0. The families are
restricted analytic nodal families: proper holomorphic maps onto finite-dimensional complex
manifolds, with compact connected nodal fibres and disjoint holomorphic sections for the marks,
which near each node are the hypersurface xy = s(b) for a holomorphic function s on the base. The
function s may vanish identically (a permanent node) or to higher order, as in xy = b², where the
total space is singular.

The first headline theorem is universality. Every stable curve C of genus g with n marks has a
universal unfolding over a complex manifold of dimension 3g − 3 + n: every restricted family with a
fibre identified with C is, near that fibre, the pullback of the universal family by a unique
holomorphic map and a unique isomorphism extending the identification, including families with
permanent nodes and singular total spaces. Every prestable curve has a miniversal unfolding, whose
classifying maps are unique only to first order.

The second is compactness. For 2g − 2 + n > 0 the stable curves and their isomorphisms form a proper
étale complex groupoid on a countable union of universal bases. Its orbit space, the coarse moduli
space, is compact, Hausdorff and second countable, and near a curve C it is the quotient of a
neighbourhood in a universal base by the finite group Aut(C), which may act with a kernel. The third
is uniformization of finite type: every Riemann surface of finite type with negative Euler
characteristic carries a unique complete finite-area hyperbolic metric in its conformal class, a
compact bordered one a unique hyperbolic metric with geodesic boundary, and a marked nodal curve has
finitely many automorphisms exactly when it is stable.

The analytic spaces come from ComplexComparisonPartII, and the Cauchy–Riemann and Fredholm analysis
from PseudoholomorphicCurveAnalysis. The proper étale groupoid goes to Orbifolds for its coarse
topology and weighted Poincaré pairing, and the domain theory to AnalyticStableMaps. StableReduction
is the scheme-theoretic counterpart, compared on explicit examples.

## How to read the build

Layer 0 below treats single components: classification of surfaces, Riemann–Roch for
Cauchy–Riemann operators, genus zero and one, hyperbolic metrics, properness of the diffeomorphism
action. Layer 1 builds nodal curves and their isomorphisms, Layer 2 the restricted families and the
algebra of nodes, Layer 3 linear deformation theory, Sobolev spaces on circles and holomorphic
slices, Layer 4 Hardy gluing and universal unfoldings. Layer 5 assembles the countable étale chart
groupoid, Layer 6 proves compactness and properness and builds finite action charts, Layer 7
constructs the universal curve, forgetful maps, clutching and scheme comparisons, and Layer 8
instantiates the orbifold theory and computes the low-genus moduli spaces.
Layers 0–4 run in order, with §§0.1e, 0.3 and 0.4 needed again in Layer 6; Layers 5–8 follow Layer 4
in
order, and Layer 7 needs only Layers 1, 2, 4 and 5. Each section's *Needs:* line lists the inputs of
its statement and of its route, so that a target proved by another route is not blocked behind an
unrelated section. Other roadmaps cite these sections as D0–D8: item n of Dk is §k.n.

## Conventions

1. **Components.** A component is a compact connected Hausdorff Riemann surface in Mathlib's
   vocabulary: a type with `ChartedSpace ℂ` and `IsManifold 𝓘(ℂ) ω`, holomorphic maps being
   `MDifferentiable` (equivalently analytic) maps; no second type of Riemann surfaces is
   introduced. The sphere is `OnePoint ℂ` with Tau Ceti's manifold structure, and a complex torus
   is `ℂ ⧸ Λ` for a lattice Λ (ComplexTori Milestone 1). The genus of a component is the
   topological genus, `χ = 2 − 2g` with Tau Ceti's Euler characteristic `TauCeti.eulerChar` of a
   space of finite CW type.

2. **Prestable curves.** A prestable curve has a finite nonempty family of components (Σ_v), a
   finite set of node flags, which are distinct points of the disjoint union, with a
   fixed-point-free pairing, and n ordered distinct marks away from the flags. A self-node is given
   by two different flags on the same component. The dual graph G has the components as vertices
   and the flag pairs as edges; it is connected, equivalently the glued space is connected, so empty
   and disconnected curves are excluded. The arithmetic genus is `g = Σ g_v + b₁(G)`, with
   `b₁(G) = #edges − #vertices + 1`. In Lean the data is Tau Ceti's
   `TauCeti.NodalGluing.FlagPairData` with a `TauCeti.NodalGluing.Marking`, the glued curve is
   `TauCeti.NodalGluing.GluedCurve`, and an isomorphism is a `TauCeti.NodalGluing.Iso` for the
   model `𝓘(ℂ)` and smoothness ω; these carriers assume neither compactness nor connectedness,
   which are hypotheses on the statements that use them.

3. **Stability.** The special points of a component are its flags and its marks, n_v in number.
   The curve is stable when `2g_v − 2 + n_v > 0` for every component, equivalently
   `χ(Σ_v) < n_v`; node branches count as special points. The prestable curves include
   components of genus zero with at most two special points and of genus one with none; these
   have positive-dimensional automorphism groups, are needed by moduli of maps, and are not
   orbifold points of the moduli of stable curves. Isomorphisms may permute components, branches
   and, where permitted, labels; every automorphism is kept, including those acting trivially on a
   deformation base.

4. **Bases and families.** Bases are finite-dimensional Hausdorff second-countable complex
   manifolds. Δ is an open coordinate disc. A restricted analytic nodal family π : P → B is proper,
   with compact connected reduced nodal fibres and disjoint holomorphic sections in the smooth
   locus, and is locally isomorphic to a product `U × Δ` or to a node chart
   `N_s = {(b, x, y) ∈ U × Δ² | xy = s(b)}` with s holomorphic on U, with the quotient sheaf of
   holomorphic germs. The total space of N_s can be singular. Closed discs and annuli used in a
   Hardy decomposition are compact subdomains of larger open charts. The universal smoothing of one
   node is `xy = a` with a a base coordinate; a pullback to a one-dimensional base has `a = s(t)`,
   with s either zero or a unit times `t^m` after centring. Permanent nodes and `xy = b²` are
   therefore families.

5. **Analytic spaces.** Families live in the category of complex analytic spaces of
   ComplexComparisonPartII §C-1.1 (`ComplexAnalyticSpace`, locally ringed spaces locally
   isomorphic to closed analytic subspaces of open sets of ℂⁿ), with complex manifolds included by
   §2.0. Each node chart is a closed analytic subspace of a product manifold, and open gluing and
   fibre products are §C-1.1's operations. This roadmap constructs the node charts and their family
   theorems; it does not build a second category of analytic spaces. The node equations are proved
   reduced (§2.1); the generic carrier keeps nilpotents on other spaces.

6. **Morphisms of families.** A morphism of families over a holomorphic base map φ : A → B is a
   Cartesian isomorphism `P ≅ φ*Q` preserving the sections and designated flags, with its induced
   map of total spaces; morphisms compose by the base-change associators of §2.3. A contraction
   (Layer 7) is a different kind of map. The composition of two curve projections is not a family
   of curves. For each fixed base germ, families and their isomorphisms form a groupoid; arbitrary
   base maps act contravariantly by pullback and are not arrows of that groupoid.

7. **Signs and analytic conventions.** `∂̄ = (du + J du j)/2`. Every infinitesimal action and Lie
   bracket of a source is compared with the native convention; the bracket of Robbin and Salamon
   satisfies `L_[v,w] = L_w L_v − L_v L_w` (§3.6). The corrected statement of the Robbin–Salamon
   corrigendum governs integrability of finite-dimensional families. Where HeegaardFloer's
   Conley–Zehnder index is used at an end, `CZ = −μ_RS` (HeegaardFloer F1.4); no other index
   convention is introduced. The Laplacian `Δ = −div grad` is nonnegative. On a boundary circle,
   `H^s` has the weight `(1 + |n|)^(2s)` on `|a_n|²`.

8. **Names and citations.** The acceptance file `Suggested.lean` states its theorems in
   `TauCetiRoadmap.ComplexCurveModuli`. A name in code font that is not a Mathlib, Tau Ceti or
   other-roadmap declaration is one of those statements. Exports cited by other roadmaps under a
   proposed name carry it in italics ("cited as *finiteActionUniversalChart*"). Robbin–Salamon 2006
   is the paper on the Deligne–Mumford orbifold and "the corrigendum" its 2007 correction
   (References); a numbered locator such as "Robbin–Salamon 2006, 11.4" refers to that paper, with
   the numbering of its arXiv version.

<a id="d0-smooth-curves-finite-type-and-the-classification-floor"></a>

## Layer 0: smooth surfaces, compact Riemann surfaces and uniformization

This layer treats one component at a time: compact oriented surfaces with labelled boundary and
marks, compact Riemann surfaces of genus zero and one, hyperbolic metrics, and the action of
diffeomorphisms on complex structures. Sections 0.1a–0.1f together are §0.1.

### 0.1a Oriented normal forms with labelled boundary

GeometricTopology §1.7 classifies compact connected smooth surfaces: each is diffeomorphic to
exactly one standard model, and an orientable one of Euler characteristic χ with b boundary circles
has genus `g = (2 − χ − b)/2`. This section owns the oriented, labelled and collared form of that
classification used by the domain theory. For a compact connected oriented smooth surface Σ with
finitely many labelled boundary circles, specified product collars and finitely many ordered
distinct interior marks, construct an orientation-preserving diffeomorphism onto the standard
oriented model of the same genus and number of boundary circles, carrying each labelled boundary
circle to the circle of the same label, with its side and collar jet. Obtain it from the
diffeomorphism of GeometricTopology §1.7, composed if necessary with an orientation-reversing
diffeomorphism of the model, then with the boundary extensions of §0.1d and the supported
isotopies of §0.1c. The combinatorial polygon word of the model is bookkeeping only.
*Needs:* GeometricTopology §1.7 (classification, genus), §1.1 (collars); §0.1c, §0.1d.

### 0.1b Euler characteristic, boundary count and genus

Prove `χ = 2 − 2g − b` for the standard oriented model by its finite cell structure, and that
(g, b) is an invariant: b is the number of boundary components, and capping the b boundary circles
by discs, with the boundary maps extended across the caps, gives `χ(cap M) = χ(M) + b` by homotopy
invariance and excisive additivity of the Euler characteristic, so `g = (2 − b − χ(M))/2`. The
argument applies to the oriented smooth surface before any complex structure is chosen and uses
no Fuchsian bordered-surface theory. On a closed complex component, prove that this genus equals
the topological genus of FuchsianOrbifolds Layer 5, item 1, defined by `χ = 2 − 2g`. Prove the
orientation-preserving diffeomorphism classification of compact connected oriented surfaces by
(g, b), with labelled boundary circles, from §0.1a and these invariants.
*Needs:* §0.1a; AlgebraicTopology §§7.1–7.3 (Euler characteristic of finite CW types, homotopy
invariance, additivity); FuchsianOrbifolds Layer 5; GeometricTopology §1.7.

**Checks.**
- The pair of pants and the one-holed torus both have `χ = −1`, with b = 3 and b = 1; the formula
  gives g = 0 and g = 1. The Euler characteristic alone does not classify bordered surfaces, so a
  classification by χ without b would identify them.
- Capping the annulus (χ = 0, b = 2) gives the sphere, `χ = 0 + 2 = 2`, and g = 0.

### 0.1c Supported isotopies of ordered discs and points

Tau Ceti proves, for a Hausdorff boundaryless manifold of real dimension greater than one and a
preconnected open subset U, that two finite ordered configurations of orientation-preserving discs
with collars in U, with pairwise disjoint images, are related on any compact subset by a
diffeotopy supported in a compact subset of U
(`TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_pairwise_disjoint`), and that two finite
ordered configurations of distinct points of U are related by such a diffeotopy
(`TauCeti.exists_diffeotopy_final_comp_eq_of_isPreconnected`). Prove the adapter that applies them
on a connected oriented surface with prescribed disjoint protected closed discs and an open outer
boundary collar: the complement U of the protected discs and of the closed collar in the interior
of the surface is open and connected, a diffeotopy of the interior fixing the complement of a
compact subset of U extends by the identity to the whole surface, and it fixes the protected
discs and the collar. This gives the supported ordered disc isotopy (cited as
*surfaceOrderedDiscIsotopy*) and the supported point-pushing isotopies, avoiding all other marks
and the protected sets.
*Needs:* Tau Ceti `TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_pairwise_disjoint`,
`TauCeti.exists_diffeotopy_final_comp_eq_of_isPreconnected`, `TauCeti.Diffeotopy`.

**Checks.**
- On the circle the ordered triples (0, 1/3, 2/3) and (0, 2/3, 1/3) have opposite cyclic orders,
  which every diffeotopy preserves, so neither is carried to the other: the hypothesis that the
  dimension exceeds one is needed. On a surface, removing finitely many disjoint closed discs from
  the interior and a closed collar of the boundary leaves a connected open set, while removing an
  arc joining two boundary points of a disc would disconnect it.

### 0.1d Boundary extension

Extend each prescribed orientation-compatible diffeomorphism of a boundary circle to a product
collar and then to the surface: lift the circle map to a monotone degree-one map of ℝ, interpolate
through circle diffeomorphisms, and cut off radially. Prove the relative and collar matching laws:
the extension equals the prescribed map on the boundary, is a product near it, and is the identity
outside the collar.
*Needs:* Tau Ceti `AddCircle.diffeotopyOfLift`, `AddCircle.collarDiffeomorphOfLift`,
`TauCeti.Diffeotopy.exists_extend_of_isCompact`; GeometricTopology §1.1.

### 0.1e Marked classification and cut systems

Compose the normal form of §0.1a with the supported isotopies of §0.1c and the boundary extensions
of §0.1d to prove the classification retaining every designated label, side and collar. Apply it
to cut surfaces: two disjoint systems of essential simple closed curves with the same labelled
complement and branch signature are related by an orientation-preserving diffeomorphism matching
the two sides of each curve and their re-gluing collars. No uniqueness up to isotopy and no finite
list of all isotopy classes is asserted. This supplies the standard normalization surfaces, the
finitely many cut-system types and the finitely many stable dual-graph types for fixed (g, n).
*Needs:* §§0.1a–0.1d.

### 0.1f The analytic genus and holomorphic one-forms

Consume ModularForms §10B's theorem that the analytic genus equals the topological genus for every
connected compact Riemann surface; its prerequisites, including the existence of a nonconstant
meromorphic function, belong to that roadmap. Transport ComplexKahlerGeometry's Serre duality
(§5.10) and that equality to `dim_ℂ H⁰(K_Σ) = g_top` on the components used here.
*Needs:* ModularForms §10B; ComplexKahlerGeometry §5.10; FuchsianOrbifolds Layer 5.

### 0.2 Riemann–Roch for Cauchy–Riemann operators on line bundles

Transport the real Riemann–Roch formula of PseudoholomorphicCurveAnalysis §7.2 through complex
linearity to `ind_ℂ ∂̄_L = deg L + 1 − g` for a holomorphic line bundle L on a compact connected
Riemann surface of genus g, and compare it with ModularForms §10B's cohomological divisor
Riemann–Roch through the bundle, Dolbeault and Serre maps of ComplexKahlerGeometry §4.1 and §5.10.
This section owns that comparison, not a second cohomological Riemann–Roch. In particular
`deg TΣ = 2 − 2g` and `ind_ℂ ∂̄_{TΣ(−D)} = 3 − 3g − |D|`. Transport holomorphic zero counting and
the vanishing of holomorphic sections of negative degree to these carriers. Consume the
branched-cover Euler characteristic and Riemann–Hurwitz formula of FuchsianOrbifolds Layer 5
(proved in Tau Ceti as
`TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`);
if a canonical-divisor form is used, construct its comparison with Tau Ceti's ramification divisor
rather than claim that a native Riemann–Hurwitz formula with canonical divisors exists. Compare an
operator with point constraints on smooth or `W^(k,p)` sections with the twisted Dolbeault complex
by its restriction exact sequence: a smooth section vanishing at p need not be smoothly divisible
by a holomorphic coordinate, so the two Banach domains are not identified literally.
*Needs:* PseudoholomorphicCurveAnalysis §7.2; ModularForms §10B; ComplexKahlerGeometry §§4.1,
5.10; FuchsianOrbifolds Layer 5; Tau Ceti `TauCeti.RiemannSurface.ramificationDivisor`.

**Checks.**
- On the sphere with three marks, `3 − 3·0 − 3 = 0`: no infinitesimal automorphisms and no
  deformations. On a torus with one mark it is `−1`: `H⁰ = 0` and `H¹` is one-dimensional (the
  j-line). On a closed surface of genus two it is `−3`. A formula with `2 − 2g − |D|` (the degree)
  in place of the index would give `−1`, `−1` and `−2`.

### 0.3 Genus zero and genus one

For genus zero, consume HeegaardFloer F2.6a (§4.6a): the classification by `O(p)` and degree one,
and the jointly holomorphic Möbius action with its normalization of triples, on the fixed sphere
`OnePoint ℂ`, proved with Tau Ceti's `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`. Construct
the family, slice and carrier comparisons needed here; do not reprove the sphere theorem or depend
on the nonlinear sphere moduli of that roadmap.

For genus one, prove `exists_zlattice_nonempty_diffeomorph_of_eulerChar_eq_zero`: a compact
connected Riemann surface Σ of Euler characteristic zero is biholomorphic to `ℂ ⧸ Λ` for a lattice
Λ, the fixed-lattice quotient carrier of Tau Ceti (ComplexTori Milestone 1); Robbin–Salamon 2006,
8.1 and the consequence drawn after it, obtain this from the flat metric of the uniformization
theorem, which the route below does not use. Route: take a nonzero holomorphic one-form ω (§0.1f),
whose divisor has degree zero and is therefore zero. On an oriented polygonal homology basis (a, b)
with periods A and B, prove the bilinear relation `∫_Σ i ω ∧ conj(ω) = 2 Im(conj(A) B) > 0`; every
period is an integer combination of A and B, so `Λ = ℤA + ℤB` is a discrete lattice of rank two.
Integration of ω modulo Λ defines a holomorphic map `Σ → ℂ ⧸ Λ`; comparing the area of Σ with that
of the period parallelogram shows that it has degree one, and
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne` concludes. Choosing A first gives `τ = B/A` in the
upper half-plane. No existence theorem for universal covers is assumed. Construct the local
dependence of the periods on a family, and keep the translations and the full stabilizer of the
lattice, including −1. A fixed lattice quotient alone does not prove the classification.
*Needs:* HeegaardFloer F2.6a; §0.1f; ComplexTori Milestone 1; Tau Ceti
`TauCeti.RiemannSurface.biholomorphOfDegreeEqOne`, `TauCeti.eulerChar`,
`Diffeomorph.finite_fixingSubgroup_iff_nonempty`.

**Checks.**
- For `Λ = ℤ + ℤτ` and `ω = dz`, `i dz ∧ dz̄ = 2 dx ∧ dy`, so the left side is twice the area
  `Im τ`, and `2 Im(conj(1)·τ) = 2 Im τ`: the two sides agree, with the factor two. Without the
  conjugate the right side `2 Im(AB)` would change sign under `ω ↦ iω`.
- The automorphisms of `(ℂ ⧸ Λ, 0)` form ℤ/2 for a generic lattice, ℤ/4 for `ℤ[i]` and ℤ/6 for
  `ℤ[e^(2πi/3)]`; a stabilizer omitting −1 would be trivial for a generic lattice.

### 0.4 Uniformization of finite-type and bordered components

Own finite-type uniformization for every stable punctured component, including punctured spheres and
punctured tori, and for compact bordered components with geodesic boundary. For negative Euler
characteristic, construct a complete finite-area metric of curvature −1 in the given conformal class
(Robbin–Salamon 2006, 17.3, which deduces it from the uniformization theorem). Fix the nonnegative
Laplacian `Δ = −div grad`, so that the equation for `g = e^(2u) g₀` is `Δ₀u + K₀ + e^(2u) = 0`.

*Closed surfaces.* Prove `exists_hyperbolicMetric_metric_eq_rescale_of_eulerChar_neg`: on a closed
connected surface M of negative Euler characteristic, every smooth Riemannian metric g is
conformal to a hyperbolic metric. Tau Ceti reduces existence to a smooth solution of the curvature
equation (`Bundle.ContMDiffRiemannianMetric.exists_hyperbolicMetric_metric_eq_rescale_iff`) and
proves uniqueness (`TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale`). Construct the solution by
lower and upper barriers and the coercive normalized variational or continuity argument, with the
two-dimensional exponential estimate, the inverse of the Poisson equation and the elliptic
bootstrap, from the compact elliptic theory.

*Cusps.* Prove `exists_hyperbolicMetric_hasFiniteVolume_metric_eq_rescale_of_eulerChar_lt_card`: if
M is a closed connected surface and P ⊂ M a finite set with `χ(M) < |P|`, then for every smooth
Riemannian metric g on M the restriction of g to `M ∖ P` is conformal to a complete hyperbolic
metric of finite area on `M ∖ P`. Near each puncture choose the explicit cusp metric
`(dt² + dθ²)/t²`, `t = −log|z|`, outside a compact core. Define weighted Hölder norms `C^(k,α)_δ` by
the cusp chart, scaled derivatives and the weight `t^δ`, for `0 < δ < 1`. Construct the uniform
exhaustion estimates and the inverse of the linearization `Δ_g + 2` on this scale, including the
barriers `t^(−δ)` and the excluded indicial roots, then the bounded nonlinear solution and its
expansion at the end. Prove completeness, finite area and the Gauss–Bonnet area normalization.
Prove `eq_of_metric_eq_rescale_restrictOpenTangentSpace`: two complete hyperbolic metrics on
`M ∖ P` conformal to the restriction of g are equal, by the maximum principle or the Schwarz lemma.
It needs no bound on |P|, since for `χ(M) ≥ |P|` no complete hyperbolic metric is conformal to the
restriction of g.

*Boundary.* For a smooth Riemannian metric g on a surface M with boundary, modelled on the closed
half-plane (Mathlib's `𝓡∂ 2`), define `HasGeodesicBoundary g`: every C² curve ℝ → M that lies in
the boundary and has unit g-speed is a geodesic of g (Tau Ceti `TauCeti.Manifold.IsGeodesicCurve`).
On a compact surface these curves are the unit-speed parametrizations of the boundary circles. Along
such a curve γ the covariant acceleration is orthogonal to γ′, by unit speed, and its component
along the inward unit normal is `II(γ′, γ′)`, for the second fundamental form II of the boundary
(RiemannianManifoldsWithConvexBoundary §1.4); so on a compact surface `HasGeodesicBoundary g` holds
exactly when II vanishes, that is, when the boundary has geodesic curvature zero. Prove
`exists_hyperbolicMetric_metric_eq_rescale_hasGeodesicBoundary_of_eulerChar_neg`: if M is a compact
connected surface with boundary and `χ(M) < 0`, every smooth Riemannian metric g on M is conformal
to a hyperbolic metric with geodesic boundary. Prove
`eq_of_metric_eq_rescale_of_hasGeodesicBoundary`: on a compact connected surface with boundary, two
hyperbolic metrics with geodesic boundary conformal to the same g are equal. Robbin–Salamon 2006,
17.3, gives both for oriented surfaces; a non-orientable M reduces to its orientation double cover
by uniqueness. Construct holomorphic half-disc and collar coordinates at the boundary, the
holomorphic double and its reflection; uniqueness on the double makes its metric invariant under
the reflection and the boundary geodesic. A hyperbolic metric with geodesic boundary doubles, by
even reflection in Fermi coordinates, to a hyperbolic metric on the holomorphic double, so
uniqueness follows from the closed case.

Include C∞ dependence on compact subsets and uniform cusp and boundary templates for nearby smooth
structures, with explicit estimates under the weighted and exhaustion hypotheses. No general
uniformization theorem and no theorem of Hummel is assumed as a property or an external proof, and
the fixed quotient examples of FuchsianOrbifolds and the complex tori of ComplexTori do not supply
uniformization in every genus.
*Needs:* Tau Ceti `TauCeti.HyperbolicMetric`, `TauCeti.HyperbolicMetric.HasFiniteVolume`,
`Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`,
`Bundle.ContMDiffRiemannianMetric.exists_hyperbolicMetric_metric_eq_rescale_iff`,
`TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale`, `Bundle.ContMDiffRiemannianMetric.rescale`,
`TauCeti.Manifold.IsGeodesicCurve`, `TauCeti.eulerChar`; Mathlib `ModelWithCorners.boundary`,
`modelWithCornersEuclideanHalfSpace`; PDE §§1.1, 1.4, 1.7; ComplexKahlerGeometry §5.10 (compact
elliptic theory); RiemannianManifoldsWithConvexBoundary §1.4 (the second fundamental form of the
boundary).

**Checks.**
- With `t = −log|z|`, `|dz|/|z| = (dt² + dθ²)^(1/2)`, so the cusp metric is
  `|dz|²/(|z|² log²|z|)`, the hyperbolic metric of the punctured disc, of curvature −1.
- The linearization `Δ_g + 2` on functions of t alone in the cusp is `−t² ∂_t² + 2`, with indicial
  roots t² and t^(−1), and for `0 < δ < 1` the decay `t^(−δ)` lies strictly between them. The
  barrier computation `(−t² ∂_t² + 2) t^(−δ) = (2 − δ − δ²) t^(−δ)` gives a positive multiple for
  `0 < δ < 1` and, for δ > 0, vanishes only at δ = 1, the indicial weight; there
  `(−t² ∂_t² + 2) u = t^(−1)` has the solution `u = (1/3) t^(−1) log t`, which is not `O(t^(−1))`,
  so the linearization is not invertible on the scale of weight one. Finiteness of the weighted
  norm of t^(−1) does not single out δ = 1: it holds for every δ ≤ 1.
- The thrice-punctured sphere has area `2π(2·0 − 2 + 3) = 2π` by Gauss–Bonnet, and a closed
  surface of genus two has area 4π. With geodesic boundary, Gauss–Bonnet gives area `−2πχ`: 2π for
  a pair of pants, and 0 for an annulus, which therefore carries no hyperbolic metric with geodesic
  boundary, so `χ(M) < 0` cannot be weakened to `χ(M) ≤ 0`.
- On the flat cylinder `[0, 1] × ℝ/2πℤ` the unit-speed boundary curves `t ↦ (0, ±t + c)` and
  `t ↦ (1, ±t + c)` have zero acceleration, so its metric has geodesic boundary; on the flat closed
  unit disc the boundary curve `t ↦ (cos t, sin t)` has unit speed and acceleration
  `−(cos t, sin t) ≠ 0`, so its metric does not. Without the unit-speed condition the boundary
  curve `t ↦ (0, t + t³)` of the cylinder, of acceleration `(0, 6t)`, would violate it, and no
  metric with nonempty boundary would have geodesic boundary.

### 0.5 Properness of the diffeomorphism action and finite automorphism groups

For stable marked smooth curves, prove properness of the action of the diffeomorphism group: if
complex structures `j_k`, `j′_k` and the marks converge smoothly and `φ_k` intertwines them and
preserves the ordered marks, then a subsequence of `φ_k` converges in C∞, with its inverses
(Robbin–Salamon 2006, 9.2, for closed surfaces of genus greater than one without marks). One route
uses the canonical finite-area metrics of §0.4: isometries preserve the injectivity radius, so a
chosen frame in the thick core is mapped into a uniformly compact thick core; compactness of frames
and the local isometry equation give smooth convergence, and cusp coordinates extend it over the
punctures. Prove this extension and the convergence of the inverses. For genus zero and one use the
normalized models of §0.3 with their finite stabilizers. The statement is false for the full Möbius
group of the unmarked sphere and is not asserted there.

From the same properness and the vanishing of the space of infinitesimal automorphisms, construct
the finite automorphism groups of stable marked curves, including genus at least two, and prove
`finite_ordered_iff_forall_eulerChar_lt` (§1.2): the group of automorphisms of a marked nodal curve
fixing every mark is finite exactly when every component is stable (Robbin–Salamon 2006, 3.7–3.8,
which define stability as finiteness of the automorphism group). Tau Ceti reduces this to the
components (`TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff`) and settles the components
biholomorphic to the sphere and to complex tori
(`TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff_forall_two_lt_encard`,
`TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff_forall_specialPoints_nonempty_of_complexTorus`);
this section supplies the components of genus at least two and the identification of a component of
Euler characteristic 2 or 0 with the sphere or a torus (§0.3).
*Needs:* §0.3, §0.4; Tau Ceti `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff` and its two
specializations, `TauCeti.eulerChar`.

**Checks.**
- The sphere with marks 0, 1, ∞ has trivial automorphism group, while with marks 0 and ∞ it has
  the infinite group z ↦ λz: finiteness switches exactly at `2g − 2 + n = 1 > 0`.
- A torus with one mark has automorphism group ℤ/2, ℤ/4 or ℤ/6, finite, while the unmarked torus
  has all translations.
- For a closed surface of genus two, `χ = −2 < 0 = n`, and the automorphism group is finite, of
  order at most `84(g − 1) = 84` by Hurwitz's bound, and always contains the hyperelliptic
  involution.

### Examples

- `OnePoint ℂ` with marks 0, 1, ∞ is the unique stable sphere with three marks; a fourth mark λ
  gives the cross-ratio coordinate of §8.3.
- The complex torus `ℂ ⧸ (ℤ + ℤi)` has a holomorphic one-form dz with periods 1 and i, and
  `∫ i dz ∧ dz̄ = 2`, twice its area.
- On a closed surface of genus two with a smooth metric g, §0.4 gives a unique hyperbolic metric
  conformal to g, of area 4π.

### Dependencies

GeometricTopology §§1.1, 1.7; AlgebraicTopology §§7.1–7.3; FuchsianOrbifolds Layer 5; ModularForms
§10B; ComplexKahlerGeometry §§4.1, 5.10; PseudoholomorphicCurveAnalysis §7.2; HeegaardFloer F2.6a;
ComplexTori Milestone 1; PDE §§1.1, 1.4, 1.7; RiemannianManifoldsWithConvexBoundary §1.4 (the
second fundamental form of the boundary, for §0.4); DifferentialGeometry Layer 3 (flows, on which
Tau Ceti's diffeotopies of §0.1c rest); Tau Ceti's diffeotopies, compact Riemann surfaces,
hyperbolic metrics and
Euler characteristic. §0.5 also uses Tau Ceti's nodal gluing of Layer 1.

## Layer 1: nodal curves, node rings and their isomorphisms

### 1.1 The nodal quotient and its node rings

A prestable curve is presented by Tau Ceti's flag-pair data `TauCeti.NodalGluing.FlagPairData`
(components `X i`, flags with pairwise distinct flag points) and a `TauCeti.NodalGluing.Marking`
(Convention 1). Its glued curve `TauCeti.NodalGluing.GluedCurve` is the quotient by the flag
pairs; Tau Ceti proves it Hausdorff (`TauCeti.NodalGluing.t2Space_gluedCurve`, from the finite
gluing of `Setoid.t2Space_quotient`, whose relation is closed by `Setoid.isClosed_setOf_rel`),
identifies the complement of the flag points with the complement of the nodes
(`TauCeti.NodalGluing.quotientMapOnComplNodeSetHomeomorph`), and characterizes connectedness by
the dual graph (`TauCeti.NodalGluing.connectedSpace_gluedCurve_iff`). With finitely many compact
components it is compact. Its structure sheaf is the quotient sheaf of holomorphic functions
agreeing at glued points; its stalk away from the nodes is the holomorphic stalk of the
normalization (`TauCeti.NodalGluing.quotientStalkBranchEquiv`) and at a node it is the node ring
(`TauCeti.NodalGluing.quotientStalkToNodeEquiv`), the ring
`TauCeti.holomorphicStructureSheaf.nodeLocalRing` of pairs of branch germs with equal values at
the origins, with componentwise operations, a local ring with its maximal ideal, defined before any
hypersurface chart. It makes the curve a locally ringed space
(`TauCeti.NodalGluing.locallyRingedSpace`) whose nodes are intrinsic
(`TauCeti.NodalGluing.isDomain_quotientStalk_iff`).

Prove that the complement of the flag points maps by an isomorphism of ringed spaces onto the
complement of the nodes, combining the homeomorphism and the stalk isomorphism above; this is the
local biholomorphism of the complement.

*The genus formula.* Tau Ceti's dual graph `TauCeti.NodalGluing.dualGraph` takes the genera of the
components as an input and proves `p_a + #components = Σ g_i + #nodes + 1`
(`TauCeti.NodalGluing.arithmeticGenus_dualGraph_add_card`). Prove the genus formula
`g = Σ g_v + b₁(G)` with g_v the genus of §0.1b of the component, and its compatibility with
smoothing and cutting: smoothing a set of edges keeps the arithmetic genus
(`TauCeti.DualGraph.arithmeticGenus_smoothing`), and cutting at a set of nodes distributes it over
the cut components
(`TauCeti.DualGraph.sum_arithmeticGenus_cutComponent_add_card`), applied to the dual graph with
these genera; §2.4 proves the same for the geometric plumbing.
*Needs:* §0.1b; Tau Ceti's nodal gluing (`TauCeti.NodalGluing.GluedCurve`,
`TauCeti.NodalGluing.locallyRingedSpace`, `TauCeti.NodalGluing.dualGraph` and the theorems named
above), `TauCeti.holomorphicStructureSheaf.nodeLocalRing`, `TauCeti.DualGraph`.

**Checks.**
- The product `ℂ{x} × ℂ{y}` of the two branch rings, without the condition of equal values, has two
  maximal ideals and is not local; the node ring is local with residue field ℂ, and its maximal
  ideal is generated by the two branch coordinates, whose product is zero.
- A chain of three smooth rational curves has b₁ = 0 and genus 0; counting nodes instead of b₁
  would give genus 2. Two rational curves meeting in two points have b₁ = 1 and genus 1, as does
  the irreducible rational curve with one node.

### 1.2 Isomorphisms, automorphisms and stability

Isomorphisms of prestable curves are Tau Ceti's `TauCeti.NodalGluing.Iso` for the model `𝓘(ℂ)` and
smoothness ω: biholomorphisms of the normalizations respecting the flag pairs. They induce maps of
branches, nodes and components and descend faithfully to the glued curve
(`TauCeti.NodalGluing.Iso.gluedCurveHomeomorph_injective`). A node-preserving homeomorphism of
glued curves comes from a unique isomorphism exactly when its lift to the normalization is
holomorphic off the flag points (`TauCeti.NodalGluing.existsUnique_iso_gluedCurveHomeomorph_eq_iff`),
and the same holds for isomorphisms of the ringed spaces fixing constants
(`TauCeti.NodalGluing.existsUnique_iso_sheafedSpaceIso_eq_iff`). Descent and lifting for finite
maps of nodal curves, wherever such a statement is used, are proved separately under their own
hypotheses. An arbitrary morphism contracting a component is not covered by this pairing
criterion.

The automorphism group `TauCeti.NodalGluing.Aut` keeps every automorphism, with its action on
branches (`TauCeti.NodalGluing.Aut.branchPerm`), nodes and components. Its actions on deformation
bases, which may have a kernel, are constructed with those bases in §4.6 and §6.4; an automorphism
acting trivially on a base stays an arrow. Prove `finite_ordered_iff_forall_eulerChar_lt`: the group
of automorphisms fixing every
mark is finite exactly when every component is stable, `2g_v − 2 + n_v > 0`, equivalently
`χ(X_v) < n_v` (§0.5). Stability is not required of a prestable object.
*Needs:* §0.5, §1.1; Tau Ceti `TauCeti.NodalGluing.Iso`, `TauCeti.NodalGluing.Aut`, the lifting
theorems above, `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff`.

**Checks.**
- The irreducible nodal curve of genus one with one mark (normalization `OnePoint ℂ` with branches
  at 0 and ∞ and mark 1) has `n_v = 3`, so it is stable, with automorphism group ℤ/2 generated by
  z ↦ 1/z; without the mark it has `n_v = 2`, is unstable, and has the infinite group of the maps
  z ↦ λz and z ↦ λ/z, λ ∈ ℂˣ, the semidirect product `ℂˣ ⋊ ℤ/2` in which z ↦ 1/z, exchanging the
  branches, acts on the scalings by λ ↦ λ⁻¹.
- A smooth curve of genus two attached at one node to an unmarked sphere is not stable: the sphere
  has `2·0 − 2 + 1 = −1 < 0`, although `2g − 2 + n = 2 > 0` for the whole curve. A criterion on the
  total genus would call it stable, and its automorphism group (containing z ↦ λz on the sphere,
  fixing the node) is infinite.

### 1.3 Auxiliary permutation arrows

For n distinguished ordered marks and r distinct auxiliary marks, Tau Ceti's
`TauCeti.NodalGluing.AuxiliaryMarkedCurve.unorderedAuxiliaryIsomorphismGroupoid` has as arrows the
pairs (π, f), `π ∈ S_r` and f an isomorphism preserving the distinguished labels and carrying
auxiliary mark j to auxiliary mark π(j), compatibly with branches
(`TauCeti.NodalGluing.AuxiliaryIso`), composed by `(ρ, h) ∘ (π, f) = (ρ ∘ π, h ∘ f)`. It extends the
ordered groupoid by permutations of labels and is not a forgetting or contraction operation; the
auxiliary marks stay distinct, so the permutation is determined by the map. Tau Ceti proves that
each nonempty Hom set with fixed π is a torsor for the group of automorphisms preserving every label
(`TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv`), and that the Hom sets are finite when the
ordered automorphism groups are (`TauCeti.NodalGluing.AuxiliaryIso.finite`). Deduce from §1.2 that,
for a stable total set of n + r special labels, the extended central Hom sets and automorphism
groups are finite. Keep the full group even when its action on a deformation base has a kernel.
These arrows are defined before the chart topology of Layer 5 and the action charts of §6.4, and use
neither Layer 7 nor any moduli of maps.
*Needs:* §1.2; Tau Ceti `TauCeti.NodalGluing.AuxiliaryIso`, `TauCeti.NodalGluing.AuxiliaryAut`,
`TauCeti.NodalGluing.AuxiliaryMarkedCurve`, `TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv`,
`TauCeti.NodalGluing.AuxiliaryIso.finite`.

### 1.4 Partitioned auxiliary arrows

For a finite labelled partition `Λ = ⊔_{c∈C} Λ_c` of the auxiliary labels, Tau Ceti's
`TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid` keeps the arrows
(π, f) preserving every colour class, so that the permitted permutations form `∏_c S(Λ_c)`. Two
distinguished unordered auxiliary sets use `S_(r₁) × S_(r₂)`, not `S_(r₁+r₂)`, which could
interchange their roles; empty blocks are allowed. It is a wide subgroupoid with the same objects
and only the colour-preserving arrows, not in general a full subgroupoid; one block recovers the
groupoid of §1.3 and singleton blocks the ordered labels, and its automorphism groups are
`TauCeti.NodalGluing.AuxiliaryAut.partitioned`. Tau Ceti also proves that relabelling the blocks
injectively leaves the groupoid unchanged and merging blocks enlarges it
(`TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_comp_of_injective`,
`TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_le_comp`), and
that a colour-preserving arrow carries each union of blocks onto itself and the auxiliary marks of
those colours onto the marks of the same colours
(`TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.perm_image_preimage`,
`TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.image_image_point_inr_preimage`); forgetting the
colours is faithful on arrows, as for every subgroupoid (Mathlib
`CategoryTheory.Subgroupoid.hom.faithful`).
*Needs:* §1.3; Tau Ceti
`TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid`,
`TauCeti.NodalGluing.AuxiliaryAut.partitioned` and the laws above; Mathlib
`CategoryTheory.Subgroupoid.hom.faithful`.

### Examples

- The irreducible rational curve with one node and one mark: `X = OnePoint ℂ`, one flag pair
  (0, ∞), mark 1; the glued curve is compact, connected and Hausdorff, of genus one (one loop in
  the dual graph), and its automorphism group is ℤ/2.
- Two spheres glued at one point, each with two marks: four marks, genus zero, each component with
  three special points, trivial ordered automorphism group; with two colour classes of two marks
  each placed on different components, the partitioned groupoid admits the automorphisms
  interchanging the marks within each class but not those exchanging the classes.

### Dependencies

Layer 0 (§§0.1b, 0.3, 0.5); Tau Ceti's nodal gluing, node rings, dual graphs and finite gluing.

## Layer 2: restricted analytic nodal families and the local algebra of nodes

The families of this roadmap are objects of the analytic-space category of ComplexComparisonPartII
§C-1.1, built from product charts and the node charts N_s. This layer constructs those specific
objects and their family theorems, not a parallel general category of analytic spaces.

### 2.0 Complex manifolds as analytic spaces

Tau Ceti puts the sheaf of holomorphic functions on a complex manifold
(`TauCeti.holomorphicStructureSheaf`), with local stalks of residue field ℂ
(`TauCeti.holomorphicStructureSheaf.residueFieldEquiv`), and compares it with Mathlib's structure
sheaf of the manifold as a locally ringed space (`TauCeti.holomorphicStructureSheaf.smoothSheafIso`).
For a finite-dimensional Hausdorff second-countable complex manifold, given by Mathlib's
`ChartedSpace` and `IsManifold 𝓘(ℂ, E) ω`, construct its analytic space in the sense of
ComplexComparisonPartII §C-1.1 (cited as *nativeComplexManifoldAnalyticSpace*): identify every
coordinate chart with the open analytic model of zero ideal, through §C-1.1's comparison of
`HolomorphicStructureSheaf` with Tau Ceti's sheaf, and glue by the holomorphic transition maps.

Prove that holomorphic maps of complex manifolds correspond to local ℂ-ringed morphisms between
these analytic spaces (cited as *holomorphicMapLocalRingedEquivalence*). The forward map is pullback
of sections. For the inverse, the residue fields ℂ and the pulled-back coordinate functions recover
the underlying map; prove equality of the whole germ maps, not only of their coordinate values:
locality preserves the powers of the maximal ideal, Taylor congruences hold to every order, and
the separatedness of convergent local algebras for the Taylor filtration (§C-1.1) identifies the
germs. Establish identity, composition, restriction and independence of charts. Prove the
comparison of open submanifolds with §C-1.1's open subspaces (cited as
*nativeComplexOpenAnalyticComparison*), and of products of manifolds with §C-1.1's fibre products
over the point (cited as *nativeComplexProductAnalyticComparison*), by comparing the product charts
of zero ideal and gluing; the universal property of the fibre product is tested against arbitrary
analytic spaces, not only smooth ones. These comparisons consume §C-1.1's generic operations and
ComplexKahlerGeometry's holomorphic calculus. The sentence of ComplexComparisonPartII §C0.3 about
manifolds with zero ideal is a model of shape only; its equivalence of holomorphic bundles with
locally free modules, GAGA (§C1.9) and Picard (§C3.2) are not inputs.
*Needs:* ComplexComparisonPartII §C-1.1; ComplexKahlerGeometry §§3.2, 4.1; Tau Ceti
`TauCeti.holomorphicStructureSheaf`, `TauCeti.holomorphicStructureSheaf.residueFieldEquiv`,
`TauCeti.holomorphicStructureSheaf.smoothSheafIso`; Mathlib `ChartedSpace`, `IsManifold`.

**Checks.**
- On the disc, the pullback of the coordinate z along a holomorphic f with f(0) = 0 is f, so the
  inverse construction recovers f. No ℂ-algebra map of stalks at the origin sends z to 1 + z: it
  would send the unit 1 − z to −z, which vanishes at the origin. Likewise an image g of z with
  `g(0) = c ≠ 0` would send the unit `z − c` to the non-unit `g − c`; so such a map sends the
  maximal ideal into the maximal ideal, and the image of z is a map germ fixing the origin.

### 2.1 The node charts and their structure sheaf

Let U be an open subset of a base manifold, Δ an open coordinate disc and s : U → ℂ holomorphic.
The node chart is `N_s = {(b, x, y) ∈ U × Δ² | xy = s(b)}`. Its underlying points over a base B,
with global coordinates `(x, y) ∈ ℂ²`, form `NodeChart B s`, with projection `nodeProjection`; the
projection is continuous (`continuous_nodeProjection`), the defining equation is closed when s is
continuous (`isClosed_nodeEquation`), and the points over b are the plane curve `NodeFiber s b`
(`nodeFiberEquiv`). Its branches over b are `leftNodeBranch` (on `y = 0`) and `rightNodeBranch`
(on `x = 0`); they cover the fibre when `s(b) = 0` (`centralNodeBranches_cover`) and meet only at
the node (`centralNodeBranches_inter`).

Using the analytic spaces of §2.0, construct the restricted families as objects and morphisms of
ComplexComparisonPartII §C-1.1's analytic-space category, by product charts, node charts and open
gluing with explicit cocycles, local-ring stalks and compatible topology. Prove that the
normalization and branch-pair presentation of Layer 1 gives the same object, not a second carrier.
The node chart is §C-1.1's closed analytic subspace of the product manifold `U × Δ²` cut out by the
ideal `(xy − s)`; overlaps use §C-1.1's open subspaces, gluing and fibre products, and morphisms are
its locally ℂ-ringed morphisms. Identify §C-1.1's convergent germs and `HolomorphicStructureSheaf`
with the germs and sheaves of ComplexKahlerGeometry §§3.2 and 4.1 through the same analytic
function germs, preserving coordinates, maximal ideals and quotient maps.

The sheaf on N_s is the quotient of the ambient holomorphic germs by `(xy − s)`; surjectivity on
sections over every open set is not asserted from exactness on stalks. Prove that it equals the
sheaf of functions that are locally restrictions of ambient holomorphic functions: in the factorial
germ ring of characteristic zero, a repeated irreducible factor of `f = xy − s` would divide
`∂_x f = y` and `∂_y f = x`, which is impossible, so `(f)` is radical, also when s vanishes
identically, and the Rückert Nullstellensatz identifies it with the vanishing ideal. Tau Ceti
proves the comparison of the branch-pair ring with `ℂ{x, y}/(xy)` for s = 0
(`TauCeti.holomorphicStructureSheaf.nodeLocalRing.planeNodeEquiv`) and the product charts away from
the nodal locus (`TauCeti.holomorphicStructureSheaf.offNodeChartFstEquiv` and
`TauCeti.holomorphicStructureSheaf.offNodeChartSndEquiv`, at stalks: where x ≠ 0 the coordinate y
is eliminated); prove the product charts off the nodal locus as isomorphisms of analytic spaces: on
`x ≠ 0` the
coordinates (b, x) identify N_s with an open subset of `U × Δ`, and likewise (b, y) on `y ≠ 0`.
*Needs:* §2.0; Layer 1 (§1.1); ComplexComparisonPartII §C-1.1; ComplexKahlerGeometry §§3.2, 3.4
(Weierstrass division, factoriality, Rückert Nullstellensatz), 4.1; Tau Ceti
`TauCeti.holomorphicStructureSheaf.nodeLocalRing.planeNodeEquiv`,
`TauCeti.holomorphicStructureSheaf.offNodeChartFstEquiv`,
`TauCeti.holomorphicStructureSheaf.offNodeChartSndEquiv`.

**Checks.**
- For s ≡ 0 the ideal `(xy)` is radical but not prime, with two branches: the argument gives
  radicality, and a claim of primality would be false. For `s(b) = b²` the ideal `(xy − b²)` is
  prime although the total space is singular at the origin, so radicality does not need a smooth
  total space.
- Over b with `s(b) ≠ 0` the fibre `xy = s(b)` is a smooth hyperbola, which contains no point of
  either axis: both branches are empty, and `centralNodeBranches_cover` needs `s(b) = 0`.

### 2.2 Flatness of the node charts

Prove flatness of N_s over U for every holomorphic s, as a theorem about these charts and not as an
admissibility hypothesis. After the invertible linear change `u = x + y`, `v = x − y`, Weierstrass
division makes the local quotient free of rank two over `B = ℂ{b, v}`, with basis 1, u, through
the Weierstrass polynomial `u² − v² − 4s(b)`. Prove that B is flat over `A = ℂ{b}`. One route:
identify the completions at the maximal ideals with formal Taylor series, and the completion of B
with the completion of `A[v]` at `(m_A, v)`; Noetherian adic completion and freeness of the
polynomial ring make it flat over A; the completion `B → B̂` is faithfully flat, so tensoring an
injection of finitely generated ideals of A with B and then with B̂, using flatness over A and
faithful detection, descends injectivity. Consume §C-1.1's identification of maximal-ideal
completions with Taylor series, and construct the comparison of the node's polynomial completion
and the descent of the ideal criterion here. This is a construction in analytic germs and
commutative algebra, not the word "free" over A.
*Needs:* §2.1; ComplexComparisonPartII §C-1.1; ComplexKahlerGeometry §3.2 (Weierstrass division);
Mathlib's adic completion, flatness and the ideal criterion (`Module.Flat`,
`Module.Flat.iff_rTensor_injective`).

**Checks.**
- `u² − v² = (x + y)² − (x − y)² = 4xy`, so `xy − s = (u² − v² − 4s)/4`: the Weierstrass polynomial
  is monic of degree two in u with coefficients in the maximal ideal when `s(0) = 0`.
- Flatness holds for `s ≡ 0`, a permanent node. By contrast `ℂ{b, x}/(bx)` is not flat over `ℂ{b}`:
  b kills the nonzero class of x, and the fibre jumps from a point (b ≠ 0) to a line (b = 0). The
  node equation never behaves so, because after the change of variables it is monic in u.

### 2.3 Proper families, base change and Cartesian morphisms

Define restricted analytic nodal families (Convention 2) with these charts and disjoint sections.
For any holomorphic base map φ : A → B, construct the ringed fibre product with local equation
`xy = s(φ(a))` and its universal property: maps to the product correspond naturally to compatible
maps to A and to the family over B. On underlying points this is `NodePullback s φ`, homeomorphic
to `NodeChart A (s ∘ φ)` (`nodePullbackHomeomorph`, with underlying equivalence
`nodePullbackEquiv`); a pair of compatible maps induces `nodePullbackLift`, continuous when its
components are (`continuous_nodePullbackLift`) and the unique map with those projections
(`nodePullbackLift_unique`). Prove that properness, flatness, the marks and nodality of the fibres
survive base change, with the associativity and unit coherence of iterated pullbacks. Define the
Cartesian morphisms of families by this product. When a holomorphic fibrewise isomorphism is used
to recognize one, prove that it has a local ringed inverse, using the inverse on the smooth pieces
and, at a node, the criterion through branch derivatives and the quotient ring, then glue; a
continuous bijection of total spaces is not enough.
*Needs:* §2.1, §2.2; ComplexComparisonPartII §C-1.1 (fibre products).

**Checks.**
- Pulling back `xy = a` along `t ↦ t²` gives `xy = t²`, and along the constant map to a = 0 gives
  the permanent node `xy = 0` over the new base: both are restricted families, the first with a
  singular total space.
- The map from the family `xy = t²` to the family `xy = t` over the squaring map of bases is not an
  isomorphism of families over the identity of either base; it is the Cartesian morphism over
  `t ↦ t²`.

### 2.4 The smoothing ideal and multi-node plumbing

Prove that the smoothing ideal `(s)` in the germ of the base at a single node is intrinsic up to a
unit and commutes with base change: compute the relative differentials and their Fitting ideal,
whose image on the base is the ideal of singular values, and compare branch-coordinate changes. At
the central node the first-order smoothing line is `T_pΣ ⊗_ℂ T_qΣ`, with the two tangent derivative
factors. Distinguish this line from ds, which vanishes for `xy = b²` and is zero for a permanent
node.

Construct independent plumbing at several nodes by a global cut-and-glue construction: take
disjoint larger branch discs in the normalized marked component families, remove smaller cores,
glue the annuli by `xy = a_i`, add the node charts, and prove Hausdorffness, properness over a
shrunken base, the sheaf cocycles and disjointness of the marks. An arbitrary collection of locally
thickened charts is not claimed to globalize. Prove that the smooth fibres of the plumbing at a set
of nodes have the arithmetic genus of the central fibre, as the graph identities of §1.1 predict.
*Needs:* §§2.1–2.3; Layer 1; ComplexComparisonPartII §C-1.1.

**Checks.**
- For `xy = b²` the smoothing ideal is `(b²)`, nonzero, while `ds = 2b db` vanishes at b = 0; for
  the permanent node the ideal is zero. A definition of the smoothing line through ds would make it
  zero in the first case, where the node still smooths.
- Plumbing the node of the irreducible nodal curve of genus one gives smooth fibres that are tori,
  of genus `0 + 1 = 1`.

### Examples

- The universal one-node smoothing `xy = a` over the a-disc, its pullback `xy = t^m` along
  `a = t^m`, and the permanent node `xy = 0` over any base; the first has smooth total space, the
  others for m ≥ 2 do not.
- Two independent nodes with parameters `a₁`, `a₂` on a two-dimensional base, and the diagonal
  pullback `a₁ = a₂ = t` on a one-dimensional base, which is a restricted family whose smoothing
  derivative has rank one.

### Dependencies

Layer 1; ComplexComparisonPartII §C-1.1; ComplexKahlerGeometry §§3.2, 3.4, 4.1; Tau Ceti's
holomorphic structure sheaf, node ring and off-node charts; Mathlib's flatness and completions.

## Layer 3: linear deformation theory, fractional Sobolev spaces and slices

### 3.1 Sobolev spaces on components and on boundary circles

On compact smooth components and on the chosen bordered pieces, build the spaces `H^k` of sections
from the integer Sobolev carriers of PDE §1.1 and PseudoholomorphicCurveAnalysis §6.1, with an
explicitly equivalent Hilbert norm.

On each boundary circle, `H^s` for real s is Tau Ceti's `TauCeti.CircleSobolev s E`, defined by
Fourier coefficients with norm² `Σ_n (1 + |n|)^(2s) ‖a_n‖²`. Tau Ceti proves completeness, density
of trigonometric polynomials (`TauCeti.CircleSobolev.dense_finite_support_coeff`), the continuous
inclusions for t ≤ s and their compactness for t < s with finite-dimensional values
(`TauCeti.CircleSobolev.isCompactOperator_inclusion`), finite disjoint unions
(`TauCeti.CircleSobolev.piLpEquiv`), and, for s > 1/2, continuous evaluation
(`TauCeti.CircleSobolev.toContinuousMap`), the algebra estimate
(`TauCeti.CircleSobolev.norm_mul_le`) and holomorphic Nemytskii maps of scalar functions
(`TauCeti.CircleSobolev.analyticOnNhd_nemytskii`). Multiplication by a nowhere-vanishing smooth
function is an isomorphism for every real s (`TauCeti.CircleSobolev.mulFourierSeriesEquiv`), and a
fixed smooth circle diffeomorphism induces a bounded isomorphism for s ≥ 0
(`TauCeti.CircleSobolev.precompSmoothEquivOfLift`).

Prove the rest of the boundary theory: boundedness of multiplication by any smooth function (its
inverse asserted only when the function vanishes nowhere); bounded isomorphisms induced by fixed
circle diffeomorphisms for negative s, and hence coordinate invariance; smooth and holomorphic
Nemytskii maps into finite-dimensional targets for s > 1/2; the Hilbert manifolds of boundary maps;
and the derivative offsets of variable reparametrizations, which act by `H^(s+r) → H^s` with `C^r`
dependence and not smoothly on one completion.
*Needs:* PDE §1.1; PseudoholomorphicCurveAnalysis §6.1; Tau Ceti `TauCeti.CircleSobolev` and the
theorems named above.

**Checks.**
- For s > 1/2, `Σ_n (1 + |n|)^(−2s)` converges and bounds evaluation; at s = 1/2 it is the
  divergent harmonic series, and the coefficients `a_n = 1/((1 + |n|) log(2 + |n|))` define an
  element of `H^(1/2)` whose Fourier series diverges at 0: the threshold is sharp.
- The weight `(1 + |n|)^(2s)` gives the constant function norm 1 for every s; the weight `|n|^(2s)`
  would give it norm 0 and not define a norm.

### 3.2 Trace and the boundary Cauchy–Riemann estimate

For integer `k = s + 1/2 ≥ 1` prove the bounded trace `H^k(Ω, E) → H^(k−1/2)(∂Ω, E)`, and, on each
connected compact bordered component with nonempty boundary, the real Cauchy–Riemann estimate

    ‖ξ‖_(H^k) ≤ C (‖Dξ‖_(H^(k−1)) + ‖trace ξ‖_(H^(k−1/2)))

Route: prove the Fourier estimates on the cylinder for positive, negative and constant modes, patch
them with bundle and coordinate partitions and lower-order errors, obtain the preliminary estimate
with an `H^(k−1)` remainder, and remove it by Rellich compactness, closed range and unique
continuation at the boundary. Construct the closed image of (D, trace) and its bounded inverse onto
the image, and constants depending continuously on the parameters over bounded compact sets of
coefficients. For the free-boundary spaces of holomorphic maps used below, prove split
surjectivity of D with finitely many point constraints by a totally real boundary condition of
sufficiently positive Maslov index and its boundary solver; it does not follow from the displayed
estimate alone. Consume the Fredholm theory of real Cauchy–Riemann operators and the bordered index
of PseudoholomorphicCurveAnalysis §§6–7 and its local analysis (§§3–5); construct the boundary
conditions and right inverses of the trace here. No integer-order trace theorem is read as a
half-order Hilbert-manifold or nonlinear Hardy theorem.
*Needs:* §3.1; PseudoholomorphicCurveAnalysis Layers 3–7; PDE §1.6 (trace, Rellich).

**Checks.**
- On the closed disc with `D = ∂̄`, the holomorphic functions have `Dξ = 0` and are controlled by
  their boundary trace; on a closed surface (empty boundary) the constants have `Dξ = 0` and zero
  trace, so the estimate fails without boundary, which is why nonempty boundary is assumed.

### 3.3 First-order deformations and automorphisms of a prestable curve

Let `A_C = H⁰(TΣ(−special))`, the holomorphic vector fields on the normalization vanishing at the
special points, and let `Def¹(C)` be the deformation group of the normalization and the nodes,
defined by the exact sequence

    0 → ⊕_v H¹(TΣ_v(−special_v)) → Def¹(C) → ⊕_{nodes {p,q}} T_pΣ ⊗ T_qΣ → 0

Define first-order deformations of charts over the dual numbers, their gluing and gauge maps, and
prove this exact sequence, not only a dimension count. Compute the infinitesimal automorphisms as
`⊕_v H⁰` of the same twisted tangent bundles. Prove that the obstruction group vanishes: the
normalization has no cohomology in degree two, the node term is a finite skyscraper with nothing in
degree one, and each node is a hypersurface with an explicit two-term cotangent complex. This is a
construction with finitely many charts to first order and for obstructions, not a general derived
analytic category. Prove `dim Def¹ = 3g − 3 + n + dim A_C`, and the dimensions of strata and
smoothing directions on the stable locus.
*Needs:* §0.2, §1.1, §2.4; ComplexKahlerGeometry §5.10.

**Checks.**
- For the stable curve of genus zero with five marks made of a chain of three spheres, each
  component has three special points, so `A_C = 0` and the `H¹` terms vanish; the two nodes give
  `Def¹ = ℂ²`, and `3·0 − 3 + 5 = 2`.
- For the irreducible nodal curve of genus one with one mark, `H¹(T OnePoint ℂ (−3 points))
  = H¹(O(−1)) = 0` and the node gives `Def¹ = ℂ`, of dimension `3 − 3 + 1 = 1`. For the sphere
  with one mark, `A_C = H⁰(O(1))` has dimension 2 and `Def¹ = 0`, and `0 = −3 + 1 + 2`.

### 3.4 The Robbin–Salamon operator of an unfolding

On a nodal unfolding π : Q → B with smooth total space and connected fibres, define, with u a
desingularization of the central fibre,

    X_(u,b) = {(ξ, b̂) : dπ(u) ξ ≡ b̂, ξ(mark_i) ∈ T S_i, ξ(p) = ξ(q) at paired flags}
    Y_u = {η ∈ Ω^(0,1)(u*TQ) : dπ(u) η = 0}
    D_(u,b)(ξ, b̂) = D_u ξ

Construct its Sobolev completions, closed constraints and Fredholm theory. Let k be the number of
nodes and r the rank of the joint smoothing derivative `d(s_1, …, s_k)_b`. Prove

    ind_ℂ D_(u,b) = 3 − 3g − n + dim_ℂ B + k − r

so that equality without the defect is equivalent to joint regular nodality, r = k. Build the
Kodaira–Spencer map `KS : T_bB → Def¹(C)` from the first-order family, and prove
`0 → A_C → ker D → ker KS → 0` and `0 → coker D → coker KS → coker d(s_*) → 0`; the second identifies
the missing smoothing directions. On a regular nodal family, bijectivity of D together with
stability is the full criterion for infinitesimal universality, equivalently `A_C = 0` and KS an
isomorphism. Neither TQ nor this operator is applied to a singular total space N_s; there the
intrinsic first-order complex of §3.3 and base change are used.
*Needs:* §3.1, §3.2, §3.3, §2.4; PseudoholomorphicCurveAnalysis §§6–7.

**Checks.**
- The two exact sequences give `ind D = dim A_C + dim B − dim Def¹ + k − r`, which with §3.3 is the
  displayed formula.
- For the chain of three spheres with five marks (§3.3), the diagonal unfolding `a₁ = a₂ = t` on a
  one-dimensional base has k = 2, r = 1, index `3 − 5 + 1 + 1 = 0`, and D is bijective although KS
  is not surjective (its cokernel is the missing smoothing direction): bijectivity of D detects
  universality only on regular nodal families. The formula without the defect would give −1.

### 3.5 Holomorphic slices and the Sobolev chart of complex structures

*Holomorphic marked slices.* On closed stable-pointed smooth components, choose a finite-dimensional
complex complement to the image of the complex-linear ∂̄, with smooth representatives, by the
Riemann–Roch of PseudoholomorphicCurveAnalysis §7.2 and the elliptic regularity of
ComplexKahlerGeometry Layer 5. Prove the holomorphic slice formula `ι(η) = (1 + η)⁻¹ j₀ (1 + η)` on
the anti-complex-linear complement, with its derivative and complex linearity (Robbin–Salamon 2006,
9.1). Build the marked coordinates jointly holomorphically in the resulting family, not only
smoothly in the real parameter, including the normalization of three points in genus zero and the
lattice and one-mark constructions in genus one (Robbin–Salamon 2006, 11.4, Step 1). Prove that the
slice together with the mark directions is a complex complement of the full marked infinitesimal
action.

*The Sobolev chart.* For p > 2 and integer k ≥ 1 construct the Banach manifold `J^(k,p)(Σ)` of
orientation-compatible complex structures of class `W^(k,p)`. Near j₀ use small anti-complex-linear
endomorphisms η of class `W^(k,p)` and `η ↦ ι(η) = (1 + η)⁻¹ j₀ (1 + η)`. Prove the inverse chart,
the pointwise conditions of complex structure and orientation, smoothness of multiplication and
inversion, and the chart transitions; `W^(k,p) ⊂ C⁰` and the small norm make 1 + η invertible at
every point. This is the full target chart, not only its finite-dimensional slice.

*Arbitrary smooth complements and the offset implicit function theorem.* Let T be any
finite-dimensional complex subspace of smooth anti-complex-linear representatives whose classes
complement the image of the point-constrained infinitesimal action
`A : W^(k+1,p)(TΣ; ξ(mark_i) = 0) → W^(k,p) Ω^(0,1)(TΣ)`. On a closed stable-pointed component its
kernel is zero; use the restriction exact sequence of §0.2 to identify the full marked cokernel,
including the directions moving the marks: smooth sections vanishing at the marks are not
identified with holomorphically divisible sections. For each p > 2 and integer k ≥ 1 prove that the
offset map `Diff^(k+1,p)_Θ(Σ) × T → J^(k,p)(Σ)`, `(φ, η) ↦ φ*[(1 + η)⁻¹ j₀ (1 + η)]`, is smooth as a
real Banach map near (id, 0), for every such T. Its derivative is `2j₀(∂̄ξ + η)`, with the native
and source conventions for the Lie derivative compared explicitly; equivalently, include the
point-evaluation terms in the formulation with jointly moving marks. Prove the theorem for stable
marked spheres and tori as well as for genus greater than one, not only in the unmarked case of
negative degree treated in Robbin–Salamon 2006, 9.1. Smooth complements supported in a core are
allowed whenever the application proves the complement hypothesis; localization of support and
unique continuation for choosing T are not assumed by the theorem. Prove the closed complemented
range and the Banach implicit function theorem, then bootstrap a C¹ diffeomorphism intertwining
two structures of class `W^(k,p)` to one of class `W^(k+1,p)`, and to a smooth one when both
structures are smooth. Differentiability of the unrestricted action on one completion is not
claimed.
Prove local uniqueness near the identity using §0.5 and the inverse and transition estimates of
the offset map, keeping all other finite isotropy arrows. No global Teichmüller space is
presumed. Miniversal slices of unstable components are the auxiliary-mark construction of §4.7,
not free actions on stable-pointed slices.
*Needs:* §0.2, §0.5, §3.1; PseudoholomorphicCurveAnalysis §7.2; ComplexKahlerGeometry Layer 5;
Wendl, Lectures on Holomorphic Curves, §§4.2–4.3 (derivative offsets).

**Checks.**
- For η anti-complex-linear (`η j₀ = −j₀ η`) and small, `ι(η)² = (1 + η)⁻¹ j₀² (1 + η) = −1`, so
  ι(η) is a complex structure; its derivative at η = 0 is `j₀η − ηj₀ = 2j₀η`, which is the η-term of
  the offset derivative `2j₀(∂̄ξ + η)`.
- On a torus with one mark the slice is one-dimensional (the j-line) and the action has zero
  kernel; on the unmarked torus the kernel contains the translations, and the theorem is not
  asserted there.
- On a torus with its flat structure j₀, `φ(x, y) = (x + εh(x), y)`, with h periodic of class
  `C^(k+1)` but not smooth, vanishing near the mark, and ε small, is a diffeomorphism intertwining
  j₀ with `j = φ*j₀`, whose entries `1 + εh′` and `−(1 + εh′)⁻¹` are of class `C^k`: j lies in the
  `W^(k,p)` chart near j₀, and φ is of class `W^(k+1,p)` but not smooth, so the smooth bootstrap
  needs both structures smooth.

### 3.6 Integrability of product families

In a smooth product trivialization write the almost complex structure as `J = [[i, 0], [α, j]]`
with `α(iâ) + jα(â) = 0`. Define the mixed component `M(â) = dj(â) + j dj(iâ) + j L_(α(â)) j` and,
for `ξ = α(â)`, `η = α(b̂)`, the horizontal component
`ζ(â, b̂) = dξ(ib̂) − j dξ(b̂) − dη(iâ) + j dη(â) + [ξ, η]_RS`. Tau Ceti proves the Nijenhuis
dictionary
in a product trivialization with constant base structure i: the mixed, horizontal and vertical
components
(`TauCeti.ComplexStructureFamily.nijenhuis_horizontal_vertical`,
`TauCeti.ComplexStructureFamily.nijenhuis_horizontal_horizontal`,
`TauCeti.ComplexStructureFamily.nijenhuis_vertical_vertical`), the comparison of the source bracket,
which satisfies `L_[v,w] = L_w L_v − L_v L_w`, with Mathlib's
(`TauCeti.ComplexStructureFamily.lieBracket_fiber_eq`), under which the source values `(0, j M(â) v)`
and `(0, ζ(â, b̂))` become `(0, −j M)` and `(0, −ζ)`, and the criterion that J is integrable exactly
when both components and the fibrewise one vanish
(`TauCeti.ComplexStructureFamily.nijenhuis_eq_zero_iff`). Both conditions are therefore needed in
general, in every genus.

Prove the remaining statements. Name the two conditions `∂̄^H j = 0` and the (0,2)-curvature
condition only under the Hamiltonian-connection representation `α(â) = j(v_â + j v_(iâ))` of the
Remark of the Robbin–Salamon corrigendum, with its symplectic and Hamiltonian data and sign
dictionary. Prove that the mixed condition alone implies integrability in genus greater than one on
closed compact source surfaces, by vanishing of global holomorphic vector fields; it is not used on
bordered Hardy cores, which need both local conditions on their open collar extensions. Prove that
for α = 0 a holomorphic j suffices. The proofs of universality use the valid direction, necessity
for a holomorphic family, together with the α = 0 construction and the marked-section equation of
§4.1; they do not use sufficiency in genus zero and one, which is false without restriction. The
corrected statement of the corrigendum, not the uncorrected Lemma 10.2 of Robbin–Salamon 2006 (Lemma
8.2 in the journal numbering the corrigendum uses), governs integrability of finite-dimensional
families.
*Needs:* Tau Ceti `TauCeti.ComplexStructureFamily.nijenhuis_eq_zero_iff` and the component
formulas above; Robbin–Salamon corrigendum, Lemmas A–B; §0.2 (vanishing of holomorphic vector
fields in genus at least two).

**Checks.**
- For α = 0 the mixed component is `dj(â) + j dj(iâ)`, which vanishes exactly when
  `dj(iâ) = j dj(â)`, that is when b ↦ j(b) is holomorphic for the complex structure A ↦ jA on the
  space of complex structures; for a constant family it vanishes.
- On a torus fibre, global holomorphic vector fields exist, so the mixed condition alone does not
  imply integrability in genus one; the shortcut is restricted to genus greater than one.

### Examples

- For the sphere with three marks, `A_C = 0`, `Def¹ = 0`, and the universal unfolding is a point.
- For a torus with one mark, `A_C = 0`, `Def¹ = H¹(TΣ(−p))` is one-dimensional, and the slice of
  §3.5 is the upper half-plane coordinate τ near a given lattice.

### Dependencies

Layers 0–2; PseudoholomorphicCurveAnalysis Layers 3–7; PDE §§1.1, 1.6; ComplexKahlerGeometry
Layer 5; Tau Ceti's circle Sobolev spaces and the Nijenhuis criterion for product families.

## Layer 4: Hardy gluing, universality and the restricted-family extension

### 4.1 Universal unfoldings of smooth stable curves and independent plumbing

Construct the marked holomorphic unfoldings of smooth stable components by §3.5. Prove their
universal property by the argument of Robbin–Salamon 2006, 11.4, Step 3: after pulling back a
candidate family to a slice trivialization, use the necessary mixed Nijenhuis equation of §3.6 with
each marked-section equation `dσ_i(â) + j dσ_i(iâ) + α(iâ)(σ_i) = 0` (unnumbered in that step). The
complex marked-slice complement separates these into holomorphic j and σ directions and an
infinitesimal automorphism α vanishing at all marks; stability on the closed component forces α = 0.
The classifying map and the total map are therefore holomorphic, unique for the specified central
arrow. This establishes universality for smooth stable components before Hardy gluing at nodes.

*Independent plumbing and dimensions.* Glue their branch discs with independent parameters a_i by
§2.4. Prove that the total space is a complex manifold with regular nodal projection, with all
coordinate transitions of the total space and properness. The universal base has complex dimension
`3g − 3 + n`, its equisingular stratum with k nodes has dimension `3g − 3 + n − k` (real codimension
2k in the base), and the total space of the universal curve has dimension `3g − 2 + n`. The strata
are not boundary faces of an orbifold. Compute KS and D by Layer 3, and prove bijectivity and the
independence of the smoothing derivative; the missing directions are not inferred from the vertical
operator alone. This is the existence of an infinitesimally universal unfolding for every stable
curve (Robbin–Salamon 2006, 5.6).
*Needs:* §2.4, §3.4, §3.5, §3.6.

**Checks.**
- For (g, n) = (0, 4) the universal base is one-dimensional and the universal curve two-dimensional;
  at a nodal curve the stratum with one node has dimension `0 − 3 + 4 − 1 = 0`, a point.

### 4.2 The Hardy decomposition

Build the complete Hardy proof of Robbin–Salamon 2006, §§12–15, on exact function spaces. Split
each fibre into a compact bordered core M and closed node discs and annuli N inside larger open
node charts, with boundary Γ a finite union of circles. Every connected component of the core used
in the boundary-trace argument has nonempty boundary. If the central curve is smooth and there are
no node pieces, use the closed-surface slice and direct unfolding of Layer 3 instead, or cut
further ordinary coordinate discs and prove their elementary Hardy gluing, so that every core
component has boundary; no injective boundary trace is claimed for a closed core with Γ empty.
Choose collar trivializations holomorphic near Γ. For integer `k = s + 1/2 > 4`, let W be the open
Hilbert manifold of `H^s` boundary maps in a common submersion overlap, with winding one and
marking conditions. Define U by holomorphic `H^k` extension over N respecting paired nodes, and V
by holomorphic `H^k` extension over M respecting the marks. Prove injectivity of the trace and the
smooth and complex embedding, including properness of the trace map near the reference embedding:
interior elliptic bounds, absence of sphere bubbles in the node-free target core, straightening of
the fixed boundary and bounds on boundary derivatives, then the `H^k` trace estimate. These
compact-embedding and no-bubble estimates are owned here, using PseudoholomorphicCurveAnalysis
Layers 3–5 (§5.2 for the uniform bounds) and the local estimates of HeegaardFloer F2.3; they are
local analysis of curves, not an input from virtual classes of stable maps.
*Needs:* §§3.1–3.2, §3.5; PseudoholomorphicCurveAnalysis Layers 3–5; HeegaardFloer F2.3.

### 4.3 The nonlinear Hardy graph at a node and global Hardy matching

*The node.* Tau Ceti proves the nonlinear Hardy graph theorem at a plumbing node
(`TauCeti.CircleSobolev.exists_analyticAt_hardyGraph`), for s > 1/2: near the trivial data, pairs of
boundary maps `ξ = x e^F`, `η = y e^G` on the two circles of `xy = a`, with logarithms F, G in
`H^s`, that extend holomorphically across the neck are determined by their Laurent modes of
positive index, which are the modes of nonnegative index of `e^F` and `e^G`, constant modes
included, shifted by one. A map ψ analytic jointly in those modes and in a, including at the node
a = 0, gives the logarithms, hence the modes of nonpositive index of ξ and η, constant modes
included, and `b = a e^(F₀ + G₀)`. It rests on the linear neck graph
`TauCeti.CircleSobolev.neckGraph`, a complement of the negative Laurent subspaces
(`TauCeti.CircleSobolev.isCompl_neckGraph`), and the node equation `ξ(x) η(a/x) = b` holds on it
(`TauCeti.CircleSobolev.mul_exp_mul_mul_exp_eq_of_mem_neckGraph`). Tau Ceti also proves that the
ambient evaluation `(x, y, t) ↦ (ξ_(xy,t)(x), η_(xy,t)(y))` is jointly holomorphic
(`TauCeti.CircleSobolev.analyticAt_neckEvaluation_mul`). Constants may depend on s and on the fixed
reference norm of the identity; no bound `‖id‖_(H^s) ≤ 1` is assumed. The derivative of the
correction is not inferred to vanish from its being `O(a)`, since the smoothing component has
nonzero derivative at 0. Prove the branch-coordinate extension and inverse lemma: near the node the
ambient evaluation is a local biholomorphism in branch coordinates, with holomorphic inverse.

*Global Hardy matching.* Prove that U and V are complex Hilbert submanifolds, their projection and
submersion properties, and the kernel and cokernel restriction isomorphisms, using local right
inverses and Borel matching of collar jets for the jump of the cokernel. The mixed family
trivialization need not depend holomorphically on the parameters; §3.6 provides the correct complex
tangent calculation, and the boundary α vanishes there.
*Needs:* §4.2, §3.6; Tau Ceti `TauCeti.CircleSobolev.exists_analyticAt_hardyGraph`,
`TauCeti.CircleSobolev.isCompl_neckGraph`, `TauCeti.CircleSobolev.analyticAt_neckEvaluation_mul`.

**Checks.**
- On the neck graph with a = 0 the negative modes of both logarithms F and G vanish, so the
  boundary maps ξ and η have no modes of nonpositive index: each extends holomorphically over its
  own disc and vanishes at its centre, and the two branches are independent, as at a node. For
  a ≠ 0 the neck graph ties the mode `−n` of each logarithm to the mode n of the other,
  `F₋ₙ = −aⁿ Gₙ` and `G₋ₙ = −aⁿ Fₙ` for n > 0, the Fourier form of `F(x) + G(a/x) = F₀ + G₀`; a
  graph with `a^(−n)` would blow up as a → 0. The relation is one between the logarithms: the
  modes of ξ and η are tied only through the node equation `ξ(x) η(a/x) = a e^(F₀ + G₀)`.

### 4.4 Openness of universality and versality

Prove that infinitesimal universality on regular nodal families is open (Robbin–Salamon 2006, 5.3),
and so is versality. For stable universal targets, the Hardy tangent splitting is an open
complemented splitting; apply the implicit function theorem to `U ∩ V → A`, then prove joint
holomorphy of the total map on both pieces and agreement across Γ. Prove that the source and target
maps on germs of arrows are local biholomorphisms, and uniqueness with the specified central
isomorphism (Robbin–Salamon 2006, 5.4–5.5). Smooth trivializations of spaces of boundary maps need
only give `C^r` transitions on `H^(s+r)` before bootstrapping; no smooth reparametrization on one
completion is claimed.
*Needs:* §4.1, §4.3.

### 4.5 Universality for every restricted family

Extend the universal property to every restricted family of Layer 2, including permanent nodes and
`xy = b²`. This is not a citation of the smaller class of Robbin–Salamon and not an assumption that
local thickenings glue. Direct route: the source core outside the node charts is a smooth
holomorphic submersion; construct a proper trivialization of the bordered core holomorphic near its
boundary. The boundary of `xy = s_i(a)` is `A × S¹` in branch coordinates even when the total node is
singular. Obtain the Hardy space of a source node by holomorphic pullback `a_i = s_i(a)` of the
universal node graph of §4.3. The independent smoothing coordinates of the regular target solve for
its b_i, so the required projection to A is a submersion. Redo the global intersection of U and V
and its implicit function theorem, not only each node separately.

At a source node, write the base parameter as t and the solved positive modes as `ξ_+(t)`,
`η_+(t)`. Form the universal graph `T(z, ξ_+(t), η_+(t))` with an independent smoothing argument z.
Its ambient evaluation is `(x, y, t) ↦ (ξ_(xy,t)(x), η_(xy,t)(y))`: the smoothing argument is xy and
the positive modes depend on t. Only then restrict to `xy = s_i(t)`. Substituting `s_i(t)` for xy at
arbitrary ambient points is invalid, since the Laurent tail need not converge when `|x| < |s_i(t)|`.
This restriction gives a morphism of quotient sheaves without applying removability on a smooth
manifold to a singular total space. Prove its Cartesian inverse by §2.3. Existence and uniqueness
follow from this global Hardy diagram and its unique nearby intersection, with the central
identifications and group arrows retained. A different method through a smooth envelope would need
its own relative global deformation and gluing theorem and uniqueness proof; it is not presumed.
*Needs:* §2.3, §4.3, §4.4.

**Checks.**
- The family `xy = t²` has an A₁ singularity at the node, so a universality theorem stated only for
  families with smooth total space would not apply to it; §4.5 classifies it by `a = t²`, whose
  derivative vanishes at 0 as ds does.

### 4.6 Deformation groupoids

For each base germ, define the groupoid of identified deformations (P, ι : C ≅ P_0), with arrows
over the identity of the base satisfying `Φ_0 ∘ ι = ι′`. Pullback along arbitrary base maps gives a
pseudofunctor with its associators. Aut(C) acts by changing ι; it is not declared to act strictly on
one chosen miniversal base. Nontrivial automorphism germs of an unstable family can restrict to the
identity on the central fibre and stay arrows. Separately define the unframed groupoid of fibres,
with central isotropy Aut(C), and the isomorphisms of family germs over biholomorphic base germs;
the isotropy of the latter can have a kernel under central restriction and is not identified with
Aut(C) wholesale.
*Needs:* §2.3, §1.2.

### 4.7 Miniversal unfoldings of prestable curves

For every prestable curve construct a miniversal germ in the sense of §4.6: every identified family
is isomorphic to a pullback, and the derivative dφ of the classifying map at the central point is
unique through the Kodaira–Spencer isomorphism, while φ and its isomorphism need not be unique. Add
the minimum number of disjoint smooth auxiliary sections making every unstable component stable,
extended over arbitrary families of Layer 2 by product charts; their number is `dim A_C`. Classify
the stabilized family by §4.5 and drop the extra sections without contraction. Prove, by the exact
sequence of tangent evaluations, that KS on the resulting base is an isomorphism; if redundant marks
were used, choose and justify a holomorphic transverse slice of the base. Construct open versality at
neighbouring fibres by the Fredholm and Hardy surjectivity argument; miniversality is asserted at the
specified central fibre, not at every neighbouring one, where the dimension of the automorphism
group can change. Stable curves have `A_C = 0`, so their universal property is unique with a
specified central arrow. No strict quotient `[Def/Aut]` is asserted for unstable objects.
*Needs:* §4.5, §4.6, §3.3, §3.4.

**Checks.**
- The unmarked sphere needs three auxiliary marks, a sphere with one or two special points needs two
  or one, and the unmarked torus needs one: these are `dim A_C = h⁰(O(2 − k))` for `k ≤ 2` special
  points on the sphere and `h⁰(O) = 1` on the torus. Adding one mark to the unmarked sphere would
  leave a component with infinite automorphism group.

### Examples

- The universal unfolding of the irreducible nodal curve of genus one with one mark is the
  one-node smoothing `xy = a` near the node, glued to the trivial family away from it; its base is
  the disc in a, the neighbourhood of the boundary point of the compactified j-line, with ℤ/2 acting
  trivially.
- The family `xy = t²` over the t-disc is classified by `t ↦ t²` (§4.5), although its total space is
  singular at the node.

### Dependencies

Layers 2 and 3; PseudoholomorphicCurveAnalysis Layers 3–5; HeegaardFloer F2.3; Tau Ceti's Hardy
graph at a node.

## Layer 5: the countable stable pointed chart groupoid

This layer assembles, for fixed g and n with 2g − 2 + n > 0, countably many universal unfoldings
of Layer 4 into one complex étale groupoid whose arrows are the actual isomorphisms between
fibres. It proves nothing about Hausdorffness, properness or compactness of the arrow relation:
those are Layer 6's.

### 5.1 The parameter space of a stable signature

Use the diffeomorphism classification of §0.1b, with GeometricTopology §1.7, to fix set-sized
standard smooth normalization surfaces and finitely many connected graph-and-mark codes, with
explicit universe bounds. A *stable signature* is such a code whose every vertex satisfies
2g_v − 2 + n_v > 0. For each stable signature form the parameter space
`S = ∏_v J(Σ_v) × Conf(ordered flags and marks)`, where `J(Σ_v)` is the space of smooth complex
structures on Σ_v compatible with its orientation and the configuration entries are pairwise
distinct on their designated component. Give S its C∞ topology by finite-chart seminorms, and
prove that S is separable, metrizable and second countable, through finite-order Sobolev and
coordinate approximations.
*Needs:* §0.1b; GeometricTopology §1.7; Layer 1.

### 5.2 Universal charts and parameter neighbourhoods

For every s ∈ S choose a holomorphic marked slice of §3.5 and an independent-plumbing chart of
§4.1 representing the curve s.

*Universal-locus restriction.* Before any object point other than the centre or any comparison
germ is used, apply the openness theorem of §4.4 at the chart's central fibre and restrict its
base to an open neighbourhood B_s contained in its universal locus. Every b ∈ B_s then has a
universal unfolding with its specified central identification, and relabelled chart families
inherit this. Shrinking B_s preserves the property; it does not create universality at a point
where it fails.

*Parameter neighbourhoods.* Prove that the parameters in an open neighbourhood U_s ⊂ S of s are
isomorphic to fibres of that chart, using the offset inverse of §3.5 and moving-mark
coordinates. Shrink U_s and the inverse parameter map, which is the classifying map, together so
that it lands in B_s; the centre s stays in U_s, so the U_s form an open cover of S before any
global chart or arrow quotient is defined.
*Needs:* §3.5, §4.1, §4.4.

### 5.3 Countable selection

By Lindelöf, choose countably many of the charts of §5.2 whose U_s cover S. For fixed g and n
there are finitely many connected stable signatures, and every stable curve is represented in
one of them by the diffeomorphism and point-pushing results of §0.1. The chart bases therefore
form a second-countable complex manifold B, their countable disjoint union. Neither an equality
of chart and quotient topologies nor a finite atlas is a premise of this selection; the quotient,
chart and Deligne–Mumford topologies are compared in Layer 6, after the arrow groupoid exists.
*Needs:* §5.1, §5.2, §0.1.

### 5.4 The arrow space

Form the arrow space Γ of all triples (a, f, b) with a, b ∈ B and f an isomorphism of marked fibres
from the fibre over a to the fibre over b. Use the unique universal comparison germs of §4.4 and
§4.5 to give Γ complex charts. Prove that source and target are local biholomorphisms, that
identity, inverse and composition are holomorphic and satisfy the groupoid laws (Robbin–Salamon
2006, 6.5 (i)), and that the arrow topology is locally first countable. The comparison germs rely on
the universal-locus restriction of §5.2 at every selected object point.
*Needs:* §4.4, §4.5, §5.2, §5.3.

### 5.5 Auxiliary permutation and partitioned arrow topologies

*Unordered auxiliary labels.* For each fixed number r of auxiliary marks, close the countable
family of object charts under the finitely many permutations of the auxiliary labels. Give the
permutation-extended arrows of §1.3 complex charts by the same universal comparison applied to
the relabelled sections; the arrows with a fixed permutation carry the ordered comparison
topology. Prove the composition, inverse and relabelling laws and that the extended arrow space
is the finite union of its fixed-permutation parts. No action of a finite group on one chosen
base is assumed here; that is constructed in §6.4.

*Partitioned auxiliary labels.* For a finite partition of the auxiliary labels as in §1.4,
restrict to the arrows whose locally constant permutation lies in `∏_c S(Λ_c)`. Prove that this
is an open and closed subspace of the arrow space, with the inherited complex charts, local
biholomorphisms and holomorphic operations. It is a wide subgroupoid on the same object space,
not a restriction to fewer objects. Export it as the partitioned auxiliary arrow topology
(cited as *partitionedAuxiliaryArrowTopology*), with its two-colour case `S_(r₁) × S_(r₂)` and
its restriction and colour-forgetting laws.
*Needs:* §1.3, §1.4, §5.4.

**Checks.**
- With two colour classes of sizes r₁ = r₂ = 1 the permitted permutation group is trivial, so
  an arrow interchanging the two auxiliary marks lies in the unordered groupoid of §1.3 but not
  in the partitioned one; a definition allowing all of `S_(r₁+r₂)` would admit it.

### 5.6 Common refinements

Prove that the groupoid does not depend on the chosen countable family of universal charts:
two choices have a countable common refinement, and the comparison functors are fully faithful
and essentially surjective, with their natural isomorphisms (Robbin–Salamon 2006, 6.5 (ii)–(iii)).
This is the complex étale presentation of the stable curves of genus g with n marks.
Hausdorffness and properness of the arrow relation and compactness of the coarse space are
proved in Layer 6 and are not assumed here.
*Needs:* §5.4, §5.5.

### Examples

- For (g, n) = (0, 3) there is one stable signature, a single sphere with three marks; its
  parameter space is connected, every curve is isomorphic to `(OnePoint ℂ; 0, 1, ∞)`, and the
  groupoid is equivalent to a point with trivial isotropy.
- For (g, n) = (0, 4) there are two kinds of stable signature: the smooth sphere with four marks
  and the two-component trees with two marks on each component (three of them, by the choice of
  which marks share a component). A universal chart at a nodal curve has a one-dimensional base,
  with the smoothing parameter of the node as coordinate.

### Dependencies

Layers 0, 1, 3 and 4; GeometricTopology §1.7.

## Layer 6: degeneration, compactness and properness

### 6.1 Annuli, collars and Deligne–Mumford convergence

*Round annuli.* Construct the generic annulus and protected-collar comparisons used for the
convergence of domains and of maps. For a compact conformal annulus with holomorphic collar
extensions and reflection charts, form its holomorphic double, identify the resulting closed
genus-one surface by the period biholomorphism of §0.3, choose a nonzero holomorphic one-form
real under the reflection, and prove that the two fixed ovals become the parallel boundary lines
of a strip modulo its primitive period. Exponentiation then gives the round-annulus
normalization (cited as *roundAnnulusNormalization*): a biholomorphism to `A_ρ = {ρ < |z| < 1}`
with degree-one boundary correspondence and modulus `(2π)⁻¹ log(1/ρ)`. The reflection, period
and selected-half assertions are proved on this double; a classification of tori alone is not an
annulus normalization theorem.

*Modulus in families.* Prove the annulus-modulus family comparison (cited as
*annulusModulusFamilyComparison*): on a fixed compact annulus with C∞-converging uniformly
elliptic coefficients, construct the weak `H¹` Dirichlet energy minimizer with boundary values 0
and 1 by the scalar Hilbert, trace and coercive variational theory, prove that it has a smooth
harmonic representative and the identity between capacity and modulus, and compare the energies
to obtain continuity of the modulus at finite positive modulus. For a plumbing neck `xy = a` with
branch radii in a fixed interval `[c, C]`, `0 < c ≤ C`, compare the inner and outer round annuli
and prove
`log(1/ρ_a) = −log|a| + O(1)` as a → 0. Permanent nodes are the case of two punctured branches.
Construct the normalized degree-one holomorphic embeddings of end collars and their
nondegenerate limits after rotation and passage to a subsequence, using normal families,
Schwarz–Pick and reflection with explicit collar derivative bounds. The annulus-modulus and
compact-surface (Huber) comparisons used here are constructed in this section on the hypotheses of
ConformalMapping's scalar theorems; they do not follow from a theorem about the disc by renaming,
and ConformalMapping's generic constructions are not owned again.

*Collar interpolation.* Export the protected-collar annulus interpolation and the nodal annulus
branch limit (cited as *protectedCollarAnnulusInterpolation* and *nodalAnnulusBranchLimit*) for
two given orientation-compatible holomorphic end germs with controlled nondegenerate limits. Use
z on one end and w = ρ/z on the other, choose compatible real angular lifts (retaining their
integer Dehn twist), straighten nearby cut circles by smooth log-polar collar isotopies, and
interpolate monotonically across a spare middle annulus. Prove the positive-Jacobian and
embedding estimates and that the interpolation equals the given germs on smaller protected
collars. The interpolation is smooth; it is not a holomorphic automorphism matching two
independent boundary parametrizations.

*Annular convergence.* These yield C∞ convergence on compact subsets at finite modulus, and,
off a fixed middle circle, convergence to the two punctured branches when ρ → 0, uniformly over
compact parameter families, with fixed outer collars and compatibility with restriction to the
same prescribed germ. They are theorems about domain annuli, independent of any cover or global
parametrization of a moduli space of maps; AnalyticStableMaps builds its own simultaneous cover
from them.

*Deligne–Mumford convergence.* Define Deligne–Mumford deformations by cutting embedded circles
and mapping the pairs of cut boundaries to pairs of punctures, with monotypic convergence and
finite combinations of smoothing patterns. With the comparisons above, collar interpolation,
diagonal extraction and the plumbing coordinates of Layer 4, prove that Deligne–Mumford
convergence is equivalent to convergence in the universal charts of Layer 4, and the parallel
criterion for convergence of arrows through unique comparison germs. Include multi-node patterns
and restrictions with permanent nodes. A limit is unique up to isomorphism, not up to a unique
isomorphism.
*Needs:* §0.3, Layer 4, Layer 5; ConformalMapping Layers 0, 1, 2 and 4 (local mapping, normal
families, Schwarz–Pick, reflection); PDE §4.2 (coercive Dirichlet problems) and §1.6 (trace).

**Checks.**
- For the neck `{|x| < r, |y| < r, xy = a}` with 0 < |a| < r², projection to x identifies it with
  the annulus `|a|/r < |x| < r`, of modulus `(2π)⁻¹ log(r²/|a|)`; so
  `log(1/ρ_a) = −log|a| + 2 log r`, and the error term `2 log r` is bounded exactly when r stays
  in a fixed interval `[c, C]` with `0 < c`; for a fixed radius it is constant in a. The radii
  `r = |a|^(1/4)`, which satisfy `|a| < r²` and are bounded above, give the error
  `(1/2) log|a| → −∞`.

### 6.2 Hyperbolic collars and thick-core compactness

*Collars and short geodesics.* Prove the hyperbolic compactness ingredients used by
Robbin–Salamon 2006, §17, rather than citing Hummel's proofs: standard cusp and geodesic collar
coordinates and the collar-width formula; reduction of sufficiently short nonperipheral closed
geodesics to primitive simple core curves, with length multiplication for covers and a uniform
positive lower bound for the length of self-intersecting geodesics from the local analysis of thin
hyperbolic cylinders and triangles; disjointness of distinct simple closed geodesics each of
length less than `2 arsinh(1)`; and the bound `3g − 3 + N` for the number of curves of a system of
disjoint, pairwise non-homotopic essential simple closed curves, N the number of punctures and
boundary circles. Use the smooth relative classification of curve systems of §0.1e, not a
piecewise-linear homeomorphism, to fix the labelled cut type after passing to a subsequence and
composing with diffeomorphisms.

*Geodesic-cut metric.* Prove that cutting a complete finite-area hyperbolic metric along
disjoint simple interior geodesics gives the same metric on each piece with geodesic boundary. In
period-one Fermi coordinates its collar is `dr² + ℓ² cosh²(r) dθ²`, and even reflection across
r = 0 makes its double smooth, complete and hyperbolic. Compare with the conformal double and
apply the uniqueness of §0.4: the restricted metric is the canonical bordered metric, and each
new boundary length is the length of the original geodesic. It is not replaced by the Poincaré
metric of the open interior, and no comparison is inferred from Schwarz–Pick.

*Marked pants.* If length–twist coordinates are used for a fixed marked pants decomposition,
twists are real on marked Teichmüller space, and circle-valued only after the quotient by the
corresponding Dehn twists. Prove the finite-type, pants, collar and finite-cover comparisons
used here, without claiming uniqueness up to isotopy from circle-valued coordinates.

*Thick-core compactness.* For a sequence with no interior pinching and geodesic boundary
lengths tending to zero, construct a compact thick core covered by a uniform finite number of
embedded hyperbolic charts (fixed area by Gauss–Bonnet, injectivity radius and explicit
transition bounds), normalize frames and extract C∞ limits by Arzelà–Ascoli. Glue the limit
atlas, prove its completeness and its cusp models, and add the conformal punctures and marks.
Construct the comparison diffeomorphisms and collapse maps of Robbin–Salamon 2006, 17.4. The
proof includes the exhaustion without loss and the convergence of boundary geodesics to cusps.
*Needs:* §0.1e, §0.4.

**Checks.**
- Two simple closed geodesics that cross satisfy `sinh(ℓ₁/2) sinh(ℓ₂/2) ≥ 1`, so two with
  lengths less than `2 arsinh(1)`, where `sinh(ℓ/2) < 1`, cannot cross. Equality occurs: on the
  once-punctured torus whose generators A, B have `(tr A, tr B, tr AB) = (2√2, 2√2, 4)`, a
  solution of `x² + y² + z² = xyz`, so that `tr[A, B] = −2`, the geodesics of A and B are simple,
  cross once and both have length `2 arcosh(√2) = 2 arsinh(1)`; so the cutoff must be strict.
- On a closed surface of genus two the bound `3g − 3 + N` is 3, the number of curves of a pants
  decomposition; on a sphere with four punctures it is 1.
- A complete finite-area hyperbolic surface of genus g with N cusps has area `2π(2g − 2 + N)`;
  the thrice-punctured sphere has area 2π.

### 6.3 Compactness, Hausdorffness and properness

*Selection of pinching curves.* Pass to a fixed connected stable dual-graph and normalization
signature from the finite list, and work on the punctured normalization components. After
subsequences, select all pinching curves by a maximal finite induction, as in the proof of
Robbin–Salamon 2006, 17.5: while some cut piece has no uniform positive lower bound on the lengths
of its interior nonperipheral geodesics, choose a sequence of such geodesics with lengths tending to
zero, pass to a fixed labelled complement type by §0.1e, and cut along it. The collar lemma of §6.2
makes the chosen curves disjoint; exclude duplicates parallel to the boundary. At most the bound
`3g − 3 + N` of §6.2 can be added, so the induction stops; after the final subsequence no piece has
interior pinching, and every newly cut boundary has length tending to zero in the restricted metric
of §6.2. This is a statement about a subsequence and maximality, not a fixed list of isotopy classes
for every term.

*Deligne–Mumford subsequences.* Applying §6.2 to each bordered piece gives a Deligne–Mumford
convergent subsequence of every sequence of stable curves of genus g with n marks (Robbin–Salamon
2006, 17.5); §6.1 converts it into chart convergence.

*Sequential arrow extraction.* For convergent chart endpoints and fibre isomorphisms between
them, use the thick-core and collar maps and normal families of stable marked surfaces to
extract a limit isomorphism and its inverse (alternatively, prove the no-sphere-bubble argument
from the stable special-point counts and the local estimates of HeegaardFloer F2.3). Extend
across punctures and compare by the arrow criterion of §6.1.

*Arrow separation.* Prove that the arrow space is Hausdorff (cited as *arrowHausdorff*),
directly and before properness. Arrows with different endpoint pairs are separated in B × B.
For different maps over the same endpoints, choose a smooth point of the source where they
differ, extend it to a local section of the source family, and evaluate the holomorphic
comparison maps into the Hausdorff total space of the target family; disjoint target
neighbourhoods pull back to disjoint arrow neighbourhoods. The smooth point exists because the
smooth locus is dense and the maps are continuous. For extended arrows, distinct auxiliary
sections determine the permutation, so their arrows are separated as well. Prove continuity of
this evaluation on the comparison charts.

*Central Hom.* Prove that each central Hom set is empty or a torsor for the finite stable
automorphism group (a finite union of such torsors for unordered labels), cited as
*finiteCentralHom*; the uniqueness of §4.4 gives one comparison bisection germ for each central
arrow.

*Endpoint exhaustion.* Prove, before properness and before global second countability of the
arrows, that all arrows over some neighbourhood of an endpoint pair are exhausted by finitely
many comparison bisections (cited as *endpointNeighborhoodExhaustion*). In the Hausdorff locally
complex arrow manifold choose finitely many open bisection neighbourhoods W_f with compact
closures inside larger bisection charts. A nested countable basis of neighbourhoods of (a, b)
exists in B × B. If every member admitted an arrow outside the union of the W_f, choose an
escaping sequence; the sequential extraction above and the arrow criterion of §6.1 give a
subsequence converging to a central arrow, which lies in the open union, a contradiction. When
the central Hom set is empty, the same argument gives a neighbourhood with no arrows.

*Topological properness.* Shrink precompact source and target neighbourhoods so that their closures
stay in the larger chart domains. Over a compact subset of the smaller endpoint product the preimage
is a finite union of closed graphs of comparison maps on compact source subsets, hence compact. For
a general compact subset of B × B take a finite refinement by such neighbourhoods, or use its closed
preimage in the finite union of compact bisection closures. This proves that (s, t) : Γ → B × B is
proper (Robbin–Salamon 2006, 6.6), without assuming second countability of Γ. The same proof applies
to the finite permutation extension after fixing the permutation along a subsequence.

*Coarse separation.* A proper map into the locally compact Hausdorff space B × B is closed, so
the isomorphism relation, its image, is closed. The quotient map is open because the groupoid is
étale. Hence the coarse space is Hausdorff, and it is second countable from the countable basis
of B.

*Coarse compactness.* The Deligne–Mumford extraction makes the coarse space sequentially
compact; with second countability, it is compact.

*Second countability of the arrows.* B × B is σ-compact, properness gives a countable cover of
Γ by compact sets, and finite covers of these by locally second-countable arrow charts give a
countable atlas. No compactness of the total space of a universal chart over a noncompact base
is asserted.

*Partitioned properness.* Restrict the Hausdorff, étale and second-countable presentation to the
open and closed partition-preserving arrow subgroupoid of §5.5. Its arrows form a closed subset of
the full arrow space, so the endpoint map stays proper; the finite-central-Hom and extraction
arguments also apply directly after fixing the permitted permutation. Export this as the
partitioned auxiliary properness theorem (cited as *partitionedAuxiliaryProperness*). No quotient
by colour-preserving arrows is identified with the quotient by all of `S_r`.
*Needs:* §6.1, §6.2, §0.1e, §4.4, Layer 5; HeegaardFloer F2.3 (for the alternative
no-bubble route).

**Checks.**
- For (g, n) = (0, 4) the coarse space is the cross-ratio sphere (§8.3), compact; the
  sub-groupoid of smooth curves has coarse space the thrice-punctured sphere `ℂ ∖ {0, 1}`, not
  compact, so the nodal curves are needed for compactness.
- For a smooth curve C with nontrivial Aut(C) the central Hom set from C to itself is Aut(C),
  a torsor for Aut(C) and not a point: a groupoid recording only the coarse relation would lose
  it.

### 6.4 Finite action charts

Export the finite action universal chart (cited as *finiteActionUniversalChart*) for every stable
curve C, and the unordered auxiliary action chart (cited as *unorderedAuxiliaryActionChart*) when
its n distinguished labels stay ordered and its r auxiliary labels are unordered. Choose an object
chart component B_α of Layer 5, a point b ∈ B_α and a specified isomorphism C ≅ Q_(α,b) with the
fibre over b. Every selected B_α lies in its universal locus by §5.2, so the
unfolding is universal at b; choose a smaller neighbourhood inside that locus and transport the
central automorphisms through the specified isomorphism. This shrinking keeps universality; it
does not establish it at an arbitrary fibre. All bases U below lie in B_α, and Γ|_U is the full
restriction of the groupoid of Layer 5 to this component, not a newly adjoined universal family.
Let H be the finite group of central automorphisms, including the allowed auxiliary permutations
and any kernel of its action on the base.

*Action germs.* Extend each h ∈ H to a holomorphic comparison germ (φ_h, Φ_h) of the universal
family, with Φ_h carrying auxiliary mark j to auxiliary mark π_h(j). Use uniqueness with the
specified central arrow to prove, as germs, `φ_(gh) = φ_g ∘ φ_h` and
`Φ_(gh)(u) = Φ_g(φ_h(u)) ∘ Φ_h(u)`, with the identity and inverse laws.

*Invariant domain and lifted action.* Choose representatives on a common neighbourhood, impose
the finitely many composition laws there, and shrink to an H-invariant open base U on which all
maps and laws hold. Construct the lifted holomorphic action of H on the total space of the
universal nodal curve, and prove it faithful as an action on the family by restricting to the
central fibre; its action on the base may be ineffective. It preserves sections, nodes, branch
permutations and the quotient-sheaf maps, including at permanent nodes.

Apply the endpoint exhaustion of §6.3 at (C, C) and shrink U invariantly once more: the arrows
with both endpoints in U are exactly the comparison arrows (h, u) : u → φ_h(u). Prove the
isomorphism of topological and holomorphic groupoids `H ⋉ U ≅ Γ|_U`, including injectivity of
distinct central-arrow branches.

*Open coarse chart.* The induced map from U/H to the coarse moduli space, ordered or quotiented
by `S_r`, is a homeomorphism onto an open subset: the saturation of U is open for an étale
groupoid, and the full restriction gives exactly the stated equivalence relation and quotient
topology. Export the universal family with its lifted action, the local classifying and
evaluation maps, the pullback and common-refinement laws, and the statement that comparisons are
unique up to H. This is constructed after analytic properness and before Layer 8. It is not a
chart of the coarse space alone, not a strict action of Aut(C) assumed in Layer 5, and not an
application of a generic linearization theorem for orbifolds; neither Layer 7 nor any input from
moduli of maps is used.

*Partitioned action charts.* For the colour classes of §1.4, restrict the central group to the
subgroup H_partition of automorphisms preserving every colour. Restrict the lifted action and the
permitted-arrow presentation to that subgroup, using the clopen arrow topology of §5.5 and the
partitioned properness of §6.3. On a common invariant U the permitted arrows are exactly
`H_partition ⋉ U`, with its possibly ineffective action on the base and faithful action on the
family, and its quotient is open in the partitioned coarse moduli space. Export this as the
partitioned auxiliary action chart (cited as *partitionedAuxiliaryActionChart*) with its
two-colour case and its block-relabelling, colour-forgetting, family and refinement laws.
Forgetting colours need not be injective on coarse points and is not an inclusion of a full
subgroupoid.
*Needs:* §6.3, §5.2, §5.5, §4.4, §1.3, §1.4.

**Checks.**
- For an elliptic curve with one mark and j-invariant 1728, H = ℤ/4; its element of order two
  (the inversion of the curve) acts trivially on the one-dimensional universal base, so the base
  action of H factors through ℤ/2 while the action on the family is faithful. A chart recording
  only the effective quotient would lose the generic isotropy of order two.

### Examples

- The round annulus `A_ρ` has modulus `(2π)⁻¹ log(1/ρ)`; the neck `xy = a` in the unit bidisc
  is `A_|a|`, so its modulus tends to infinity as a → 0, which is how a node forms.
- For (g, n) = (1, 1), every stable curve has an automorphism of order two (the inversion of the
  smooth elliptic curves and the branch interchange of the nodal one), acting trivially on the
  base of a finite action chart; the coarse space is the j-line compactified by one point.

### Dependencies

Layers 0, 1, 4 and 5; ConformalMapping Layers 0, 1, 2 and 4; PDE §§1.6, 4.2; HeegaardFloer F2.3.

## Layer 7: the universal curve and operations on marked curves

### 7.0 The universal curve over the groupoid

The chart families of Layer 4 descend along the arrows of Layer 5 to the universal nodal curve
over the groupoid, whose fibre over a point is the marked curve itself, not its quotient by
automorphisms. Its total action groupoid has as objects the pairs (chart parameter, point of its
fibre) and as arrows the fibre isomorphisms carrying the first point to the second. Construct its
pullback and common-refinement laws. No universal family over the coarse space is asserted. The
universal curve is constructed once; other identifications are comparisons with it.
*Needs:* Layer 4, Layer 5.

### 7.1 Forgetting marks and stabilization

In the stable range define forgetting a mark followed by contracting exactly the components that
become unstable: rational tails and rational bridges. Construct the contraction in analytic
families, including products and permanent nodes. On a bridge with branch charts `xy = t₁` and
`uv = t₂`, suitable outer coordinates give `xv = t₁t₂`. Prove the contraction on all overlapping
charts, the direct image of the local quotient sheaf and its isomorphism away from the
exceptional component, properness, flatness and nodality of the target, and the universal
property against maps constant on the contracted fibres. Treat a tail by its single attaching
chart and moving-section coordinates.

*Ordered arrow descent.* Define forgetting on arrows: an isomorphism of curves of genus g with
n + 1 marks descends to an isomorphism of the stabilized curves with n marks. Prove the induced
homomorphisms of automorphism groups and their compatibility with the remembered point of the
universal curve and with branch interchange; they are not maps of coarse point sets. Glue the
local contractions to global ones by their uniqueness on overlaps, and prove iteration and
base-change coherence.

*Setwise forgetting.* Export forgetting a finite set S of auxiliary labels (cited as
*forgetAuxiliarySet*) when the retained labels are in the stable range. Construct the
stabilization after forgetting S and prove that iterated one-mark forgetting in any order is
canonically isomorphic to it: both contract exactly the eventually unstable rational trees and
bridges, and both satisfy the same universal property against maps constant on those fibres.
Prove the canonical comparison identities, composition and higher permutation and iteration
coherence by uniqueness, in analytic families and under arbitrary base change.

*Setwise arrow descent.* For an extended arrow (π, f) with π(S) = S′, prove that its descended
stabilized map does not depend on the order of forgetting and preserves the induced retained
labels; in particular forgetting all r auxiliary labels descends the whole permutation extension
of §1.3.

*Presentation functors.* On the étale and permutation-topology presentations of Layer 5, export
the induced homomorphisms of automorphism groups, with their possible kernels, and prove
compatibility with composition, branch interchange, the remembered point on the contracted family
and further forgetting. Prove continuity and holomorphy on the comparison charts and
compatibility with base change, families and arrows. This uses the universal curve of §7.0, not
the comparison of §7.2. The result is a functor with canonical natural comparison isomorphisms on
the retained-arrow presentations, not a map of coarse point sets and not the claim that ordered
iteration alone handles unordered sets; an arbitrary set map deleting components is not enough.

*Partitioned forgetting.* Restrict setwise forgetting and its maps on arrows, families and
automorphism groups to the partition-preserving groupoid of §1.4 and §5.5. An arrow carries the
forgotten subset S to S′ and induces the restricted permutation and partition of the retained
labels. In particular, with `S_(r₁) × S_(r₂)`, one may keep one unordered colour class and forget
the other: the retained class stays unordered and is not identified with the forgotten one.
Forgetting all auxiliary labels is the full `S_r` case. Export this as partitioned forgetting
(cited as *forgetPartitionedAuxiliarySet*) with the inherited canonical order and base-change
coherence.
*Needs:* §7.0, §2.3, §2.4, §4.5, §1.3, §1.4, §5.5.

**Checks.**
- On a bridge with `xy = t₁` and `uv = t₂` and bridge coordinates related by `yu = 1`, the outer
  coordinates satisfy `xv = (t₁/y)(t₂/u) = t₁t₂`: the contracted node has smoothing parameter
  t₁t₂, so it persists when either node does. A contraction that kept t₁ alone as the smoothing
  parameter would smooth the node while the second node persists.
- Forgetting the fourth mark of `(OnePoint ℂ; 0, 1, ∞, λ)` with λ ∉ {0, 1, ∞} gives
  `(OnePoint ℂ; 0, 1, ∞)` with no contraction; forgetting a mark on a component of the nodal curve
  of genus zero with four marks leaves that component with two special points, and it is
  contracted.

### 7.2 Collision bubbles and the universal-curve comparison

*Local charts.* A new point in the smooth unmarked locus gives an extra section; its collision
with an old mark or with a node gives an inserted rational bubble, carrying three special points
in the node case. Construct the blow-up and plumbing local charts, transition maps, inverse
contraction and base-change laws for these collisions in families, using Layer 2 and §7.1. At an
old mark track both labelled sections and the attaching flag; at a node track the two attaching
flags and the new mark, with the product coordinates of the contraction. These are constructions
on domains, before any application to moduli of maps. Export them as the marked-point collision
bubble charts (cited as *markedPointCollisionBubbleCharts*), with all their label, branch, arrow,
restriction and base-change laws. This local export serves collisions of combined labels without
the global comparison below or the scheme examples.

*Global comparison.* Construct the comparison between the universal-curve action groupoid of
§7.0 and the stable groupoid of genus g with n + 1 marks from these local charts and their arrows.
It is a Morita equivalence of retained-arrow étale groupoids over the groupoid of genus g with n
marks. Construct the common-refinement and bibundle maps, their full faithfulness and local
essential surjectivity, and the identifications of arrows and automorphism groups, including at a
point on a node or an old mark. It is neither a homeomorphism of coarse spaces alone nor a
canonical strict isomorphism of chosen chart sets. Prove its compatibility with the ordered,
setwise and partitioned forgetful functors of §7.1, their remembered-point maps, automorphism
homomorphisms and canonical iteration and base-change isomorphisms; this compatibility is
proved here, after those functors exist, and is not a premise of §7.1. This is an analytic
construction in the style of Knudsen, not supplied by the universal-unfolding theorem of
Robbin–Salamon alone.
*Needs:* §7.0, §7.1, Layer 2, Layer 5.

**Checks.**
- A point colliding with the node of the irreducible nodal curve of genus one with one mark gives
  a curve of genus one with two marks: a rational bubble carrying the new mark and two node
  branches, attached at two nodes to the normalization of the old component. Every component is
  stable, and the arithmetic genus is still one (b₁ of the dual graph is one).

### 7.3 Clutching

Construct external clutching `(g₁, I ⊔ {*}) × (g₂, J ⊔ {**}) → (g₁ + g₂, I ⊔ J)` and self-clutching
`(g, I ⊔ {*, **}) → (g + 1, I)` by pairing the indicated sections, relabelling marks by the
displayed maps of finite sets. The resulting local family has a permanent node `xy = 0`, so use
Layer 2 and §4.5 rather than a smooth total space. Prove compatibility with all arrows, graph
automorphisms and forgetting comparisons, and with the boundary smoothing line `T_* ⊗ T_**`.
*Needs:* Layer 2, §4.5, §7.1.

**Checks.**
- External clutching adds genera and self-clutching adds one: the dual graph gains an edge
  between two vertices (b₁ unchanged) or a loop (b₁ increases by one), as the genus formula of
  §1.1 says. Self-clutching a sphere with three marks gives the irreducible nodal curve of genus
  one with one mark, the boundary point of the compactified j-line.

### 7.4 Comparison with scheme-theoretic stable curves on examples

Compare with StableReduction Layers 3 and 9 only on definite presented examples: the complex
points and holomorphic quotient germs of the polynomial families `xy = s(b)`, including `xy = 0`,
`xy = b`, `xy = b²` and the two-step bridge `xy = t₁t₂`, with their polynomial base maps and the
displayed marked charts. Prove that the explicit node and contracted-family formulas agree. Use
the affine, open and fibre-product laws of `complexSchemeAnalytification` of ComplexComparisonPartII
§C-1.1 for these polynomial examples and prove the displayed comparisons of germs and families.
Neither a competing general analytification functor nor proper GAGA (ComplexComparisonPartII
§C1.9), Picard algebraicity (§C3.2) or derived algebraicity is used, and no comparison of all
analytic families is inferred.
*Needs:* §2.1, §7.1; StableReduction Layers 3 and 9; ComplexComparisonPartII §C-1.1.

### Examples

- Forgetting the last mark from the stable curves of genus zero with four marks to those with
  three marks is the map from the cross-ratio sphere to a point; its fibre is the universal curve
  over the point `(OnePoint ℂ; 0, 1, ∞)`, which is that sphere itself, with the three nodal curves
  sitting over the three marked points.
- Self-clutching the two extra marks of a sphere with four marks gives a curve of genus one with
  two marks and a permanent node, `xy = 0` over the base.

### Dependencies

Layers 1, 2, 4 and 5; StableReduction Layers 3 and 9; ComplexComparisonPartII §C-1.1.

## Layer 8: the orbifold adapter and low-genus moduli

### 8.1 The orbifold instance

After Layers 5 and 6, including the finite action charts of §6.4, regard the holomorphic chart
and arrow manifolds as real manifolds on the same underlying spaces, prove that all maps are
smooth and that source and target are local diffeomorphisms, and transport properness and second
countability to the retained-arrow carrier of Orbifolds O1. Holomorphic transition arrows
preserve the complex orientation; keep the full ineffective stabilizers. This is an instance of
the independently developed generic theory, not an input to Layers 0–7.
*Needs:* Layer 5, §6.3, §6.4; Orbifolds O1.

### 8.2 Coarse topology and the weighted pairing

Apply the compact coarse triangulation and finite CW construction of Orbifolds O3 (items 1–3) and
the rational Čech, singular, coarse and classifying-space comparisons of Orbifolds O4 to the
actual domain groupoid. Export the coarse homotopy maps and CW witness, and the product maps for
`DMbar_(g,n) × Xⁿ` when X is a given compact smooth target of finite CW type. Apply the weighted
rational perfect pairing of Orbifolds O5 with its orientation and generic kernel normalization.
Define this target adapter independently of any virtual class of stable maps. A downstream
Gromov–Witten operation is determined through this weighted pairing and the dual Čech functional
of the moduli of maps; a bare pushforward in coarse homology is not the cohomology-valued
operation. In particular a generic ineffective isotropy of order two contributes one half of the
ordinary coarse fundamental class. Keep the rational and real coefficient comparisons distinct,
with their finite-order invertibility assumptions.
*Needs:* §8.1; Orbifolds O3, O4, O5.

### 8.3 Low-genus moduli and test families

Prove that the coarse moduli space of stable curves of genus zero with three marks is a point,
and that of genus zero with four marks is the cross-ratio sphere, with three boundary points, each
a curve with one node. For genus one with one mark, prove that the boundary point is the
irreducible rational curve with one node, that the generic and the boundary isotropy are
ineffective of order two, and that the exceptional smooth points have isotropy of orders four and
six, at j = 1728 and j = 0. Prove that the stable curves of genus two without marks have generic
ineffective isotropy of order two. Distinguish pointed stability from stability of maps: verify
that spheres with zero, one or two special points and unmarked tori are objects of the miniversal,
identification-preserving and unframed groupoids of §4.6–§4.7. Test the independent two-node
plumbing against its diagonal pullback, the singular family `xy = b²` and permanent nodes, branch
interchange, base change of the node sheaf, the positive half-order trace budgets of §3.1–§3.2, the
dimensions of stable strata, and the absence of a finite atlas before Layer 6. These tests do not
replace the construction proofs.
*Needs:* §8.1, §8.2, §6.4, §4.6, §4.7, §2.4, §3.2.

**Checks.**
- The weighted fundamental class of the stable curves of genus one with one mark is half the
  coarse fundamental class: every point has an ineffective automorphism of order two.
- The universal base of genus g with n marks has dimension `3g − 3 + n`: 0, 1, 1 and 3 for
  (g, n) = (0, 3), (0, 4), (1, 1) and (2, 0), matching the point, the sphere, the j-line and the
  three-dimensional moduli of genus-two curves.

### Examples

- On the irreducible nodal curve of genus one with one mark, normalized as `OnePoint ℂ` with
  branches at 0 and ∞ and the mark at 1, the automorphism z ↦ 1/z interchanges the branches; in
  branch coordinates x = z and y = 1/z it exchanges x and y, so it fixes the smoothing parameter
  xy, and the isotropy at the boundary point acts trivially on the base.

### Dependencies

Layers 4, 5 and 6; Orbifolds O1, O3, O4 and O5.

## Downstream consumers

Other roadmaps cite this one with the labels D0–D8: item n of Dk is §k.n above (§0.1 being
§§0.1a–0.1f, and D1, D5 and D8 the whole of Layers 1, 5 and 8). In particular D0.1 reads as §0.1,
D0.3 as §0.3, D0.4 as §0.4, D0.5 as §0.5, D3.4 as §3.4 and D6.2 as §6.2.

- AnalyticStableMaps consumes §§0.1, 0.2, 0.3 and 0.5 (smooth source models, the genus-zero and
  genus-one models, properness of the diffeomorphism action and finite automorphism groups), Layer
  1, §3.5, Layer 4, Layer 5, §6.1 (*roundAnnulusNormalization*, *annulusModulusFamilyComparison*,
  *protectedCollarAnnulusInterpolation*, *nodalAnnulusBranchLimit*), §6.4
  (*finiteActionUniversalChart*, *unorderedAuxiliaryActionChart*), §7.1 (*forgetAuxiliarySet*,
  *forgetPartitionedAuxiliarySet*), §§7.2–7.3 and Layer 8.
- GromovWittenTheory consumes Layer 1, §3.5, Layer 4, Layer 5 (the chart groupoid on which it
  builds the Hodge bundle and cotangent lines), §6.4, §7.1 (with the bridge equation `xv = t₁t₂`),
  §7.2 (*markedPointCollisionBubbleCharts*), §7.3 (clutching and the smoothing line `T_* ⊗ T_**`)
  and Layer 8 (the weighted pairing and the ineffective isotropy of order two).
- ConformalMappingPartII consumes §0.4 (the complete finite-area hyperbolic metric with cusps on a
  sphere with at least three punctures).
- PainleveEquations consumes the normalization of points on the sphere (through §0.3), the
  point-pushing isotopies of §0.1c and the stable marked charts of Layers 3–5.

## Scope and ownership

**This roadmap owns** the analytic theory of prestable and stable complex curves over ℂ: the
oriented, labelled and marked normal forms of compact surfaces, the transport of the equality of
the analytic and topological genus to holomorphic one-forms on components, the
operator form of Riemann–Roch for line bundles on components, the genus-one classification,
finite-type uniformization and properness of the diffeomorphism action (Layer 0); nodal curves
with the genus formula, stability as finiteness and the auxiliary-label arrows (Layer 1); restricted
analytic nodal families, their local algebra and plumbing (Layer 2); the linear deformation theory,
the boundary Sobolev theory, holomorphic slices and the integrability equations of families
(Layer 3); Hardy gluing, universality for every restricted family, deformation groupoids and
miniversal unfoldings (Layer 4); the countable étale chart groupoid (Layer 5); degeneration,
compactness, Hausdorffness, properness and finite action charts (Layer 6); the universal curve,
forgetful maps, collision bubbles, clutching and the comparison with scheme-theoretic stable curves
on explicit examples (Layer 7); and the instance of the orbifold theory with the low-genus moduli
spaces (Layer 8). The roadmap is complete when the restricted family category with its local
algebra and base-change laws, universality for fixed and singular pullbacks with explicit Hardy
operators, the miniversal unstable groupoids, the countable étale charts followed by direct arrow
Hausdorffness, compactness and properness with the finite-action and unordered-label charts, and the
coherent analytic operations on marks and universal curves are all built; the orbifold adapter of
Layer 8 then supplies its comparison, which is not implicit in compactness alone.

**Owned elsewhere.**

- *Moduli of maps and virtual classes.* AnalyticStableMaps builds map-dependent stability and
  automorphisms, slices, moving-domain Cauchy–Riemann sections, gluing and compactness for an
  arbitrary almost complex structure, and all atlas axioms of its application; ImplicitAtlases
  builds the generic virtual-class engine (its §7.4 states the division of labour). Neither is proved
  here, and no identification of a virtual class with singular homology of the source, independence
  of the atlas or Gromov–Witten axiom is claimed.
- *Orbifolds.* Orbifolds O1–O5 own the generic theory of proper étale groupoids, their coarse
  triangulation and finite CW structure, rational comparisons and weighted Poincaré duality; Layer 8
  only instantiates them after properness, and nothing of Orbifolds is an input to Layers 0–7.
- *Scheme-theoretic stable curves.* StableReduction Layers 3, 9 and 10 own the pointed curves,
  contraction and stabilization, and stable maps over schemes; §7.4 compares only explicit examples.
- *The smooth classification of compact surfaces* and the genus `(2 − χ − b)/2`: GeometricTopology
  §1.7. This roadmap adds the oriented, labelled, collared and marked forms (§§0.1a–0.1e).
  The disc theorem and isotopy extension are GeometricTopology §3.3's; the handle calculus of
  cobordisms is a target of no roadmap cited here and is not used.
- *Analytic spaces*: ComplexComparisonPartII §C-1.1, with its `HolomorphicStructureSheaf`,
  convergent germs, Weierstrass division and Taylor completion, `ComplexAnalyticSpace` and its open
  and closed subspaces, gluing and fibre products, and `complexSchemeAnalytification`. Its
  GAGA (§C1.9) and quasi-coherator and Picard (§C3.2) are not inputs.
- *Meromorphic functions as finite maps to the sphere*: Tau Ceti turns a function meromorphic at
  every point of a compact connected Riemann surface into a holomorphic map to `OnePoint ℂ`
  (`TauCeti.RiemannSurface.sphereMap`, `TauCeti.RiemannSurface.mdifferentiable_sphereMap`), and a
  nonconstant one into a finite holomorphic map
  (`TauCeti.RiemannSurface.FiniteHolomorphicMap.ofMeromorphic`); it identifies the global sections
  of the divisor sheaf with the meromorphic functions satisfying the pole bound
  (`TauCeti.RiemannSurface.divisorSections.mem_range_toMeromorphic_iff`) and makes a finite map from
  a section space of dimension greater than one
  (`TauCeti.RiemannSurface.exists_finiteHolomorphicMap_of_one_lt_finrank_divisorSections`). The
  existence of a nonconstant meromorphic function by Riemann–Roch is ModularForms §10B's. This
  roadmap uses none of them.
- *Riemann–Roch*: the real Riemann–Roch formula for Cauchy–Riemann operators on an arbitrary closed
  or bordered source, PseudoholomorphicCurveAnalysis §7.2; the cohomological divisor Riemann–Roch,
  Serre duality and the equality of the analytic and topological genera, ModularForms §10B. The
  topological genus and the branched-cover Euler characteristic, FuchsianOrbifolds Layer 5.
  ComplexKahlerGeometry Layer 5 gives no Riemann–Roch for line bundles.
- *The sphere domain*: the Möbius group of `OnePoint ℂ`, the normalization of triples and the
  genus-zero classification, HeegaardFloer F2.6a.
- *Generic analysis*: Sobolev spaces, traces and compactness (PDE Layer 1), Cauchy–Riemann estimates
  and Fredholm theory (PseudoholomorphicCurveAnalysis Layers 1–7), cylindrical-end norms and
  determinant lines (HeegaardFloer F1.1, F1.4), normal families, Schwarz–Pick and reflection
  (ConformalMapping Layers 0, 1, 2 and 4), complex orientation, holomorphic implicit functions,
  Dolbeault
  theory, local analytic algebra, holomorphic bundles and compact Hodge theory (ComplexKahlerGeometry
  Layers 1–5), flows (DifferentialGeometry Layer 3), the second fundamental form of a boundary
  (RiemannianManifoldsWithConvexBoundary §1.4), and the Euler characteristic of finite CW types
  (AlgebraicTopology §§7.1–7.3).

**Already in the Tau Ceti library.** The following results are proved at the Tau Ceti pin and are
used above by name (supplier contracts below); the rest of each section stays a target.

| Section | At the Tau Ceti pin |
| --- | --- |
| §0.1c | ordered disc isotopies and point pushing in a preconnected open set: `TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_pairwise_disjoint`, `TauCeti.exists_diffeotopy_final_comp_eq_of_isPreconnected` |
| §0.4 | the curvature equation as criterion, and uniqueness, for closed surfaces: `Bundle.ContMDiffRiemannianMetric.exists_hyperbolicMetric_metric_eq_rescale_iff`, `TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale` |
| §0.5, §1.2 | reduction of finiteness of automorphisms to components, and the sphere and torus cases: `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff` and its two specializations |
| §1.1 | the nodal quotient, its Hausdorffness, stalks, node ring, locally ringed space, intrinsic nodes, connectedness criterion and dual graph with the genus identity for given component genera: `TauCeti.NodalGluing` (`Basic`, `StructureSheaf`, `RingedSpace`, `IntrinsicNodes`, `Connected`, `DualGraph`), `TauCeti.holomorphicStructureSheaf.nodeLocalRing`, `TauCeti.DualGraph` |
| §1.2 | isomorphisms and automorphisms, their descent and lifting: `TauCeti.NodalGluing.Iso`, `TauCeti.NodalGluing.Aut`, `TauCeti.NodalGluing.existsUnique_iso_gluedCurveHomeomorph_eq_iff`, `TauCeti.NodalGluing.existsUnique_iso_sheafedSpaceIso_eq_iff` |
| §§1.3–1.4 | the unordered and partitioned auxiliary groupoids, the torsor structure of the Hom sets with fixed permutation, relabelling and merging of blocks and the transport of colour classes: `TauCeti.NodalGluing.AuxiliaryMarkedCurve.unorderedAuxiliaryIsomorphismGroupoid`, `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid`, `TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv`, `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_comp_of_injective`, `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_le_comp`, `TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.perm_image_preimage`, `TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.image_image_point_inr_preimage` |
| §2.0 | the holomorphic structure sheaf of a complex manifold and its comparison with Mathlib's: `TauCeti.holomorphicStructureSheaf`, `TauCeti.holomorphicStructureSheaf.smoothSheafIso` |
| §2.1 | the node ring as `ℂ{x, y}/(xy)` and the off-node product charts at stalks: `TauCeti.holomorphicStructureSheaf.nodeLocalRing.planeNodeEquiv`, `TauCeti.holomorphicStructureSheaf.offNodeChartFstEquiv` |
| §3.1 | `H^s` on the circle with completeness, density, compact inclusions, finite unions, evaluation, the algebra estimate, scalar holomorphic Nemytskii maps, nowhere-vanishing multipliers and fixed diffeomorphisms for s ≥ 0: `TauCeti.CircleSobolev` |
| §3.6 | the Nijenhuis dictionary in a product trivialization and its sign comparison: `TauCeti.ComplexStructureFamily.nijenhuis_eq_zero_iff` |
| §4.3 | the nonlinear Hardy graph at a node and the ambient evaluation: `TauCeti.CircleSobolev.exists_analyticAt_hardyGraph`, `TauCeti.CircleSobolev.analyticAt_neckEvaluation_mul` |

## Exact supplier contracts

### From Mathlib

- `ChartedSpace`, `IsManifold`, `modelWithCornersSelf` (`𝓘(ℂ)`), `MDifferentiable`, `ContMDiff`,
  `Diffeomorph` (`≃ₘ⟮I, J⟯`, holomorphic for the model `𝓘(ℂ)`): the carriers of components and
  holomorphic maps.
- `AddCircle`, `lp`, `fourierCoeff`; `Submodule ℤ ℂ` with `IsZLattice` and
  `AddAction.orbitRel.Quotient` (the complex torus `ℂ ⧸ Λ`).
- `AlgebraicGeometry.LocallyRingedSpace` and `CategoryTheory.Groupoid` (with Tau Ceti's groupoids
  of Layer 1); `CategoryTheory.Subgroupoid.hom.faithful` (§1.4).
- `Module.Flat`, `Module.Flat.iff_rTensor_injective`, adic completion of Noetherian rings (§2.2).
- `modelWithCornersEuclideanHalfSpace` (`𝓡∂ 2`, the closed half-plane model of surfaces with
  boundary) and `ModelWithCorners.boundary` (the points whose chart image lies on the frontier of the
  model), for the bordered surfaces of §0.4.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved at the pin.

- *Compact Riemann surfaces* (`Analysis/Complex/RiemannSurface/`):
  `TauCeti.RiemannSurface.FiniteHolomorphicMap` (a nonconstant holomorphic map with finite fibres),
  `TauCeti.RiemannSurface.biholomorphOfDegreeEqOne` (a finite holomorphic map of degree one between
  compact connected Riemann surfaces is a biholomorphism),
  `TauCeti.RiemannSurface.ramificationDivisor`,
  `TauCeti.RiemannSurface.FiniteHolomorphicMap.eulerChar_eq_degree_mul_eulerChar_sub_ramificationDegree`
  (`χ(X) = deg f · χ(Y) − R(f)` when X, Y and the complement of the branch values have finite CW
  type), and `Diffeomorph.finite_fixingSubgroup_iff_nonempty` (`ComplexTorus.lean`; automorphisms of
  a complex torus fixing a set are finite iff the set is nonempty). The manifold structure of
  `OnePoint ℂ` (`Geometry/Manifold/Instances/OnePoint/`) and of quotients by discrete submodules
  (`Geometry/Manifold/Algebra/Quotient.lean`).
- *Euler characteristic* (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`):
  `TauCeti.FiniteCWType` and `TauCeti.eulerChar`, homotopy invariant, the alternating count of cells
  of any homotopy equivalent finite CW complex.
- *Diffeotopies* (`Geometry/Diffeomorphism/Diffeotopy/`): `TauCeti.Diffeotopy`;
  `TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_pairwise_disjoint` (`DiscConfiguration.lean`;
  in a Hausdorff boundaryless manifold of dimension greater than one, two finite ordered families of
  orientation-preserving collared discs with disjoint images in a preconnected open U agree on a
  given compact set after a diffeotopy fixed off a compact subset of U);
  `TauCeti.exists_diffeotopy_final_comp_eq_of_isPreconnected` (`Configuration.lean`; the same for
  ordered configurations of distinct points); `TauCeti.Diffeotopy.exists_extend_of_isCompact`
  (`Extend.lean`); `AddCircle.diffeotopyOfLift`, `AddCircle.collarDiffeomorphOfLift`
  (`AddCircle.lean`).
- *Hyperbolic metrics*: `TauCeti.HyperbolicMetric` (`Geometry/Manifold/Riemannian/Hyperbolic.lean`;
  a complete smooth metric of constant curvature −1); `TauCeti.HyperbolicMetric.HasFiniteVolume`
  (`Hyperbolic/FiniteVolume.lean`; finite Riemannian volume);
  `Bundle.ContMDiffRiemannianMetric.restrictOpenTangentSpace`
  (`Geometry/Manifold/Riemannian/Restriction.lean`; restriction to an open submanifold);
  `Bundle.ContMDiffRiemannianMetric.rescale`
  (`Geometry/Manifold/VectorBundle/Riemannian/Conformal.lean`);
  `Bundle.ContMDiffRiemannianMetric.exists_hyperbolicMetric_metric_eq_rescale_iff` and
  `TauCeti.HyperbolicMetric.eq_of_metric_eq_rescale`
  (`Geometry/Manifold/Riemannian/Hyperbolic/ClosedSurface.lean`;
  on a compact surface, a hyperbolic metric conformal to g exists iff the curvature equation has a
  smooth solution, and is unique when the model has no boundary).
- *Geodesics*: `TauCeti.Manifold.IsGeodesicCurve`
  (`Geometry/Manifold/Riemannian/Geodesic/Basic.lean`; a C² curve ℝ → M whose covariant
  acceleration for the Levi-Civita connection vanishes, for any model with corners), for the
  geodesic boundary of §0.4.
- *Nodal gluing* (`AlgebraicGeometry/Curves/NodalGluing/`): `TauCeti.NodalGluing.FlagPairData`,
  `TauCeti.NodalGluing.Marking`, `TauCeti.NodalGluing.GluedCurve`,
  `TauCeti.NodalGluing.t2Space_gluedCurve` (T2 components, finitely many flags),
  `TauCeti.NodalGluing.quotientMapOnComplNodeSetHomeomorph`,
  `TauCeti.NodalGluing.connectedSpace_gluedCurve_iff`,
  `TauCeti.NodalGluing.quotientStalkBranchEquiv`, `TauCeti.NodalGluing.quotientStalkToNodeEquiv`,
  `TauCeti.NodalGluing.locallyRingedSpace`, `TauCeti.NodalGluing.isDomain_quotientStalk_iff`,
  `TauCeti.NodalGluing.dualGraph` (component genera as input) with
  `TauCeti.NodalGluing.arithmeticGenus_dualGraph_add_card`; `TauCeti.NodalGluing.Iso`,
  `TauCeti.NodalGluing.Iso.gluedCurveHomeomorph_injective`, `TauCeti.NodalGluing.Aut`,
  `TauCeti.NodalGluing.Aut.branchPerm`,
  `TauCeti.NodalGluing.existsUnique_iso_gluedCurveHomeomorph_eq_iff`,
  `TauCeti.NodalGluing.existsUnique_iso_sheafedSpaceIso_eq_iff`; `TauCeti.NodalGluing.AuxiliaryIso`,
  `TauCeti.NodalGluing.AuxiliaryIso.finite`, `TauCeti.NodalGluing.AuxiliaryIso.permFiberEquiv` (the
  Hom set with a fixed permutation is a torsor for the ordered automorphisms),
  `TauCeti.NodalGluing.AuxiliaryAut` with its subgroup of ordered automorphisms,
  `TauCeti.NodalGluing.AuxiliaryAut.partitioned`, `TauCeti.NodalGluing.AuxiliaryMarkedCurve`,
  `TauCeti.NodalGluing.AuxiliaryMarkedCurve.unorderedAuxiliaryIsomorphismGroupoid`,
  `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid` with
  `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_comp_of_injective`
  and `TauCeti.NodalGluing.AuxiliaryMarkedCurve.partitionedAuxiliaryIsomorphismGroupoid_le_comp`
  (relabelling and merging blocks),
  `TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.perm_image_preimage` and
  `TauCeti.NodalGluing.AuxiliaryIso.PreservesColors.image_image_point_inr_preimage` (transport of
  colour classes and their marks); `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff` (connected
  components, finitely many components and flags: the ordered automorphisms are finite iff each
  component's automorphisms fixing its special points are),
  `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff_forall_two_lt_encard` (components
  biholomorphic to `OnePoint ℂ`: iff each has more than two special points) and
  `TauCeti.NodalGluing.AuxiliaryAut.finite_ordered_iff_forall_specialPoints_nonempty_of_complexTorus`
  (components biholomorphic to complex tori: iff each has a special point). From
  `Topology/Constructions/FiniteGluing.lean`: `Setoid.t2Space_quotient`,
  `Setoid.isClosed_setOf_rel`.
- *Dual graphs* (`AlgebraicGeometry/Curves/DualGraph/`): `TauCeti.DualGraph`,
  `TauCeti.DualGraph.arithmeticGenus_smoothing`,
  `TauCeti.DualGraph.sum_arithmeticGenus_cutComponent_add_card`.
- *Structure sheaves* (`Geometry/Manifold/Complex/StructureSheaf/`):
  `TauCeti.holomorphicStructureSheaf` (analytic sections),
  `TauCeti.holomorphicStructureSheaf.residueFieldEquiv`,
  `TauCeti.holomorphicStructureSheaf.smoothSheafIso` (with Mathlib's structure sheaf, boundaryless
  finite-dimensional model), `TauCeti.holomorphicStructureSheaf.nodeLocalRing` (pairs of branch
  germs with equal values; local), `TauCeti.holomorphicStructureSheaf.nodeLocalRing.planeNodeEquiv`
  (`ℂ{x, y}/(xy)` is the node ring), `TauCeti.holomorphicStructureSheaf.offNodeChartFstEquiv` and
  `TauCeti.holomorphicStructureSheaf.offNodeChartSndEquiv` (at a point with x ≠ 0, respectively
  y ≠ 0, the stalk of `xy = s` is the stalk of the product with that coordinate).
- *Circle Sobolev spaces* (`Analysis/Sobolev/Circle/`): `TauCeti.CircleSobolev` (weight
  `(1 + |n|)^s` on coefficients, a Hilbert space for Hilbert values),
  `TauCeti.CircleSobolev.dense_finite_support_coeff`,
  `TauCeti.CircleSobolev.isCompactOperator_inclusion`
  (finite-dimensional values, t < s), `TauCeti.CircleSobolev.piLpEquiv`,
  `TauCeti.CircleSobolev.toContinuousMap` (s > 1/2), `TauCeti.CircleSobolev.norm_mul_le`
  (s > 1/2), `TauCeti.CircleSobolev.analyticOnNhd_nemytskii` (s > 1/2, scalar),
  `TauCeti.CircleSobolev.mulFourierSeriesEquiv` (smooth nowhere-vanishing multiplier, every real s),
  `TauCeti.CircleSobolev.precompSmoothEquivOfLift` (smooth circle diffeomorphism, s ≥ 0),
  `TauCeti.CircleSobolev.neckGraph`, `TauCeti.CircleSobolev.isCompl_neckGraph` (`‖a‖ ≤ 1`),
  `TauCeti.CircleSobolev.mul_exp_mul_mul_exp_eq_of_mem_neckGraph`,
  `TauCeti.CircleSobolev.analyticAt_neckEvaluation_mul`,
  `TauCeti.CircleSobolev.exists_analyticAt_hardyGraph` (s > 1/2).
- *Families of complex structures* (`Geometry/Manifold/Complex/FamilyNijenhuis.lean`):
  `TauCeti.ComplexStructureFamily.nijenhuis_horizontal_vertical`,
  `TauCeti.ComplexStructureFamily.nijenhuis_horizontal_horizontal`,
  `TauCeti.ComplexStructureFamily.nijenhuis_vertical_vertical`,
  `TauCeti.ComplexStructureFamily.lieBracket_fiber_eq`,
  `TauCeti.ComplexStructureFamily.nijenhuis_eq_zero_iff` (finite-dimensional B and V, J of block form
  `(i a, α a + j v)` near p with α and j differentiable at p).
- *ConformalMapping at the pin* (`Analysis/Complex/Conformal/`): `TauCeti.montel` (normal families),
  `TauCeti.pseudoHyperbolicExpr_map_le` and `TauCeti.norm_deriv_div_one_sub_norm_sq_le`
  (Schwarz–Pick), and the reflection principles of `Reflection/`.

### From TauCetiRoadmap.ComplexComparisonPartII

- §C-1.1: `HolomorphicStructureSheaf` on ℂⁿ with its comparison to the convergent germs of
  ComplexKahlerGeometry §3.2 and to Tau Ceti's holomorphic sheaf; Weierstrass division and
  preparation and the Noetherian property through that comparison; the identification of the
  completed stalk with formal power series by Taylor truncation; `ComplexAnalyticSpace` with
  coherent closed quotients, open restrictions, open gluing and fibre products; and
  `complexSchemeAnalytification` with its affine, open, closed-quotient and fibre-product laws.
  Consumed in Layer 2 and §7.4. §C-1.1 does not depend on this roadmap or on any moduli of curves
  or maps.
- §C0.3 (a shape model only), §C1.9 and §C3.2 are named in the scope above and not consumed.

### From TauCetiRoadmap.ComplexKahlerGeometry

- §1.1 (complex orientation) and §1.2 (holomorphic implicit functions, Tau Ceti's
  `TauCeti.exists_jointImplicitFunction_of_eventually_mdifferentiableAt`); Layer 2 (local Dolbeault
  calculus).
- §3.2 (holomorphic germs, Weierstrass division and preparation) and §3.4 (factoriality of germ
  rings, the Rückert Nullstellensatz, local coherence), for §2.1–§2.2.
- §4.1 (holomorphic bundles and their section sheaves), for §0.2 and §2.1.
- Layer 5, §§5.1–5.10 (compact Hermitian elliptic theory, Dolbeault Hodge theory and Serre duality),
  for §§0.1f, 0.2, 0.4, 3.3 and 3.5. It contains no Riemann–Roch theorem for line bundles.

### From TauCetiRoadmap.PseudoholomorphicCurveAnalysis

- Layers 1, 3–5 (local Sobolev classes, planar Cauchy–Riemann estimates, similarity principle and
  unique continuation, elliptic bootstrapping and its uniform version §5.2), for §§3.2 and 4.2.
- Layer 6 with §6.1 (real Cauchy–Riemann operators and Sobolev sections over compact surfaces with
  boundary) and Layer 7: §7.1 (Maslov index) and §7.2 (`ind_ℝ D = nχ + μ(E, F)` for an arbitrary
  complex structure on a closed or bordered source), for §§0.2, 3.1–3.5.

### From TauCetiRoadmap.ModularForms

- §10B: Čech cohomology of line bundles on a nonempty connected compact Riemann surface, divisor
  Riemann–Roch `χ(𝒪(D)) = deg D + 1 − g_an` with `g_an = dim H¹(𝒪)`, Riemann–Roch for line
  bundles, Serre duality with `h⁰(K) = g_an`, and the equality of the analytic and the topological
  genus for every connected compact Riemann surface. Consumed in §§0.1f and 0.2.

### From TauCetiRoadmap.FuchsianOrbifolds

- Layer 5, items 1–3: the topological genus `(2 − χ)/2` of a compact Riemann surface, the degree
  theory of finite holomorphic maps (at the Tau Ceti pin), the branched-cover Euler characteristic
  formula and Riemann–Hurwitz. Consumed in §§0.1b, 0.1f and 0.2.

### From TauCetiRoadmap.HeegaardFloer

- F2.6a (§4.6a): the sphere `OnePoint ℂ` with its jointly holomorphic Möbius action, the
  normalization of three points, and the genus-zero classification through `O(p)` and degree one;
  consumed in §0.3, without its nonlinear sphere moduli.
- F1.1 (§3.1; strip and cylindrical-end norms) and F1.4 (§3.4; determinant lines and the convention
  `CZ = −μ_RS`), for Convention 7; F2.3 (§4.3; mean-value estimates, monotonicity and removal of
  singularities), whose local estimates are used in §§4.2 and 6.3; its compactness theorem is for
  genus zero and is not used.

### From TauCetiRoadmap.GeometricTopology

- §1.1 (collars) and §1.7 (the smooth classification of compact surfaces by Euler characteristic,
  number of boundary components and orientability, and the genus `(2 − χ − b)/2`), for §0.1.
- §3.3 (isotopy extension, with the disc theorem for balls at the Tau Ceti pin as
  `TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_det_chartAt_mul_pos`): the single-disc case
  that Tau Ceti's configuration theorem of §0.1c extends to ordered families.

### From TauCetiRoadmap.AlgebraicTopology

- §§7.1–7.3: the Euler characteristic of finite CW types (Tau Ceti's `TauCeti.eulerChar`), its
  homotopy invariance and additivity over subcomplexes and open covers, for §0.1b.

### From TauCetiRoadmap.DifferentialGeometry

- Layer 3 (§3.2 maximal flows, §3.3 completeness of compactly supported fields, §3.5 time-dependent
  flows, whose finite-dimensional results are at the Tau Ceti pin, among them `TauCeti.flowOf` and
  `TauCeti.timeDependentFlowDiffeomorph`): the flows on which Tau Ceti's diffeotopies of §0.1c and
  the collar extensions of §0.1d rest. The
  finite-dimensional branch is used, not the extension to Banach models.

### From TauCetiRoadmap.RiemannianManifoldsWithConvexBoundary

- §1.4: the second fundamental form II of the boundary of a smooth Riemannian manifold with
  boundary modelled on `𝓡∂ (n+1)`, here with n = 1, a symmetric bilinear form on the tangent space
  of the boundary at each boundary point q, with `II_q(u, w) = ⟨∇_(dι u) W, ν_in(q)⟩` for every
  vector field W, C¹ near q and tangent to the boundary along it, with `W(q) = dι w`, where ι is the
  inclusion of the boundary, ∇ Mathlib's Levi-Civita connection and ν_in the inward unit normal.
  Consumed in §0.4, where geodesic boundary is the vanishing of II.

### From TauCetiRoadmap.PDE

- Layer 1: §1.1 (weak derivatives and Sobolev classes, at the Tau Ceti pin),
  §1.4 (embeddings), §1.6 (trace, extension and Rellich compactness on Lipschitz domains), §1.7
  (Hölder spaces); §4.2 (existence and uniqueness for coercive Dirichlet problems), for §§0.4, 3.1,
  3.2 and 6.1. Its trace is of first order; the half-order trace of §3.2 is built here.

### From TauCetiRoadmap.ComplexTori

- Milestone 1: the complex torus `ℂ ⧸ Λ` of a lattice as a compact connected complex Lie group,
  with its lattice-preserving maps; consumed in §0.3 as the target of the period map. Its
  disclaimer of a classification by universal covers is respected: §0.3 proves the classification.

### From TauCetiRoadmap.StableReduction

- Layer 3 (prestable, stable and pointed curves over schemes, clutching, the single-marking
  contraction) and Layer 9 (marked stabilization), for the explicit comparisons of §7.4. Layer 10
  (stable maps) is not an input.

### From TauCetiRoadmap.Orbifolds

- O1 (presentations by proper étale groupoids retaining trivially acting elements), O3 items 1–3
  (coarse triangulation, finite covers and finite CW models), O4 (rational Čech, singular, coarse
  and classifying-space comparisons) and O5 (weighted integration and rational Poincaré duality),
  for Layer 8 only.

### From ConformalMapping

- Layers 0, 1, 2 and 4 of the completed ConformalMapping roadmap (local mapping and zero counting,
  normal families, Schwarz–Pick, reflection across analytic arcs), whose theorems are at the Tau Ceti
  pin (above), for §6.1.

## References

- J. W. Robbin and D. A. Salamon, *A construction of the Deligne–Mumford orbifold*, J. Eur. Math.
  Soc. 8 (2006), 611–699, DOI 10.4171/JEMS/69; arXiv:math/0407090v4. Locators are to the arXiv
  version, whose numbering differs from the journal's (its Lemma 10.2 is the journal's Lemma 8.2,
  the numbering the corrigendum uses): stability as finiteness of automorphisms, 3.7–3.8; Definition
  5.2 and Theorems 5.3–5.6; the étale groupoid, its common refinements, properness and compact
  quotient, 6.5–6.6; complex structures on the torus, 8.1; slices, properness of the diffeomorphism
  action and integrability of families, §§9–11 (9.1, 9.2, 10.2, 11.4); the complete nonlinear Hardy,
  node and decomposition proofs, §§12–15; topology and compactness, §§16–17 (17.3, 17.4, 17.5). The
  family quantifiers and the joint regularity of smoothing are stated in this roadmap explicitly,
  and the comparison for all restricted families (§4.5) extends the paper.
- J. W. Robbin and D. A. Salamon, *Corrigendum: A construction of the Deligne–Mumford orbifold*,
  J. Eur. Math. Soc. 9 (2007), 901–905, DOI 10.4171/JEMS/101: Lemmas A–B with both equations, the
  dictionary of brackets, the exceptions in genus and for α, and the Remark on Hamiltonian
  connections.
- C. Wendl, *Lectures on Holomorphic Curves*, version 3.3, §§4.2–4.3: slices with derivative offsets
  and the explicit qualifications in the unstable cases;
  no general compactness or gluing theorem is taken from this version.
- The references to Hummel in Robbin–Salamon 2006, §17, identify the compactness ingredient; the
  thick-core, collar and cusp theorems it needs are proved in §§6.2–6.3, and Hummel's proof is not
  used by citation.
- J. W. Robbin, Y. Ruan and D. A. Salamon, arXiv:1205.1662: a comparison for regular maps to
  integrable targets, not a replacement for stable maps with an arbitrary almost complex structure
  or for virtual theory.
