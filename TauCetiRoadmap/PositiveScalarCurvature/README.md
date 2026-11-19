# Roadmap: positive scalar curvature, surgery and bordism

**Summary.** Build the theory of smooth Riemannian metrics of positive scalar
curvature (PSC) on the native smooth-manifold carriers: the space R⁺(M) of such
metrics with its C² and C∞ topologies, metric families, isotopies and
concordances (Layer 1); PSC metrics on fibre bundles with PSC fibres and compact
isometric structure groups, including the Myers–Steenrod theorem that the
isometry group of a closed Riemannian manifold is a compact Lie group acting
smoothly (Layer 2); the Gromov–Lawson surgery theorem with its curvature
estimates and its relative, choice-independence and family versions (Layer 3);
bordism invariance of PSC in the simply connected range through handle
decompositions and the normal-structure hypotheses of Gromov–Lawson and Stolz
(Layer 4); the real Clifford-linear Dirac obstruction α and the classification
of closed simply connected manifolds of dimension at least five that admit PSC
(Layer 5); and the examples: low dimensions, Hitchin's exotic spheres in
dimensions 8j+1 and 8j+2 without PSC, Dold manifolds, tori and the continuity
of the Dirac index bundle in a PSC family (Layer 6). Scalar curvature, Ricci
positivity and sectional positivity are distinct conditions; only scalar
positivity is studied here.

## Scope and ownership

This roadmap owns:

- the symmetric-bilinear metric bundle Sym²(T*M), the identification of the
  native smooth metrics with its positive-definite sections, the C² and C∞
  topologies on metrics of a Hausdorff second-countable boundaryless manifold
  as subspace topologies of a supplied Fréchet section space, and the C^k
  topology on metrics of a compact manifold with boundary (1.1);
- the scalar curvature `metricScalarCurvature` of a smooth metric in that
  metric's own instances, the subtype `PositiveScalarMetrics` of PSC metrics,
  its smoothness `contMDiff_metricScalarCurvature`, the uniform gap
  `exists_uniform_scalar_gap`, openness of positivity and the family versions
  (1.2);
- scaling, product, disjoint-union and restriction laws of PSC and the scalar
  curvature of the round, complex projective and quaternionic projective models
  in the normalizations of the Conventions (1.3);
- collars, metric gluing, isotopies and concordances of PSC metrics (1.4);
- the Myers–Steenrod theorem for closed Riemannian manifolds, stated on the
  native isometry group of the Riemannian distance (2.1): HopfRinow Layer 4
  states its smooth Riemannian isometries and leaves the smoothness of a metric
  isometry as a separate milestone, which is this one;
- associated manifold-fibre bundles with boundary collars, the connection
  metric of a bundle with PSC fibre and compact isometric structure group and
  the O'Neill scalar formula (2.2), and the Fubini–Study invariance and metric
  comparisons for the projective-plane bundles of the transfer theorems (2.3);
- the Gromov–Lawson tube estimates, bending curve and surgery theorem, with
  its relative concordances, naturality, family and connected-sum versions
  (Layer 3);
- the interior surgeries making a bordism two-connected under the Spin and
  oriented nonspin normal-structure hypotheses, the handle-index bound for a
  bordism whose outgoing inclusion is two-connected, the transfer of PSC along
  such a bordism and the geometric PSC bordism groups (Layer 4);
- the vanishing of α on PSC manifolds and the classification (Layer 5);
- the Hitchin-sphere chain (coherent Moore-space coextensions, Toda's
  unstable classes, the μ classes and their α), the Dold-manifold and HP^k
  examples, the torus counterexample and the continuity of the index bundle
  in a PSC family (Layer 6).

This roadmap leaves to named suppliers, and never restates:

- the α-invariant, the ABS comparison and the complexification genus
  (TangentialBordism §7.1, labelled B3.0), structured oriented and Spin
  bordisms (TangentialBordism Layers 2–3, B1–B2), the associated-family
  transfers and the integral orientation-kernel and Spin-to-KO kernel
  theorems with their PSp3-equivariant HP² bundles (TangentialBordism
  §§10.2–10.4, B6.4–B6.6), the compact Lie group PU3⋊C₂ with its smooth
  orientation-preserving action on CP² (TangentialBordism §10.3), and the
  Dold-manifold conventions (TangentialBordism §6.6 and §10.3);
- Spin structures, spinor bundles, Clifford-linear Dirac operators, the
  Lichnerowicz formula and kernel vanishing (SpinGeometry G4–G6), the KO
  coefficient ring (TopologicalKTheory T7), the graded Fredholm and ABS
  construction (GeneralizedCohomology G5.5);
- smooth principal bundles (SmoothBundlesConnections B1), principal
  connections and their existence by partitions of unity and gluing of local
  potentials (SmoothBundlesConnections B3.1), finite faithful unitary
  representations of compact Lie groups, Stiefel universal-bundle
  approximations and the smoothing of continuous principal bundles and
  reductions over smooth bases, including relative homotopy versions
  (CharacteristicClasses C1, items 3–4);
- the Fréchet topology of smooth sections of a finite-rank real bundle over a
  Hausdorff second-countable boundaryless manifold, with its completeness,
  atlas independence and continuous restriction (ComplexKahlerGeometry K5a);
- manifolds with boundary, boundary gluing, handle attachment, tubular
  neighbourhoods and the framed-surgery interface (GeometricTopology Layer 1),
  ordered handle decompositions, cancellation, slides and the Whitney moves
  (HomotopySpheres §§1.2–1.6), homotopy spheres and Θ_n (HomotopySpheres
  Layer 2), the EHP sequence, Hopf invariants and unstable Toda brackets
  (HomotopySpheres §3C), the almost-framed exact sequence and the
  Kervaire–Milnor comparison (HomotopySpheres Layers 6–8), and the complex
  e-invariant of a torsion stable odd-sphere class with its additivity,
  naturality and the seventh-stem value (HomotopySpheres §9A.1);
- the closed-surface Gauss–Bonnet theorem (PositiveMass §3.1);
- the positive-Ricci Witten-genus and TMF questions (StringOrientation, a
  consumer).

The round-sphere, projective and curvature-formula inputs are
RiemannianGeometry's (R1, R2, R4, R4.7, R5a); the closed-subgroup theorem is
LieGroups', Peter–Weyl separation is CompactGroups', the stable comparison of
Toda brackets is BordismFormalGroups F4's, and the uniform elliptic estimates
of Layer 6 are PseudodifferentialOperators Layer 5's.

## Conventions

- A closed manifold is compact and without boundary. Every manifold is
  finite-dimensional and Hausdorff. Wherever the section topology of 1.1, the
  metric cone, the C² or C∞ topology on metrics, openness of positivity or a
  family of metrics appears, the manifold is in addition second-countable and
  without boundary, and the openness of the metric cone and of R⁺(M) is
  stated on closed M only; the local definitions (scalar curvature, R⁺(M) as
  a set, smoothness of scalar curvature) are stated on every model with
  corners.
  Compact manifolds with boundary use the half-space model
  `modelWithCornersEuclideanHalfSpace` (notation `𝓡∂ n`).
- In the classification (Layer 5), M is nonempty, connected, simply connected
  and of dimension n≥5; hence it is orientable. A Spin structure is fixed
  whenever α is written.
- A smooth metric is Mathlib's `Bundle.ContMDiffRiemannianMetric I ∞ E
  (TangentSpace I)`; `SmoothMetric I M` abbreviates it. Each metric g carries
  its own `RiemannianBundle` and `IsContMDiffRiemannianBundle` instances when
  Tau Ceti's Levi-Civita connection and `CovariantDerivative.scalarCurvature`
  are applied; `metricScalarCurvature g` is that scalar curvature, the metric
  trace of the Ricci tensor of the Levi-Civita connection of g. For each g, the
  Riemannian distance lives on a metric-carrying type synonym of M with
  `TauCeti.MetricSpace.ofRiemannianMetric` on a connected component (a T3
  preconnected manifold) and Mathlib's `EMetricSpace.ofRiemannianMetric`
  otherwise, with transported charts and the identity diffeomorphism;
  connections and scalar curvature are compared through that identity. Metric
  families remain sections on the fixed underlying manifold.
- Normalizations: the round sphere S^n(r) of radius r has scalar curvature
  n(n−1)/r²; CP^d carries the Fubini–Study metric of holomorphic sectional
  curvature 4, with scalar curvature 4d(d+1); HP^d carries the quaternionic
  metric of quaternionic sectional curvature 4, with scalar curvature
  16d(d+2), using the real quaternionic trace. For c>0,
  Scal(cg)=c⁻¹Scal(g). A product has scalar curvature the sum of the factors'.
- O'Neill tensor: for a Riemannian submersion with totally geodesic fibres and
  a g_B-orthonormal horizontal frame X_i, `|A|²=Σ_(i,j) g_F(A_(X_i)X_j,
  A_(X_i)X_j)` summed over all ordered pairs, with the unscaled vertical
  metric g_F.
- Concordances are PSC metrics on M×ℝ equal to g₀+dt² for t≤0 and g₁+dt² for
  t≥1; isotopies are continuous paths in R⁺(M).
- KO_n is ℤ for n≡0,4 mod 8, ℤ/2 for n≡1,2 mod 8 and 0 otherwise, with
  generators η∈KO₁, a∈KO₄ and the Bott generator b∈KO₈, c(a)=2u² and
  c(b)=u⁴ under complexification; α(K3)=a.
- (·)₂ is the projection of a torsion abelian group onto its 2-primary
  component along the sum of its odd-primary components (6.2). σ=E∞σ₈ is a
  generator of π₇ˢ≃ℤ/240; σ=±J₇(b) for the generator J₇(b) fixed by
  HomotopySpheres §9A.1, and no statement here depends on the sign. Toda's
  cone orientation and Adams's bracket sign are fixed in 6.2.

## Exact supplier contracts

### From Mathlib

- `Bundle.ContMDiffRiemannianMetric`, `RiemannianBundle`,
  `IsContMDiffRiemannianBundle` and `IsRiemannianManifold` (the Riemannian
  extended distance of a manifold equals its `PseudoEMetricSpace` distance);
  `EMetricSpace.ofRiemannianMetric` on a T3 manifold.
- `modelWithCornersEuclideanHalfSpace` and `IsManifold` on every model with
  corners; `LieGroup`, `ChartedSpace`, `ContMDiff`.
- `IsometryEquiv` with its group structure on `M ≃ᵢ M`, and the compact-open
  topology of `C(M, M)`, from which 2.1 induces the topology of the isometry
  group.
- `Ideal.primaryComponent`, `Ideal.iSup_primaryComponent_eq_top` and
  `Ideal.iSupIndep_primaryComponent` (a torsion module over a Dedekind domain
  is the internal direct sum of its primary components over the height-one
  primes), and `AddCommGroup.primaryComponent`.
- `Metric.sphere` in `EuclideanSpace ℝ (Fin (d+1))` as the topological
  d-sphere.

### From Tau Ceti

- `CovariantDerivative.leviCivitaConnection I M` and
  `CovariantDerivative.scalarCurvature`, on a finite-dimensional model with
  corners, in the metric's own instances.
- `TauCeti.MetricSpace.ofRiemannianMetric` on a T3 preconnected Riemannian
  manifold.

### From roadmaps on main

- RiemannianGeometry: R1 for scaling, product, conformal and submersion
  formulas for curvature, normal-coordinate jets and the projective metrics
  of CP^d and HP^d; R2 and R4 for Jacobi fields, exponential maps and convex
  normal balls; R4.7 for the normalized round models; R5a for the Gauss
  equation and second fundamental forms.
- SmoothBundlesConnections: B1 for smooth principal bundles, B1.4 for
  quotients, B3.1 for principal connections (existence by locally finite
  partitions of unity, gluing from local potentials), B6.0 for smooth good
  covers and convex normal balls.
- ComplexKahlerGeometry K5a: the complete Fréchet topology on smooth sections
  of a finite-rank real bundle over a Hausdorff second-countable boundaryless
  manifold, its atlas independence and continuous restriction.
- SpinGeometry G4–G6: Spin bundles, G5.0's `realCliffordSpinorBundle`,
  G6.0's `realSpinDiracClosedRealization` on the real H¹/L² carriers and
  `realSpinDiracIndexClass` in degree KO_n with its Clifford-sign,
  bounded-transform and finite-kernel comparisons, G6's Lichnerowicz formula
  `realSpinLichnerowiczFormula` and kernel vanishing.
- GeneralizedCohomology G5.5: the graded Fredholm and ABS construction.
- TopologicalKTheory T7: the real KO coefficient ring and the Clifford-module
  quotient.
- CharacteristicClasses C1, items 3–4: finite faithful unitary representation
  of a compact Lie group, Stiefel approximations `E_m=V_N(ℂ^m)` with their
  connectivity, and the smoothing of continuous principal bundles and
  reductions over smooth bases with relative homotopy versions; Stiefel–Whitney
  classes for 6.3.
- GeometricTopology Layer 1: manifolds with boundary, boundary gluing, handle
  attachment on a collared bordism, tubular neighbourhoods and the
  framed-surgery interface.
- HopfRinow Layer 4 (completed): smooth Riemannian isometries and the
  transport of the Levi-Civita connection and exponential map along them.
- LieGroups: the closed-subgroup theorem and the continuous-homomorphism
  theorem. CompactGroups: Peter–Weyl point separation.
- BordismFormalGroups F4: the stable comparison of Toda brackets.
- PseudodifferentialOperators Layer 5: uniform elliptic estimates on the
  Hilbert scale.

### From roadmaps earlier in the merge order

Consume TangentialBordism §7.1 (B3.0) for `spinABSDiracIndexComparison` and
`spinABSComplexificationGenus`, built on the real Clifford-linear Spin
operator and GeneralizedCohomology G5.5; this real index, with its mod-two
branches, is the one used, since the complex index does not detect them.
Consume TangentialBordism Layers 2–3 (B1–B2) for structured geometric
bordisms with product collars and their Pontryagin–Thom classes, §10.2 (B6.4)
for the associated-family transfers, §10.3 (B6.5) for the integral oriented
point-kernel theorem through CP² and RP² bundles and for the group PU3⋊C₂ with
its smooth action on CP², §10.4 (B6.6) for the Spin-to-KO kernel theorem
through PSp3-equivariant HP² bundles with the descended vertical Spin lift,
§6.6 for the Wall generators, and the HP^k Pontryagin classes it states for
every k. Consume HomotopySpheres §1.2 for ordered handle decompositions,
cancellation and slides, §1.4 for the local Whitney move, §1.5 for Whitney
discs in codimension at least three, §1.6 for the five-dimensional level,
Layer 2 for Θ_n and homotopy-sphere recognition, §3C.1 for the Hopf class η
and the EHP maps, §3C.3 for unstable Toda brackets with their
adjacent-nullhomotopy data and composition-subgroup indeterminacy, Layers 6–8
for the almost-framed exact sequence, framed kernel surgery and the
Kervaire–Milnor comparison (§8.2 and §8.3), and §9A.1 for the complex
e-invariant of a torsion stable odd-sphere class, its additivity and
naturality, and `e_C(J_7(b))=±1/240`. Consume PositiveMass §3.1 for the
closed-surface Gauss–Bonnet theorem. All three roadmaps precede this one in
the merge order and none consumes it.

## How to read the build

Layer 1 builds the carriers: the metric bundle and its section topologies,
scalar curvature, R⁺(M), the uniform gap, the model computations, collars,
isotopies and concordances. Layer 2 builds PSC metrics on bundles: the
isometry group of a closed Riemannian manifold is a compact Lie group, the
connection metric of a bundle with PSC fibre has PSC for small fibre scale,
and the projective-plane bundles of the transfer theorems carry such metrics.
Layer 3 proves the Gromov–Lawson surgery theorem and its relative versions.
Layer 4 turns bordisms with the right normal structure into sequences of
surgeries in codimension at least three and transfers PSC along them. Layer 5
proves that PSC forces α=0 and, with TangentialBordism's kernel theorems and
Layers 2–4, the classification. Layer 6 applies the theory: low dimensions,
the Hitchin spheres, Dold manifolds, tori and the index bundle of a family.

## Layer 1: Smooth metrics, positivity and families (P1)

### 1.1 The symmetric-bilinear bundle and the topology of metrics

Construct Sym²(T*M) as the symmetric subbundle of the supplied real bilinear
bundle on T M: project by b↦(b+bᵗ)/2, use local frames and constant-rank
gluing. Identify the native smooth metrics `SmoothMetric I M` with the
positive-definite smooth sections of Sym²(T*M) and prove the comparison in
both directions, on every model with corners.

For M Hausdorff, second-countable and without boundary, equip `SmoothMetric
I M` with the subspace topology from ComplexKahlerGeometry K5a's Fréchet space
of smooth sections of Sym²(T*M) (Hamilton, *The inverse function theorem of
Nash and Moser*, Part I, Example 1.1.5, p. 68, for the compact case). Prove
its chart and auxiliary-connection comparisons, identify the metric cone as
a convex cone in that space with the subspace topology, and consume K5a's
completeness and atlas independence. K5a's seminorms are taken over a
countable exhaustion by compact sets, so on a noncompact M the metric cone is
not open in that topology (a section may turn negative definite far out
while agreeing with a metric on every compact set); openness of the cone is
stated on closed M only. On closed M compare the C² and C∞ topologies with
the finite-atlas seminorms: define the C² topology by uniform coordinate
derivatives of orders 0, 1 and 2 over a finite atlas and prove atlas
independence, and prove that the metric cone is open in the C² topology and
in the C∞ topology. For a compact manifold with boundary on the half-space
model, define the C^k topology on metrics by the same finite-atlas seminorms
with boundary charts included and prove its atlas independence; this is the
topology used for the uniform margins of 1.4 and 3.3, and nothing of K5a is
applied to a manifold with boundary.

- The projection b↦(b+bᵗ)/2 is a smooth bundle map of constant rank
  n(n+1)/2 with image the symmetric forms, and the identity on them.
- A smooth metric is exactly a smooth positive-definite symmetric section; the
  comparison maps are mutually inverse.
- For second-countable boundaryless M the section topology is Fréchet,
  complete and atlas-independent, and the metric cone is convex; on closed M
  the metric cone is open in the C² and C∞ topologies, the C² topology is
  coarser than the C∞ topology and both are atlas-independent.

**Checks.**

- On ℝ² the form b(X,Y)=X¹Y² has (b+bᵗ)/2 the symmetric form with matrix
  entries 1/2 off the diagonal and 0 on it, and (b−bᵗ)/2 equal to half of
  dx¹∧dx²; a projection using (b−bᵗ)/2 sends the Euclidean metric to 0, so it
  is not a projection onto the symmetric forms.
- The Euclidean metric is a positive-definite symmetric section; its negative
  is symmetric and not a metric; the symmetric section with matrix
  diag(1,0) is positive semidefinite, degenerate and not a metric.
- For an uncountable disjoint union of circles the componentwise constant
  sections form ℝ^I with the product topology, which has no countable
  neighbourhood base at 0, so no Fréchet topology exists; this union is
  excluded by the second-countability hypothesis, and a countable disjoint
  union gives a countable product of Fréchet spaces, which is Fréchet.
- Convex combinations of metrics are metrics; the cone is not closed (the
  limit diag(1,ε) as ε→0 is degenerate). On closed M it is open: the
  smallest eigenvalue of g over a finite atlas has a positive lower bound λ,
  and every symmetric section whose coordinate entries lie within λ/n of
  those of g in the C⁰ seminorm of the atlas is positive definite, so a C⁰
  neighbourhood, hence a C² and a C∞ neighbourhood, of g lies in the cone.
- On the noncompact M=ℝ with g=dx², let φ be a bump function with compact
  support, 0≤φ≤1 and φ(0)=1, and h_k=(1−2φ(x−k))dx². For every compact K the
  sections h_k and g agree on K once k is large, so every seminorm of h_k−g
  in the compact-exhaustion topology is eventually 0 and h_k→g; but
  h_k(k)=−dx² is negative definite. Every neighbourhood of g contains a
  non-metric, so the cone is not open in K5a's topology on noncompact M and
  the openness statement is confined to closed M.

### 1.2 Scalar curvature, positivity, smoothness and the uniform gap

Define `metricScalarCurvature g : M → ℝ` as the scalar curvature of the
Levi-Civita connection of g in g's own `RiemannianBundle` instance, and R⁺(M),
the subtype `PositiveScalarMetrics`, by `∀ x, 0 < metricScalarCurvature g x`.
Prove the smoothness of scalar curvature `contMDiff_metricScalarCurvature`
on every model with corners, including the half-space models, and its
continuity as a second-order metric differential expression. On closed M
prove that R⁺(M) is open in the C² topology and in the C∞ topology. Prove the
uniform gap `exists_uniform_scalar_gap`: for one PSC metric on compact M there
is ε>0 with Scal(g)≥ε everywhere; and the family version: for a compact
parameter space P and a continuous family g_p in the C∞ topology of PSC
metrics on closed M, there is δ>0 with Scal(g_p)(x)≥δ for all p and x,
including families of metrics fixed on a neighbourhood of a specified closed
subset.

- `metricScalarCurvature g` is the metric trace of the Ricci tensor of the
  Levi-Civita connection of g; it is a smooth function on M.
- Membership in `PositiveScalarMetrics` is pointwise positivity at every
  point; the empty manifold has exactly one PSC metric.
- On compact M, positivity of scalar curvature implies a uniform positive
  lower bound, and positivity is open in the C² topology.

**Checks.**

- The round S²(r) has scalar curvature 2/r², so 2 at r=1 and 1/2 at r=2; in
  the chart inherited from the unit sphere, g_ij(0)=r²δ_ij and
  Ric_ij(0)=δ_ij at the pole for every r, so a definition summing the
  coordinate diagonal entries of Ric without the inverse metric gives 2 for
  every r, while the metric trace g^(ij)Ric_ij gives 2/r².
- The flat torus T² has scalar curvature 0 and is not in R⁺(T²).
- The disjoint union of a round S² and a flat T² has scalar values 2 and 0 on
  its components and is not in R⁺; a definition asking for positivity at some
  point, or for a positive total scalar curvature, would accept it.
- On the empty manifold the gap statement holds with ε=1.
- Compactness is necessary for the gap: on (0,∞)×S² with
  g=dr²+(r²/2)g_round, the warped-product formula with f(r)=r/√2 gives
  Scal=2(1−f′²)/f²−4f″/f=2/r², positive with infimum 0, equal to 2 at r=1
  and 1/2 at r=2.

### 1.3 Scaling, products, unions and the model spaces

Build pullback by diffeomorphisms, scaling, products, disjoint unions and
restriction to open subsets, with their scalar-curvature and metric-family
laws, from RiemannianGeometry R1's formulas. For c>0, Scal(cg)=c⁻¹Scal(g); a
product has scalar curvature the sum of the two factors'; scaling a compact
PSC factor down dominates a bounded negative contribution of the other
factor. Prove that round S^n(r) has scalar curvature n(n−1)/r² for n≥2 on
RiemannianGeometry R4.7's round models, and on R1's projective carriers with
holomorphic or quaternionic sectional curvature 4 prove Scal(CP^d)=4d(d+1)
and Scal(HP^d)=16d(d+2), using the real quaternionic trace.

- Pullback by a diffeomorphism φ satisfies Scal(φ*g)=Scal(g)∘φ and preserves
  R⁺.
- A disjoint union is in R⁺ exactly when every component is.
- For compact F with PSC metric g_F and any compact (B,g_B) there is ε₀>0 with
  g_B+ε²g_F in R⁺(B×F) for 0<ε<ε₀.

**Checks.**

- S²(r)=r²·S²(1): Scal=r⁻²·2=2/r², consistent with the scaling law.
- S²×T² with the round and flat metrics has scalar curvature 2+0=2; a rule
  multiplying the factors' scalar curvatures would give 0.
- S^n(1) has scalar curvature n(n−1): 0 for n=1, 2 for n=2, 6 for n=3.
- CP¹ with holomorphic sectional curvature 4 is S²(1/2): 4·1·2=8=2/(1/2)²;
  HP¹ with quaternionic sectional curvature 4 is S⁴(1/2): 16·1·3=48=12/(1/2)²;
  CP² gives 24 and HP² gives 128, the value TangentialBordism §10.4 uses.
- The hyperbolic plane (K=−1, Scal=−2) times S²(ε) has scalar curvature
  −2+2/ε², positive exactly for ε<1.

### 1.4 Boundaries, collars, isotopies and concordances

Use the half-space model for compact bordisms with boundary; smooth tensors
extend locally across boundary charts. Construct collars and metric
restriction and gluing on these models. Define isotopies as continuous paths
in R⁺(M) and concordances as PSC metrics on M×ℝ equal to g₀+dt² for t≤0 and
g₁+dt² for t≥1. Prove the equivalence between concordances with these product
tails and PSC metrics on M×[0,1] with product collars: given a concordance,
restrict it to [−1,2] and pull it back along a fixed smooth increasing
diffeomorphism ψ:[0,1]→[−1,2] equal to t↦t−1 near 0 and t↦t+1 near 1, so the
pullback is exactly g₀+dt² and g₁+dt² near the endpoints and stays PSC by
diffeomorphism invariance; conversely extend a product-collared metric by its
exact product tails. Prove these conversions preserve the endpoint data and
witness the same concordance relation. Prove reversal, concatenation and
collar-smoothing laws, and that an isotopy produces a concordance: first
smooth the compact parameter path by finite local combinations of metrics,
relative to the endpoints and within its uniform C²-positive margin; then
slow its smooth parameter with quantitative curvature bounds, in the C^k
topology of 1.1 on M×[0,1]. Carry the endpoint metric and collar data
explicitly.

- Concordance is an equivalence relation on R⁺(M) for closed M.
- The constant path at g gives the concordance g+dt².
- An isotopy g_t, t∈[0,1], in R⁺(M) with closed M yields a concordance from
  g₀ to g₁.

**Checks.**

- The product g+dt² has scalar curvature Scal(g), so it is a concordance from
  g to g.
- Near t=0 the pullback of g₀+dt² along t↦t−1 is g₀+dt², since dt is
  translation-invariant.
- Restriction to [0,1] alone need not give product collars: on S²×ℝ the
  metric dt²+(1+t)g_round has f²=1+t in the warped-product formula and scalar
  curvature 2/(1+t)+1/(2(1+t)²), positive for t>−1 (5/2 at t=0, 9/8 at
  t=1); its restriction to [0,1] is PSC with ends g_round and 2g_round but is
  a product near neither end.
- Slowing the parameter: dt²+(1+t/L)g_round on S²×[0,L] has scalar curvature
  2/(1+t/L)+1/(2L²(1+t/L)²), whose correction to the slice value
  2/(1+t/L) is of order L⁻²; the margin of the slices absorbs it for large L.

### Examples

Round spheres, projective spaces and products of a round sphere with any
compact manifold are in R⁺ after scaling the sphere; the flat torus and every
metric on a circle or on a one-dimensional manifold have scalar curvature 0
and are not. The warped products of 1.2 and 1.4 are the noncompact and
non-collared controls.

### Dependencies

Mathlib's smooth Riemannian metrics and models with corners; Tau Ceti's
Levi-Civita connection and scalar curvature; RiemannianGeometry R1 and R4.7;
ComplexKahlerGeometry K5a.

## Layer 2: Positive fibres and bundle metrics (P2)

### 2.1 Isometry groups of closed Riemannian manifolds

For a closed Riemannian manifold (F,g) construct its isometry group on the
Riemannian-distance carrier: the group `F ≃ᵢ F` of isometries of the
Riemannian distance, with the topology induced from the compact-open topology
of `C(F, F)`. Compare metric isometries with HopfRinow Layer 4's smooth
Riemannian isometries and prove the Myers–Steenrod theorem
`compact_isometryEquiv_lieGroup`: the isometry group is a compact Lie group,
of dimension at most n(n+1)/2 for n=dim F, acting smoothly on F (Kobayashi,
*Transformation Groups in Differential Geometry*, Ch. II §1).

Route. First prove metric isometries smooth, using SmoothBundlesConnections
B6.0's convex normal balls and squared distances to finitely many nearby
centres as smooth local coordinates. Then prove the connected-fibre lemma:
evaluation at one orthonormal frame determines an isometry on a connected
component and controls its derivatives through the exponential formula of
RiemannianGeometry R2 and R4. A compact manifold has finitely many
components; for possibly disconnected F choose one frame in each component
and retain both the induced finite permutation of components and the image
frame of every chosen frame; prove this data determines each isometry and
controls its derivatives. Use Arzelà–Ascoli for compactness. Prove the
no-small-subgroups property: for a compact subgroup contained in a
sufficiently small identity neighbourhood, average its small orbits to their
unique centres in convex normal balls; the resulting fixed-point map is
uniformly C¹-close to the identity and a diffeomorphism, so the subgroup is
trivial. Build all uniform Hessian and implicit-function bounds in that
argument. Consume CompactGroups' Peter–Weyl separation to find finitely many
representations whose common kernel lies in that neighbourhood;
no-small-subgroups makes their sum faithful. Its closed unitary-group image
gives the Lie structure by LieGroups' closed-subgroup theorem; frame
evaluation and the exponential formulas prove the action smooth. This
supplies the full isometry structure group of the bundle construction in 2.2,
which also applies to a specified Lie group with a smooth isometric action.

- Every isometry of the Riemannian distance of a closed Riemannian manifold
  is a smooth Riemannian isometry, and conversely.
- `compact_isometryEquiv_lieGroup`: on a closed Riemannian manifold F
  (boundaryless, `IsRiemannianManifold`), there are d and a smooth atlas on
  `F ≃ᵢ F` modelled on ℝ^d for which it is a compact Lie group and evaluation
  `(φ,x) ↦ φ x` is smooth.
- Frame evaluation is injective on each component; an isometry permutes
  components.

*Needs:* 1.2; HopfRinow Layer 4; RiemannianGeometry R2, R4; SmoothBundlesConnections
B6.0; CompactGroups; LieGroups.

**Checks.**

- The round circle has isometry group O(2) with d=1; the round S² has O(3)
  with d=3=2·3/2, the maximal dimension.
- Three isolated points with the discrete Riemannian distance have isometry
  group the symmetric group S₃ of order 6 and d=0.
- The disjoint union of two round spheres of equal radius has isometry group
  the wreath product of O(3) by C₂: the permutation of the components and one
  frame image per component determine the isometry.
- Euclidean ℝⁿ has the noncompact isometry group E(n): compactness of F is
  used.
- Rotations by 2π/k lie in every identity neighbourhood of O(2) for large k,
  but the subgroup each generates contains a rotation by at least π/2, so
  O(2) has no small subgroups; a Lie group has none, which is what the
  faithful-sum step uses.

### 2.2 Associated bundles and connection metrics

Construct P×_G F for a smooth principal G-bundle P (SmoothBundlesConnections
B1) and a smooth G-action on F: glue the local U×F charts with their action
transition maps, prove the cocycle, Hausdorff and smooth-submersion laws, and
identify the quotient topology and pullbacks. Use base half-space charts and
product collars when the base has boundary. Consume CharacteristicClasses C1,
items 3–4, for the finite faithful unitary representation of a compact Lie
group, the Stiefel approximations and the smoothing of a continuous principal
bundle over a smooth base; own the adapter for compact smooth bases with
boundary: smooth relative to an already smooth boundary collar, and identify
the pullback with the original continuous bundle. Consume
SmoothBundlesConnections B3.1 for a smooth principal connection, which exists
by locally finite partitions of unity.

For a bundle F→E→B with compact smooth base, compact fibre F carrying a PSC
metric g_F, and structure group acting by g_F-isometries, construct the
horizontal distribution from the principal connection and the connection
metric g_ε=π*g_B+ε²g_F. Prove the fibres totally geodesic and derive the
scalar formula `Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F)−ε²|A|²`, with |A|² the
frame-independent contraction of the Conventions. Prove uniform estimates and
choose a positive ε making the total scalar curvature positive. Establish
smooth base change and compact-family versions, with product boundary collars
when the base has boundary. Compactness supplies the lower fibre bound and
the upper error bound; positivity of the base metric is not assumed.

- g_ε is a smooth metric on E for every ε>0, a Riemannian submersion onto
  (B,g_B) with totally geodesic fibres isometric to (F,ε²g_F).
- |A|² is independent of the horizontal orthonormal frame and bounded on E.
- There is ε₀>0 with g_ε in R⁺(E) for 0<ε<ε₀; the family ε↦g_ε is continuous
  in the C∞ topology.

*Needs:* 1.2–1.3; SmoothBundlesConnections B1, B3.1; CharacteristicClasses C1
items 3–4; RiemannianGeometry R1 (submersion formulas); 2.1 for the isometry
structure group.

**Checks.**

- Hopf fibration S³→S²(1/2) with unit circle fibres: |A|²=2 (the two
  off-diagonal terms each 1, the diagonal terms 0), Scal(g_B)=8,
  Scal(g_F)=0, so Scal(g_ε)=8−2ε²; at ε=1 this is 6, the round S³, and
  summing only over unordered pairs would give 7 there.
- A product bundle has A=0 and Scal(g_ε)=Scal(g_B)+ε⁻²Scal(g_F).
- Flat T²×S² with g_ε=flat+ε²g_round has scalar curvature 2/ε²>0 for every
  ε: positivity of the base is not needed; the hyperbolic base of the 1.3
  Check needs ε<1.

### 2.3 The projective-plane bundles of the transfer theorems

Apply 2.2 to the associated RP², CP² and HP² bundles of TangentialBordism
§§10.3–10.4, retaining each orientation and Spin structure. Consume
TangentialBordism §10.3's compact Lie group PU3⋊C₂, with C₂ acting by
complex conjugation, and its smooth action on CP²; prove here that this
action preserves RiemannianGeometry R1's Fubini–Study metric. HP² uses PSp3
and TangentialBordism's descended vertical Spin lift. These are metrics on
the transfer's actual total spaces, not replacement manifolds in the same
rational class.

- The PU3⋊C₂-action on CP² is by isometries of the Fubini–Study metric of
  holomorphic sectional curvature 4.
- Every associated CP², HP² and RP² bundle over a compact base, with or
  without boundary, carries a PSC connection metric with product collars.

*Needs:* 2.2; RiemannianGeometry R1 projective metrics.

**Checks.**

- Complex conjugation on CP² has degree (−1)²=+1 (TangentialBordism's own
  Check) and preserves the Fubini–Study metric: conjugation of ℂ³ is a
  real-linear isometry of the unit S⁵ normalizing the circle action, so it
  descends to an isometry of the quotient metric.
- Scal(CP²)=24, Scal(HP²)=128, Scal(RP²)=2 for the metric covered by the unit
  round sphere.
- The Berger sphere, the Hopf connection metric of 2.2 on S³ over S²(1/2)
  with fibre scaled by ε²=1/2, has Scal=8−2·(1/2)=7, larger than the round
  value 6: shrinking the fibre of a flat-fibre bundle raises the scalar
  curvature, and 8−2ε² stays positive for every ε<2, so the Hopf bundle
  needs no shrinking at all; a formula with the sign of the |A|² term
  reversed would give 9 at ε²=1/2 and could never lose positivity.

### Examples

Berger spheres as Hopf-fibration connection metrics; CP² bundles with
structure group PU3⋊C₂ over flat tori (the mapping tori of 6.3); HP² bundles
with structure group PSp3.

### Dependencies

Layer 1; HopfRinow Layer 4; SmoothBundlesConnections B1, B3.1, B6.0;
CharacteristicClasses C1; RiemannianGeometry R1, R2, R4; LieGroups;
CompactGroups.

## Layer 3: Metric surgery and relative extension (P3)

### 3.1 Tube estimates and the bending curve

Let (M^n,g) be a closed Riemannian manifold with a framed embedded sphere
S^k⊂M of codimension q=n−k≥3 and a framed tubular neighbourhood. Own the
uniform tubular estimates: among the principal curvatures of the distance
tube of small radius r, q−1 have leading term −1/r and the remaining k stay
bounded. Prove the rescaled C² comparison with the normal-connection
sphere-bundle metric, including base and vertical derivative bounds.
Construct the Gromov–Lawson bending curve and torpedo metric, with smooth
endpoints and all required derivative bounds, and use R1's normal metric
estimates and R5a's Gauss equation to prove scalar positivity through the
bending region. In the point case pin the bending scalar term as
`(n−1)(n−2)sin²θ/r²−2(n−1)k_γ sinθ/r`, plus the bounded ambient-curvature
and normal-coordinate error terms, with k_γ the chosen signed curve
curvature. Derive the corresponding codimension-q tube estimate from the
actual principal curvatures, controlling its r⁻¹ errors before choosing the
bending curve. Supply the first small-angle bend, the straight shrinking
interval and the final bend with smooth inequalities throughout; a schematic
picture does not choose these constants.

- Principal curvatures of the tube boundary: q−1 of them equal −1/r+O(1),
  the other k are O(1), uniformly for small r.
- The bent metric is PSC on the bending region for admissible (r, bending
  function) data.

*Needs:* 1.2–1.4; RiemannianGeometry R1, R5a; GeometricTopology Layer 1
tubular neighbourhoods.

**Checks.**

- The tube of radius r around a point (k=0, q=n) is S^(n−1)(r): all n−1
  principal curvatures are −1/r and none is bounded, as the count q−1=n−1
  says.
- The tube of radius r around a line in ℝ³ (k=1, q=2) is a cylinder with
  principal curvatures −1/r and 0: one leading term and one bounded term.
- The bending term at θ=π/2 and k_γ=0 is (n−1)(n−2)/r², the scalar curvature
  of S^(n−1)(r).
- The model tube S^(q−1)(r)×ℝ^k has scalar curvature (q−1)(q−2)/r², which
  vanishes at q=2: codimension two gives no positive tube term, which is why
  q≥3 is assumed.

### 3.2 The surgery theorem

Let (M^n,g) be a closed manifold with a PSC metric g, and S^k⊂M a framed
embedded sphere with q=n−k≥3. Replace S^k×D^q by D^(k+1)×S^(q−1) along the
framed tubular neighbourhood, matching g on the exterior collar, and prove
that the resulting closed manifold M′ carries a PSC metric g′ equal to g
outside the chosen tubular neighbourhood (Gromov–Lawson, Theorem A, p. 423).
Construct the collar interpolation with a uniform positive margin, not a
partition-of-unity average of PSC metrics. The surgery is the boundary of a
handle of index λ=k+1 in dimension n+1, with belt sphere of dimension
n−λ=q−1, so q≥3 is exactly belt-sphere dimension at least 2. Include the
creation and removal of round components and connected sums in dimension
n≥3, with their neck metrics and collars.

- Surgery in codimension at least three on a closed PSC manifold yields a
  closed PSC manifold, with the metric unchanged outside the surgery
  neighbourhood.
- Connected sums of closed PSC manifolds of dimension n≥3 carry PSC metrics
  equal to the given ones away from the neck.

*Needs:* 3.1; GeometricTopology Layer 1 framed surgery and handle attachment.

**Checks.**

- Starting PSC metric: for M=K3×K3 and a framed S⁰ the surgered manifold is
  M#(S¹×S⁷), Spin-bordant to M with α=a²=4b≠0, so it has no PSC metric; the
  theorem does not apply because K3×K3 has none either (α≠0).
- Round S⁸ with a framed S⁰ gives S¹×S⁷ with a PSC metric: the product of a
  circle with the round S⁷ has scalar curvature 42.
- Dimension: the connected sum of two tori is a closed surface of Euler
  characteristic −2 with no PSC metric (PositiveMass §3.1), consistent with
  the theorem, which needs q=n≥3 for connected sums.
- Belt sphere: λ=k+1 and n−λ=q−1≥2 exactly when q≥3.

### 3.3 Relative concordances, naturality, families and connected sums

Construct relative PSC concordances between the results of 3.2 for any two
admissible sufficiently small radii and bending functions: interpolate the
radius and bending data with a uniform curvature bound and positive scalar
gap, and stretch the cylinder parameter so that its mixed curvature terms
preserve that gap, with the margins measured in the C^k topology of 1.1. Fix
the metric g outside the surgery neighbourhood and on its boundary collars.
Prove independence of the choices by these concordances, naturality under
isometries preserving the framed data, simultaneous disjoint surgeries and
compact parameter-family constructions with supplied framings, all starting
from a PSC metric g or a compact family of PSC metrics.

- Any two admissible choices in 3.2 give concordant results, by a concordance
  fixed outside the surgery neighbourhood.
- An isometry of (M,g) carrying one framed sphere to another carries the
  surgered metrics to each other.
- For a compact family g_p of PSC metrics and a continuous family of framed
  spheres, the surgered metrics form a continuous family.

*Needs:* 1.4; 3.2.

**Checks.**

- Two radii r₁<r₂: the interpolation of radii is a path of admissible data
  and the resulting concordance has scalar curvature at least the common gap.
- Disjoint surgeries commute: the surgered metrics agree, since each is g
  outside its own neighbourhood.
- The family version at a one-point parameter space is 3.2.

### Examples

Connected sums of round spheres; S¹×S⁷ from S⁸; connected sums along framed
circles in dimension at least four.

### Dependencies

Layer 1; RiemannianGeometry R1, R5a; GeometricTopology Layer 1.

## Layer 4: Bordism surgery and normal structures (P4)

### 4.1 Interior surgeries to a two-connected inclusion

For a structured bordism W^(n+1) between N and M, n≥5, construct interior
surgeries making the outgoing inclusion M→W two-connected under the following
two normal-structure hypotheses. In the Spin case both M and W are Spin and M
is simply connected. First discard closed components of W that meet neither
boundary, and join the remaining components by interior 0-surgeries with
their compatible oriented or Spin framings, so that W is connected without
changing its boundary. In the oriented nonspin case M is simply connected and
w₂(M)≠0; retain the nonzero w₂ class of the normal 1-type instead of killing
it. Use finite generators and embedded circles to kill π₁(W); prove that
oriented normal bundles over those circles are trivial, and choose framings
preserving the specified Spin structure. For π₂ use general position to
obtain embedded spheres and identify the normal framing obstruction with w₂;
in the Spin case it vanishes, in the nonspin case kill the kernel of w₂ and
use a sphere from the outgoing M detecting w₂ to make the outgoing π₂ map
surjective. Prove all normal-structure and relative-boundary comparisons. The
bordism dimension is n+1, so circle surgery uses S¹×D^n.

- After the surgeries W is connected, M→W is two-connected, and the Spin
  (respectively oriented) structure restricts to the given ones on N and M.

*Needs:* GeometricTopology Layer 1 handle attachment; CharacteristicClasses
Stiefel–Whitney classes.

**Checks.**

- An oriented rank-n bundle over a circle is trivial (π₀(SO(n))=0); its two
  framings differ by the generator of π₁(SO(n))=ℤ/2 for n≥3, and exactly one
  of them is compatible with the Spin structure.
- The normal bundle of an embedded S² in W^(n+1), n≥5, is an oriented bundle
  classified by π₁(SO(n−1))=ℤ/2 and detected by w₂; since TS² is stably
  trivial, this is w₂(W) evaluated on the sphere.
- In the nonspin case with M=CP²×S² (w₂≠0) the w₂-detecting sphere is
  CP¹×point; killing it would change the normal type.

### 4.2 The handle-index bound

Prove the handle-index bound: for a compact connected bordism W of dimension
n+1≥6 between closed N and M, with M simply connected (hence π₁(W)=0 by
two-connectedness) and the outgoing inclusion M→W two-connected, W has a
handle decomposition relative to N whose handles have index at most
(n+1)−3=n−2. Route: take HomotopySpheres §1.2's ordered handle decomposition
of W relative to M, trade away its handles of index 0 and 1 (Milnor,
*Lectures on the h-Cobordism Theorem*, Theorem 8.1, p. 100: index 0 by
H₀(W,M)=0, index 1 for W and M simply connected and n+1≥6, against auxiliary
index-3 handles), then cancel the index-2 handles against index-3 handles:
H₂(W,M)=0 by two-connectedness and the relative Hurewicz theorem, the basis
theorem (Milnor, Theorem 7.6, p. 92) puts the boundary map into elementary
form by handle slides, and the second cancellation theorem (Milnor, Theorem
6.4, p. 70, with Theorem 5.4, p. 48) removes each pair once its attaching and
belt spheres meet transversely in one point. The Whitney step for a pair of
index 2 and 3 has (dim P, dim Q)=(2, n−2) in the level manifold of dimension
n: the attaching 2-sphere and the belt sphere of the 2-handle. For n=5 this
is HomotopySpheres §1.6's five-dimensional level, consumed as stated. For
n≥6 own the index-two complement condition: the gradient flow identifies the
level minus the belt sphere with the incoming level minus the attaching
circle of the 2-handle, which has codimension n−1≥5 in a simply connected
level, so π₁(V∖Q)→π₁(V) is injective (Milnor, proof of Theorem 6.4, pp.
72–73, the λ=2 case), and apply HomotopySpheres §1.4's local Whitney move
with Milnor's Theorem 6.6, p. 71; HomotopySpheres §1.5 does not apply to
this pair because it requires both dimensions at least three. Then turn the
decomposition upside down: the dual of a handle of index λ on M is a handle
of index n+1−λ on N. The interior framed sphere surgeries are
GeometricTopology Layer 1's handle attachments on the collared bordism. The
surgery form of the conclusion is Gromov–Lawson's proof of Theorem B,
p. 432, via Smale. HomotopySpheres §1.3's handle trading is stated for
h-cobordisms with both ends simply connected and is not an input: N is
arbitrary here.

- Under the hypotheses, W is obtained from N×[0,1] by attaching handles of
  index at most n−2 only; equivalently M is obtained from N by surgeries in
  codimension at least three.
- The levels between the index-2 and index-3 handles are simply connected.

*Needs:* 4.1; GeometricTopology Layer 1.

**Checks.**

- W=(S¹×S⁴)×[0,1] with M=S¹×S⁴×{1}: the inclusion is a homotopy
  equivalence, hence two-connected, but π₁(W)=ℤ; the simple connectivity
  hypothesis excludes it. The cylinder S⁵×[0,1] satisfies the hypotheses with
  the empty handle decomposition.
- n=5: the pair has sphere dimensions (2,3) in the five-dimensional level,
  HomotopySpheres §1.6; n=6: (2,4) in the six-dimensional level, the owned
  complement condition with the attaching circle of codimension 5.
- Dual indices: after trading, every handle relative to M has index λ≥3; its
  dual relative to N has index μ=n+1−λ≤n−2 and performs a surgery on
  S^(μ−1)⊂N of codimension n−μ+1≥3. A 2-handle left relative to M would
  dualize to an (n−1)-handle on N, a surgery on S^(n−2) of codimension 2,
  which 3.2 does not cover.

### 4.3 Transfer of positive scalar curvature along a bordism

When N has several components, first attach compatible 1-handles joining
them and replace N by their connected sum, using 3.2's connected-sum PSC
metrics and the associated oriented or Spin bordisms; compose this bordism
with W and verify the now-connected incoming and outgoing boundaries before
applying 4.2. Apply 3.2 along the handles of 4.2 to transfer PSC from N to M.
Treat an empty incoming boundary by deleting an open ball from the interior
of W, which makes W a bordism from the round sphere S^n to M. Conclude the
Spin and oriented nonspin bordism-invariance statements in the simply
connected range, with n≥5, simple connectivity of M and the stated Spin or
nonspin normal type as explicit hypotheses (Gromov–Lawson, Theorems B and C,
p. 424; Stolz, *Positive scalar curvature: constructions and obstructions*,
Theorem 1.4 and Corollary 1.5).

- A closed simply connected Spin manifold of dimension n≥5 that is Spin
  bordant to a PSC manifold carries a PSC metric.
- A closed simply connected oriented manifold of dimension n≥5 with w₂≠0
  that is oriented bordant to a PSC manifold carries a PSC metric.

*Needs:* 3.2–3.3; 4.1–4.2.

**Checks.**

- N=∅: W is a Spin nullbordism of M; removing a ball gives a bordism from S^n,
  which is round PSC, so M has PSC: every Spin-nullbordant simply connected
  M of dimension n≥5 has PSC.
- N with two components N₁⊔N₂: the 1-handle gives N₁#N₂, which has PSC by
  3.2 since n≥3.
- The hypothesis on the normal type is used: for M nonspin and W oriented,
  the argument kills π₁ and the kernel of w₂ only.

### 4.4 Geometric PSC bordism

Define geometric PSC bordism over a CW space X with maps to X and product
collar metrics, its cycles, inverse, disjoint union and equivalence laws.
Construct the forgetful map to TangentialBordism's structured bordism and
its subgroup Ω_n^(Spin,+)(X), respectively Ω_n^(SO,+)(X), of classes
admitting a PSC representative. Give change-of-space, product and
relative-boundary laws. A theorem for arbitrary fundamental groups is not
inferred from the simply connected argument.

- Ω_n^(Spin,+)(X) is a subgroup of Ω_n^Spin(X), natural in X.
- The product of a PSC class with any closed manifold class is a PSC class.

*Needs:* 1.4; 3.2.

**Checks.**

- Over a point: Ω₄^(Spin,+)=0, since a PSC Spin 4-manifold has Â=0 and
  Ω₄^Spin=ℤ is detected by Â (K3 has Â=2); Ω₂^(Spin,+)=0, since the
  nonbounding torus has no PSC metric; Ω₁^(Spin,+)=0, since every metric on a
  circle has scalar curvature 0, and the empty manifold represents 0.
- Ω₅^(SO,+) contains the class of the Dold manifold P(1,2) of 6.3, so it is
  all of Ω₅^SO=ℤ/2.
- The product law: [HP²]·[K3]=[HP²×K3] is nonzero in Ω₁₂^Spin, since its
  signature is 1·(−16)=−16, and it is a PSC class although K3 is not: for
  any metric g on K3, ε²g_(HP²)+g has scalar curvature 128/ε²+Scal(g), which
  is positive for small ε by 1.3's product law, and α(HP²×K3)=0·a=0 agrees
  with 5.1. A definition that declared a product PSC only when both factors
  are PSC would reject this class.
- The space variable: over X=S¹, the circle with the antiperiodic (bounding)
  Spin structure and the identity map to S¹ is nonzero in
  Ω₁^Spin(S¹)≃ℤ/2⊕ℤ, its degree component being 1, although its image in
  Ω₁^Spin is 0; a closed 1-manifold with PSC is empty, so
  Ω₁^(Spin,+)(S¹)=0 and this class is not in it. A definition that tested
  PSC on the image in Ω₁^Spin after forgetting the map would wrongly admit
  it.

### Examples

HP² bundles as Spin bordisms with PSC; the Dold manifold P(1,2) as an
oriented PSC representative; the nullbordism of S^n.

### Dependencies

Layer 3; GeometricTopology Layer 1; CharacteristicClasses.

## Layer 5: Spin obstruction and the simply connected classification (P5)

### 5.1 The α-invariant vanishes on PSC manifolds

Consume the real graded Clifford-linear Dirac index and its ABS comparison
(SpinGeometry G6.0, TangentialBordism §7.1). Prove that 1.2's uniform scalar
gap implies α(M)=0 for a closed Spin PSC manifold, through SpinGeometry G6's
Lichnerowicz formula D²=∇*∇+Scal/4, and identify α with the map MSpin→ko→KO
on TangentialBordism's Pontryagin–Thom class. For n≡0 mod 8, α equals Â. In
dimension 8k+4 write α(M)=r·a·b^k and prove Â(M)=2r through c(a)=2u²,
c(b)=u⁴ and TangentialBordism §7.1's genus comparison; the complex chiral
index is twice this integer coefficient. Pin the real Clifford sign and
Morita adapters to SpinGeometry G5 and verify α(K3)=a. Preserve the Spin
structure in additivity, products and bordism laws.

- α: Ω_n^Spin→KO_n is a ring homomorphism, additive under disjoint union and
  connected sum.
- If a closed Spin manifold carries a PSC metric then α(M)=0.

*Needs:* 1.2; SpinGeometry G5–G6; TopologicalKTheory T7.

**Checks.**

- α(K3)=a and Â(K3)=2: r=1; α(K3×K3)=a²=4b and Â=4.
- HP² has PSC (Scal=128) and α(HP²)=Â(HP²)=0; the round S^n has α=0 for
  every n.
- The nonbounding Spin circle has α=η≠0 with η²≠0 and η³=0 in KO_*; it has
  no PSC metric since its scalar curvature is 0.
- A Spin 8-manifold with Â=1 has α=b≠0 and no PSC metric.

### 5.2 The classification

For α(M)=0 use TangentialBordism §10.4's integral Spin-to-KO kernel theorem
to represent the Spin bordism class of M by sums of actual HP² transfer total
spaces; equip them with 2.3's metrics, including orientation reversals and
disjoint unions, and apply 4.3. For the nonspin branch use TangentialBordism
§10.3's integral oriented point-kernel theorem through CP² and RP² transfers
to give a PSC representative of every positive-dimensional oriented class,
then apply 4.3's nonspin normal-type bordism argument. Prove, on the closed
simply connected n≥5 carriers of the Conventions, that M admits a PSC metric
if and only if M is nonspin, or M is Spin with α(M)=0 (Stolz, Theorem 1.6
and Corollary 1.5 of *Positive scalar curvature: constructions and
obstructions*; Gromov–Lawson, Corollary C). Neither zero rational Â nor a
mod-two coefficient calculation replaces this integral statement.

- A closed simply connected manifold of dimension n≥5 admits a PSC metric iff
  it is nonspin, or Spin with α(M)=0.

*Needs:* 2.3; 4.3; 5.1.

**Checks.**

- Dimensions 5, 6, 7: KO_n=0, so every closed simply connected Spin manifold
  of these dimensions has PSC; CP³ (Spin, dimension 6) has the Fubini–Study
  metric.
- CP⁴ is simply connected, nonspin (w₂≠0) of dimension 8 and has PSC
  (Fubini–Study, Scal=80); HP² is Spin with α=0 and has PSC.
- A Spin 8-manifold with Â=1 is excluded by α=b≠0; the rational statement
  Â=0 would not exclude a Spin 9-manifold with α=ηb≠0 (6.2), whose Â is 0
  for dimensional reasons.

### Examples

K3 (α=a, no PSC); HP² (PSC, α=0); CP⁴ (nonspin, PSC); products of these
with round spheres.

### Dependencies

Layers 2–4; SpinGeometry G5–G6; TopologicalKTheory T7; GeneralizedCohomology
G5.5.

## Layer 6: Examples, metric dependence and exotic spheres (P6)

### 6.1 Low dimensions and homotopy spheres

Construct PSC metrics on connected sums, the projective bundles of 2.3 and
closed simply connected manifolds of dimensions 5, 6 and 7, using 5.2 and the
zero KO groups. For a homotopy sphere Σ^n, n≥5, compare its unique Spin
structure and α with the stable unit, J and ABS maps.

- A homotopy sphere has a unique Spin structure, and α(Σ) is the image of its
  almost-framing class under the stable unit map.
- Σ in bP_(n+1) has α(Σ)=0 and a PSC metric.

*Needs:* 2.3; 5.2; 3.2.

**Checks.**

- The standard sphere has α=0; a sphere bounding a parallelizable manifold is
  Spin nullbordant, so α=0.
- In dimensions 5, 6, 7 the Spin branch of 5.2 has empty obstruction.
- In dimension 7, Θ₇=bP₈≃ℤ/28 (HomotopySpheres §9A.2: the cokernel of J₇ is
  0), so every homotopy 7-sphere bounds a parallelizable manifold, has
  α(Σ)=0 and carries a PSC metric; the α-obstruction excludes no 7-sphere,
  in contrast to dimensions 9 and 10, where 6.2's Hitchin spheres have α≠0.
  A construction of α that did not vanish on bP₈ would contradict KO₇=0.

### 6.2 The Hitchin spheres

Construct the Hitchin spheres in dimensions 8j+1 and 8j+2, j≥1, by the
following explicit chain, and conclude the headline
`exists_smooth_sphere_isEmpty_positiveScalarMetrics`: for every j≥1 and d
equal to 8j+1 or 8j+2 there is a smooth structure on the topological
d-sphere `Metric.sphere 0 1` in `EuclideanSpace ℝ (Fin (d+1))`, modelled on
`EuclideanSpace ℝ (Fin d)`, for which `PositiveScalarMetrics` is empty
(Hitchin, *Harmonic spinors*, §4, pp. 44 and 46: the exotic spheres with
α≠0 and their non-existence of PSC metrics). The smooth structure is the
one transported from the homotopy sphere Σ_d of step 3 along the
homeomorphism of step 4; it is exotic, since the standard structure carries
the round metric.

1. Consume HomotopySpheres §3C.3's unstable Toda brackets with their
   adjacent-nullhomotopy data, composition-subgroup indeterminacy and
   suspension laws; consume BordismFormalGroups F4's stable comparison. Own
   the following coherent Moore-space construction. Write
   M_n=cofib(2ι_n:Sⁿ→Sⁿ), with bottom inclusion i_n:Sⁿ→M_n and collapse
   j_n:M_n→S^(n+1). Construct these on GeneralizedCohomology G2's
   mapping-cone carrier with the prescribed sphere and degree conventions;
   prove their suspension comparisons and specified attaching nullhomotopies.
   Prove the reusable extension/coextension lemma, n≥2 and r≥3: for
   a:S^(r−1)→Sⁿ with chosen nullhomotopies of 2ι_n∘a and a∘2ι_(r−1), a chosen
   zero representative of {2ι_n,a,2ι_(r−1)} supplies a coextension
   a_tilde:Sʳ→M_n built from the same first nullhomotopy A₀ occurring in that
   zero representative, with j_n∘a_tilde≃Ea in the fixed cone orientation,
   and a chosen nullhomotopy of a_tilde∘2ι_r. Extend it to A:M_r→M_n with
   A∘i_r≃a_tilde. Construct the maps and tracks by gluing the mapping cones;
   prove their naturality and change-of-nullhomotopy comparisons, retaining
   the full composition-subgroup indeterminacy. No unstable degree-two
   postcomposition is identified with additive doubling except under the
   stated suspension hypothesis.

   Construct Toda's σ'''∈π₁₂(S⁵) of order 2 and σ''∈π₁₃(S⁶) of order 4,
   prove Eσ'''=2σ'' for Toda's specified low-dimensional classes, and prove
   σ''' stabilizes to the order-two class in π₇ˢ. Construct Toda's
   σ′∈π₁₄(S⁷) of order 8 and the integral σ₈∈π₁₅(S⁸) with H(σ₈)=ι₁₅. Write
   (·)₂ for the projection of a torsion abelian group onto its 2-primary
   component along the sum of its odd-primary components: a torsion
   ℤ-module is the internal direct sum of its `Ideal.primaryComponent`s over
   the height-one primes of the Dedekind domain ℤ, that is, the nonzero
   primes (`Ideal.iSup_primaryComponent_eq_top` and
   `Ideal.iSupIndep_primaryComponent`, with hypotheses `IsDedekindDomain ℤ`
   and `Module.IsTorsion ℤ G`, indexed by `IsDedekindDomain.HeightOneSpectrum
   ℤ`); the component at 2 has the same elements as the subgroup
   `AddCommGroup.primaryComponent G 2`, those of order a power of 2, and
   (·)₂ is the component map of that internal direct sum. It is additive and
   natural for homomorphisms, and it is the identity on elements of 2-power
   order. Pin the 2-primary normalization using Toda's Lemmas 5.13–5.14 and
   Proposition 5.15: set σ₂=(E∞σ₈)₂∈π₇ˢ, the 2-primary component of the
   stable image of σ₈. Prove σ₂ has order 16 and `E∞σ′=2σ₂`, `E∞σ′′=4σ₂`,
   `E∞σ′′′=8σ₂`, equalities in π₇ˢ between elements of its 2-primary
   subgroup. Use `Eσ′′=2σ′` in π₁₄(S⁷) and `Eσ′′′=2σ′′` in π₁₃(S⁶), integral
   identities since both sides have 2-power order, and Toda's relation
   between 2-primary components `(2Eσ₈)₂=E²σ′` in π₁₆(S⁹), whose right side
   already lies in the 2-primary subgroup because σ′ has order 8. The
   unprojected `2Eσ₈=E²σ′` is false in π₁₆(S⁹)≃ℤ/240: Eσ₈ generates, so 2Eσ₈
   has order 120 while E²σ′ has order dividing 8. Witness: with σ=E∞σ₈, a
   generator of π₇ˢ≃ℤ/240 equal to ±J₇(b) for HomotopySpheres §9A.1's
   generator J₇(b), σ₂=225σ, as 225≡1 mod 16 and 225≡0 mod 15; then
   2σ₂=210σ has order 8, 4σ₂=180σ has order 4 and 8σ₂=120σ is the unique
   element of order 2, matching the orders of σ′, σ′′ and σ′′′, and 15σ=−σ₂
   is the component of −σ, not of σ. The witness is computed relative to σ
   itself, so the sign relating σ to J₇(b) enters nowhere. Transport the
   final order-two identity to the integral stable stem by the subgroup
   inclusion. The displayed Hopf relation is a 2-primary computation, not an
   identity with the unprojected integral stable Hopf class. Give the finite
   EHP calculation and framing normalization. Set a₁=Eσ'''. Since it is a
   suspension, 2ι₆∘a₁=2a₁=0; precomposition by 2 is also zero. Prove Toda's
   particular identity Eσ'''∘η₁₃∈{2ι₆,Eσ''',2ι₁₃}⊆π₁₄(S⁶) from Toda's
   Corollary 3.7, constructing the Moore-space relation 2·1_M=iηj and its
   bracket comparison. Own the finite integral calculation
   π₁₄(S⁶)≃ℤ/8{ν̄₆}⊕ℤ/2{ε₆}⊕ℤ/3, with an explicit odd-primary generator and
   all generator and order comparisons (Kachi–Mukai–Nozaki–Sumita–Tamaki,
   Proposition 4.4). Fix suspension-compatible order-eight 2-primary classes
   ν₁₁^(2) and ν₁₃^(2), distinct from an unprojected integral quaternionic
   Hopf class. In the 2-primary EHP calculation prove H(ν̄₆)=ν₁₁^(2),
   H(ε₆)=0 and [ι₆,ι₆]∘ν₁₁^(2)=Δ(ν₁₃^(2))=±2ν̄₆ in the fixed normalization.
   Here H:π₁₄(S⁶)→π₁₄(S¹¹) is the sphere EHP Hopf map of HomotopySpheres
   §3C.1; it is not precomposition by a quaternionic Hopf map. Retain the
   integral bracket indeterminacy 2ι₆∘π₁₄(S⁶)+2π₁₄(S⁶). On its 2-primary
   part prove the Hilton–Hopf formula (2ι₆)∘x=2x+[ι₆,ι₆]∘H(x); the preceding
   computations put its image in the additive doubles. Degree-two
   postcomposition is a group homomorphism and preserves odd-primary torsion,
   where multiplication by 2 is an automorphism. Use both parts to identify
   the full integral indeterminacy with 2π₁₄(S⁶), retaining its entire
   order-three summand. The displayed element is zero because Eσ'''=2σ'' and
   precomposition by the suspension η₁₃ is additive. Choose this zero
   representative and its coherent tracks. The preceding lemma gives
   A:M₁₄→M₆, hence A:Σ⁸M₆→M₆ after the specified suspension comparison.
   Prove its stabilization is a Moore-spectrum Adams map, inducing the unit
   mod 2 on the correctly graded reduced complex K group under Bott
   periodicity.

   Extend η₅:S⁶→S⁵ over M₆ to bar_eta₅:M₆→S⁵, using η₅∘2ι₆=0. For every j≥1
   form A^(j)=A∘Σ⁸A∘…∘Σ^(8(j−1))A:Σ^(8j)M₆→M₆ and define
   μ_(8j+1,5)=bar_eta₅∘A^(j)∘i_(8j+6):S^(8j+6)→S⁵. Here i_(8j+6) is
   transported to Σ^(8j)i₆ by the fixed Moore/suspension comparison. This
   map extends across M_(8j+6), so its precomposition by the degree-two
   domain map is null and its homotopy class has order dividing 2. Prove all
   diagram and suspension comparisons before naming its stable class
   μ_(8j+1). Choices remain explicit; no canonical choice-independent class
   or arbitrary-member unstable Toda recursion is asserted (Crowley–Schick,
   §2.3, Lemmas 2.12 and 2.14, for the fixed-S⁵ representatives).
2. Consume HomotopySpheres §9A.1's complex e-invariant of a torsion stable
   odd-sphere class, built from its two-cell mapping cone, with its
   additivity, stable naturality and target ℚ/ℤ. Own here its
   extension/Moore-map detection formula and the real d-invariant comparison
   in degrees 8j+1 (Adams, *On the groups J(X) IV*, §7 and the proof of
   Theorem 7.2). Compare the stabilized cone diagrams of step 1 with Adams's
   Moore construction (Theorem 12.13 and Lemma 12.5). With his bracket order
   and sign, the formula is e_C{h,qι,f}=−q e_C(Ef)e_C(h) modulo ℤ (Theorem
   11.1). Pin its typing as f:S^(2a−2)→S^(2b−1), h:S^(2b−1)→S^(2c),
   a>b>c>0, with qι on the intervening S^(2b−1), and the adjacent-null
   hypotheses; the real analogue requires a, b, c even. Prove its
   well-definedness on the actual indeterminacy. The sign follows the
   Toda-to-Massey comparison (Theorem 5.3(v)). Compute e_C(a₁)=1/2, the
   Moore-map unit, e_C(η)=1/2 and the iterated μ value 1/2. Thus μ_(8j+1,5)
   has exact order 2. Identify the KO unit with TangentialBordism §7.1's
   framed-forgetful-Spin/ABS/Dirac comparison and derive α(μ_(8j+1))=η b^j
   and α(ημ_(8j+1))=η² b^j, the nonzero KO generators. The η product consumes
   HomotopySpheres §3C.1's Hopf class η and TopologicalKTheory T7's
   coefficient laws. This stable detection and the fixed S⁵ representatives
   are separate from any statement about all unstable degree-two
   composition images.
3. Consume HomotopySpheres Layers 6–8's almost-framed exact sequence, framed
   kernel surgery and obstruction calculation. Apply the zero odd obstruction
   P_(8j+1)=0 to the image of the μ class under HomotopySpheres §8.2's
   injection coker J→almost-framed bordism to obtain a homotopy sphere
   Σ_(8j+1) with this α. For the even class use the product of this sphere
   with the Lie-framed Spin circle. Its middle homology in degree 4j+1 is
   zero; prove its framed surgery-normalized Arf obstruction is zero and
   apply the same surgery/realization theorem to obtain Σ_(8j+2). Compare
   stable framings modulo im J and prove J has zero Spin/KO image in these
   dimensions: its framed standard sphere has the unique bounding Spin
   structure. Track the actual Spin bordisms so that α remains the detected
   generator. In both dimensions use the full §8.2 exact sequence; its §8.3
   isomorphism criterion π_(n−1)(SO)=0 does not hold here.
4. Prove that HomotopySpheres Layer 2's simply connected high-dimensional
   h-cobordism recognition makes these spheres homeomorphic to the standard
   sphere, with dimension 8j+1 or 8j+2≥9. Name the local Alexander-trick
   extension on the complementary marked ball in this recognition and prove
   its compatibility with the boundary homeomorphism. Transport the smooth
   structure of Σ_d to the topological sphere along this homeomorphism, so
   that its charts are charts of `Metric.sphere 0 1`, and apply 5.1 to show
   that the transported structure admits no PSC metric. This compares actual
   topological and smooth manifolds and their metrics.

- `exists_smooth_sphere_isEmpty_positiveScalarMetrics`: for j≥1 and
  d∈{8j+1, 8j+2} there is a smooth structure on the topological d-sphere
  with `PositiveScalarMetrics` empty.
- α(Σ_(8j+1))=ηb^j and α(Σ_(8j+2))=η²b^j are the nonzero elements of
  KO_(8j+1) and KO_(8j+2).

*Needs:* 5.1; 1.2; GeneralizedCohomology G2; BordismFormalGroups F4;
TopologicalKTheory T7.

**Checks.**

- σ₂=225σ: 225=14·16+1 and 225=15·15; 2σ₂=450σ=210σ, 4σ₂=900σ=180σ,
  8σ₂=1800σ=120σ, and 120σ is the unique element of order 2 in ℤ/240.
- e_C(120σ)=120·(±1/240)=±1/2=1/2 mod ℤ, consistent with e_C(a₁)=1/2 for
  a₁=Eσ''' stabilizing to 8σ₂=120σ.
- Sign control at an odd prime: e_C(ν)=1/12 on the quaternionic Hopf class
  ν∈π₃ˢ (Adams, Proposition 7.14, with e′_R(ν)=1/24), so e_C(8ν)=2/3 and
  −2/3≡1/3≠2/3 mod ℤ; a sign error in the bracket formula is visible on this
  3-primary value and invisible on every value in (1/2)ℤ/ℤ, which is all the
  μ computation uses.
- j=1: d=9 and d=10 are the first Hitchin dimensions; the standard S⁹ with
  the round metric has Scal=72, so the smooth structure found is exotic.
- π₁₆(S⁹)≃ℤ/240 with 2Eσ₈ of order 120 and E²σ′ of order dividing 8: the
  unprojected relation fails, the 2-primary one holds.

### 6.3 Rational-bordism examples and Dold manifolds

Give the direct rational-bordism examples: HP^k, k>1, have zero Â by
Lichnerowicz and 2.3's PSC metric. Pin u=−c₂(γ_H viewed as a complex
rank-two bundle), the standard quaternionic Euler normalization, and prove
p(T HP^k)=(1+u)^(2k+2)/(1+4u), truncated at degree 4k, on TangentialBordism's
HP^k carriers; their top Newton number is `2k+2−4^k`. Compare with
TangentialBordism §6.6's generators and retain the integral theorem
separately. Construct the Dold quotient `(S^a×CP^b)/C2` with the
antipodal/conjugation action and its descended product metric. Its scalar
curvature is the sum of the factor scalars and is positive when a≥2 or b≥1;
mixed sectional planes have curvature zero. In particular P(1,2) has an
oriented PSC metric but is not oriented-nullbordant: compute its mod-two
cohomology, w₂=d, w₃=cd and ⟨w₂w₃,[P(1,2)]⟩=⟨cd²,[P(1,2)]⟩=1, using
TangentialBordism's Dold-manifold conventions (§6.6 and §10.3) and
CharacteristicClasses' Stiefel–Whitney classes. Keep Ω₅^SO≃ℤ/2 distinct from
Ω₅^Spin=0. Construct the reflection mapping-torus examples and the
product-to-circle regular fibres used in the oriented torsion calculation as
the actual isometric bundles, applying 2.2 over flat tori. Supply the metric
comparisons for TangentialBordism's Wall representatives; a general product
quotient is not asserted to have positive sectional curvature.

- p(T HP^k)=(1+u)^(2k+2)/(1+4u) truncated at degree 4k.
- The Dold manifold P(a,b) carries the descended product metric, with scalar
  curvature a(a−1)+4b(b+1) for the unit round and holomorphic-curvature-4
  factors.

*Needs:* 2.2–2.3; 5.1; CharacteristicClasses.

**Checks.**

- k=1: (1+u)⁴/(1+4u) up to degree 4 is (1+4u)(1−4u)=1, so p₁(S⁴)=0 and the
  Newton number is 2·1+2−4=0; k=2: (1+6u+15u²)(1−4u+16u²)=1+2u+7u², the
  p₁=2u, p₂=7u² of TangentialBordism, with Newton number
  p₁²−2p₂=4−14=−10=2·2+2−16.
- P(1,2) has dimension 5 and scalar curvature 0+24=24; P(1,0)=S¹/C₂ has a=1,
  b=0, scalar curvature 0, and the positivity condition "a≥2 or b≥1" fails,
  as it must; P(2,0)=RP² has scalar curvature 2.
- ⟨cd²,[P(1,2)]⟩=1 in degree 1+2·2=5, so w₂w₃≠0 and P(1,2) generates
  Ω₅^SO=ℤ/2.

### 6.4 Tori, families and the index bundle

Compare Spin structures on circles and tori and their α values through
SpinGeometry G5's Bott/Clifford comparison and TopologicalKTheory T7's
coefficient table, using SpinGeometry's explicit Fourier models. On T² with
one antiperiodic Spin direction prove α=0, while PositiveMass §3.1's
closed-surface Gauss–Bonnet theorem and χ(T²)=0 exclude PSC: a PSC metric
on T² would have positive Gauss curvature Scal/2 and positive total
curvature, but the total curvature is 2πχ(T²)=0. This is an explicit
index-zero counterexample outside 5.2's simply connected range.

For a compact parameter space P and a continuous C∞ family of PSC metrics
g_p on closed M, use 1.2's family gap δ>0. Identify the spinor bundles and L²
spaces by the positive metric square-root and density transformations, and
prove the Dirac realizations vary continuously H¹→L². Using SpinGeometry G6
and PseudodifferentialOperators Layer 5's uniform elliptic estimates, prove
norm continuity of the bounded transforms D_p(1+D_p²)^(−1/2) on that fixed
Hilbert/Clifford-module carrier. Prove uniformly `D_p²≥δ/4` by the
Lichnerowicz formula, hence `F(D_p)²≥(δ/4)/(1+δ/4)` by the functional
calculus. This uniform invertibility supplies the null index family and the
metric-path and relative PSC-bordism comparisons: prove the
pullback/forgetting comparison with 4.4's geometric PSC bordism, and use
Layers 1–3's metric paths and collars to prove that isotopy implies
concordance. The reverse implication is not a target of this metric-path
comparison.

- A family of PSC metrics over compact P has a uniformly invertible family of
  Dirac operators, hence a null index bundle.
- Isotopic PSC metrics are concordant.

*Needs:* 1.2, 1.4; 4.4; 5.1; SpinGeometry G5–G6; PseudodifferentialOperators
Layer 5.

**Checks.**

- The antiperiodic Spin circle is the bounding one with α=0 and the periodic
  (Lie-framed) one has α=η; T² with one antiperiodic direction has α=η·0=0,
  and with two periodic directions α=η²≠0; neither torus has PSC.
- With δ the family gap, x↦x/(1+x) is increasing, so D²≥δ/4 gives
  F(D)²≥(δ/4)/(1+δ/4); at δ=4 this bound is 1/2.
- The one-point family is the gap of 1.2.

### Examples

K3 and K3×K3 (no PSC); HP^k; the Dold manifold P(1,2); the Hitchin spheres in
dimensions 9 and 10; the torus with one antiperiodic direction.

### Dependencies

Layers 1–5; the three roadmaps earlier in the merge order named in the Exact
supplier contracts (the seventh stem, the almost-framed exact sequence, the
transfer theorems and the Dold conventions, the closed-surface Gauss–Bonnet
theorem); GeneralizedCohomology G2; BordismFormalGroups F4; TopologicalKTheory
T7; SpinGeometry G5–G6; PseudodifferentialOperators Layer 5;
CharacteristicClasses.

## Downstream consumers

StringOrientation consumes this scalar-curvature theory only where its
hypotheses apply, for its positive-Ricci Witten-genus and TMF questions.
TangentialBordism's homogeneous HP² index-zero construction uses its own
invariant metric and SpinGeometry's Lichnerowicz theorem, not Layer 5's
classification, and records that this roadmap owns the connection-metric
estimates, surgery and the PSC classification.

## References

- Gromov–Lawson, [*The classification of simply connected manifolds of positive scalar curvature*](https://www.ihes.fr/~gromov/wp-content/uploads/2018/08/827.pdf), Ann. of Math. 111 (1980), Theorems A–C, pp. 423–424, and the proof of Theorem B, pp. 431–432, for metric surgery and the Spin/nonspin bordism reduction.
- Stolz, [*Simply connected manifolds of positive scalar curvature*](https://doi.org/10.2307/2946598), Ann. of Math. 136 (1992), for the integral classification and its transfer proof, owned in TangentialBordism.
- Stolz, [*Positive scalar curvature: constructions and obstructions*](https://arxiv.org/abs/2202.05904), Theorems 1.4 and 1.6, Corollary 1.5, and §§2–3, for the normal-type distinctions and proof references.
- Hitchin, *Harmonic spinors*, Advances in Mathematics 14 (1974), 1–55, §4, pp. 44–46, for the real index and the exotic spheres with α≠0 and no PSC metric.
- Crowley–Schick, [*The Gromoll filtration, KO-characteristic classes and metrics of positive scalar curvature*](https://doi.org/10.2140/gt.2013.17.1773), §2.3, Lemmas 2.12 and 2.14, for the fixed-S⁵ μ representatives, KO detection and the exotic-sphere application; 6.2's coherent Moore-space extension construction supplies the proof route.
- J. F. Adams, [*On the groups J(X) IV*](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Adams-JX4.pdf), Theorems 5.3(v), 11.1 and 12.13, Lemma 12.5 and Proposition 7.14, for the stable Toda/Massey sign, the Moore-map construction and complex e detection; §7 and the proof of Theorem 7.2 give the real d_R comparison and detection in degrees 1, 2 modulo 8.
- Toda, *Composition Methods in Homotopy Groups of Spheres*, Lemmas 5.13–5.14, Proposition 5.15 (pp. 48–50), Corollary 3.7 and the finite EHP and π₁₄(S⁶) tables, for 6.2's unstable base classes and Moore-space bracket identity.
- Kachi–Mukai–Nozaki–Sumita–Tamaki, [*Some cohomotopy groups of suspended projective planes*](https://www.math.okayama-u.ac.jp/mjou/mjou43/_Kachi.pdf), Proposition 4.4, for the integral π₁₄(S⁶) decomposition and the distinction between its 2-primary projection and the full quaternionic-Hopf formula.
- Milnor, [*Lectures on the h-Cobordism Theorem*](https://www.math.auckland.ac.nz/~hekmati/Books/Milnor2.pdf), Theorems 5.4 (p. 48), 6.4 (p. 70, with the λ=2 case of its proof, pp. 72–73), 6.6 (p. 71), 7.6 (p. 92), 7.8 (p. 97) and 8.1 (p. 100), for 4.2.
- Hamilton, [*The inverse function theorem of Nash and Moser*](https://www.ams.org/journals/bull/1982-07-01/S0273-0979-1982-15004-2/S0273-0979-1982-15004-2.pdf), Bull. Amer. Math. Soc. 7 (1982), Part I, Example 1.1.5, p. 68, for the Fréchet space of smooth sections over a compact manifold.
- Kobayashi, *Transformation Groups in Differential Geometry*, Springer 1972, Ch. II §1, for the Myers–Steenrod theorem of 2.1.
- Lawson–Michelsohn, *Spin Geometry*, Princeton 1989, Ch. I §§3–5 for the real Clifford algebras and modules, Ch. II §5 for Dirac operators and Theorem II.8.8 for the Lichnerowicz formula.
