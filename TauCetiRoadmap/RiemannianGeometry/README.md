# Roadmap: curvature, Jacobi fields, submanifolds, and Bochner geometry

**Summary.** Develop the reusable graduate Riemannian geometry that connects
curvature to geodesic variation, the topology of complete manifolds,
extrinsic geometry and harmonic forms, on Mathlib's Riemannian bundles and
Tau Ceti's Levi-Civita connection, curvature tensor, geodesics, exponential
map and Riemannian volume. The layers build the curvature calculus and the
round, projective and homogeneous models; Jacobi fields and normal-coordinate
jets; index forms, conjugate points and the finite broken-geodesic models of
path spaces; comparison theory, complete manifolds and space forms;
isometric immersions and volume variations; focal geometry; the
Weitzenböck–Bochner identities; and spherical harmonics with minimal
eigenmaps. The end theorems are Schur's theorem, the Rauch, Günther and
Bishop–Gromov comparisons, Cartan–Hadamard, Bonnet–Myers, Synge's theorem,
the Killing–Hopf classification, two geodesics between distinct points and
three simple closed geodesics on a two-sphere, the homology of the loop
spaces of spheres and the Morse proof of the Freudenthal range, the Morse
index theorem and its focal version, the Gauss–Codazzi–Ricci equations with
the first and second variation of volume, the Bochner vanishing theorems, the
smooth-function duality for the distance, the irreducibility of spherical
harmonics and Takahashi's eigenmap theorem. Definitions come with their
coordinate, naturality, regularity and computational APIs.

This README is the roadmap. `Suggested.lean` is its acceptance test: it states the
headline theorems below against the pinned Mathlib and Tau Ceti, and its docstring names
the headlines that are not yet statable there.

## Scope and ownership

[MorseTheory M1–M6](../MorseTheory/README.md) owns ordinary Morse functions,
normal forms, compact-band deformation, cell attachments and abstract Morse–Bott
attachments and gradient convergence. [HeegaardFloer Lane M](../HeegaardFloer/README.md#lane-m-morse-homology-stage-0)
owns Morse–Smale trajectories and Morse homology.
R3 defines the single general complete-manifold finite broken-geodesic carrier
and path-sublevel comparison for any complete smooth metric. It uses no
Bott-chain construction beyond MorseTheory M5.
MorseTheory M2 owns ordinary attachments and M5 owns the abstract
finite-dimensional Morse–Bott theorem.
[DGFloer](../DGFloer/README.md) owns free-loop extensions and CP/HP
applications on the same finite-vertex carriers and short-segment
interpolation. R3 owns the round-sphere antipodal Morse–Bott calculation
below.

RicciFlow owns the differentiable sphere theorem and
Hamilton's three-dimensional positive-Ricci theorem. [AffineMorseLefschetz](../AffineMorseLefschetz/README.md)
owns the complex shape-operator and affine Lefschetz applications. R3 owns
the Morse proof and normalized suspension-map comparison for sphere
Freudenthal connectivity; stable homotopy groups of spheres are not computed
here. Tau Ceti already proves two results that belong to this subject, and
this roadmap consumes them rather than restating them: Milnor's theorem that
squared distance from almost every point is a Morse function on an immersed
manifold (consumed by R6) and the Lichnerowicz eigenvalue estimate (consumed
by R7.0). Consumers of this roadmap are listed under Downstream consumers.

## Conventions

Work with finite-dimensional real, Hausdorff, second-countable, boundaryless smooth
manifolds and smooth positive-definite Riemannian metrics. Express these through
Mathlib's `ModelWithCorners`, `ChartedSpace`, `IsManifold`, `RiemannianBundle`,
`IsContMDiffRiemannianBundle`, and
[`IsRiemannianManifold`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Geometry/Manifold/Riemannian/Basic.html#IsRiemannianManifold).
Impose connectedness,
orientation, completeness, compactness, and positive dimension on each result
that needs them. Geodesic domains and exponential domains remain explicit.

Use

`R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`,

`K(span(X,Y)) = ⟨R(X,Y)Y,X⟩ / (|X|²|Y|²−⟨X,Y⟩²)`.

The unit round sphere has sectional curvature +1. The pointwise curvature tensor
is
[`CovariantDerivative.curvatureTensor`](https://github.com/TauCetiProject/TauCeti/blob/a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Tensor.lean#L148);
sectional/Ricci/scalar curvature use
the existing covariant-derivative APIs, including their independent-vector
hypotheses. The curvature operator on bivectors is characterized by
`⟨Rop(X∧Y),Z∧W⟩ = ⟨R(X,Y)W,Z⟩`, so on constant curvature κ it is κ Id.

Energy is `½∫|γ′|²`. The index integrand is
`⟨D_t X,D_t Y⟩−⟨R(X,γ′)γ′,Y⟩`. The nonnegative Hodge/rough Laplacians
have scalar sign `Δ⁺=−div grad`. They are the negative of
DifferentialGeometry's scalar `laplaceBeltrami`, not a second definition of it.
Increasing wedges of an orthonormal coframe are orthonormal; repeated ordered
indices and sums over increasing pairs must have an explicit conversion.

For an isometric immersion f, use
`B(X,Y)=(∇^N_X df(Y))^⊥`, `S_η X=−(∇^N_X η)^⊤`, and
`⟨S_ηX,Y⟩=⟨B(X,Y),η⟩`. Mean curvature is the **averaged vector**
`H=(1/m)tr B` for m>0. The outward-normal unit sphere has B=−g times its
position vector; this fixes all normal and variation signs. Zero-dimensional
immersions use trace B=0 and are treated separately from the average formula.

## Exact supplier contracts

Consume these exact suppliers:

- [HopfRinow](../../Completed/HopfRinow/README.md), Layers 0–4: the reconciled distance and
  piecewise smooth length, Levi-Civita existence/uniqueness/regularity, intrinsic
  covariant differentiation along curves, geodesic spray/flow, natural-domain
  `TauCeti.Manifold.riemannianExp`, normal balls/logarithms, Gauss lemma, first
  energy variation, minimizing geodesics, completeness and smooth-isometry
  transport. Use its existing `alongCurveWithin` carrier and proved chart-change laws;
  R2 supplies the remaining arbitrary-section regularity and reparametrization
  extensions needed for iterated covariant differentiation.
- [DifferentialGeometry](../DifferentialGeometry/README.md), Layers 0–3,5–10,12:
  ordinary forms and exterior calculus, orientation, smooth flows, manifold Sard (Layer 10),
  integration/Stokes, de Rham/singular comparison, metrics, gradient/Hessian,
  divergence and the canonical density/measure bridge.
- [SmoothBundlesConnections](../SmoothBundlesConnections/README.md), B1.4–B1.5/B2–B5/B6.0:
  actual smooth pullback/tensor/dual/End bundles, metric connections and their
  induced derivatives, curvature, parallel transport/holonomy, and real/complex
  bundle L². Transport reconstruction consumes B5's smooth path-family and
  concatenation/reparametrization laws, not an unspecified compatibility axiom.
  B6.0 supplies uniform normal and strong-convexity radii on compact sets.
- [GeometricTopology](../GeometricTopology/README.md), Layer 1: the actual normal
  bundle and tubular neighbourhood theorem; Layer 7: the existing intrinsic
  curvature construction and `TauCeti.riemannianVolume`. This roadmap extends
  their geometric identities and comparison theory. General immersions use the
  corresponding orthogonal subbundle of f*TN; for embeddings it is canonically
  the Layer 1 normal bundle, with the same induced topology. The canonical quotient comparison
  is GT Layer 1's orthogonal-complement-to-quotient bundle equivalence; no additional quotient carrier is constructed.
  Layer 8 owns the eight three-dimensional model geometries; R4.7 compares its
  constant-curvature models with their native `ModelGeometry.Space` instances.
  Its smoothing-and-triangulation item 1 supplies the marked CW-pair and
  finite-point refinements consumed by R3.
- [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md), K5a: real/complex
  bundle Sobolev/Rellich, distributional regularity and global estimates for
  smooth Laplace-type systems, the formal-adjoint L² comparison, compact resolvent, Green operator,
  real de Rham Hodge theorem and harmonic representatives. This roadmap owns
  curvature identities and their geometric consequences, not another Hodge or
  bundle L² construction. [PDE](../PDE/README.md) supplies scalar weak-derivative,
  extension and elliptic estimates through K5a. R3 owns the vector-valued
  interval weak-derivative/absolutely-continuous comparison needed for paths. K7.1 (projective
  charts and orientation) supplies the smooth complex projective carrier used by
  R1; K7.2 (projective bundles, forms and cohomology) supplies its normalized
  Fubini–Study form. PDO P1.0 supplies formal differential adjoints.
- [PDE A.1–A.6, D.16–D.19, E.20–E.22](../PDE/README.md) and
  VariationalMethods §2.3–§2.4 and Layers 3–5.2: Sobolev,
  trace, energy/interior estimates and abstract closed-form/represented-operator
  theory for R5b's normal-Jacobi Dirichlet specialization. R5b constructs its
  boundary H² estimate and exact operator domain; these are not supplied by
  closed-manifold PDO/K5a or PDE E's interior regularity theorem.
  Consume UnboundedOperators §4.7 (UO-D06)
  for the single generic closed semibounded-form representation, with its
  native partial-operator domain, self-adjointness and real/complex comparison.
  The abstract order is VariationalMethods §2.3 → UnboundedOperators §4.7 →
  VariationalMethods §5.1–§5.2; R5b
  supplies its geometric form and boundary-domain identification afterwards.
- [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory):
  smooth quaternionic projective and Stiefel carriers, the smooth Hopf
  quotient submersion and its classical homogeneous-space diffeomorphism.
  R1 equips these supplied carriers with its normalized metrics; this
  finite-dimensional smooth supplier uses no RiemannianGeometry result.
- [TopologicalKTheory T6.6](../TopologicalKTheory/README.md): the smooth
  classical homogeneous-space/Grassmannian comparison consumed by R1's
  projective examples, after the early G4.0b smooth carriers.
- [CharacteristicClasses C2.0](../CharacteristicClasses/README.md): relative
  bundle disc/sphere CW models and disc-attachment comparison consumed by R3.
- [ConformalMapping L3/L5](../../Completed/ConformalMapping/README.md) supplies the Riemann map/closed-disc Jordan correspondence and plane separation/filled-hull floor. [GeometricMeasureTheory G1/G6](../GeometricMeasureTheory/README.md) and [DifferentialGeometry 5.6](../DifferentialGeometry/README.md) supply rectifiable length/arclength, Jordan index, proximity/reparametrization and trace-area-zero comparisons. [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) supplies the generic BV/variation/perimeter floor; R4.9 constructs its spherical chart comparisons and symmetrization applications. R4.9 constructs the spherical component-cover, annular, round-regularization and finite-family shortening applications. [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility) supplies the Euclidean Jordan inequality for the normal-chart weak small-area application; R4.9 owns spherical symmetrization and the sharp spherical utility.
- [CharacteristicClasses C1.5/C2/C3](../CharacteristicClasses/README.md) supplies the ordinary finite RP²/cup/Thom comparisons used on the tautological disk bundle in R4.9; [AlgebraicTopology Stage 6](../AlgebraicTopology/README.md) supplies its absolute cup/relative cap, singular small-chain and homotopy APIs. R4.9 owns the direct relative cover cocycle on its curve space and the particular finite cycle/cap-localization adapters.
- Native Mathlib `Besicovitch.exist_disjoint_covering_families` and its finite-dimensional normed-real-space instance supply disjoint closed-ball color families and open-ball covering for R4.9's finite geometric parameter cutoffs. R4.9 constructs the finite extraction, cutoffs and geometric-operator estimates. Its principal shortening route is length-controlled round regularization followed by the actual-metric smooth flow, with its own finite-time blowup, local exit-cost and family-stopping applications.
- [SpinGeometry G1.2/G2.2/G3.4](../SpinGeometry/README.md): the finite Clifford
  module and exterior-symbol comparisons used by R7. These precede the later
  Spin Dirac/index targets and have no R7 analytic input.
- [AlgebraicTopology](../AlgebraicTopology/README.md), Stages 2,4–8, and
  [UniversalCovers](../../Completed/UniversalCovers/README.md): actual CW and
  relative homology, coefficient-sensitive Betti/Euler statements, duality,
  homotopy and covering results. AT4.4 supplies the raw reduced-suspension
  quotient and its normalized sphere homeomorphism; R3 constructs its curried
  based-loop map and homotopy-group suspension comparison. DGFloer Layer 1
  item 2 supplies the Hopf homotopy exact sequence and homology invariance
  under weak equivalence. Its standing Moore-path convention supplies the
  length-change carrier; R3 constructs the ordinary fixed-interval comparisons.
  R4 supplies its fundamental-class/weak-contractibility argument,
  and AT8.5 supplies Whitehead's CW comparison.
- [RepresentationTheory/LieGroups L0–L2](../RepresentationTheory/LieGroups/README.md):
  native Lie-group/manifold carriers, Ad and dAd=ad for the invariant metrics.
  SBC B1.4–B1.5 supplies smooth G/H, principal quotient bundles and the
  kernel/horizontal subbundles for the R1 submersion construction.
- [RepresentationTheory/ClassicalGroups](../RepresentationTheory/ClassicalGroups/README.md)
  Layers 3/5 and [CompactGroups](../RepresentationTheory/CompactGroups/README.md): complex orthogonal-group highest-weight/dimension targets, invariant
  products and complete reducibility. R8 constructs the harmonic-polynomial
  representation and identifies its complexification with the specific
  highest-weight module; it does not assume a supplied harmonic-tensor carrier.

- Tau Ceti, besides the curvature, geodesic, exponential, volume, isometry and
  model-space declarations named in the layers: the squared-distance theorems
  `TauCeti.ae_isMorse_norm_sq_sub_comp`,
  `TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp`
  (`Geometry/Manifold/Morse/SquaredDistance.lean`) and
  `TauCeti.isProperMap_norm_sq_sub_comp` (`Topology/Maps/Proper/Metric.lean`),
  consumed by R6; the operator `TauCeti.Manifold.laplaceBeltrami`, the Bochner
  identity `TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient` and the
  Lichnerowicz estimate `TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`,
  consumed by R7.0; and the harmonic-polynomial algebra of
  `RingTheory/MvPolynomial/Harmonic.lean` (`MvPolynomial.laplacian`,
  `MvPolynomial.harmonicSubmodule`, the Fischer decomposition and the dimension
  count), consumed by R8.1. Each is assumed exactly as stated there.
- PseudodifferentialOperators, P1:
  generic differential operators, jets, commutator order, geometric/Fourier symbol
  comparison, Dirac polarization and canonical Bochner connection. R7 consumes its rough/de Rham construction and symbol examples, and supplies
  the real geometric curvature/Weitzenböck identities. P5 extends K5a’s p=2
  scale to bundle p≠2/all-order/Hölder theory; P6 supplies arbitrary elliptic
  regularity. PDE retains scalar boundary and Calderón–Zygmund estimates.

The shared analytic order is K5a's pointwise Gram form metric, real star and
density line, then PDO P1.0's differential operators, symbols and density
formal adjoints, then K5a's real/complex distributional Sobolev scales, weak
H² realization, compact resolvent and real de Rham Hodge theory. PDO P1.1
and P2–P6 follow that analytic scale; R7 consumes these objects for its
geometric curvature identities. K5a applies to arbitrary real base dimension
and identifies real bundles with conjugation-fixed complexifications.


## How to read the build

Layer 1 builds the curvature and connection algebra, the metric-change,
homogeneous and submersion formulas, the round sphere model and the
projective metrics. Layer 2 builds Jacobi fields and, from them, the
normal-coordinate jets R1.4. Layer 3 builds second variation, index forms and
conjugate points, the H¹ and finite broken-geodesic models of path spaces, and
their round-sphere calculations. Layer 4 proves the comparison theorems, the
covering and completeness results, the space-form classification and the
geodesic multiplicity theorems. Layer 5 builds isometric immersions and the
first and second variation of volume, and Layer 6 their focal geometry and
squared-distance functions. Layer 7 applies the supplied analytic theory to
curvature identities and vanishing theorems, and Layer 8 identifies the
spherical harmonic representations and minimal eigenmaps. Each layer uses
only earlier layers and the suppliers above, and every object receives its
identity, linearity, regularity, naturality and local-to-global comparison
lemmas before its headline theorem.

## Layer 1: curvature, connections and model metrics

### R1. Intrinsic curvature calculus and normal-coordinate jets

1. Consume the existing pointwise curvature/sectional/Ricci/scalar carriers.
   Supply every missing metric symmetry, pair interchange and both Bianchi
   identities, their coordinate and moving-frame formulas, and smoothness of
   their scalar and tensor components. Induced tensor connections define ∇R;
   prove frame independence, contraction compatibility and isometry naturality.
   For End-valued curvature match SBC B4's covariant exterior derivative and
   `Ω=dω+½[ω∧ω]`, `d_∇Ω=0`, explaining the equivalent matrix
   `F=dA+A∧A` convention: section coefficients are columns and
   `∇s=ds+A s`, with matrix multiplication in the wedge. Include `(d_∇)²=R∧·`, the canonical tangent-valued
   identity 1-form/torsion comparison and the affine/skew-adjoint difference of
   metric connections as supplier acceptance checks. For the torsion-free
   connection pin the Ricci identity
   `∇²s(X,Y)−∇²s(Y,X)=R(X,Y)s`; identify its torsion correction for a
   connection with torsion.

   **Checks.**
   - On the unit sphere in polar coordinates (θ,φ) the component `R_θφθφ=sin²θ`
     is not constant, yet `∇R=0` because `R=g∧g` and `∇g=0`; a "derivative of
     R" taken as the plain partial derivative of components, without the
     connection terms, returns `∂_θR_θφθφ=sin 2θ≠0` and would call the sphere
     not locally symmetric.
   - Pair interchange and the first Bianchi identity on the flat torus: every
     component vanishes, so both hold trivially; on `S²×S²` with unit factors,
     `r(e₁,e₂,e₂,e₁)=1` for an orthonormal pair in one factor and
     `r(e₁,f₁,f₁,e₁)=0` for a mixed pair, so `Ric=g` (each unit vector has one
     curved companion direction) and `Scal=4`, whereas the round unit `S⁴` has
     `Ric=3g` and `Scal=12`; a pair-interchange law stated with a minus sign
     would force the diagonal value `r(e₁,e₂,e₂,e₁)=1` to equal its own
     negative.
   - For the trivial line bundle with connection `d+A`, `A=a(x)dx` on ℝ, the
     curvature `F=dA+A∧A=0`; on ℝ² with `A=x dy` it is `F=dx∧dy≠0`, and the
     sign convention `∇s=ds+As` makes the curvature of `∇` equal `F`, whereas
     `∇s=ds−As` gives `−F`.

   *Needs:* HopfRinow (Completed) Layer 1 (Levi-Civita connection), Tau Ceti
   `CovariantDerivative.curvatureTensor` and the pinned sectional, Ricci and
   scalar curvature APIs, SBC B2–B5 (induced tensor connections, covariant
   exterior derivative, `Ω=dω+½[ω∧ω]`, parallel transport), Mathlib tensor and
   alternating-map algebra.
2. For the covariant four-tensor `r(x,y,z,w)=⟨R(x,y)z,w⟩`, put
   `Q(x,y)=r(x,y,y,x)`. This numerator is defined for all vectors, including
   dependent pairs; on independent pairs it is sectional curvature times the
   Gram determinant. Pin the mixed polarization

   ```
   B_Q(x,w;y,z) = Q(x+w,y+z) − Q(x+w,y−z)
                 − Q(x−w,y+z) + Q(x−w,y−z),
   24 r(x,y,z,w) = B_Q(x,w;y,z) − B_Q(y,w;x,z).
   ```

   Prove the formula by multilinearity, skew symmetries, pair interchange
   and first Bianchi, first for an algebraic curvature tensor on a real
   vector space (a four-linear form that is skew in its first pair,
   symmetric under pair interchange and satisfies the first Bianchi
   identity, with no inner product, orthonormality or independence
   assumption), and then for the existing pointwise curvature tensor paired
   with the metric. Deduce that two algebraic curvature tensors with the
   same numerator Q are equal: the reconstruction divides by the constant
   24, never by a Gram determinant. For dependent pairs prove Q=0 by
   alternation; equality of sectional curvatures on all two-planes
   therefore gives equality of Q everywhere and of the full tensor.
   Identify constant sectional curvature κ with
   `R(X,Y)Z=κ(⟨Z,Y⟩X−⟨Z,X⟩Y)` (`constant_sectional_tensor_iff`), hence `Ric=(n−1)κg` and scalar
   curvature `n(n−1)κ`. Include the n<2 cases separately; an empty collection
   of 2-planes must not determine κ. The reconstruction is Andrews,
   *Lectures on Differential Geometry*, Lecture 16, Proposition 16.2.1,
   p. 154, whose slot convention `K(σ)=R(e₁,e₂,e₁,e₂)` is translated into
   the one fixed above.

   **Checks.**
   - Orthonormal x,y in constant curvature +1, with z=y and w=x: here
     `Q(a,b)=|a|²|b|²−⟨a,b⟩²`, so `B_Q(x,x;y,y)=Q(2x,2y)=16` (the other
     three terms have a zero argument), while `B_Q(y,x;x,y)` has
     `Q(x+y,x+y)=0`, `Q(x+y,x−y)=4`, `Q(y−x,x+y)=4`, `Q(y−x,x−y)=0`, hence
     equals −8; the right side is `16−(−8)=24=24·r(x,y,y,x)` with K=1. A
     formula with the two B_Q terms interchanged, or with the constant 12
     or 48, fails on this pair.
   - Dependent pairs: `Q(x,λx)=λ²r(x,x,x,x)=0` by skew symmetry, so the
     formula is evaluated on dependent arguments without any division; the
     numerator `⟨R(x,y)x,y⟩=r(x,y,x,y)` of the opposite slot order gives
     `−K` on orthonormal pairs, the wrong sign.
   - Without the first Bianchi identity the formula is false: for a
     nondegenerate skew form ω on ℝ⁴ with `ω(e₁,e₂)=ω(e₃,e₄)=1` and all
     other basis pairs zero, `r(x,y,z,w)=ω(x,y)ω(z,w)` is skew in its first
     pair and symmetric under pair interchange, with `Q(x,y)=−ω(x,y)²`; at
     `(e₁,e₂,e₃,e₄)` the right side is `8−(−8)=16` while
     `24·r(e₁,e₂,e₃,e₄)=24`.

   *Needs:* R1 item 1 (skew and pair symmetries and the first Bianchi
   identity of the pointwise tensor), Tau Ceti `CovariantDerivative.curvatureTensor`,
   Mathlib multilinear maps on a real vector space.
3. Prove Schur's theorem (`schur`) on connected n≥3 manifolds and the contracted-Bianchi
   Einstein statement `Ric=a(x)g ⇒ a constant`, also with n≥3. Define local symmetry by ∇R=0,
   prove parallel transport preserves R exactly when this condition holds,
   and prove locally symmetric surfaces have locally constant K, globally constant on
   each connected surface. Constant sectional
   curvature implies local symmetry. Flat curvature on an open set is equivalent
   to a local Euclidean isometry around every point of that set. For the flat
   implication use B5's local parallel frames, torsion-free closed coframes and
   DG's local primitives, then the shared manifold inverse-function theorem.
   *Needs:* R1 item 1 (`∇R`, contracted Bianchi identity, parallel transport
   of R), R1 item 2 (the constant-curvature tensor form), SBC B5 (local
   parallel frames), DifferentialGeometry Layers 0–1 and 6.2 (exterior
   calculus and the Poincaré lemma for local primitives), Mathlib's manifold
   inverse-function theorem.

The normal-coordinate jets R1.4 are built in Layer 2, after the Jacobi fields of R2.
Use Mathlib's tensor, Gram, continuous-linear-map and finite-dimensional spectral
APIs. Consume SBC B2's exterior-square smooth bundle Λ²TM; supply its Gram inner
product and pin its musical isometry with K5a’s
degree-2 real Gram form bundle, and define self-adjoint Rop on that shared
identified carrier. No second unconnected exterior bundle is used. Metric
scaling, products, pullbacks, conformal changes and warped products get full
connection/curvature transformation laws, including scalar/Ricci contractions;
a constant scaling c>0 preserves the connection and scales K by 1/c.
For g̃=e^(2u)g set A_XY=du(X)Y+du(Y)X−g(X,Y)grad u and prove
∇̃=∇+A and
`R̃(X,Y)Z=R(X,Y)Z+(∇_X A)(Y,Z)−(∇_Y A)(X,Z)+A(X,A(Y,Z))−A(Y,A(X,Z))`.
In dimension n, with Δ⁺=−tr Hess, pin
`Ric̃=Ric−(n−2)(Hess u−du⊗du)+(Δ⁺u−(n−2)|du|²)g` and
`Scal̃=e^(−2u)(Scal+2(n−1)Δ⁺u−(n−1)(n−2)|du|²)`.
Reconstruct
a connection from smooth linear path transport by differentiating transported
sections, prove locality/Leibniz/chart independence and uniqueness, and recover
the transport. Use SBC B5’s family/concatenation theorems and compare to its actual
connection rather than merely naming this exercise in a supplier paragraph.

**Checks.**
- `Rop` on constant curvature κ is κ·Id on Λ²: for orthonormal X,Y,
  `⟨Rop(X∧Y),X∧Y⟩=⟨R(X,Y)Y,X⟩=κ`; the opposite slot convention
  `⟨R(X,Y)X,Y⟩` would give `−κ·Id`. On `S²×S²` with unit factors `Rop` has
  eigenvalue 1 on the two factor planes and 0 on the four-dimensional space of
  mixed bivectors, so it is not a multiple of the identity.
- On `S²×ℝ` with the unit `S²`, `Rop` has eigenvalue 1 on `e₁∧e₂` and 0 on
  `e₁∧e₃` and `e₂∧e₃`, so `tr Rop=1=Scal/2` with `Scal=2`: the trace counts
  each plane once, while the sum `Σ_(i≠j)K(e_i,e_j)` over ordered pairs is
  `Scal=2`, twice the trace, which is the conversion the increasing-pair
  convention requires.
- The Gram inner product makes `e₁∧e₂` a unit bivector:
  `⟨X∧Y,X∧Y⟩=|X|²|Y|²−⟨X,Y⟩²=1` for orthonormal X,Y. Identifying `X∧Y` with
  the tensor `X⊗Y−Y⊗X`, of squared norm 2, would halve the Rayleigh quotient
  `⟨Rop(e₁∧e₂),e₁∧e₂⟩/|e₁∧e₂|²` on the unit sphere to ½ instead of K=1.
- Conformal change on the plane: `g̃=e^(2u)(dx²+dy²)` with
  `u=log 2−log(1+x²+y²)` is the stereographic round metric; `Δu=−4/(1+r²)²`
  and the formula `K̃=−e^(−2u)Δu` give `K̃=1`, and `Scal̃=e^(−2u)(0+2Δ⁺u)=2`
  with `Δ⁺=−Δ`; with `∇̃=∇−A` instead of `∇+A` the sign of the Hessian terms
  flips and the same computation returns `K̃=−1`. For constant u, `A=0` and
  the connection is unchanged, as the scaling law requires.

For a supplied positive Ad-invariant inner product on a finite-dimensional
real Lie algebra, construct the corresponding bi-invariant metric on the
native Lie-group carrier and prove invariance and completeness by
`TauCeti.completeSpace_ofRiemannianMetric_of_isPretransitive_isom`,
proving the transitive isometry action on its Riemannian-distance carrier.
This applies in every finite dimension, including noncompact homogeneous
metrics. Prove ∇_X Y=½[X,Y], R(X,Y)Z=−¼[[X,Y],Z] under the curvature convention
above, using left-invariant vector fields and proving that their native
vector-field bracket agrees with the supplied Lie-algebra bracket. Prove every
finite-dimensional left-invariant Riemannian metric, and every invariant
Riemannian metric on a homogeneous quotient, is complete. An Ad-invariant
product exists when the adjoint image has compact closure; its existence is
a separate hypothesis for an arbitrary Lie group.
For a smooth Riemannian submersion build its horizontal/vertical projections
h,v for the given metric, comparing SBC's splitting after choosing that
metric as its auxiliary metric, and pin
`A_X Y=v∇_(hX)(hY)+h∇_(hX)(vY)` and
`T_X Y=h∇_(vX)(vY)+v∇_(vX)(hY)`.
Develop their tensor, symmetry, integrability, connection and O'Neill curvature
formulas with naturality under isometries preserving the submersion. For a
horizontal initial vector, prove its geodesic stays horizontal and projects to
a base geodesic. Prove local horizontal lifting of every base geodesic from a
chosen point in its fiber, and full-interval lifting when the total metric is
complete; incomplete submersions have only maximal-interval lifts. For a
closed H≤G and the supplied Ad(G)-invariant product, construct the normal
homogeneous metric on SBC B1.4's G/H with horizontal space h^perp and prove
G→G/H is a Riemannian submersion. The more general Ad(H)-invariant product
on a reductive complement gives a G-invariant homogeneous metric; do not call
it normal without the Ad(G)-invariant full-group product.

**Checks.**
- `SU(2)` with `⟨X,Y⟩=−½ Re tr(XY)`: `iσ₁,iσ₂,iσ₃` are orthonormal
  (`tr((iσ_j)²)=−2`), `[iσ₁,iσ₂]=−2iσ₃` has squared norm 4, and
  `K=¼|[X,Y]|²=1`: the bi-invariant metric is the round unit `S³`. The metric
  `−Re tr(XY)` doubles g and gives `K=½`. On an abelian group `[X,Y]=0`, so
  `∇_XY=0` and R=0: the flat torus.
- Riemannian submersion tensors: for `ℝ²∖{0}→(0,∞)`, `x↦|x|`, the fibres
  are circles of radius r, `A=0` (one-dimensional base) and
  `T_VV=−(1/r)∂_r` for the unit vertical field, the fibre's curvature vector;
  for the Hopf map `S³→S²(½)` the fibres are great circles, so `T=0`, and
  O'Neill's formula `4=1+3|A_XY|²` gives `|A_XY|=1` for horizontal
  orthonormal X,Y; for a product `M×F→M` both tensors vanish. A definition
  with `A` and `T` interchanged would attach the fibre curvature of the radial
  example to `A`.
- Horizontal lifting: on the Hopf map the horizontal lift of a great circle of
  `S²(½)` (length π) from z is the horizontal half great circle
  `γ(t)=cos t·z+sin t·v`, 0≤t≤π, of `S³` (length π), which ends at
  `γ(π)=−z`, on the fibre of z but not at z; traversing the base circle twice
  closes the lift into a full great circle of length 2π. So the horizontal
  lift of a closed geodesic need not be closed.

*Needs:* SBC B2 (the exterior-square bundle `Λ²TM`), ComplexKahlerGeometry K5a
(the degree-2 real Gram form bundle), SBC B5 (smooth path-family transport,
concatenation and reparametrization laws), LieGroups L0–L2 (Lie-group
carrier, `Ad` and `dAd=ad`), SBC B1.4–B1.5 (smooth `G/H`, principal quotient
bundles, kernel and horizontal subbundles), Tau Ceti
`TauCeti.completeSpace_ofRiemannianMetric_of_isPretransitive_isom`,
HopfRinow (Completed) Layer 4 (completeness and minimizing geodesics),
O'Neill, *The fundamental equations of a submersion*, Theorem 2 and
Corollary 1 (the curvature formulas).

This generic connection/submersion lane precedes R2 and uses no projective
carrier or normal-coordinate jet theorem.

**The round sphere model.** On the unit sphere `Sⁿ⊂ℝⁿ⁺¹`, n≥1, with Tau
Ceti's `TauCeti.sphereRoundMetric`, derive the Levi-Civita connection as the
tangential projection `∇_XY=(D_XY)^⊤=D_XY+⟨X,Y⟩x` of the ambient derivative D
at the point x, verify from item 1's connection identities that the
curvature tensor is `R(X,Y)Z=⟨Y,Z⟩X−⟨X,Z⟩Y`, so every sectional curvature is
+1 for n≥2, and prove that the unit-speed geodesics are the great circles
`γ(t)=cos t·x+sin t·v` with v a unit tangent vector at x. Prove the scaling
law: the sphere of radius ρ has the same connection and sectional curvature
`1/ρ²`, with great circles of length 2πρ. This direct model construction
uses no Jacobi, index or comparison theorem; R4.7 consumes it for the
space-form classification and the real-projective quotients.

**Checks.**
- Great circle through `x=e₁` with `v=e₂`: `γ(t)=(cos t,sin t,0,…)` has ambient
  acceleration `γ″=−γ`, which is normal to the sphere, so its tangential part
  vanishes and γ is a geodesic; a latitude circle
  `γ(t)=(r cos t,r sin t,√(1−r²),0,…)` with 0<r<1 has `⟨γ″,γ⟩=−r²`, so its
  tangential acceleration `γ″+r²γ=(−r(1−r²)cos t,−r(1−r²)sin t,r²√(1−r²),0,…)`
  has squared norm `r²(1−r²)>0`, and it is not a geodesic.
- Curvature: for orthonormal X,Y at x, `⟨R(X,Y)Y,X⟩=⟨Y,Y⟩⟨X,X⟩−⟨X,Y⟩²=1`; the
  convention `R(X,Y)Z=⟨X,Z⟩Y−⟨Y,Z⟩X` would give −1, the value of the
  hyperbolic plane.
- Scaling: on the sphere of radius ½ the great circle `γ(t)=½(cos 2t,sin 2t,0)`
  has unit speed, period π and sectional curvature 4, the values used for `CP¹`
  and `HP¹` below; a model that scaled curvature by ρ instead of `1/ρ²` would
  give ½.

*Needs:* R1 item 1 (connection identities), Tau Ceti `TauCeti.sphereRoundMetric`,
HopfRinow (Completed) Layers 0–1 (Levi-Civita connection, geodesic predicate),
Mathlib `EuclideanSpace` and `Metric.sphere`.

**Projective metric examples.** This block follows the generic submersion
construction, the round sphere model above and the indicated smooth-carrier
suppliers.
On [ComplexKahlerGeometry](../ComplexKahlerGeometry/README.md) K7.1 (projective
charts and orientation)'s
smooth CP^d carrier and [GeneralizedCohomology G4.0b](../GeneralizedCohomology/README.md#g4-generalized-lerayhirsch-thom-and-euler-theory)'s
smooth HP^d carrier, construct metrics as the quotients of the round unit
spheres S^(2d+1) and S^(4d+3) by the circle and unit-quaternion Hopf actions.
For HP^d consume G4.0b's smooth Hopf quotient submersion and its diffeomorphism
with Sp(d+1)/(Sp(d)×Sp(1)); prove that the quotient metric makes this map a
Riemannian submersion. For CP^d construct the general smooth Hopf map as
SBC B1.4's free circle quotient, consuming SBC's S³→CP¹ example when d=1,
and prove the general quotient is diffeomorphic to K7.1's chart-built native
projectivization carrier. Consume TopologicalKTheory T6.6's classical quotient
comparison with U(d+1)/(U(d)×U(1)), with base point the last coordinate line,
matching the ordered blocks and the HP convention.
On both classical Lie algebras pin the product `⟨X,Y⟩=−½ Re tr(XY)`;
for sp(d+1) take the trace in quaternionic (d+1)-by-(d+1) matrices, or
`−¼ Re tr(XY)` in their doubled complex representation. Prove its induced
quotient metric equals the round Hopf quotient metric. This normalization
has primitive unit-speed geodesic period π. For d≥2 the sectional curvature
bounds 1 and 4 are both attained; CP¹ and HP¹ have constant curvature 4 and are
round spheres of radius ½, while d=0 is a point. Derive the curvature range
from O'Neill's horizontal-curvature formula for a Riemannian submersion,
`K_B(π_*X,π_*Y)=K_M(X,Y)+¾|[X,Y]^v|²` for horizontal orthonormal X,Y
(O'Neill, *The fundamental equations of a submersion*, Michigan Math. J. 13
(1966), Theorem 2 and Corollary 1), on the round S^(2d+1): the vertical
component of [X,Y] is `2⟨X,JY⟩` times the unit fibre direction Jz, so
`K(X,Y)=1+3⟨X,JY⟩²`, which lies in [1,4], equals 4 exactly on complex lines
(Y=±JX) and equals 1 exactly on totally real planes; on HP^d the same
computation with the three complex structures gives `K(X,Y)=1+3Σ_k⟨X,J_kY⟩²`.
Derive the period from horizontal great circles: for a unit v with v⊥z and
v⊥Jz, `γ(t)=cos t·z+sin t·v` is horizontal at every time, its projection is a
geodesic of the quotient, and `γ(t+π)=−γ(t)` is its first return to the line
through z. Pin the normalization by the orbit map: for X in the orthogonal
complement of u(d)⊕u(1) in u(d+1), `−½ Re tr(X²)=|X e_(d+1)|²` is the round
norm of the orbit velocity, while on the u(1) summand `−½ Re tr(X²)` is half of
it, so the comparison is a statement about the quotient U(d+1)/(U(d)×U(1)) and
not about the orbit map onto the sphere. Compare the complex Kähler
form with K7.2's integral-one normalization: `ω_g=π·ω_FS`,
with `ω_g(u,v)=g(Ju,v)` and hence `ω_g(u,Jv)=g(u,v)`. Both are
U(d+1)-invariant real 2-forms and the U(d)×U(1)-invariant 2-forms on a
tangent space are one-dimensional, so they are proportional; a projective
line carries the round metric of radius ½ with area π, where ω_FS has
integral one, which fixes the constant.

*Needs:* R1 generic connection/submersion lane (the tensors A, T, O'Neill's
formula, horizontal lifts), R1 round sphere model (connection, curvature +1,
great circles, scaling), ComplexKahlerGeometry K7.1 (projective charts and
orientation: smooth `CP^d`) and K7.2 (projective bundles, forms and cohomology:
normalized Fubini–Study form), GeneralizedCohomology G4.0b (smooth `HP^d`, the Hopf quotient
submersion and `Sp(d+1)/(Sp(d)×Sp(1))`), TopologicalKTheory T6.6
(`U(d+1)/(U(d)×U(1))`), SBC B1.4 (free circle quotient, `S³→CP¹`), O'Neill,
*The fundamental equations of a submersion*, Theorem 2 and Corollary 1.

### Examples

On the unit `S³` the constant-curvature identity gives `Ric=2g` and `Scal=6`,
and the bi-invariant metric `−½Re tr(XY)` on `SU(2)` reproduces it; on
`S²×S²` with unit factors `Ric=g` and `Scal=4`. The projective line `CP¹`
with the Hopf quotient metric is the round sphere of radius ½, of curvature 4
and area π, and `ω_g=π·ω_FS` there.

### Dependencies

Layer 1 uses HopfRinow (Completed) Layers 0–1 and 4, SmoothBundlesConnections
B1.4–B1.5 and B2–B5, ComplexKahlerGeometry K5a, LieGroups L0–L2 and Tau Ceti's
curvature, homogeneity and round-sphere declarations. Its generic connection,
tensor and submersion algebra and the round sphere model come first; the
projective metric examples then consume ComplexKahlerGeometry K7.1–K7.2,
GeneralizedCohomology G4.0b and TopologicalKTheory T6.6 together with that
round model and the submersion formulas. No Jacobi, index or comparison
theorem is used in this layer.

## Layer 2: Jacobi fields and normal-coordinate jets

### R2. General Jacobi fields and exponential derivatives

First upgrade native C² `IsGeodesicCurveOn` solutions for a smooth metric to
C^∞ on the interval interior by bootstrapping the coordinate geodesic ODE;
give the endpoint version when the geodesic extends to an open interval.
For a smooth geodesic γ on a nondegenerate interval, define a Jacobi field
(`IsJacobiFieldOn`) as a C² section X of γ*TM with `D_t²X+R(X,γ′)γ′=0`. Its C² lift to the tangent
bundle and the parameter-set unique-derivative hypothesis are part of the
definition. Extend the existing along-curve carrier: for C^(k+1) curves and
section lifts on a `UniqueDiffOn` parameter set, prove the lift of D_tX is C^k
with its fixed-chart formula near every point. Consume native
`CovariantDerivative.symmL_alongCurveInChartWithin` for chart independence under
its differentiability/unique-derivative hypotheses. Consume HopfRinow's
reparametrization law and prove iterated-derivative regularity before using
the Jacobi equation. The global
smooth solutions then follow by the linear ODE regularity theorem.

**Checks.**
- On the unit sphere, along a unit-speed great circle γ with E a parallel unit
  normal field, `X(t)=sin t·E` satisfies `D_t²X=−sin t·E` and
  `R(X,γ′)γ′=⟨γ′,γ′⟩X−⟨X,γ′⟩γ′=sin t·E`, so `D_t²X+R(X,γ′)γ′=0`: Jacobi,
  with `X(0)=0`, `D_tX(0)=E` and first zero at t=π, the conjugate time.
- The tangential field `X(t)=t·γ′(t)` has `D_t²X=0` and `R(γ′,γ′)γ′=0`, so it
  is Jacobi along every geodesic; so is `γ′` itself. The field `sinh t·E`
  satisfies `D_t²X−R(X,γ′)γ′=0` on the sphere, the equation with the
  curvature term's sign reversed, and is not Jacobi there; it is Jacobi in
  hyperbolic space, where `R(X,γ′)γ′=−X` for normal X.
- Along a constant geodesic `γ≡p`, `γ′=0` and the equation reads
  `X″=0` in the fixed space `T_pM`, so the Jacobi fields are the affine fields
  `u+tv`; a definition that divided by `|γ′|` would be undefined here.

Prove linearity, restriction, overlap uniqueness, time translation/scaling and
smooth-isometry transport. Trivialize along γ by parallel transport and obtain a
linear second-order ODE on a **fixed** tangent space. Prove global solvability
(`exists_jacobi_initial_data`) and uniqueness (`jacobi_eq_of_initial_data`)
on each prescribed compact geodesic interval for arbitrary (X(t₀),D_tX(t₀)),
smooth dependence, and the 2n-dimensional solution-space identification. This
solution space consists of sections on the interval, or the quotient of extended
sections by equality there; freely chosen values outside the interval are not
part of it. This does not require completeness of the whole manifold.

Every smooth variation through geodesics gives a Jacobi field. Conversely realize
any initial-data solution by a smooth geodesic variation on a common compact
time interval, using smooth initial position/velocity and the joint geodesic flow.
This converse does not promise fixed endpoints beyond first order. Prove
`d exp_(tv)(tw)=X(t)` for X(0)=0,D_tX(0)=w, and its version with varying basepoint.
Prove the Wronskian is constant and the splitting into tangential `(a+bt)γ′`
and normal fields for a nonconstant geodesic, with the affine-parameter scaling
explicit. Constant geodesics are the separate affine-vector-field case.
Pin the Gauss radial-length identity `|d exp_v(v)|=|v|`. For the equality
case in the radial-versus-angular length comparison, require d exp to be
nonsingular along the compared domain before concluding the angular component
vanishes; the norm inequality alone does not exclude a singular kernel.

For constant curvature compute all Jacobi solutions with sin/cos, linear or
sinh/cosh coefficients in a parallel frame. Identify positive-curvature conjugate
times/multiplicity and the nonpositive-curvature absence
(`jacobi_eq_zero_of_nonpositive_curvature`). Use these formulas for
the sphere examples, space forms and normal jets. Prove a Killing field
restricts to a Jacobi field along every geodesic, with the complete local-flow
isometry characterization and the identity
`∇²_(Y,Z)X=R(Y,X)Z`, where ∇²_(Y,Z)X=∇_Y∇_ZX−∇_(∇_YZ)X.

*Needs:* R1 (curvature tensor, connection identities, the Killing-field
commutation), HopfRinow (Completed) Layers 0–2 (geodesic predicate, covariant
differentiation along curves, reparametrization), Tau Ceti
`TauCeti.Manifold.IsGeodesicCurveOn`, `CovariantDerivative.alongCurveWithin` and
`CovariantDerivative.symmL_alongCurveInChartWithin`, Mathlib `IsPicardLindelof` and
`ODE_solution_unique_of_mem_Icc` (existence and uniqueness for the parallel-frame
linear system), SBC B2–B5 (parallel transport along γ).

### R1.4. Normal-coordinate jets

Build smooth orthonormal geodesic frames at a point, including their induced
tensor frames. In a normal chart prove that the first derivatives of g vanish
and characterize the quadratic and cubic jets by R and ∇R. With orthonormal
vectors e_i at p and v in its tangent normal ball, pin
`exp_p*g(e_i,e_j)=δ_ij−⅓⟨R(e_i,v)v,e_j⟩−⅙⟨(∇_vR)(e_i,v)v,e_j⟩+O(|v|⁴)`
(Brewin, *Riemann normal coordinate expansions using Cadabra*, equation
(11.1), arXiv v3 p. 15, whose index convention gives the same quadratic term
`|v|²δ_ij−v_iv_j` on the unit sphere; Nicolaescu, *Lectures on the Geometry
of Manifolds*, Proposition 4.1.25, p. 151, for the vanishing first
derivatives). State the remainder as a local norm bound uniform over unit
e_i, e_j. Derive these expansions from R2's Jacobi equation, not from an
assumed Taylor formula for exp. In particular, for unit T,Y with Y⊥T,
`|d exp_(tT)(tY)|²=t²−⅓K(T,Y)t⁴+O(t⁵)`.

**Checks.**
- Unit sphere: `⟨R(e_i,v)v,e_j⟩=|v|²δ_ij−v_iv_j`, so for unit e⊥v the
  coefficient is `1−|v|²/3`, the expansion of the angular factor
  `sin²|v|/|v|²`; the sign `+⅓` would give `1+|v|²/3`, the factor
  `sinh²|v|/|v|²` of the hyperbolic plane.
- Radial direction: for `e=v/|v|` the quadratic term `|v|²−|v|²` vanishes,
  as the Gauss lemma requires (`|d exp_v(v)|=|v|`).
- On the unit sphere the Jacobi field `sin t·Y` gives
  `|d exp_(tT)(tY)|²=sin²t=t²−t⁴/3+O(t⁶)`, matching K=1; in ℝⁿ every
  correction vanishes and normal coordinates are affine coordinates.

*Needs:* HopfRinow (Completed) Layers 2–3 (normal balls, Gauss lemma),
SmoothBundlesConnections B5.0 (smooth parameter-dependent parallel transport),
R2 (Jacobi fields and `d exp`).

### Examples

Along a unit-speed great circle of the unit sphere the Jacobi field with
`X(0)=0` and `D_tX(0)=E` is `sin t·E`, with first zero at the conjugate time π;
in hyperbolic space it is `sinh t·E` and in ℝⁿ it is `tE`. Correspondingly
`|d exp_(tT)(tY)|²` is `sin²t`, `sinh²t` and `t²`, whose `t⁴` coefficients
−⅓, +⅓ and 0 are `−⅓K`.

### Dependencies

R2 uses Layer 1's curvature identities, HopfRinow (Completed) Layers 0–2,
SmoothBundlesConnections B2–B5, Tau Ceti's geodesic and along-curve
derivative declarations and Mathlib's ODE existence and uniqueness. The
normal-coordinate jets R1.4 follow R2's Jacobi fields and also use
SmoothBundlesConnections B5.0 and HopfRinow (Completed) Layers 2–3.

## Layer 3: index forms and path topology

### R3. Second variation, index forms and conjugate points

Construct smooth and piecewise smooth variations and their endpoint constraints
on the actual curve/section types. First construct the shared ambient real module
of continuous piecewise C¹ sections of γ*TM on [a,b], with subdivision-independent
C¹ lifts on the pieces and linear endpoint evaluations. Construct the bulk index
integral as a real `LinearMap.BilinForm` on this module. Its fixed-endpoint
restriction I is on V₀₀={X | X(a)=0 and X(b)=0}; R3 uses this restriction.
Construct the smooth-submodule and H¹ completion comparisons and continuous
endpoint traces, with their inclusion/restriction laws. The periodic and R6
mixed-endpoint subspaces use this same ambient interval-section module, with
their own endpoint constraints. Starting from HopfRinow's first variation,
first prove the first-variation formula for continuous piecewise smooth curves,
including the jump of tangent velocity at each corner. Then prove mixed
covariant derivatives commute up to curvature, interchange
derivative/integral under compact-parameter hypotheses, and derive the second
energy variation, including endpoint acceleration and corner terms. For fixed
endpoints its Hessian is the pinned index form. For length, use normal fields
along a unit-speed nonconstant geodesic and state the tangential/reparametrization
degeneracy separately. On smooth closed geodesics also prove the second
variation on periodic fields/variations; periodic endpoint terms cancel. This
is the closed-geodesic formula consumed by R4.6's Synge argument; DGFloer
owns the wider free-loop Morse theory. Give the smooth-density/approximation comparison with
piecewise C¹ and H¹ fields.

Prove integration by parts, symmetry and the endpoint-Jacobi kernel criterion.
Define conjugacy by a **nonzero** Jacobi field vanishing at both endpoints;
multiplicity is the dimension of that solution subspace. Prove equivalence with
the singular differential of exp and nullity of the endpoint index form, with
radial direction excluded for a nonconstant geodesic. Multiplicity≤n−1; prove it also equals `dim ker(d exp_(bv))` with the
initial-time/velocity rescaling explicit.

Use a finite subdivision into strongly convex normal neighborhoods. Split
endpoint-zero fields into piecewise Jacobi interpolation and fields zero at all
nodes, prove index orthogonality, and prove positivity on the latter summand.
Identify the index/nullity with the finite matrix on node values. Prove finiteness
of the index, defined first as the supremum in `ℕ∞` of the dimensions of finite
negative-definite subspaces; the reduction proves this value is attained.
Prove the Morse index theorem: index equals the sum of conjugate multiplicities
strictly inside the interval; endpoint conjugacy supplies nullity, not index.
Track the index jump as the endpoint moves. No infinite-dimensional spectral
assertion substitutes for this finite reduction.

Prove minimizing segments have index zero (positive-semidefinite index form). A conjugate point strictly
before the endpoint produces an explicitly smoothed shortening variation;
segments with no conjugate point in `(a,b]` are strictly locally minimizing
among uniformly close fixed-endpoint curves up to nondecreasing reparametrization
for length, or uniquely at the fixed affine parametrization for energy.
Global minimizing and absence of conjugacy remain distinct. R6 supplies the
submanifold-endpoint and focal versions on its mixed-endpoint subspace of the
same ambient interval-section module, with the bulk form restricted there.

The index form, conjugate multiplicity and the `ℕ∞`-valued index are
definitions with the following unit tests.

**Checks.**
- On the unit sphere, along a unit-speed great circle on `[0,b]` with E a
  parallel unit normal field, `X=sin(πt/b)E` gives
  `I(X,X)=∫₀ᵇ((π/b)²cos²(πt/b)−sin²(πt/b))dt=(b/2)(π²/b²−1)`, negative exactly
  when b>π; the integrand with `+⟨R(X,γ′)γ′,X⟩` would give `(b/2)(π²/b²+1)>0`
  for every b and never detect the conjugate point at π.
- Conjugate multiplicity on the unit `Sⁿ`: the Jacobi fields vanishing at 0
  and π along a great circle are `sin t·E_i` for the n−1 parallel normal
  fields `E_i`, so the multiplicity at π is n−1, while `t·γ′` vanishes only
  at 0; in `ℝⁿ` no point is conjugate. A definition that did not require the
  Jacobi field to be nonzero would make every pair of points conjugate.
- The index on `S²` (n=2): the Dirichlet modes `sin(kπt/b)E` have
  `I=(b/2)((kπ/b)²−1)`, negative exactly for k<b/π, so the index is 1 for
  π<b<2π and 2 for 2π<b<3π, the number of interior conjugate times counted
  with multiplicity; at b=π the index is 0 and `sin t·E` is a null vector,
  so endpoint conjugacy contributes nullity, not index.

*Needs:* R2 (Jacobi fields, geodesic variations, the exponential differential),
HopfRinow (Completed) Layers 1–3 (first energy variation, normal balls), SBC B6.0
(strongly convex normal neighbourhoods for the finite subdivision), Mathlib
`intervalIntegral` and `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
(differentiation under the integral on a compact parameter interval).

#### R3.1. H¹ paths and the speed topology

Define the H¹ path carrier using continuous curves whose readings on a finite
coordinate subdivision have weak first derivatives in L². Pin its topology by
local exponential charts along reference smooth paths, with section norm
`(∫(|V|²+|D_tV|²))^(1/2)`; prove chart/subdivision independence, the
one-dimensional Sobolev chain rule, continuity into the compact-open carrier,
and relative smooth density. Piecewise C¹ paths have the induced H¹ topology.
Construct the finite-dimensional vector-valued interval weak derivative
coordinatewise from PDE's scalar theory, prove equivalence with absolute
continuity and the integral of the derivative, and prove energy is continuous.
For every absolutely continuous finite-energy
curve on [a,b], prove Cauchy–Schwarz
`Length(γ)²≤2(b−a)Energy(γ)` and its restriction to each subinterval.
For b>a prove equality exactly when the speed is constant almost everywhere,
including the zero-speed case.

For the interval path carrier compare the H¹ topology with the speed metric
`d_s(γ,η)=sup_t dist(γ(t),η(t))+‖|γ′|−|η′|‖_L²`.
Prove that convergence to an existing H¹ path in this metric is equivalent
to convergence in the preceding H¹ charts. In a common finite coordinate
subdivision, uniform convergence and bounded energy give weak convergence
of coordinate derivatives; convergence of the speed L² norms and uniform
metric coefficients then give strong convergence in the fixed weighted
Hilbert derivative space. Prove the converse using the one-dimensional
Sobolev embedding and the reverse triangle inequality for speeds. This
metric induces that topology but need not be complete: on an interval,
fixed-endpoint triangular waves of amplitude tending to zero and speed one
almost everywhere form a d_s-Cauchy sequence with no d_s limit. Do not use
completeness of this particular metric in constructing the Hilbert charts.

The H¹ carrier, its speed metric and the energy are definitions with the following
unit tests.

**Checks.**
- On the segment `γ(t)=tv` in ℝⁿ, t in [0,1], `Length=|v|` and `Energy=½|v|²`, so
  `Length²=2(b−a)·Energy` with equality, as the constant speed predicts; on
  `t↦t²v` the length is still `|v|` while `Energy=(2/3)|v|²`, so `2·Energy=(4/3)|v|²>|v|²`
  strictly. An energy defined without the factor ½ would turn the equality case
  into `Length²=Energy`.
- The triangular waves `γ_k(t)=dist(t,(1/k)ℤ)` on [0,1] in ℝ have speed 1 almost
  everywhere, fixed endpoints 0, and `sup|γ_k|=1/(2k)`, so `sup|γ_k−γ_j|≤1/(2 min(k,j))` and they are d_s-Cauchy;
  their uniform limit is the constant path with speed 0, at speed-norm distance 1
  from every γ_k, so they have no d_s-limit. A speed metric that used the sup
  distance alone would declare the sequence convergent.
- The same γ_k converge uniformly to the constant path while `Energy(γ_k)=½` for all
  k; energy is therefore discontinuous for the compact-open topology and continuous
  for the H¹ topology, which separates the two carriers.

*Needs:* PDE A.1–A.6 (scalar weak derivatives and `W^{1,2}` on an interval),
R3 (the ambient interval-section module), HopfRinow (Completed) Layer 1 (length and
energy of piecewise smooth curves), Mathlib `ContinuousMap` (the compact-open
carrier) and the Lebesgue fundamental theorem of calculus
(`intervalIntegral.integral_eq_sub_of_hasDerivAt`).

#### R3.2. Finite broken geodesics and path CW models

For a connected complete manifold with its given smooth Riemannian metric, fixed endpoints
p,q, a positive energy bound c and subdivision t₀<⋯<t_r, put T=t_r−t₀>0.
Define the continuous discrete energy on all finite tuples first:
`E_Δ(x₁,…,x_(r−1))=½Σ_(j=1)^r dist(x_(j−1),x_j)²/(t_j−t_(j−1))`,
with x₀=p and x_r=q. The finite vertex manifold is the open subset
`E_Δ<c` of M^(r−1). Prove openness from continuity of distance before
constructing any short-geodesic interpolation.

Prove discrete Cauchy–Schwarz and the triangle estimate
`dist(p,x_j)≤Σ_(i=1)^j dist(x_(i−1),x_i)≤√(2T E_Δ)<√(2Tc)`.
Define admissibility `Adm(c,t)` to mean: c>0, t is strictly increasing
with these endpoints, and there exist ρ>0 and a compact closed ball
centered at p with radius greater than `√(2Tc)+ρ`, on which ρ is below
SBC B6.0's uniform normal/strong-convexity bounds, with
`max_j(t_j−t_(j−1))<ρ²/(2c)`. Hopf–Rinow properness and B6.0
supply such bounds; sufficiently fine subdivisions are admissible. Prove
admissibility is preserved under decreasing the positive cutoff and
under subdivision refinement with the same time endpoints. Each
nonnegative energy summand then
gives `dist(x_(j−1),x_j)²≤2E_Δ(t_j−t_(j−1))<ρ²`.
Specify the open pair-normal domain
`{(x,y):x∈B(p,√(2Tc)), dist(x,y)<ρ}`, including its diagonal.
B6.0 supplies smooth logarithms/segments there using the larger compact
ball and its margin. Thus each edge in the energy carrier belongs to
this domain. Only then construct the unique short minimizing
segments and prove smooth dependence on both endpoints using SBC B6.0.
For compact M also construct one global radius supplying smooth short
segments for every pair at distance<ρ. DGFloer owns its closed-loop
energy-cut and distance-cut carriers using that interpolation. These
compact-set radius bounds precede R4's injectivity-radius function.

For two admissible subdivisions with one refining the other, construct
the geodesic-insertion map from coarse to fine and vertex-forgetting map
from fine to coarse. Prove insertion preserves discrete energy exactly
and forgetting does not increase it. Compare cutoffs by inclusion, and
prove these maps and their homotopies commute with further refinement;
different finite products are related by maps, not identified as subsets.
Prove the energy-cutoff path
sublevel deformation retracts to the corresponding broken-geodesic sublevel by
straightening each segment, with continuity and nonincreasing energy. Prove every
compact family in the piecewise C¹/H¹ path topology is captured by some
subdivision/cutoff; continuous compact families in the compact-open carrier
first use a relative parametric smoothing/finite-energy comparison. Prove
independence/refinement comparisons. These are Milnor §16 finite objects.
Construct CP^d/HP^d examples using R1's normalized Hopf-submersion metrics.
The general finite-vertex construction takes any complete smooth metric as
input, including R1's complete invariant metrics.
Prove that critical points of the energy on the finite vertex manifold are
in bijection with geodesics p→q on [t₀,t_r] of energy<c, in both
directions, and that the Hessian is R3's node-value index matrix (Milnor
16.2–16.3). Prove every admissible subdivision satisfies the strongly
convex subdivision hypothesis of that reduction at every such geodesic.
The general Jacobi/index APIs are supplied here.
Consume MorseTheory M1–M2's native critical-point/index/chart comparisons,
compact-band deformation and simultaneous finite critical-level cell attachments
(Milnor Theorems 3.1–3.5 and Remark 3.4). Verify their compact-band hypotheses
for each finite vertex energy carrier, and prove the attaching maps and relative
homotopies commute with the path-space and subdivision comparisons. R4 consumes
the same supplier for its no-critical-value/minimax step.

For every strict energy cutoff a<c prove compactness of its sublevel inside
the open carrier E_Δ<c of an Adm(c,t) subdivision. For nonconjugate endpoints derive that critical
points are nondegenerate and isolated, and that there are finitely many in
each compact band and countably many overall. Prove Milnor Theorem 17.3: a CW
model with one λ-cell per geodesic of index λ. Consume MorseTheory M2's
compatible-cell/telescope and Milnor Lemmas 3.6–3.7 extension machinery for
the increasing cutoff/subdivision sequence; prove all refinement attachment
and sublevel homotopies commute with its telescope maps.
Pin the ordinary fixed-endpoint carrier as native `Path p q` with topology
induced from `ContinuousMap I M`; compare it with DGFloer's standing
Moore-path carriers, by fixed-interval reparametrization and explicit
length-change/retracing homotopies. It is metrizable here, so k-ification preserves
its topology. Compact-family capture gives a weak equivalence from the CW
model. Consume AT8.11a's finite-source based-pair mapping-space CW-type
targets `finiteSourceMappingCWType` and `basedLoopCWType`
(Milnor 1959) for loops at p, using the interval endpoint pair
and the marked CW pair (M,{p}). R3 consumes neither AT's
smash/suspension comparison targets nor a Freudenthal theorem. The
smooth-triangulation item 1 in
[GeometricTopology's smoothing-and-triangulation comparison](../GeometricTopology/README.md#the-smoothing-and-triangulation-comparison-far-horizon)
supplies that pair with p as a 0-cell. R3 transports the supplied
triangulation through MorseTheory M1's smooth model-change atlas
equivalence. Use the endpoint-change equivalence
below to obtain CW type for paths p→q, then AT's Whitehead comparison
upgrades the weak equivalence to a homotopy equivalence. Own all parametric
smoothing/finite-energy comparison maps used to enter this ordinary carrier.
For a chosen path η from p to q, construct the endpoint-change homotopy
equivalence between loops at p and paths p→q by concatenation with η and
its reversal, with explicit reparametrization/retracing homotopies and topology
comparisons; the equivalence depends on η.

The discrete energy `E_Δ` and the admissibility predicate `Adm(c,t)` are definitions
with the following unit tests.

**Checks.**
- In ℝⁿ with `t_j=j/r` on [0,1] and the equally spaced vertices
  `x_j=p+(j/r)(q−p)`, every summand is `(|q−p|²/r²)/(1/r)=|q−p|²/r`, so
  `E_Δ=½|q−p|²`, the energy of the straight segment, independently of r. Without the
  weights `1/(t_j−t_(j−1))` the value would be `½|q−p|²/r`, shrinking under refinement.
- Discrete Cauchy–Schwarz: with r equal time steps `T/r` and all r distances equal
  to d, `Σdist=rd=√(2T·E_Δ)` with equality; with r=2, T=1 and distances d, 0 the
  left side is d and the right side `√(2·½(d²/½))=√2·d`, strictly larger.
- On the circle of circumference 2π with p=q, T=1, `t=(0,½,1)`, c=20 and the
  antipode `x_1=−p`, `E_Δ=½(π²/½+π²/½)=2π²<20`, so the tuple lies in the carrier
  although p and x_1 are joined by two minimizing segments. Admissibility fails:
  `max(t_j−t_(j−1))=½<ρ²/(2c)` forces `ρ>√20>π/2`, above the circle's
  strong-convexity radius π/2. A predicate omitting the subdivision-fineness
  condition would admit `(c,t)` and the unique short segment would not exist.

*Needs:* R3.1 (H¹ and piecewise `C¹` carriers, speed topology), R3 (index form
and its node-value matrix), SBC B6.0 (uniform normal and strong-convexity radii,
smooth short segments), HopfRinow (Completed) Layer 4 (properness of closed
balls on a complete manifold), MorseTheory M1–M2, AlgebraicTopology Stages 4, 6
and 8 (`finiteSourceMappingCWType`, `basedLoopCWType`, Whitehead's comparison),
GeometricTopology's smoothing-and-triangulation comparison (item 1), DGFloer
Layers 1–2 (Moore paths), Mathlib `Path` and `ContinuousMap`.

#### R3.3. Nonconjugate round-sphere paths, in three independent branches

Keep the ordinary path carrier, chosen endpoints and endpoint-change maps fixed throughout these calculations. The full result uses the three constructions below; the n=2 argument is not a premise of the n≥3 branch or of the circle winding branch. Their conclusion for loops is the headline `singularHomology_loopSpace_sphere`: for n≥2 and a point p of the unit `Sⁿ`, the integral singular homology of `Path p p` is ℤ in every degree divisible by n−1 and 0 in every other degree.

##### R3.3a. Lacunary cells in dimensions n≥3

For the unit round `Sⁿ`, n≥3, fix p and q with q∉{p,−p} at angle θ∈(0,π). The two oriented great-circle arcs from p to q and their extra full turns have lengths `θ+2πk` and `2π−θ+2πk`, k≥0. They pass through the conjugate times π, 2π, … of multiplicity n−1, so the Morse index theorem gives them indices `2k(n−1)` and `(2k+1)(n−1)`, with no nullity at these nonconjugate endpoints. The finite broken-geodesic critical-band theorem and coherent exhaustion of R3.2 therefore give exactly one cell in every dimension `j(n−1)`, j≥0, on the path CW model. Since n−1≥2, no two cells have adjacent dimensions and every cellular boundary map is 0. Hence `H_i(Path(p,q);ℤ)` is ℤ when n−1 divides i and 0 otherwise; use the CW homology colimit for the unbounded exhaustion. There is no 1-cell, so the path space is simply connected by the relative-cell connectivity theorem. Endpoint change along a chosen reference path transports this to `ΩSⁿ`; in particular `ΩS³` has integral homology ℤ in even degrees and 0 in odd degrees and is simply connected. The n=2 Hopf comparison and the n=1 winding branch below are separate branches, not premises here.

**Checks.**
- On `S³` with θ=π/2: the arcs of lengths π/2, 3π/2, 5π/2, 7π/2, … have
  indices 0, 2, 4, 6, …, one cell in each even dimension, so `H_i` is ℤ for
  even i and 0 for odd i; counting each conjugate point once instead of with
  multiplicity n−1=2 would give indices 0, 1, 2, 3, … and adjacent cells.
- On `S⁴` (n−1=3) the cells have dimensions 0, 3, 6, …, so `H₃=ℤ` and
  `H₁=H₂=0`; a homology "ℤ in every degree" would contradict `H₁=0`.
- The bound n≥3 is used: for n=2 the cell dimensions 0, 1, 2, … are adjacent,
  so the vanishing of boundary maps is not automatic and R3.3c supplies the
  computation instead.

*Needs:* R3.2 (finite broken-geodesic CW model, critical-band theorem, coherent
exhaustion), R2 (constant-curvature Jacobi fields and conjugate multiplicities),
R3 (Morse index theorem), AlgebraicTopology Stage 8 (cellular homology, CW
colimits, relative-cell connectivity), Mathlib `AlgebraicTopology.singularHomologyFunctor`
and `Path`.

##### R3.3b. Winding components for the circle

Use the real exponential covering `ℝ→Circle` of period 2π, after the round `S¹` homeomorphism. For a fixed endpoint angle θ, lift every path from the fixed real lift of its start; its endpoint lies at `θ+2πk` for a unique integer k. Covering homotopy lifting for parameter families makes this endpoint label locally constant. In the fibre of each k, straight-line interpolation between two lifted paths fixes both endpoints and contracts the fibre to the linear path; descent contracts that path component. Thus the path space has the homotopy type of the discrete space ℤ, `H₀` is the direct sum of one ℤ for each winding number, and all higher homology vanishes. The label is the winding number, the generator of the fundamental group of the circle, with the concatenation convention compared. This branch uses no higher-sphere or n=2 Hopf calculation; it is why the headline of R3.3 needs n≥2.

*Needs:* R3.2 (the ordinary path carrier and endpoint change), Mathlib `Circle` and
`AddCircle` with the real exponential covering and its homotopy lifting
(`IsCoveringMap`), AlgebraicTopology Stage 2 (winding number and the fundamental
group of the circle).

##### R3.3c. The n=2 Hopf comparison

Use the complex projective line `CP¹` and the unit sphere of ℂ², compared to the real `S³⊂ℝ⁴` by the real-linear isometry `(z₀,z₁)↦(Re z₀,Im z₀,Re z₁,Im z₁)`. The map `z↦ℂ·z` is the principal `Circle` Hopf bundle. On the projective chart z₀≠0, `w=z₁/z₀`, use the section `(1,w)/√(1+|w|²)` and the fibre coordinate `z₀/|z₀|`; on z₁≠0 use the analogous section `(u,1)/√(1+|u|²)`, `u=z₀/z₁`. Prove the inverse and transition formulas, joint continuity and smoothness, and that the right `Circle` action is free and transitive on fibres. These local trivializations make the projection a fibre bundle, hence a Serre fibration; no projective cohomology or Chern classification of circle bundles is a prerequisite.

The map from `CP¹` to the unit `S²` descends from
`h(z)=(2Re(z̄₀z₁),2Im(z̄₀z₁),|z₀|²−|z₁|²)`.
Compute `|h(z)|²=(|z₀|²+|z₁|²)²=1` and its fibres, which are exactly the `Circle` orbits. The two affine-chart and stereographic inverse formulas prove bijectivity, continuity and smoothness in both directions; alternatively, a continuous bijection from a compact space to a Hausdorff space is a homeomorphism, before the smooth chart comparison. Send [1:0] to the north pole; the displayed chart has positive complex orientation there, and the convention `z₀z̄₁` in place of `z̄₀z₁` reverses it, so the two conventions must be compared explicitly. This pointed homeomorphism, and diffeomorphism, is what the homotopy argument needs; no equality of the Fubini–Study and round metric normalizations is used.

**Stereographic Hopf circles and the quotient disk.** Compare this same
bundle with its orbit picture in real three-space: the stereographic images
of the Hopf fibres are pairwise linked circles filling ℝ³ together with one
line (Lyons, *An elementary introduction to the Hopf fibration*, section
"Seeing the Hopf fibration", Investigations (L) and (M) and Figure 10, arXiv v1
pp. 13–15: (L) gives the line and the circles, (M) their pairwise linking; Lyons projects
from a point of the axis fibre and uses quaternion coordinates, which the
chart below transports to the complex coordinates of R3.3c). Set P=(0,i) in
S³⊂ℂ² and use the stereographic chart
`σ(z₀,z₁)=(Re z₀,Im z₀,Re z₁)/(1−Im z₁)` from P. Construct its smooth
inverse and its extension identifying S³ with the one-point compactification
of ℝ³. For 0<r<1, the sets |z₁|=r are product tori: use
`(z₀,z₁)=(√(1−r²)e^(iα),r e^(iβ))` to prove the diagonal Circle orbits
have slope(1,1). Prove their stereographic images are embedded circles.
Handle |z₁|=0 and |z₁|=1 as the two exceptional coordinate-circle fibres:
the former is the unit circle in the xy-plane, and the latter is the
z-axis together with the compactification point P. These circles and tori
exhaust S³ and give the stated picture in ℝ³, retaining the axis as a line
there rather than asserting it is a Euclidean circle.

For the closed complex unit disk, the inverse image of its inclusion in
the xy-plane is
`j(u)=(2u/(1+|u|²),i(|u|²−1)/(1+|u|²))`.
Prove j has values in S³, σ(j(u))=(Re u,Im u,0), and every orbit with
z₁≠0 meets j(int D²) exactly once: for |u|,|v|≤1 some ζ in Circle has
`ζ·j(u)=j(v)` exactly when u=v or |u|=|v|=1, and every point of S³ is
`ζ·j(u)` for some ζ and some u with |u|≤1. Its boundary is precisely the
entire z₁=0 fibre. Construct the continuous bijection
`D²/∂D²→CP¹`, induced by u↦ℂ·j(u), and prove it is a homeomorphism
using compactness and the Hausdorff projective model. Compare this map
with the preceding CP¹≃S² charts. This identifies the actual orbit quotient,
including the collapsed boundary, rather than another abstract sphere.

The disk centre corresponds to [0:1], which the preceding h sends south.
Use the specified orientation-preserving rotation
`R(x,y,z)=(x,−y,−z)` and H=R∘h for the picture with centre called north,
so `H(z₀,z₁)=(2Re(conj(z₀)z₁),−2Im(conj(z₀)z₁),|z₁|²−|z₀|²)`.
Prove H is a smooth submersion and its north fibre is L={z₀=0}. At
(0,z₁)∈L its normal vectors `(z₁/2,0)` and `(i z₁/2,0)` map under dH
to the standard ordered tangent basis at north; prove they give the
normal-bundle trivialization supplied by the differential. The picture's
infinity P lies in L, so use the distinct source marked point b=(1,0) and
target marked point H(b)=south for the based framed fibre, with regular
value north; P remains the stereographic infinity. The general Hopf bundle
stays with the preceding suppliers.

**Checks.**
- `|j(u)|²=(4|u|²+(|u|²−1)²)/(1+|u|²)²=1` for every u; `j(0)=(0,−i)` and
  `j(u)=(u,0)` when |u|=1, so the disk centre lies over [0:1] and the
  boundary circle is the z₁=0 fibre. The lift with the opposite sign in
  the second coordinate, `(2u,i(1−|u|²))/(1+|u|²)`, also lies in S³ but
  sends the centre to P, the one point σ does not chart.
- On j(u), `1−Im z₁=2/(1+|u|²)`, hence `σ(j(u))=(Re u,Im u,0)`: the chart
  returns the disk to itself. P=(0,i) is the only point with 1−Im z₁=0.
- Orbit relation: for |u|<1 the second coordinate of j(u) is `−is` with
  `s=(1−|u|²)/(1+|u|²)>0`, so `ζ·j(u)=j(v)` forces |u|=|v| and then ζ=1
  and u=v; for |u|=1 the orbit of j(u)=(u,0) is the whole fibre {(ζu,0)}.
  The open disk alone misses that fibre, and the closed disk without the
  boundary collapse is not injective on orbits.
- On |z₁|=r the orbit of `(√(1−r²),r)` is `(√(1−r²)e^(iθ),re^(iθ))`, the
  diagonal (α,β)=(θ,θ) of the torus; at r=0 and r=1 the tori degenerate
  to the two exceptional fibres.
- `H(0,ζ)=(0,0,1)` for |ζ|=1 and `H(1,0)=(0,0,−1)`; without the rotation
  R, h sends L to the south pole. At (0,ζ), dH applied to (ζ/2,0) is
  `(2Re(conj(ζ/2)ζ),−2Im(conj(ζ/2)ζ),0)=(1,0,0)` and applied to
  (iζ/2,0) is `(2Re(conj(iζ/2)ζ),−2Im(conj(iζ/2)ζ),0)=(0,1,0)`; the
  third component vanishes because `|z₁|²−|z₀|²` is stationary in z₀ at
  z₀=0. Listing the two normal vectors in the other order reverses the
  orientation of the framing.

*Needs:* R3.3c (the Hopf bundle, its charts and the map h), Mathlib `Circle`
and its scalar action, `EuclideanSpace`, and the stereographic charts of the
sphere.

Apply the homotopy exact sequence of the Hopf fibration. For `ΩS³` the n≥3 lacunary argument of R3.3a gives one cell in each nonnegative even dimension and none in odd dimensions, so its integral homology is ℤ in even degrees and 0 in odd degrees, and `π₁(ΩS³)=0`. Its CW model has exactly one 0-cell, hence is connected, and the loop-space shift identifies `π₁(S³)` as trivial without the n=2 result. The exact sequence supplies the connecting homomorphism `π₂(S²)→π₁(S¹)`, computed by lifting discs; combine it with the loop shift `π₁(ΩS²)≃π₂(S²)`. No globally continuous path-lifting function `ΩS²→S¹` is assumed. The adjoint of the normalized reduced-suspension homeomorphism `ΣS¹→S²` gives a based continuous map `s:S¹→ΩS²`. Compute the connecting homomorphism on its adjoint sphere through the Hopf clutching function: its winding number is ±1, with the sign fixed by the charts above, so the induced map of fundamental groups is an isomorphism. This degree computation is not implied by counting cells.

Multiply s with the loop of the Hopf projection to define `S¹×ΩS³→ΩS²`. The exact sequence and the vanishing of `π_k(S¹)` for k≥2 give isomorphisms of all higher homotopy groups, the winding calculation gives `π₁`, and connectedness gives `π₀`. The map is a weak equivalence of spaces of CW type, so DGFloer's homology invariance under weak equivalence applies. The integral Künneth formula has no Tor term, because `H_*(S¹;ℤ)` and the already computed `H_*(ΩS³;ℤ)` are free, and it gives `H_j(ΩS²;ℤ)=ℤ` for every j≥0; this is a computation for this map, not a claim that every fibration splits in homology. The circle's winding and fundamental group, the reduced suspension, and the product and Tor statements precede this step. The n=1 winding components and the n≥3 lacunary proof keep their own arguments, and the antipodal Bott, geometric suspension and James–EHP constructions stay independent.

Every map above has specified basepoints, the comparison with ordinary loop concatenation, and naturality with respect to the path CW and H¹ models. The Hopf bundle and the `CP¹` charts come from their existing owners (SmoothBundlesConnections, ComplexKahlerGeometry and the library); R3 adds the n=2 homology computation and no further projective-space or classifying-space theory.

The n=2 construction consumes the n≥3 lacunary branch and the circle winding and higher-asphericity facts, and no all-dimensional sphere-path homology statement that would contain its own conclusion. Only after all three constructions are complete is the all-dimensional nonconjugate path result assembled, with endpoint-change and cellular generators compared. R1 keeps the separate metric-normalization comparison for its `CP¹` example; no equality of the Fubini–Study and round metrics is a premise of this pointed topological comparison.

On the equator `w=e^(iθ)` the two chart sections satisfy `s₁=s₀·w⁻¹`. Compute the boundary winding from this transition together with the oriented disc-boundary convention of DGFloer's connecting map, and record its sign against AT's interval-last suspension homeomorphism. If the chosen generator requires the opposite sign, compose with the inversion of `S¹` rather than suppressing the sign. Construct the loop product map with the constant loop at every basepoint, and compare its induced homomorphism with `(x,y)↦s_*x+(ΩHopf)_*y` using the loop unit and reparametrization homotopies.

**Checks.**
- The clutching transition on the equator: with `s₀=(1,w)/√2` and
  `s₁=(w̄,1)/√2` at |w|=1, `s₁=w̄·s₀=s₀·w⁻¹`, a loop of winding number −1 in
  `Circle`, so the connecting map sends a generator of `π₂(S²)` to a
  generator of `π₁(S¹)`; a degree-2 clutching `s₁=s₀·w⁻²` (the circle bundle
  of Chern number ±2, with total space `RP³`) would give ±2 and `s_*` would
  not be onto.
- `s` on fundamental groups: `π₁(S¹)=ℤ→π₁(ΩS²)=π₂(S²)=ℤ` is multiplication by
  ±1; composed with the product map, `π₁(S¹×ΩS³)=ℤ×0→π₁(ΩS²)` is an
  isomorphism, as the weak equivalence requires.
- The resulting homology: `H_j(S¹×ΩS³;ℤ)=H_j(ΩS³)⊕H_(j−1)(ΩS³)`, which is ℤ for
  every j because exactly one of j and j−1 is even; dropping the `S¹` factor
  would give ℤ only in even degrees.

*Needs:* R3.3a (`ΩS³`), R3.3b (circle winding), SmoothBundlesConnections B1.4
(free circle quotient, `S³→CP¹`), ComplexKahlerGeometry K7.1 (projective
charts), AlgebraicTopology Stages 2, 4.4 and 8 (winding number, reduced suspension,
CW models) and its Künneth theorem, DGFloer Layer 1 item 2 (Hopf exact sequence,
homology invariance under weak equivalence), Mathlib `Circle`.

#### R3.4. Antipodal Morse–Bott attachments and suspension

For antipodal endpoints
on Sⁿ, n≥2, construct the critical S^(n−1) family for each length (2k+1)π,
prove index 2k(n−1), nullity n−1 and negative normal bundle
`(TS^(n−1))^(⊕2k)`, and apply MorseTheory M5's finite-dimensional
Morse–Bott attachments on this carrier. Verify that the geodesic-direction
map into the vertex tuple is a smooth embedding, that the Hessian kernel is
exactly its tangent bundle, and that each regular band is compact and has
only the indicated isolated critical family. Prove the negative bundle is oriented:
its determinant is an even tensor power of det(TS^(n−1)), with the canonical
paired orientation. For the critical family of index λ=2k(n−1), state the
integral band relative homology as `H_i(band_upper,band_lower;ℤ)≃
H_(i−λ)(S^(n−1);ℤ)`. The family of shortest antipodal geodesics gives
`S^(n−1)→Path(p,−p;Sⁿ)`. Using AT8.1's relative-cell connectivity theorem
and subsequent attachment indices≥2(n−1), prove this inclusion induces
π_q isomorphisms for q≤2n−4 and a surjection for q=2n−3 (n≥3).
Consume [CharacteristicClasses C2.0](../CharacteristicClasses/README.md#c2-thom-euler-and-gysin-theory)'s
`bundleDiskSphereRelCW` and `bundleDiskAttachmentCWModel` for the negative bundles on the
critical families, verifying all new relative cells have dimension ≥2(n−1).
Carry the commuting square and component/homotopy isomorphisms from this
relative CW model to each actual regular energy sublevel when applying
AT8.1's transport theorem. Start with Z₀=S^(n−1), with its 0-cell and
(n−1)-cell, and construct Z_k inductively by C2.0 from Z_(k−1) and the
next M5 negative-bundle attachment. Construct compatible maps from these
models to the finite energy sublevels. Pass the connectivity ranges to the
whole Path(p,−p) by compact-family capture both of sphere maps and of their
relative null-homotopies; nonconjugacy is not used for this Morse–Bott tower.

Consume DGFloer Layer 2 item 3's ordinary sphere/loop evaluation and
currying, with its based homotopy naturality and native loop comparisons.
Define j:S^(n−1)→ΩSⁿ to be the curry of AT4.4's actual raw
`reducedSuspensionSphereHomeomorph`, using its interval-last convention.
For the shortest-geodesic family pin p=e₀, the direction sphere
`{0}×S^(n−1)⊂ℝ^(n+1)`, v₀=e₁ and
γ_v(t)=cos(πt)p+sin(πt)v. Concatenate γ_v with reverse γ_(v₀).
Rectify the loop at v₀ to the constant loop by its explicit retracing
homotopy and the sphere-basepoint cofibration. Compare the adjoint with
the unreduced meridian quotient followed by collapse of the reference
meridian. With outward-first sphere generators and interval coordinate
last, prove its degree is (−1)^(n+1). Normalize by reflecting the e₂
direction coordinate, fixing v₀, exactly when n is even. Prove the resulting
adjoint has degree +1 and is based homotopic to the chosen raw sphere
homeomorphism. Thus the normalized minimum-family map is based homotopic
to j after endpoint change. Use the native loop homotopy-group equivalence
`pathLoopSpaceMulEquiv` to identify j_* with the suspension homomorphism
π_q(S^(n−1))→π_(q+1)(Sⁿ), including the degree and basepoint equations.
This supplies the Morse proof of the sphere Freudenthal range; stable
homotopy calculations are outside this roadmap.

The minimal-geodesic family `v↦γ_v` and the map `j:S^(n−1)→ΩSⁿ` are
definitions with the following unit tests.

**Checks.**
- `γ_v(t)=cos(πt)p+sin(πt)v` has `|γ_v(t)|²=cos²(πt)+sin²(πt)=1` because
  `v⊥p`, runs from p at t=0 to −p at t=1 with constant speed π, and
  `γ_v(½)=v`, so evaluation at ½ recovers the direction sphere and the family
  is injective; the parametrization `cos t·p+sin t·v` on [0,1] would end at
  `cos 1·p+sin 1·v≠−p`.
- The degree `(−1)^(n+1)` of the unnormalized adjoint: for n=2 it is −1, so
  the reflection of the e₂ direction coordinate is applied and the
  normalized `j_*:π₁(S¹)→π₂(S²)` sends 1 to 1; for n=3 it is +1 and no
  reflection is applied.
- The connectivity range: the next critical family after the minima has
  index `2(n−1)`, so the inclusion is `(2n−3)`-connected; for n=3 this gives
  `π₂(S²)=ℤ→π₃(S³)=ℤ` bijective (q=2=2n−4) and `π₃(S²)=ℤ→π₄(S³)=ℤ/2` onto
  (q=3=2n−3) but not injective, so the range cannot be extended to an
  isomorphism at q=2n−3.

*Needs:* R3.2 (finite energy sublevels, compact-family capture), R3 (index and
nullity of the antipodal families), R2 (round-sphere Jacobi fields), MorseTheory
M5 (Morse–Bott attachments), CharacteristicClasses C2.0 (`bundleDiskSphereRelCW`,
`bundleDiskAttachmentCWModel`), AlgebraicTopology Stage 4.4
(`reducedSuspensionSphereHomeomorph`) and Stage 8.1 (relative-cell connectivity
and transport), DGFloer Layer 2 item 3 (sphere/loop evaluation and currying),
Tau Ceti `pathLoopSpaceMulEquiv`.

### Examples

On `S²` a great-circle segment of length b∈(π,2π) has index 1 and one
interior conjugate point; at b=π it has index 0 and nullity 1. The integral
homology of `ΩS³` is ℤ in even degrees and 0 in odd degrees, that of `ΩS²` is
ℤ in every degree, and the path space of the circle has one contractible
component for each winding number.

### Dependencies

Layer 3 uses Layers 1–2, HopfRinow (Completed) Layers 1–4,
SmoothBundlesConnections B6.0 (which precedes the finite-vertex choice), PDE
A.1–A.6, MorseTheory M1–M2 and M5, CharacteristicClasses C2.0,
GeometricTopology's marked triangulation, AlgebraicTopology Stages 2, 4.4, 6
and 8 (including the mapping-space CW targets of 8.11a) and DGFloer Layers 1–2.
R3.2's projective path examples consume Layer 1's projective metrics. Within
R3.3 the n≥3 lacunary branch and the n=1 winding branch precede the n=2 Hopf
comparison, and only their conjunction gives the all-dimensional path result.
The speed metric of R3.1 induces the H¹ topology but is not assumed complete;
the H¹ charts are constructed independently of it.

## Layer 4: comparison, space forms and geodesic multiplicity

### R4. Comparison, complete manifolds and space forms

1. Prove the index comparison/minimizing lemma for Jacobi fields with fixed
   endpoint values. Define `s_κ(t)=sin(√κt)/√κ`, t, or
   `sinh(√(−κ)t)/√(−κ)` according to the sign of κ. For unit-speed γ and
   normal Jacobi J with J(0)=0, prove `K≤κ ⇒ |J(t)|≥s_κ(t)|D_tJ(0)|`
   before the first positive model zero; for K≥κ prove the reversed bound
   before conjugacy of γ and the model zero. The model function is
   `modelSine` and the first bound is the headline `rauch_norm_ge_of_sectional_le`:
   on a parameter interval `[0,b]`, b>0, with the Jacobi equation, velocity and
   initial data taken within `[0,b]`, the bound `K≤κ` imposed on every tangent
   two-plane of M as `⟨R(u,v)v,u⟩≤κ(|u|²|v|²−⟨u,v⟩²)`, and `b<π/√κ` when κ>0,
   conclude `s_κ(t)|D_tJ(0)|≤|J(t)|` for every t in `[0,b]`.
   Include the two-manifold Rauch
   statement with equal initial derivative norms and curvature ordered along
   the compared normal planes. State equality as the curvature equation along
   the corresponding parallel/Jacobi directions; equality for all initial
   normal directions gives the model pullback metric and local isometry.
   On a smooth normal-distance domain derive radial Hessian zero and the
   corresponding transverse lower/upper bounds by `(s_κ'/s_κ)g`, together
   with the Laplacian trace and the scalar sign dictionary. Derive Günther's
   lower volume comparison from sectional upper bounds (the headline
   `guenther`): on a connected complete n-manifold M with
   `⟨R(u,v)v,u⟩≤κ(|u|²|v|²−⟨u,v⟩²)` for all tangent vectors, at p take r>0
   with `exp_p` injective on the open tangent ball of radius r, and r<π/√κ
   when κ>0; conclude `Vol_g(B(p,r))≥ω_(n−1)V_κ(n,r)`, the volume of the
   r-ball in the n-dimensional model of curvature κ, where `ω_(n−1)=n·vol(Bⁿ)`
   is the volume of the unit (n−1)-sphere and `V_κ` is `modelBallVolume`
   below. On a complete manifold the injectivity hypothesis holds exactly
   when r≤inj(p) (R4.6): if r exceeded the cut time `t_c` of a unit direction
   v, then for `t_c<t<r` the point `exp_p(tv)` is also `exp_p(w)` for the
   initial vector w of a minimizing geodesic, with `|w|=dist(p,exp_p(tv))<t`.
   Treat the low-dimensional cases directly: for n=1 both sides are 2r, and
   for n=0 the model side is 0. For radial comparisons beyond this full-ball
   range retain the actual cut-time-truncated polar domain; cut-locus nullity
   does not remove its radial truncation. Distinguish Bishop–Gromov global
   relative-volume monotonicity from Ricci lower bounds. Use the Jacobi
   determinant/Riccati equation, trace Cauchy–Schwarz and model s_κ to prove
   the radial density inequalities before integrating. Supply radial-Jacobian,
   polar-integration bridges, consuming R4.6’s cut-locus carrier and
   volume-nullity theorem.

   The API of `modelSine`:
   - `s_κ` solves `s″+κs=0` with `s(0)=0` and `s′(0)=1`, for every real κ.
   - For κ>0, `s_κ>0` on `(0,π/√κ)` and `s_κ(π/√κ)=0`; for κ≤0, `s_κ>0` on `(0,∞)`.
   - Scaling: `s_(κ/c²)(ct)=c·s_κ(t)` for c>0, in each of the three branches.

   **Checks.**
   - `s_0(t)=t`, `s_1(t)=sin t` and `s_(−1)(t)=sinh t`; at κ=4 the value is
     `sin(2t)/2` with first positive zero π/2, whereas the misnormalized model
     `sin(κt)/κ` gives `sin(4t)/4` with first zero π/4.
   - `s_κ′(0)=1` at κ=4 (`cos 0·2/2`) and at κ=−4 (`cosh 0·2/2`); a model normalized
     as `sin(√κ t)` has `s′(0)=√κ` and the Rauch bound would fail on the sphere of
     radius ½: there the unit-speed Jacobi field with J(0)=0, |D_tJ(0)|=1 has
     `|J(t)|=sin(2t)/2=s_4(t)` exactly, and `sin(2t)` exceeds it at t=π/4 (1>½).
   - The guard `b<π/√κ` is needed: on the sphere of radius 5/2 (K=4/25≤1) the
     same Jacobi field is `(5/2)sin(2t/5)`, which vanishes at t=5π/2, where
     `s_1(5π/2)=1`; without the guard the bound `1·1≤0` would be asserted.

   **Ricci lower bounds and relative volume, after the radial and cut-locus constructions.**

   Let M be connected complete n-dimensional smooth Riemannian and `Ric≥(n−1)κg`. Define the model ball volume `modelBallVolume`, `V_κ(n,r)=∫₀ʳ s_κ(t)^(n−1)dt`, the volume of the r-ball in the n-dimensional space form of curvature κ divided by the constant ω_(n−1), for 0≤r, and r<π/√κ when κ>0. Prove Vol(B(p,r))/V_κ(n,r) is nonincreasing for positive radii before the positive-curvature model pole (the headline `bishopGromov`: on a connected complete M of dimension n with `Ric(v,v)≥(n−1)κ|v|²` for all v, `Vol(B(p,s))/V_κ(n,s)≤Vol(B(p,r))/V_κ(n,r)` for 0<r≤s, and s<π/√κ when κ>0, with `TauCeti.riemannianVolume` of the metric balls; the constant ω_(n−1) cancels in the ratio; Wei, *Manifolds with a lower Ricci curvature bound*, Theorem 4.1, p. 5). In particular for κ=0, where `V_0(n,r)=rⁿ/n`, the ratio Vol(B(p,r))/rⁿ is nonincreasing for all r>0 and at most ω_n after normalizing by rⁿ. The statement holds in every dimension: for n=1 the model is `V_κ(1,r)=r` and the Ricci hypothesis is empty, and for n=0 the manifold is a point. Supply annulus/restricted-polar versions, small-ball limit 1, measure-zero cut locus, arbitrary center, density/metric pullback and scaling comparisons. State positive-curvature maximal radii explicitly. Do not substitute a sectional Rauch hypothesis for Ricci lower bounds.

   Proof programme: on the star domain before first cut, let J(t,θ) be the positive normal exponential Jacobian, A its shape/Riccati endomorphism and h=tr A. From the Jacobi equation derive `h′+tr(A²)+Ric(γ′,γ′)=0`, hence `h′+h²/(n−1)+(n−1)κ≤0` by trace Cauchy–Schwarz. Use the actual small-t asymptotic `J/t^(n−1)→1` to prove `J/s_κ^(n−1)` nonincreasing. Set J=0 beyond the cut time; this adds only downward jumps. Prove measurability and the native density/polar change-of-variables on the cut-truncated domain. Integrate over the same angular unit sphere and then radially; the elementary ratio-of-integrals lemma yields the ball ratio. Prove the n=1 interval/circle cases separately; no vacuous Ricci plane condition gives Euclidean rigidity there.

   The API of `modelBallVolume`:
   - `V_κ(n,·)` is differentiable with `V_κ(n,r)′=s_κ(r)^(n−1)` and `V_κ(n,0)=0`.
   - For κ>0, `V_κ(n,r)>0` on `(0,π/√κ)`; for κ≤0, `V_κ(n,r)>0` on `(0,∞)`.
   - Scaling: `V_(κ/c²)(n,cr)=cⁿ·V_κ(n,r)` for c>0, from the scaling law of `s_κ`.
   - `V_κ(1,r)=r` for every κ, and `V_0(n,r)=rⁿ/n` for n≥1.

   **Checks.**
   - `V_1(2,r)=1−cos r`, `V_0(3,2)=8/3` and `V_(−1)(2,1)=cosh 1−1≈0.5431`; a
     model written with `s_κⁿ` instead of `s_κ^(n−1)` would give `V_0(3,2)=4`.
   - On the unit `S²` with κ=1, `Vol(B(p,r))=2π(1−cos r)`, so the ratio
     `Vol(B(p,r))/V_1(2,r)` equals 2π at r=0.5, 1, 2 and 3: constant, as the
     equality case of the comparison demands.
   - On the circle of length 7 (n=1, κ=0, `V_0(1,r)=r`) the ratio
     `min(2r,7)/r` reads 2, 2, 2, 2, 1.75 and 0.7 at r=0.5, 1, 2, 3.5, 4 and
     10: nonincreasing, with the drop beginning at the cut radius 3.5.
   - The guard s<π/√κ is needed: `V_1(2,3π/2)=1` while the full unit sphere
     has area/2π=2, so past the model pole the integral is no longer a ball
     volume and the ratio on `S²` itself would read 4π at r=3π/2 against 2π
     at r=1.
   - Günther on the unit `S²` with κ=1 and r<π: `ω₁=2·vol(B²)=2π` and
     `V_1(2,r)=1−cos r`, so the bound is `2π(1−cos r)`, the area of the cap:
     equality, as on every model.
   - Günther needs the injectivity hypothesis: on the flat torus `ℝ²/ℤ²` with
     κ=0 the bound `ω₁V_0(2,r)=πr²` is the area of `B(p,r)` for r≤½=inj, but at
     r=0.6 the vectors (0.55,0) and (−0.45,0) have the same image, and
     `π·0.36≈1.131` exceeds the total area 1 of the torus.
   - On the hyperbolic plane with κ=−1, `ω₁V_(−1)(2,r)=2π(cosh r−1)` is the
     area of `B(p,r)` for every r, and with the weaker κ=0 the bound πr² is
     still below it since `cosh r−1≥r²/2`; with κ=−2 the model value
     `π(cosh(√2r)−1)` exceeds `2π(cosh r−1)` for large r, as it must when
     `K≤κ` fails.

   Construct the following equality API, also consumed by PositiveMass §2.3. Equality of the flat volume ratio on all positive radii forces equality of the radial densities a.e.; smoothness on the star domain upgrades it there. The Riccati inequality has equality, so A=(1/t)Id and the radial metric is Euclidean before cut. Prove absence of a finite cut obstruction from the equality of density and the actual cut/conjugate/loop alternative, and construct the complete local-isometry covering from the exponential model. Show any nontrivial covering identification strictly reduces the full ball volume, so equality yields a global Euclidean isometry. For equality only up to a radius, retain the actual normal-domain/radius hypotheses and ball conclusion; do not infer global flatness. PositiveMass §2.3 supplies its separate asymptotically Euclidean large-ball lower limit and combines it with this comparison and the small-ball limit; neither positive-mass theory nor a zero-mass hypothesis is an input to the present comparison.

   *Needs:* R2 (Jacobi fields, `d exp` identity, Gauss lemma), R3 (index form,
   conjugate points), R4.6 (cut locus, cut-time truncation, volume nullity, polar
   domain), R1 (curvature identities along radial geodesics), HopfRinow
   (Completed) Layer 4 (completeness, compact closed balls), Tau Ceti
   `TauCeti.riemannianVolume`, Mathlib
   `MeasureTheory.integral_image_eq_integral_abs_det_fderiv_smul` (polar change of
   variables), GT Layer 7 (the volume density).

2. On a connected complete noncompact manifold, prove a ray exists from every
   point by compactness of initial unit directions and a limit of minimizing
   segments. For p∈M let M_p be its connected component, carrying the restricted smooth
   Riemannian structure and its finite intrinsic length metric. Assume that
   metric is complete. If N is a nonempty closed embedded submanifold of M
   and N∩M_p is nonempty, prove the intrinsic distance from p to N∩M_p is
   attained, and every minimizing segment to that intersection meets N
   orthogonally. Prove the usual statement when M is connected and complete
   as a specialization. Points of N in other components are not competitors
   for this finite intrinsic distance. In particular R disjoint-union R, with
   p in one component and N the other component, has no such minimizing
   segment; closedness/nonemptiness alone is insufficient. Construct the
   component's open smooth restriction and metric comparison explicitly,
   rather than assuming a globally finite Riemannian length distance between
   disconnected components.
   Include first variation with a moving endpoint, consuming R3's corner formula.
   *Needs:* HopfRinow (Completed) Layers 3–4 (minimizing segments, completeness),
   R3 (first variation with corners), GT Layer 1 (closed embedded submanifolds).
3. Prove a local Riemannian isometry from a nonempty complete manifold to a
   connected manifold is a surjective covering. Use finite-length path lifting
   and proper closed balls, and prove pullback metrics preserve length, curvature
   and completeness on Riemannian coverings. Prove the related covering criterion
   for a local diffeomorphism with `|df(v)|≥|v|` and complete domain.
   A surjective local isometry with an incomplete domain need not be a covering;
   compute the punctured-line→circle example.
   **Complete pullback metrics and the universal covering manifold.**

   Let p:E→M be a surjective topological covering of connected finite-dimensional Hausdorff second-countable boundaryless smooth real manifolds, with E carrying the smooth atlas pulled back from M, so p is a local diffeomorphism. For a smooth positive Riemannian g on M, define g_E(v,w)=g(dp(v),dp(w)). In each covering chart dp is invertible; hence this is smooth and positive. Prove the projection is a local Riemannian isometry, lengths/energy and Levi–Civita connection/Jacobi/curvature tensors are preserved in each sheet, and local curvature/Ricci inequalities pull back with their exact constants and dimension.

   If M is complete, prove E is complete without assuming it. A base geodesic extends for every real time by Hopf–Rinow. Lift its restrictions on compact intervals from a given sheet point; covering uniqueness makes these lifts compatible on overlaps, and the native smooth-lift/local-isometry comparison makes the glued lift a geodesic with the chosen initial velocity. Thus E is geodesically complete. On each connected component the converse Hopf–Rinow gives completeness for the induced finite length metric. For connected E this is the required metric, with unchanged manifold topology. A disconnected cover is treated componentwise; no finite cross-component distance is installed.

   For the based-path universal cover, consume the actual installed TauCeti UniversalCover carrier/projection, local path-connected and semilocally simply-connected covering theorem, simple connectivity and path connectivity. The native covering theorem permits empty fibres outside the based component; connected manifolds are path connected, giving surjectivity here. Small coordinate balls provide the local hypotheses. Construct its smooth atlas by the actual native chartedSpaceComap/IsLocalDiffeomorph result, never an alternative total-space topology.

   The fibre over the basepoint is in bijection with endpoint-fixed based loop homotopy classes by the explicit UniversalCover endpoint/class structure; prove the maps and casts are inverse. Only a cardinal bijection is needed here; no group isomorphism with a convention attached is asserted. SmoothBundlesConnections B5.2 supplies the countability of `π₁(M,m₀)` for a connected second-countable manifold. Over a countable evenly covered basis there are countably many sheets (each fibre is in bijection with the basepoint fibre by path lifting); their chart bases give second countability of the universal cover. Prove Hausdorffness using either distinct base neighbourhoods or disjoint sheets over the same point. This establishes the standing manifold hypotheses before Riemannian results are applied upstairs.

   Export the conditional conclusion: if the connected universal-cover manifold constructed above is compact, its fibre is closed by continuity and the T1 property of the base, and discrete by the covering theorem; compactness of that closed fibre then implies finiteness, and the fibre/loop-class bijection proves `π₁` finite. Bonnet–Myers (R4.5) supplies the compactness hypothesis only after applying its sine-index diameter bound upstairs. The cover construction neither invokes Bonnet–Myers to construct or complete the cover nor assumes `π₁` finite, and it uses no cover classification, Eilenberg–MacLane space or higher homotopy. Pullback metrics along cover morphisms and base isometries have the expected functoriality.

   **Checks.**
   - Pullback metric under `ℝ→S¹`, `t↦e^(it)`, of the round metric `dθ²` on the
     unit circle: `dp(∂_t)=∂_θ`, so `g_E=dt²`, which is complete, as the
     completeness transfer requires; the lift from 0 of the unit-speed loop
     `θ↦e^(iθ)`, 0≤θ≤2π, is `t↦t` and has the same length 2π.
   - Double cover `S¹→S¹`, `z↦z²`, of the unit circle: `dp(∂_θ)=2∂_θ`, so
     `g_E=4dθ²` and the covering circle has length 4π, twice the base length,
     as a two-sheeted Riemannian covering must. A definition that copied the
     base coefficient into the cover's angle coordinate without `dp` would give
     `g_E=dθ²`, length 2π, and the projection would double speeds instead of
     preserving them.
   - The punctured line `ℝ∖{0}→S¹`, `t↦e^(it)`, is a surjective local isometry
     from an incomplete domain and is not a covering: no neighbourhood of
     `1=e^(i·0)` is evenly covered, since the sheet through `t=0` is missing.
     Completeness of the domain is the hypothesis that excludes it.

   *Needs:* HopfRinow (Completed) Layer 4 (Hopf–Rinow in both directions, path
   lifting of geodesics), UniversalCovers (Completed) (the based-path universal
   cover, its covering theorem and smooth atlas), SBC B5.2 (countability of
   `π₁(M,m₀)`), Mathlib `IsCoveringMap` and `IsLocalDiffeomorph`, R1 (pullback of
   curvature and Ricci bounds), R2 (lifted Jacobi fields).

4. Cartan–Hadamard (`cartanHadamard_isCoveringMap`): on connected M, K≤0 and completeness imply `exp_p` is a covering map from `T_pM` (Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 6.2.6, p. 238).
   Establish its nonsingular/expanding differential by R2/comparison and apply
   the preceding covering criterion. The simply connected specialization gives
   a global smooth exponential diffeomorphism, a unique geodesic between any
   two points at fixed affine parametrization (which is minimizing), and
   contractibility; a general connected manifold has Euclidean universal-cover
   topology and is aspherical. State nonemptiness and the basepoint explicitly.
   *Needs:* R2 (Jacobi fields), R3 (no conjugate points under K≤0), R4.3
   (covering criterion), HopfRinow (Completed) Layer 4 (completeness).
5. Bonnet–Myers (`bonnetMyers_distance`): for connected complete n≥2 and
   `Ric(v,v)≥λ|v|²` with λ>0, prove diameter≤π√((n−1)/λ), compactness and finite
   fundamental group (Nicolaescu, *Lectures on the Geometry of Manifolds*,
   Theorem 5.2.26, p. 220; Wei, *Manifolds with a lower Ricci curvature bound*,
   Theorem 6.1, p. 8). Sum the sine-test-field index forms along a minimizing
   geodesic, then apply the same bound to the Riemannian universal cover.
   *Needs:* R3 (index form, sine test fields along a minimizing segment), R4.3
   (complete universal cover with its pullback metric and finite fibre
   conclusion), HopfRinow (Completed) Layer 4 (minimizing segments between any
   two points of a complete manifold).
6. Define `inj(p)=sup{r≥0 | exp_p restricts to a diffeomorphism from
   the tangent open r-ball onto the metric r-ball}`, valued in [0,∞], and
   `inj(M)=inf_p inj(p)`. Construct the cut locus on the shared exponential and
   minimizing-geodesic carriers. On connected complete M prove that
   `dist(p,q)<inj(p)` gives a unique minimizing geodesic from p to q at fixed
   affine parametrization, including the constant geodesic when p=q; hence
   the same conclusion holds when `dist(p,q)<inj(M)`. On connected complete M prove cut-time
   continuity on the unit tangent sphere bundle, valued in (0,∞], and
   cut-time characterization by first
   conjugacy or loss of uniqueness, closedness/measurability and volume-nullity
   using Sard for conjugate values. Cover the remaining locus by countably
   many pairs of nonsingular inverse-exponential branches; their equal-distance
   locus is a regular hypersurface because distinct minimizing geodesics have
   distinct terminal velocities. Prove chart nullity and its canonical-volume
   comparison, including the infinite-cut-time convention. Prove the cut
   relation is closed and symmetric and that squared distance is smooth
   off this relation, including its smooth extension across the diagonal.
   Supply the smooth polar-coordinate domain and full-measure integration
   comparison needed by R4.1. Consume SBC
   B6.0's positive uniform normal radius on compact manifolds to prove
   `inj(M)>0`. Minimize length in each free homotopy class
   on a closed compact manifold using arclength parametrization, Arzelà–Ascoli, lower semicontinuity and
   uniform normal-neighborhood homotopies;
   a nontrivial class gives a nonconstant closed geodesic. Prove Synge's
   theorem (`synge`): a compact connected orientable Riemannian manifold of
   even dimension with positive sectional curvature on every tangent two-plane
   is simply connected (Lee, *Introduction to Riemannian Manifolds*, 2nd ed.,
   Chapter 12, Synge's theorem), using holonomy, an odd-dimensional
   special-orthogonal fixed vector and the closed index variation; orientability
   is the pinned `TauCeti.Orientable`, the existence of an oriented smooth atlas,
   and in dimension 0 the manifold is a point. Include the odd-dimensional
   consequence (`synge_orientable_of_odd`): a compact connected Riemannian
   manifold of odd dimension with positive sectional curvature is orientable.
   The real-projective examples distinguish the hypotheses.

   **Checks.**
   - `inj(p)=π` at every point of the unit sphere, `inj=π/2` on `RP^n` with
     the quotient metric, `inj=½` on the flat torus `ℝ²/ℤ²`, `inj=πr` on the
     cylinder `S¹(r)×ℝ` and `inj=∞` on `ℝⁿ`; a definition asking only that
     `exp_p` be a local diffeomorphism on the r-ball (the conjugate radius)
     would return π on `RP^n` and ∞ on the flat torus.
   - Cut times and cut loci: on the unit sphere the cut time is π in every
     direction and equals the first conjugate time, with `Cut(p)={−p}`; on the
     flat torus `ℝ²/ℤ²` the cut time of the direction `(1,0)` is ½ by loss of
     uniqueness, there are no conjugate points at all, and `Cut(p)` is the
     image of the two segments `{x₁=½}∪{x₂=½}`; on `RP²` the cut time is π/2
     in every direction while the first conjugate time is π, and `Cut(p)` is
     the line at distance π/2. A cut time defined by first conjugacy alone
     gives ∞ on the torus and π on `RP²`.
   - Synge controls: `RP²` (even, K=1, π₁=ℤ/2) is not orientable, so the
     even-dimensional theorem does not apply; `RP³` (odd, K=1, π₁=ℤ/2) is
     orientable, as the odd-dimensional theorem requires, and shows that the
     even-dimensional conclusion fails in odd dimension; the flat torus
     `T²` (even, orientable, K=0, π₁=ℤ²) shows that positive curvature cannot
     be weakened to nonnegative; the product metric on `RP²×S¹` (odd,
     non-orientable, K≥0) shows the same for the odd-dimensional statement.
   *Needs:* R2 (`d exp` and conjugate points), R3 (index form, closed-geodesic
   second variation, no conjugate points before the cut time), SBC B2–B5
   (holonomy, parallel transport), SBC B6.0 (uniform normal radius), DG Layer 10
   (Sard), DifferentialGeometry Layer 2 (orientations; comparison with the
   pinned oriented atlas), Tau Ceti `TauCeti.Orientable`, Mathlib
   `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`
   (nullity of conjugate values), HopfRinow (Completed) Layers 2–4, R3.1
   (arclength parametrization and Arzelà–Ascoli for free homotopy classes), R4.7
   (the real-projective examples).
7. Consume the existing `TauCeti` round-sphere RiemannianBundle and
   `Riemannian/Hyperbolic.lean`, `Hyperbolic/UpperHalfSpace.lean` objects and
   GT Layer 7’s `HyperbolicMetric`; compare with GT Layer 8's native
   `ModelGeometry.Space` in dimension 3. Develop the missing model formulas in all n≥2:
   Euclidean, round sphere and hyperbolic space (hyperboloid, half-space and ball), including
   explicit isometries, geodesics, exponential maps, curvature and metric scaling.
   The round sphere's connection, curvature +1, great-circle geodesics and
   scaling law are R1's round sphere model, consumed here; the global
   space-form classification below uses the remaining R4 machinery.
   Use type synonyms carrying the induced Riemannian distance via
   `TauCeti.MetricSpace.ofRiemannianMetric` for connected models, with the
   compatible `EMetricSpace.ofRiemannianMetric`/edist version for disconnected
   carriers, and prove `IsRiemannianManifold`; the sphere’s
   subtype chordal metric needs this comparison. Native `UpperHalfSpace`
   already has its Riemannian distance; consume it. Pin the hyperbolic metrics
   `(|dx|²+dy²)/y²` on y>0 and `4|dx|²/(1−|x|²)²` on |x|<1, both K=−1.
   Consume native `RiemannianIsometry.affineIsometryMulEquiv` for Euclidean
   affine isometries and prove the semidirect-product identification
   E(n)=ℝⁿ⋊O(n). Consume `LinearIsometryEquiv.unitSphereIsomHom` and its
   injectivity, and `UpperHalfSpace.isPretransitive_isom`; complete the
   missing surjectivity/isometry-group descriptions. Identify the hyperbolic group
   O⁺(n,1), with its action on the future unit hyperboloid.
   On the hyperboloid restrict the fixed ambient Lorentz form to its tangent
   hyperplanes and prove positivity; construct the Riemannian metric and compute
   its connection directly rather than applying a Riemannian ambient immersion
   theorem to an indefinite ambient form. Build continuation and monodromy of
   local constant-curvature isometry germs from their value/tangent data, using
   completeness to continue along finite paths and simple connectivity to
   remove path dependence.

   **Checks.**
   - Half-plane model `(|dx|²+dy²)/y²`: the vertical line `t↦(0,e^t)` has
     speed `e^t/e^t=1`, and the distance from (0,1) to (0,y) is `|log y|`, so
     (0,e) is at distance 1; the metric `(|dx|²+dy²)/y` would give
     `∫₁ʸ t^(−1/2)dt=2(√y−1)` instead.
   - Ball model `4|dx|²/(1−|x|²)²` in dimension 2: with `λ=2/(1−r²)`,
     `K=−Δ(log λ)/λ²=−(4/(1−r²)²)/(4/(1−r²)²)=−1`, and the radius-r point is at
     distance `∫₀ʳ 2/(1−s²)ds=log((1+r)/(1−r))` from 0, which is 1 at
     `r=tanh(½)`; without the factor 4 the same computation gives K=−4 and
     distance ½ there.
   - Hyperboloid `{⟨x,x⟩=−1, x₀>0}` for `⟨x,y⟩=−x₀y₀+Σx_iy_i`: at e₀ the
     tangent vectors are `(0,v)` with `⟨(0,v),(0,v)⟩=|v|²>0`; the curve
     `cosh t·e₀+sinh t·e₁` stays on it, has `⟨γ′,γ′⟩=cosh²t−sinh²t=1` and
     ambient acceleration γ, Lorentz-normal to the tangent space, so it is a
     unit-speed geodesic; `cos t·e₀+sin t·e₁` has `⟨γ,γ⟩=sin²t−cos²t≠−1` and
     leaves the hyperboloid. Treating the timelike unit normal as spacelike
     in the Gauss formula would give curvature +1 instead of −1.
   Prove the Killing–Hopf universal-cover classification: a connected complete
   simply connected Riemannian n-manifold of constant sectional curvature 0, 1
   or −1 admits a `TauCeti.RiemannianIsometry` onto Euclidean ℝⁿ
   (`killingHopf_euclidean`, every n≥0), onto the unit sphere Sⁿ⊂ℝⁿ⁺¹ with its
   round metric (`killingHopf_sphere`, n≥2) or onto the upper half-space model
   `TauCeti.UpperHalfSpace` of ℍⁿ (`killingHopf_hyperbolic`, n≥1); curvature
   κ≠0 reduces to these by scaling the metric by |κ|. The dimension guards are
   sharp: for n=1 the line satisfies the curvature hypothesis vacuously and is
   isometric to ℝ and to ℍ¹, not to S¹; for n=0 the point is ℝ⁰, while the
   hyperbolic case needs n≥1 because ℍⁿ is the upper half-space of ℝⁿ⁻¹×ℝ.
   Then prove the quotient
   description by free properly discontinuous discrete smooth isometries.
   Construct the quotient atlas, descended metric and covering for a free properly
   discontinuous discrete group of smooth isometries on any Riemannian manifold;
   this construction does not require constant curvature. Prove completeness and
   curvature descend when the source has those properties. Specialize this generic
   construction to the preceding space-form classification and to free finite-group
   actions on closed manifolds used by PDO P7a.
   Local isometries of a connected source are determined by value and tangent
   map at one point. Identify round-sphere isometries with O(n+1), and classify
   even-dimensional spherical space forms as the sphere and real projective
   space. For real projective space consume AlgebraicTopology Stage 4.6's
   native projectivization, coordinate-atlas and CW comparison; identify the
   generic isometric quotient with that carrier and descend the round metric.
   **The round real-projective quotient, with low-dimensional and orientation branches.**

   For every n≥0 use the unit sphere of `EuclideanSpace ℝ (Fin (n+1))` with its antipodal action of the units `{±1}` and Tau Ceti's orbit quotient `TauCeti.RealProjectiveSpace n`. Its projection is continuous, surjective and a quotient covering map, and two unit vectors have the same image exactly when x=y or x=−y; compactness, path-connectedness and the one-point zero-dimensional case are existing declarations. Construct the comparison with AT4.6's projectivization `Projectivization ℝ (Fin (n+1) → ℝ)`, after the `WithLp` linear homeomorphism, by sending a unit vector to its span. Surjectivity chooses a nonzero vector on the line and normalizes it; if two unit vectors span the same line the real scalar has absolute value 1, hence is ±1. The induced bijection of quotients is continuous, and a continuous bijection from a compact space to a Hausdorff space is a homeomorphism. Pin the representative, inverse, topology and basepoint equations. This comparison is constructed here; the generic quotient theorem does not supply it.

   In the projective chart where coordinate i is nonzero, choose the unit representative with positive i-th coordinate. The affine ratio vector gives the explicit smooth section, with normalizing denominator `√(1+Σ ratios²)>0`. Compare it by these coordinate maps with the lifted smooth atlas of the antipodal cover and with AT's projective atlas; the identity is a diffeomorphism, and no second projective manifold or topology is introduced. The antipodal map is a smooth isometry of the round sphere and acts freely, also on `S⁰`. The generic Riemannian quotient metric then descends the round metric, and on each local sheet the sectional curvature is 1 for n≥2. In dimensions 0 and 1 there is no two-plane, so the sectional statement is vacuous and no positive Ricci bound is inferred. Compactness comes from the sphere quotient, before any classification of complete space forms.

   For n≥1 orient the connected sphere by the outward-normal-first convention. The antipodal map of `ℝⁿ⁺¹` has determinant `(−1)^(n+1)`, and its degree on the sphere has the same sign. Prove this comparison of normal and tangent orientations; the determinant of `−Id` on an abstract n-plane, `(−1)ⁿ`, has the wrong exponent. A quotient orientation pulls back to an invariant sphere orientation, and an invariant orientation descends in the covering charts. Two orientations of the connected `Sⁿ` differ by one global sign, so an orientation-reversing deck transformation obstructs every descent. Thus `RPⁿ` is orientable exactly for odd n when n≥1, and `RP⁰`, a point, is orientable. This is a direct quotient and parity comparison, with no Stiefel–Whitney or Killing–Hopf input.

   For n≥2 consume Tau Ceti's `RealProjectiveSpace.fundamentalGroupMulEquivAt n hn x` onto the units of ℤ, with `hn : 2 ≤ n`, and transport it by the preceding homeomorphism; the familiar statement `π₁(RPⁿ)=ℤ/2` needs this bound. `RP¹` is a circle with fundamental group `Multiplicative ℤ`, through the line comparison or through the double-angle quotient of the circle and the winding theorem, and `RP⁰` is a point with trivial `π₁`. Compare the chosen lifts, monodromy and deck labels; the opposite labelling would be harmless only because the two-element deck group is commutative. In the one-dimensional case the cardinality `Nat.card π₁(RP¹)=0` records an infinite group, not an empty one. All three dimension ranges are treated.

   Complete connected manifolds of dimension 1 are a line or a circle with
   its circumference parameter; dimension 0 is a point, independently of κ.

   **Checks.**
   - `RP²` with the quotient metric: the image of a great circle is a closed
     geodesic of length π (half of 2π), every point is at distance at most
     π/2 from a given one, and the area is `4π/2=2π`; a quotient that did not
     identify antipodes would return the sphere's values 2π, π and 4π.
   - `RP¹`: the double-angle map `[cos θ,sin θ]↦θ mod π` identifies it with a
     circle of length π, and its fundamental group is infinite cyclic, so
     `Nat.card π₁=0`; `RP⁰` is one point with trivial `π₁`.
   - Orientability by parity: on `S²⊂ℝ³` the antipodal map has determinant
     `(−1)³=−1` and reverses the outward-first orientation, so `RP²` is not
     orientable, while on `S³⊂ℝ⁴` it has determinant `(−1)⁴=1` and `RP³` is
     orientable; the abstract-plane exponent `(−1)ⁿ` would reverse both answers.

   *Needs:* R1 round sphere model (connection, curvature +1, great circles,
   scaling),
   HopfRinow (Completed) Layers 0–4, R4.3 (coverings, pullback metrics, local
   isometries determined by one jet), R4.4 (Cartan–Hadamard for the κ≤0 cases),
   R4.6 (injectivity radius of the sphere), Tau Ceti `TauCeti.sphereRoundMetric`,
   `TauCeti.UpperHalfSpace` with `UpperHalfSpace.isPretransitive_isom`,
   `TauCeti.HyperbolicMetric`, `TauCeti.MetricSpace.ofRiemannianMetric`,
   `TauCeti.RiemannianIsometry`, `RiemannianIsometry.affineIsometryMulEquiv`,
   `LinearIsometryEquiv.unitSphereIsomHom`, `TauCeti.RealProjectiveSpace` and
   `RealProjectiveSpace.fundamentalGroupMulEquivAt`, AlgebraicTopology Stage 4.6
   (projectivization atlas), GT Layers 7–8 (hyperbolic metric, model geometries),
   Mathlib `SimplyConnectedSpace`.
8. For every pair of distinct points on a connected closed positive-dimensional
   Riemannian manifold, prove at least two geodesics with different unparametrized
   images or traversals; affinely changing the parameter is not a new geodesic.
   Specify the equivalence as oriented paths up to increasing affine
   reparametrization, allowing distinct traversals of the same closed curve.
   The headline `exists_two_geodesics_of_ne` states it on a compact connected
   manifold for p≠q: two geodesics on `[0,1]` from p to q that differ at some
   time; with both endpoints fixed on `[0,1]` the only increasing affine
   reparametrization is the identity, so they are different in the sense
   above. Positive dimension is automatic, since a connected manifold of
   dimension 0 with two points does not exist.
   Build the finite-dimensional Lusternik–Schnirelmann/minimax critical-point
   existence lemma using R3’s no-critical-value deformation, including
   degenerate critical points. Apply it on R3’s finite energy-cutoff approximations and compact-family
   capture/path-sublevel comparison. Supply the topology bridge explicitly:
   a closed positive-dimensional manifold is noncontractible by fundamental
   class/duality (mod 2 without orientation). If all homotopy groups vanished,
   DGFloer Layer 1 item 2's homology invariance under weak equivalence would
   give the mod-2 homology of a point, contradicting that class. The based-loop isomorphism
   `π_k(ΩM)≃π_(k+1)(M)` transfers it to the fixed-endpoint path space. Consume
   R3's ordinary path carrier and DGFloer's standing Moore comparison, AT’s CW, homology
   and duality objects, R3's endpoint-change equivalence and its actual CW/path
   homotopy comparison, proving these specific bridges here.
   Nontrivial fundamental group already gives distinct lifted path classes.
   Prove the minimax dichotomy: either the class has critical value strictly
   above the minimum, or the minimum critical set contains more than one
   geodesic. If its only minimum were one geodesic, a sufficiently small
   sublevel would lie in a contractible coordinate neighbourhood, killing
   the nonzero class transported by the no-critical-band deformation.
   A singular exponential differential alone does not integrate a Jacobi field
   into a fixed-endpoint geodesic family.
   **Checks.**
   - Unit `S²` with p,q at angle θ∈(0,π): the two arcs of the great circle
     through them, of lengths θ and 2π−θ, are two geodesics on `[0,1]` with
     speeds θ and 2π−θ, and they differ at t=½; adding full turns gives
     infinitely many more.
   - Flat torus `ℝ²/ℤ²`, p=0, q=(½,0): the images of `t↦(t/2,0)` and
     `t↦(−t/2,0)` are two minimizing geodesics of length ½, different at
     t=½, where they reach (¼,0) and (¾,0).
   - Compactness is needed: in `ℝⁿ` the segment is the only geodesic between
     two points, since the exponential map at p is a diffeomorphism.

   *Needs:* R3 (no-critical-value deformation, finite energy-cutoff
   approximations, ordinary path carrier and endpoint change), R3.2
   (compact-family capture), MorseTheory M1–M2 (minimax and deformation step),
   DGFloer Layer 1 item 2 (homology invariance under weak equivalence) and its
   Moore comparison, AlgebraicTopology Stages 6 and 8 (CW, homology, duality,
   mod-2 fundamental class), Tau Ceti `pathLoopSpaceMulEquiv`.

#### R4.9. Three simple closed geodesic images on a smooth two-sphere

For every smooth positive-definite Riemannian metric g on the standard smooth S², construct three distinct nonconstant embedded closed geodesic images. Identify all changes of parametrization and reversal, so neither a multiple traversal nor an orientation change gives another image. Allow degenerate closed geodesics and nonisolated geodesic families. Transport the theorem along an actual smooth diffeomorphism to an abstract smooth two-sphere: the headline `three_simple_closed_geodesics` takes any smooth manifold diffeomorphic to the standard two-sphere with any smooth Riemannian metric and produces three periodic geodesics, each injective on one period, with pairwise distinct images. Construct the following curve-space, finite-family and relative-homology APIs before the multiplicity theorem.

*Needs:* R4.6 (injectivity radius, short geodesics), R3 (geodesic ODE, second variation), ConformalMapping (Completed) L3/L5, GeometricMeasureTheory G1/G3–G6, Isoperimetry I3/I6, CharacteristicClasses C1.5/C2/C3, AlgebraicTopology Stage 6, DifferentialGeometry 5.6, Mathlib `Besicovitch.exist_disjoint_covering_families`.

Notation in this section is scoped. V is the curve-image/point space and A its point locus; V_space denotes the spacing balls. The width c, contact component c_contact, selected-side area A_side, annulus area A_ann, graph coefficient A_par and graph error E_diff have separate meanings. Use B_len for a length ceiling, a_cover for the component-cover class, a_cut for the positive clock cutoff, a_diff for diffusion, L_min for a positive length floor, K_gauss for Gaussian curvature, K_c for the critical image set and K_image for a compact parameter image. Q_disk is the Thom disk bundle, Q_graph the graph curvature expression and Q_low the low-length sublevel. The round ambient chord is D_ch; the arbitrary-metric sine comparison is psi_CA, its ratio is beta_CA and the family-clock cutoff is chi_clock. The endpoint labels are A_endpt,B_endpt; the normal-graph metric bounds G_min,v_max are positive numerical box constants, while g₀ is the round metric. Defect scale η_def, V-neighborhood radius η_V, spacing radius C_space, local epsilon allowances and their declared time windows are fixed in the clause using them.

##### R4.9.0. Rectifiable simple-curve space and length topology

Let V consist of rectifiable Jordan curve images and point-curves A={p:p∈S²}. Use the generic GMT length and arclength carriers. For Jordan parametrizations define the unoriented Fréchet distance d_F by the infimum of sup_t d_g(γ(t),η(h(t))) over circle homeomorphisms of either orientation, and extend it to constants by the corresponding constant maps. Put d_V(C,D)=d_F(C,D)+|L_g(C)−L_g(D)|. Prove independence of parametrization, triangle inequality and definiteness, including comparisons with compact-image Hausdorff distance. Identify A as a closed copy of S², prove length continuous, and construct the quotient-valued continuous constant-speed arclength representative on each positive-length band, with local representatives taken modulo rotations and reversal. Prove this from Fréchet matching, subarc lower semicontinuity and convergence of total lengths; image Hausdorff convergence alone is insufficient. At constants prove uniform diameter collapse. Use this definite metric for all later families and deformations; no completeness, manifold or CW-type assumption on V is required. For any Fréchet match by a circle homeomorphism h, approximate h uniformly by piecewise-linear circle homeomorphisms h_n of the same orientation; if η is Lipschitz, then η∘h_n is Lipschitz and its image differs from η∘h by at most Lip(η)·||h_n−h||∞. Use this approximation whenever a winding or index supplier is stated only for absolutely continuous/Lipschitz reparametrizations, with the positive distance from the tested point to the image preserved by choosing n large. Also prove the Riemannian metric-derivative identity: for every Lipschitz γ:I→(S²,d_g), md(γ,t)=|γ′(t)|_g for almost every t. In a smooth normal chart, compare d_g on a sufficiently small neighborhood with the frozen norm g_(γ(t)); the distortion tends to 1 as the neighborhood shrinks, and the metric derivative agrees with the norm of the chart derivative at Lebesgue points. Thus GMT’s metric variation equals ∫|γ′|_g for the Lipschitz parametrizations used below; the piecewise-smooth Hopf–Rinow length formula alone is not enough.

**Checks.**
- The reversed parametrization of a Jordan curve has `d_V=0` from the
  original, so `d_V` is a metric on unoriented images; the equator and the
  latitude circle at polar angle π/3 are at Fréchet distance π/6 (the
  longitude matching attains the Hausdorff distance) with lengths 2π and
  2π·sin(π/3), so `d_V=π/6+2π(1−√3/2)≈1.365`.
- A circle of spherical radius ρ about p has `d_V(p,C_ρ)=ρ+2π sin ρ→0`, so the
  constant p is a limit of Jordan images; a curve of length 100 inside the
  ρ-tube of a great circle is at Hausdorff distance ≤ρ from it but at
  `d_V≥100−2π`, which is why Hausdorff distance alone is not the topology.
- The metric derivative of the latitude circle at polar angle θ,
  parametrized by longitude, is `sin θ` almost everywhere, equal to `|γ′|_g`;
  the chart derivative in a stereographic chart differs by the conformal
  factor, so agreement holds only after the frozen-norm comparison.

*Needs:* GeometricMeasureTheory G1 (rectifiable curves, arclength, metric
derivative), HopfRinow (Completed) Layer 0 (the Riemannian distance and
piecewise smooth length), R4.6 (normal charts and the local distance
comparison), Mathlib `Metric.hausdorffDist` and uniform approximation of
circle homeomorphisms by piecewise-linear ones.

##### R4.9.1. The two-sheet component cover and point avoidance

For a nonconstant C decorate it by either complementary component of S²\C. Over a point p retain two formal tags (p,empty) and (p,full), with the point remembered. Construct an actual two-sheeted cover E→V with locally constant sheet permutations and cocycle laws. Near a Jordan curve choose test points on its opposite sides, use a smooth stereographic chart from one of them and a compact chart neighborhood, and apply the supplied planar Jordan/index/proximity theorems to parametrized Fréchet matches. Prove that nearby curves still separate the test points and that overlap labels agree or exchange continuously.

Near a constant use a small coordinate ball and a distant test point. Show that a sufficiently short curve in that ball has its small component in the coordinate convex hull; its other component contains the distant point. Extend these labels to the empty/full tags, with compatible transitions to nonconstant charts. Prove continuity of the empty section on A. Using trace area zero, winding stability of component indicators and dominated convergence, prove the component-area comparison and a uniform ε>0 for which each curve of length<ε has a unique component of area<Area_g(S²)/2. This gives a section of E over V^(<ε) extending the empty section on A, without requiring a contraction of the whole short-curve space.

For each p set V_p={C:p∉image(C)}, including constants q≠p. Prove it open and construct a continuous section on V_p by choosing the component not containing p, and empty at constants. Prove this in the cover charts, including the actual locally constant agree/exchange transition to the short-curve section on overlaps.

**Checks.**
- Over a great circle the two sheets are its two hemispheres; along the loop
  of great circles with poles `(cos s, sin s, 0)`, 0≤s≤π, the selected side
  `{x·pole>0}` moves from `{x₁>0}` to `{x₁<0}` while the image returns to
  itself, so the sheets are exchanged: E is a nontrivial cover. Moving a
  latitude circle up and back exchanges nothing.
- Near a constant: the circle of spherical radius ρ about p has sides of area
  `2π(1−cos ρ)≈πρ²` and `4π−2π(1−cos ρ)`, so for length `2π sin ρ<ε` the small
  side is the unique component of area below 2π, and it continues the empty
  tag at p; a cover identifying the two tags at a point would make the
  avoidance section over `V_p` ill defined at constants q≠p near p.
- For p the north pole and C the equator, the section over `V_p` selects the
  southern hemisphere; for p inside the southern hemisphere it selects the
  northern one, and on the overlap of the two `V_p` charts the labels differ
  by the deck exchange, as the transition law states.

*Needs:* R4.9.0 (the curve space and its topology), ConformalMapping
(Completed) L3/L5 (planar Jordan separation and index), GeometricMeasureTheory
G6 (Jordan index, proximity and reparametrization of rectifiable curves),
DifferentialGeometry 5.6 (trace area zero for planar rectifiable curves),
Isoperimetry I6 (the planar Jordan theorem), Mathlib dominated convergence
and the stereographic chart of `Metric.sphere`.

##### R4.9.2. Relative cover class and finite Thom detection

Construct the absolute singular mod 2 class a_cover∈H¹(V;F₂) of this cover and the relative lift α∈H¹(V,A;F₂) fixed by the empty section. Construct these directly on singular cochains: choose lifts at vertices agreeing with empty on A, assign the endpoint discrepancy of lifted paths, and use lifting over singular triangles to prove the cocycle law. Prove independence by a relative coboundary, naturality and image(α)=a_cover. Compare with the associated real line on finite models, rather than apply a CW-type classification theorem to arbitrary V.

Let Q_disk=D(γ¹) over RP² be the finite tautological disk bundle `(v,t)~(−v,−t)`, v∈S², −1≤t≤1, with boundary S(γ¹)≃S². Define q:Q_disk→V by the round plane circle `{x:v·x=t}`, sending |t|=1 to the point t v. Prove Fréchet-plus-g-length continuity with local frames, including uniform length collapse at the boundary for arbitrary g. The selected side `{x:v·x>t}` gives empty at t=+1 and full at t=−1; its exchange identifies the pulled-back cover with the orientation cover of π*γ¹. The boundary empty frame is t v. Prove q*a_cover=π*w₁(γ¹) and q*α=τ, the mod 2 Thom class, by its fiber-interval value 1 with those endpoint frames.

Use the ordinary finite RP²/cup/Thom theorem to prove image(τ)=π*w₁, τ²=π*w₁∪τ and τ³=π*w₁²∪τ, with the powers interpreted by the absolute-image cup action on the relative group. Prove ⟨π*w₁²∪τ,[Q_disk,∂Q_disk]⟩=1. Define z₃=q_*[Q_disk,∂Q_disk], z₂=a_cover∩z₃, z₁=a_cover²∩z₃ in H_i(V,A;F₂). Use the absolute cup/relative cap module action and prove ⟨α,z₁⟩=1. Thus all three classes are nonzero and subordinate. The finite model supplies the calculation; no homotopy equivalence V≃RP³ or parametric Schoenflies theorem is a premise.

**Checks.**
- `a_cover` evaluates to 1 on the loop of great circles with poles
  `(cos s, sin s, 0)`, 0≤s≤π (the sides are exchanged) and to 0 on a loop that
  moves a latitude circle up and back; the relative class α evaluates to 1 on
  the fibre interval of `Q_disk` over a pole v, the family of parallel circles
  from the point v (empty) to the point −v (full).
- In the finite model `⟨π*w₁²∪τ,[Q_disk,∂Q_disk]⟩=1` because `w₁(γ¹)²`
  generates `H²(RP²;F₂)` and τ restricts to the generator on each fibre
  interval; a class pulled back from the base alone, `π*w₁²` without τ,
  pairs to 0 with the relative fundamental class.
- The absolute classes are nested: `z₂=a_cover∩z₃` is represented by the
  great circles with poles on a projective line, `z₁=a_cover²∩z₃` by a single
  fibre interval, and `⟨α,z₁⟩=1`; replacing the relative cap by the absolute
  one would lose the endpoint contributions and give 0.

*Needs:* R4.9.1 (the cover E, the empty section and the `V_p` sections),
AlgebraicTopology Stage 6 (singular cochains, cup and cap products, relative
cohomology), CharacteristicClasses C1.5/C2/C3 (finite `RP²`, the
tautological disk bundle, Stiefel–Whitney and Thom classes), R4.9.0
(continuity of the model map q).

##### R4.9.3. Positive widths and finite parameter carriers

Define c_i as the infimum over finite relative singular-cycle representatives of z_i of the maximum length on their compact support. The explicit finite model gives c₃<∞. Construct support-preserving subdivision and cap representatives to prove c₁≤c₂≤c₃. The short-curve section trivializes α relatively to A on V^(<ε); its nonzero pairing with z₁ gives c₁≥ε>0.

Construct a finite cycle-to-polyhedron-pair adapter for the chosen three minimax cycles, of dimension≤3: realize the finite singular-cycle face identifications as a finite polyhedral pair, triangulate it compatibly with the relative faces mapping into A, and construct its evaluation map to V. From this chosen carrier derive the matching singular-simplex maps, relative chain representatives and subdivision/chain homotopies on the existing AT singular carrier. Prove that these maps represent the original relative class and preserve the dimension bound; use this same finite polyhedral carrier for the parameter embedding and shortening. Only these finite parameter carriers need a polyhedral model; do not assume V has finite CW type or identify arbitrary singular cycles with an unspecified cube-family notation.

**Checks.**
- On the round unit sphere all three widths equal 2π: every closed curve of
  length below 2π lies in an open hemisphere, so has a distinguished side
  and α restricts to zero on `V^(<2π)`, giving `c₁≥2π`, while the finite
  model consists of circles of length `2π√(1−t²)≤2π`, giving `c₃≤2π`.
- `c₁≤c₂≤c₃` from the subdivision and cap representatives, and
  `c₁≥ε>0` from the short-curve section; a width taken over all relative
  chains with the right boundary, rather than over representatives of the
  class `z_i`, would be 0, since a chain supported in A has maximal length 0.
- The finite polyhedral carrier of the fibre-interval representative of `z₁`
  is an interval with both endpoints mapped into A, of dimension 1≤3.

*Needs:* R4.9.2 (the classes α, `a_cover`, `z_i`), AlgebraicTopology Stage 6
(subdivision chain homotopies, relative chains), GeometricTopology's
smoothing-and-triangulation comparison (finite polyhedral pairs and their
triangulations), Mathlib finite simplicial complexes.

##### R4.9.4. Approximate geodesics with equality of limiting length

Fix 0<η_def<inj_g(S²)/4 using R4.6. For C of positive length, let D_(η_def)(C) be the supremum of arcLength−d_g(endpoints) over connected subarcs of arclength≤min(η_def,L(C)/2), using its constant-speed representative. Prove nonnegativity and continuity in d_V on positive bounded-length bands. Defect zero means every sufficiently short arc minimizes distance.

If 0<L_min≤L(C_j)≤B_len, L(C_j)→c and D_(η_def)(C_j)→0, prove uniform subsequential convergence of constant-speed representatives modulo rotation/reversal. For short parameter intervals the limiting endpoint distance equals c times interval length. Deduce a nonconstant constant-speed locally minimizing geodesic, smooth by the geodesic ODE at every point including the periodic seam, with length exactly c. Lower semicontinuity alone does not prove that equality. The compactness conclusion applies to this specified small-defect class.

**Checks.**
- A great circle has defect 0: every subarc of length ≤π/4 is minimizing.
  The latitude circle at polar angle π/4 has, for the subarc of arclength π/4,
  endpoint distance `arccos(½+½cos(π/(4 sin(π/4))))≈0.7641`, hence defect
  ≈0.0213>0.
- A circle of spherical radius ρ has length `2π sin ρ`; its half-circle arc,
  the longest allowed when `L/2<η_def`, has endpoint distance 2ρ and defect
  `π sin ρ−2ρ≈(π−2)ρ`, positive and tending to 0 with ρ; the cap
  `min(η_def,L(C)/2)` is what keeps the defect of short curves small, so a
  definition without it would compare arcs longer than the curve.
- Convergence of lengths to c is needed for the equality `L=c`: the
  triangular waves of R3.1 converge uniformly to a constant with lengths
  bounded away from 0.

*Needs:* R4.6 (injectivity radius, uniqueness of short minimizing geodesics),
R4.9.0 (constant-speed representatives), R3.1 (arclength parametrization,
Arzelà–Ascoli), R2 (the geodesic ODE and its smoothness), HopfRinow
(Completed) Layer 4 (minimizing segments).

##### R4.9.5. Simplicity, primitive traversal and critical-set localization

Exclude transverse crossings of the limiting geodesic by a planar alternating-endpoint/Jordan stability lemma for two disjoint parameter arcs of the embedded approximants. At tangential returns use ODE uniqueness: equal velocities give a shorter period; opposite velocities imply a reversal symmetry forcing zero velocity at its midpoint. Thus a limit without transverse crossings traverses a primitive embedded closed geodesic k times.

Construct a smooth normal annulus around the primitive image by its unit normal, the exponential/Fermi map, local inverse-function theorem and compact embeddedness. Uniform parametrized convergence gives a homotopy of annular projections of degree±k. The generic Jordan winding theorem in a smooth planar annulus gives degree 0 or ±1 for an embedded curve there. Hence k=1. The homotopy of parametrized annular projections supplies the degree comparison.

For c>0 let K_c be the simple unoriented geodesic images of length c. Prove K_c compact in V using compact initial unit-tangent data, ODE dependence and the preceding no-crossing/no-iterate limit theorem; allow infinite or positive-dimensional K_c. For every open U⊃K_c prove that curves in a sufficiently small length strip about c with sufficiently small D_(η_def) lie in U. Derive this by contradiction from approximate-geodesic compactness, including the case K_c=∅.

*Needs:* R4.9.4 (the limiting geodesic), HopfRinow (Completed) Layers 2–3
(the exponential map, from which the Fermi annulus of the embedded closed
geodesic is constructed here with Mathlib's inverse function theorem), ConformalMapping (Completed) L3/L5 (planar
Jordan stability for disjoint arcs), GeometricMeasureTheory G6 (winding in a
planar annulus), R2 (ODE uniqueness along geodesics), R4.9.0 (the topology
of V and compactness of `K_c`).

##### R4.9.6. Uniform embedded-preserving finite-family shortening

Fix a finite ceiling B_len>c>0 and an open U containing K_c. Construct 0<σ<c and δ>0 with c+2δ<B_len, depending only on g,B_len,c,U, independently of the parameter space. For every continuous u:(P,P₀)→(V,A), with P any compact finite polyhedron and max L_g(u)≤c+δ, construct a homotopy H relative to P₀, through Jordan images or points, whose endpoint u′ satisfies

`u′(P) ⊂ V^{<c−σ} ∪ U`,  `max_(P×[0,1]) L_g(H) ≤ c+2δ < B_len`.

Fix every input point-curve throughout, including those outside P₀. The constants σ,δ are uniform over the families; regularization mesh, parameter subdivision and flow times may depend on the particular compact family. Construct the restriction and cubical face-identification laws below for this intrinsic family construction, together with comparison laws for its compatible choices. Intermediate curves lie below the declared ceiling and their endpoints lie in the low union U. The ordered analytic construction below preserves embedded images and point inputs.

*Needs:* R4.9.5 (`K_c` and its neighbourhoods), R4.9.3 (finite polyhedral
parameter carriers), R4.9.6a–R4.9.6e (the ordered analytic construction).

###### R4.9.6a. Length-controlled parametric regularization

Choose the standard round metric g₀ as an auxiliary regularization device. Prove that the topology d_F+|ΔL| on Jordan images and points is independent of the smooth positive-definite metric on compact S². Use separate type synonyms S²_g and S²_(g₀), each carrying its own Riemannian distance, with the identity smooth diffeomorphism and its bi-Lipschitz metric comparison. Define the induced image/point bijection V_g→V_(g₀) and prove it and its inverse continuous. On positive-length bands work in the uniform quotient of constant-speed representatives by rotations and reversal. For each convergent sequence choose matched representatives with uniformly bounded Lipschitz constants, then use weak derivative convergence and convergence of arclength energy to obtain strong derivative convergence in a fixed smooth embedding; this proves convergence of length for the other metric. At points use uniform metric norm equivalence and length tending to zero. Construct the corresponding transport under a smooth diffeomorphism of compact surfaces, with variation and reparametrization laws. These are concrete curve-carrier/homeomorphism interfaces for the two-metric regularization.

Construct the shared periodic, interior and conditional blowup theorems in R4.9.6b first, then their round applications here. Before any round area evolution or annulus nonfattening application, own the following signed boundary curvature–area construction on the actual unit-round-sphere carrier with metric g₀, its fixed orientation and canonical Riemannian area.

For a selected smooth Jordan disk D, orient ∂D with D on the left. Let n_D be its inward unit conormal in the sphere and let k_D be the signed geodesic curvature defined by ∇_T T=k_D n_D for the unit-speed positive boundary tangent. Construct the boundary arclength integral and its comparison with DG's oriented line integral, and prove
`∫_(∂D) k_D ds_(g₀) + Area_(g₀)(D) = 2π`.
This is a theorem for either selected side, with its own induced orientation and normal; it does not designate a smaller side. For a smooth annular domain Ann use the two induced boundary orientations, inward conormals into Ann, and prove
`∫_(∂Ann) k_Ann ds_(g₀) + Area_(g₀)(Ann) = 0`.
Give the restriction, orientation-reversal, disk-difference and parameter-dependent integral laws needed for these actual domains.

Build the signed turning input here: an oriented smooth embedded planar Jordan curve bounding a disk on its left has tangent-map degree+1 and signed Euclidean total curvature 2π. Construct the tangent-angle lift on intervals, its degree/turning-integral identity, and the Jordan orientation comparison giving degree+1; unsigned Fenchel is a different theorem. For a selected spherical disk choose a stereographic pole in the opposite open component, transport it to a compact planar smooth Jordan disk, and use R1's stereographic metric and conformal connection comparisons. For g₀=e^(2u)(dx²+dy²), prove the signed boundary identity `k_(g₀) ds_(g₀)=(k_e+∂_(n_out)u)ds_e` and curvature identity `K_(g₀)dA_(g₀)=−Δu dxdy`. DG's Green/Stokes theorem and the signed turning theorem then give the disk formula because K_(g₀)=1. Derive the annulus formula by subtracting the two nested disk formulas and reversing the inner boundary. Own these geometric/line-integral/volume comparisons here; generic Stokes alone does not assert them.

For a smooth moving Jordan disk establish the signed moving-boundary formula `A_side′=−∫k_D ds` with the same curvature/normal convention. Combine it with the owned disk identity to obtain `A_side′=A_side−2π`, and construct its continuous finite-endpoint area trace. For two nested evolving smooth boundaries prove the corresponding variation formula with both induced annulus orientations on their common lifetime; the annulus identity gives `A_ann′=A_ann`, hence `A_ann(t)=exp(t−s)A_ann(s)` before either boundary loses smooth existence. Retain the nesting and endpoint-trace hypotheses when taking approximation limits. These focused round disk/annulus theorems supply the applications in this section; no general Gauss–Bonnet–Chern theorem is a prerequisite. The arbitrary-metric finite-time alternative and the disk area equation give finite extinction exactly when A_side(0)≠2π; area bisection excludes finite collapse.

Construct the round circular-singularity theorem by a small-length closed-curve distance comparison. For an embedded round flow extinct at (p,T), enter once L≤L_*<2π. The spherical distance of a pair is at most its shorter arc l≤L/2<π, so antipodal pairs are excluded and m≠0. Use the exact ambient chord `D_ch=|X(y)−X(x)|` in ℝ³ and `ψ(L,l)=(L/π)sin(πl/L)`, where l is the shorter arclength. Prove that a positive constant `0<β≤1` with D_ch≥βψ initially retains this inequality for all later times before T; equivalently the minimum D_ch/ψ is nondecreasing. Include the continuous diagonal value 1, the two half-arc branches at l=L/2 and a strict ε first-contact barrier. The exact ambient equation is `X_t=κ_e+X`; the measure/subarc equations are `L′=−∫|κ_e|²ds+L` and `l′=−∫_arc|κ_e|²ds+l`. Homogeneity `Lψ_L+lψ_l=ψ` cancels the pure homothety contribution in D_ch/ψ. At contact set θ=πl/L, `w=(Y−X)/D_ch`, `m=(X+Y)/2` and `c_contact=β cosθ`. The sphere and first-variation identities give `T_x·w=T_y·w=c_contact`, `T_x·m=Dc/2`, `T_y·m=−Dc/2` and `c²≤|m|²`. Resolve the remaining tangent components in the line orthogonal to span(X,Y). For equal residual signs the (+,+) second variation gives `D_t≥D_ch(1−c²/|m|²)≥0`, while ψ_t≤0. For opposite residual signs the (+,−) variation gives `D_t≥D_ch−4βπ²ψ/L²`. Own the ambient-ℝ³ closed Fenchel inequality `∫|κ_e|ds≥2π` and the endpoint-tangent turning bound on the selected arc, followed by Cauchy–Schwarz: `∫_arc|κ_e|²ds≥4(acos c_contact)²/l≥4π²l/L²` and `∫|κ_e|²ds≥4π²/L`. Hence the corresponding geodesic-curvature energies are at least `(4π²/L²−1)l` and `(4π²/L²−1)L`. Since ψ_L,ψ_l≥0 on θ∈[0,π/2], `−ψ_t≥(4π²/L²−1)ψ`, making `(D_ch−βψ)_t≥0` in the opposite-sign case too. Construct the finite-dimensional first/second-variation, turning and Fenchel lemmas with their regular-closed/arc hypotheses, then apply the strict barrier argument. This exact spherical calculation yields the scale-independent bound `D_ch≥(2β/π)l` while L→0.

Construct two distinct isoperimetric outputs. For the extinction application, once the selected shrinking side lies in a fixed small normal ball, compare its metric area and boundary length with their Euclidean chart values and consume [Isoperimetry I3/I6](../Isoperimetry/README.md#i6--full-planar-jordan-theorem-and-compatibility). This proves a uniform weak estimate `L²≥c_iso A_side` for small selected-side area. The side inside that chart is identified by Jordan separation and A_side→0. Retain the sharp spherical theorem `L²≥A_side(4π−A_side)` for every rectifiable round Jordan image as a separate utility. Consume [GeometricMeasureTheory G3–G5](../GeometricMeasureTheory/README.md#g3--distributional-bv-and-variation-measures) for derivative measures, BV compactness and perimeter lower semicontinuity in Euclidean charts. Construct the smooth-chart/pullback and partition-of-unity comparisons for spherical finite-perimeter sets here. Build spherical two-point polarization of finite-perimeter sets, prove area preservation and perimeter nonincrease, and use BV compactness and a sequence of polarizations toward a fixed pole to obtain a spherical cap of the same area. Transfer the perimeter comparison to rectifiable Jordan boundaries and compute the cap area/length. Use complements for areas above 2π. This spherical symmetrization and its limit/normalization are owned here; the planar supplier supplies the local weak estimate.

Use the closed comparison to exclude Type II at round extinction. The selected shrinking side satisfies `A_side(t)=2π(1−exp(t−T))`; the local weak estimate gives `L(t)²≥c_len(T−t)` on a terminal interval. Hamilton selection with `λ_i²(T−t_i)→∞` then has λ_iL(t_i)→∞. Prove the round application of the conditional mass and tangent theorems in R4.9.6b: the closed comparison gives linear local mass, proper arclength exhaustion and multiplicity-one pointed limits; the periodic total-curvature identity on the finite physical interval gives the finite sign-loss budget. The shared eternal-selection and disjoint-window theorem yields a proper noncompact strictly convex eternal planar limit. Its attained-maximum Harnack equality and translator classification give a grim reaper, contradicting the scale-independent closed comparison. Thus `sup_(t<T)(T−t)||k||∞²<∞`. The positive-length-floor closed application in R4.9.6b supplies the separate arbitrary-metric nonpoint exclusion.

For round Type I at the fixed extinction centre p prove `d_g₀(X(q,t),p)≤∫_t^T||k||∞ds≤2C_I sqrt(T−t)` for every material point. After scaling by `(2(T−t))^(−1/2)` the whole image stays in a fixed ball. The area equation gives rescaled selected-side area→π; combine it with the weak isoperimetric lower bound, the round local-mass estimate and the shared smooth tangent compactness theorem to prevent an empty or zero-size limit. Localized monotonicity selects a nonempty compact embedded planar shrinker, so a line is excluded. Classify that shrinker as a circle. With p,T and a normal-graph/tangential gauge fixed, prove full smooth precompactness; every subsequential limit is the same centred unit-circle image, hence the whole rescaled family converges in C∞ as unoriented embedded images. Retain normalized-flow stability and tangent uniqueness as additional utilities: compute the circle linearization and stable subspace after centre/time/gauge modulation, establish a coercive estimate and nonlinear/spherical-metric remainder bounds at every required finite Sobolev order, and prove graph persistence and convergence. These utilities use the same explicit normalization and are distinct from compactness plus classification.

Construct full great-circle convergence for immortal round flows by nonlinear area-bisecting Morse–Bott modulation. The area equation and the immortal primitive annular limits give L→2π and every curvature derivative→0. On a late latitude graph u over an accumulation great circle use the exact area constraint `∫sin u ds=0`. Prove by the implicit-function theorem that it determines the unstable constant mode from the remaining small graph; use the two rotational parameters to impose zero first harmonics. The linearized operator is `∂s²+1`; the remaining modes have eigenvalues≤−3. Establish the quasilinear coercive energy estimate, persistence on the chosen graph slice and decay at all finite orders. Derive the rotation equation and prove its velocity is integrable, giving one limiting great circle. Include the already geodesic case. Construct this nonlinear slice/constraint and the estimates, rather than infer them from the linear spectrum alone.

Retain the Gage threshold and polar/intersection outputs as separate utilities. From L→2π and curvature decay derive `∫sqrt(1+k_g²)ds<3π` on a late tail. Prove the fixed-great-circle intersection theorem from periodic scalar zero number and uniqueness. For each curve C_t, let S_t be the closure in RP² of the unoriented poles whose great circles meet C_t in at least four distinct points (a coincident great circle has infinitely many intersection points). Prove nesting first for the unclosed pole sets by the fixed-great-circle zero-number theorem, and hence for their closures. Construct the tangent polar curve with length∫|k_g|→0. Prove the rotation-to-tangency/convex-hull estimate and the closing lemma placing every accumulation pole in the actual closed set S_t, including the geodesic and tangency degeneracies. The area constraint in that closing lemma is ∫sin u=0; its proof must account for this nonlinear constraint when great circles are written as `tan u=a cos s+b sin s`. Prove the closing and pole-diameter estimates for these closed sets, including poles approaching a tangency, and deduce great-circle uniqueness. These are full geometric construction targets independent of the main modulation proof.

Construct the raw round avoidance track for nested smooth disk exhaustions of both components of a Jordan image. Before any smooth-boundary conclusion, define the closed track as the intersection of the evolved closed annuli, prove the weak-set avoidance law, maximality, exhaustion independence and restriction in time. Prove common survival for approximants of one fixed nondegenerate Jordan image using two fixed closed round balls strictly in its complementary components: their shrinking circle barriers live for `−log cos a_+` and `−log cos a_-`, and avoidance plus the finite-time point-collapse alternative excludes earlier collapse. This lifetime uses the two balls alone.

Own the conditional one-sided smooth-boundary theorem. For a nested exhaustion by smooth Jordan disk flows on a common positive interval, with uniform positive-time length ceilings, two-sided noncollapse from surviving complementary balls and the actual avoidance/nesting laws, construct a smooth single embedded boundary for the limit of each side on every smaller positive interval. Use dissipation to choose an intermediate curvature-energy slice, constant-speed H² compactness and the local parabolic graph estimates. Prove the needed limit-boundary regularity: rule out multiplicity and tangential self-contact using the one-sided nesting, strong avoidance, local embedded sheet/degree comparisons and the boundary-of-domain topology, then propagate the intermediate smooth graph to the requested time. An integral energy bound supplies an intermediate slice; the parabolic argument supplies the later estimates. Construct these boundary/degree statements on the actual limit domains. This conditional theorem has the uniform length ceiling as input, with the finite-length and general-Jordan applications obtaining it by their separate constructions.

After smooth one-sided boundaries have been constructed, prove the conditional annulus nonfattening theorem. For the nested approximating annuli, apply the signed annulus boundary identity and moving-boundary variation constructed above on the common smooth lifetime to get `A_ann′=A_ann` and `A_ann(t)=exp(t)A_ann(0)`. Retain the actual inner/outer orientations and initial-area trace in this formula. If their initial areas tend to 0, their areas at a fixed common surviving positive time tend to 0. Avoidance, the smooth-boundary limits and annular degree then identify the two boundaries as one smooth Jordan image and identify the raw track with that image. Prove uniqueness among smooth positive-time boundary flows having the declared trace. This conditional theorem takes actual smooth boundary and nesting inputs and is independent of the source of the length ceilings.

For every finite-length Jordan image γ construct smooth nested inside/outside conformal approximants with boundary lengths converging to L_g₀(γ), using the Poisson/BV theorem below. The two fixed complementary balls give common survival. Monotonicity gives the uniform length ceiling directly from these initial lengths, and dissipation supplies the intermediate good slice for the conditional one-sided smooth-boundary theorem. Apply conditional annulus nonfattening only after those boundaries exist. This produces the finite-length positive-time round engine without spacing, foliation length estimates or a Dirichlet wedge premise.

Construct the positive Poisson/BV adapter on actual continuous finite-variation boundary traces. Consume [ConformalMapping L3/L5](../../Completed/ConformalMapping/README.md) for the holomorphic disc map, its continuous injective closed-disc extension and Cauchy floor, and [GeometricMeasureTheory G1](../GeometricMeasureTheory/README.md#g1--rectifiable-curves-and-arclength) for arclength factorization. In a stereographic chart away from a pole in the other component write `z=Z∘ell`, with ell the continuous cumulative Euclidean variation and Z a unit-speed Lipschitz representative. Prove the derivative-measure substitution `Dz=(Z′∘ell)Dell`, `ell_*Dell=ds` and `|Dz|=Dell`, with generalized-inverse handling of constant pieces. Deduce `∫||dDz/d|Dz|||_(g(z))d|Dz|=∫||Z′||_(g(Z))ds=L_g(z)` from the Lipschitz metric-derivative identity. Derive the positive Poisson representation from Cauchy and harmonic uniqueness, with `P_r(θ)=(1−r²)/(1−2r cosθ+r²)` of average 1. Finite-measure Fubini gives `D(P_r*z)=P_r*Dz`. Positivity and convexity give the norm bound; split near and far angular pairs and use uniform metric continuity and the vanishing Poisson tail to prove the weighted length limsup. Uniform convergence and lower semicontinuity give equality. Apply the theorem to radial maps for both complementary domains, retaining trace, orientation and nesting laws.

Prove the finite-length engine’s own initial Fréchet and exact-length trace. Use fixed nested Schoenflies annuli around γ and smooth inner/outer barriers to trap each positive-time image for small time. Prove degree one in each annulus by the actual Jordan/avoidance and parametrized annulus laws. Constant-speed representatives have a uniform Lipschitz ceiling; every uniform subsequential limit has image γ, degree one and length≤L_g₀(γ). Use γ’s arclength homeomorphism and variation to show that any genuine backtracking would add positive length, so the limit is a monotone one-traversal parametrization. This proves unoriented Fréchet convergence; metric lower semicontinuity gives the exact length trace. Construct the required topological annuli and degree homotopies, including the absence of a nearest-point map for a rough γ.

For every Jordan image γ of spherical area zero, including nonrectifiable images, construct its maximal smooth round curve-shortening flow for positive time with unparametrized uniform/Fréchet trace γ as t↓0, unique up to reparametrization. Prove it persists for all time exactly when γ bisects the sphere's area, and otherwise becomes extinct in finite time. Use nested smooth disk exhaustions of both complementary components. A `(C,θ)`-spacing is a finite set of points y_i whose closed radius-C balls and antipodal balls miss γ, such that for every test point x two well-defined great circles through x and selected y_i have angle greater than π/2−θ. Prove existence for each Jordan curve and stability under sufficiently close Jordan approximation. For 0<r<π/2 let M_(r,g)(γ) count the components of γ∩B_(2r)(g) meeting the closed r-neighbourhood of g, and M_r be its supremum over great circles. Prove finiteness and uniform approximation bounds with buffered scales. For 0<α≪1, choose a spacing centre y and let `V_space=B_C(y)∪B_C(−y)`, disjoint from γ. For a test point x choose a great circle g through x,y and 2r<αC. Write C_space=C for the actual spacing radius above, so `V_space=B_(C_space)(y)∪B_(C_space)(−y)` is disjoint from γ. Pin 0<C_space<π/2, y∈g and 0<α<1/10. Set `C_graph=C_space/2`, `C_core=C_graph/2` and choose a gluing radius `C_glue` strictly between C_graph and C_space, for example 3C_space/4. The spacing input remains C_space; the smaller radii specify where initial graphs, their gluing and evolved estimates are imposed.

Use the normal strip coordinates `F(s,u)=cos(u)g(s)+sin(u)n`, with oriented circle parameter s, fixed unit normal n to its plane and projection π_g(F(s,u))=g(s). For a radius a define `I_a=(B_a(y)∪B_a(−y))∩g`. Choose r>0 with `4r<α C_graph` and let `R_evol=2(1+α)r<π/2`. Require the strict margins `cos(R_evol)cos(C_glue)>cos(C_space)` and `cos(R_evol)cos(C_core)>cos(C_graph)`. In particular `cos(2r)cos(C_graph)>cos(C_space)`. Define the initial graph window `U_graph=π_g⁻¹(I_(C_graph))∩B_(2r)(g)` and the larger gluing window using I_(C_glue) at that height.

A leafable curve is a smooth embedded closed curve ℓ⊂B_(2r)(g) such that `π_g:ℓ∩U_graph→I_(C_graph)` is a diffeomorphism. Thus every point of each full prescribed graph arc has exactly one point of the normal graph, with no additional components in U_graph. Require tangent angle≤α/2 to the latitude direction on this initial graph. Coverage is part of the definition, not an angle test on whatever spatial-ball intersection happens to exist. No slope condition is imposed outside this graph window.

Construct the domain comparisons explicitly. For s measured from y, `cos d(F(s,u),y)=cos(u)cos(s)`, and likewise at −y. Prove that the whole initial graph and gluing cylinders lie in the actual γ-free spacing balls V_space, using the strict margins above; their closed subwindows have compact separation from γ. The spatial-ball restriction of a nonzero latitude projects onto a shorter arc, so that restriction is not required to surject onto the larger spacing arc. Nonzero latitudes are valid initial leaves. Prove also `V_space∩B_R(g)⊂π_g⁻¹(I_(C_space))∩B_R(g)` for the heights used, and `π_g⁻¹(I_(C_core))∩B_(R_evol)(g)⊂B_(C_graph)(y)∪B_(C_graph)(−y)`. These identify the actual smaller domains in the two-ball barriers and positive-time estimates.

Prove from full two-arc coverage, embeddedness and Jordan separation in the complementary strip rectangles that the annular projection has degree±1. Construct initial leafable foliations in this same class, allowing outer leaves in B_(2r)(g)\B_r(g). Perform every imposed graph normalization and its smooth gluing inside the γ-free spacing windows; leave the required freedom outside those windows for the intersection-count construction. Prove that this yields at most `2M_(r,g)(γ)` intersections per leaf, at the original multiplicity scale r. A local low-slope modification is not imposed in a region that may contain γ; the γ-free support is part of this proof.

Construct the buffered straightening and common-lifetime theorem with those actual windows. For a straightening construction requiring initial containment B_(r_st)(g), set `r_st=2r`, use `4r<α C_graph` and the declared time/spacing margins, and prove the comparison of its graph hypotheses. Do not infer containment in B_r from B_(2r). The auxiliary straightening scale does not change the original multiplicity scale or counted intersections. Prove persistence of graph and angle estimates only on the specified smaller core arcs I_(C_core) and their buffered cylinders/spatial balls for the declared time interval; unchanged full initial-arc coverage at positive time is not a premise or conclusion. Prove that the evolved family covers the required B_r(g) region, preserves degree and intersection bounds, and reaches the stated global straightening angle. Retain the coefficient and time-window hypotheses for the transverse-foliation grid. Derive constants for each original C_space by the explicit substitutions C_graph=C_space/2 and r_st=2r, so the original uniform spacing-family statement is retained. Use the constructions of [Lauer §4 and §8](https://arxiv.org/html/1601.05704#S4) with these coordinate-domain, free-support and radius comparisons. Apply the scalar parabolic Harnack theorem of R4.9.6b to the positive linearized leaf separation, with the actual coefficient and time-window bounds from the straightening charts.

Construct the barrier-arc families used in straightening. For each fixed spacing/angle reserve and sufficiently small strip radius r, build smooth embedded convex U-turn arcs with the seven barrier properties: fixed endpoints near the spacing centre; confinement in the narrow strip and chosen wedge; a controlled tip near the antipodal ball; two graph arms; one intersection with each prescribed pencil great circle; a fixed tip-angle reserve; and nonnegative geodesic curvature. Use short geodesic arm pieces and a convex rounded tip in the actual spherical charts, smooth the joins with quantitative angle/strip margins, and keep straight endpoint pieces so all initial curvature jets vanish. Prove this construction with continuous choices and uniform constants. For their Dirichlet evolution derive k≥0 from `k_t=k_ss+k³+k`, k=0 at the endpoints, and prove the boundary-safe single-intersection laws by the homogeneous-Dirichlet/local intersection theorem. Establish the angle monotonicity and retain a subarc whose tangent angle relative to the strip frame runs from π/4 to 3π/4 while remaining in that interval until the tip enters the target ball. In `g₀=dr²+cos²r ds²`, `|theta_ell−k_g|≤C r` and `dr/dell=sin theta`; that subarc has length≤C_1 r and turning≥π/4 for small r. Hence `∫k_g²ds≥c_turn/r`, so a uniform initial length ceiling gives straightening time `T_st(r)≤C_st r`. Prove the angle window and its preservation as geometric outputs of this family, not extra hypotheses on arbitrary input curves. Construct the moving barriers and their intersection comparison with each leaf, and conclude the stated straightening angle and grid estimates.

For each spacing radius C_space and sufficiently small θ construct T_space(C_space,θ)>0; for 0<t<T_space choose buffered multiplicity scale r(C_space,θ,t) and C_len(C_space,θ,t)<∞ so every smooth embedded curve with that spacing satisfies `L(γ_t)≤C_len M_r(γ)` whenever its flow exists. This is a spacing-only length theorem. For approximants of one fixed Jordan image use the independent two-ball common lifetime, and then evaluate this length theorem at times below both lifetimes. The straightening/multiplicity length construction supplies the general-Jordan ceiling and is independent of the finite-length ceiling above.

For arbitrary area-zero Jordan images, use the spacing/multiplicity theorem to supply positive-time length bounds, then apply the conditional one-sided boundary and annulus nonfattening theorems. Construct the general initial Fréchet trace by the evolved finite crosscut/foliation grid and its arcwise separation laws, retaining arbitrary nonrectifiable initial images. This trace construction is separate from the finite-length no-backtracking proof. Prove uniqueness up to reparametrization and the area-bisection maximal-lifetime criterion, and apply the round circular/immortal outputs to its positive-time slices.

For Jordan data converging at a common surviving positive time prove joint length convergence by the final-limsup subsequence and Fatou curvature-energy argument. At a suitable intermediate time use bounded liminf curvature energy and a positive lower length bound for arclength H² compactness and C¹ convergence. Identify the support and exact traversal by the annular degree-one theorem, then use positive-time graph dependence. The general area-zero flow and the finite-length exact trace are distinct outputs with their own hypotheses.

Construct the fixed-endpoint Dirichlet application for the leaf barriers. Choose a closed spherical lune Ω bounded by two distinct great-circle barriers, endpoints A_endpt,B_endpt on the respective boundaries away from the vertices, and a smooth embedded initial arc with interior in int Ω and all initial endpoint curvature jets zero. The endpoints used in the leaf construction lie in a common strictly convex neighborhood, so their short joining segment has length<π. Instantiate the interval parabolic inverse and quasilinear theorem of R4.9.6b, in moving graph charts with zero endpoint data and actual corner compatibility. Fixed endpoints give k=0 and, for constant curvature, k_ss=0 at positive time; derive the higher even-jet compatibility identities and boundary estimates while treating odd jets as unknowns. Construct parameter dependence, avoidance, wedge containment and curvature-bounded continuation on these domains.

Derive endpoint localization from this initial wedge/embedded-arc data. Start with a small endpoint neighborhood meeting only its initial end branch, which exists by compact embeddedness. Construct a quantitative geodesic-foliation/barrier system there, with lateral boundary comparisons and interval intersection counts, and prove that its evolution keeps the whole curve’s intersection with a smaller neighborhood on one controlled endpoint graph. Prove uniform slope, curvature and compatible higher boundary bounds. In particular, for each fixed positive intrinsic separation a prove a positive δ_a, uniform in time, such that `d(A_endpt,F(q,t))≥δ_a` whenever the subarc from A_endpt has length≥a; prove the analogous B_endpt statement. The graph estimate controls the remaining shorter subarc. Construct the no-remote-return assertion through the foliation’s boundary-safe avoidance and one-sheet intersection laws; derive all constants from the given initial arc, wedge and endpoint geometry. This endpoint-localization theorem is an owned geometric construction, rather than an additional condition imposed on the input.

Prove the spherical pair-domain comparison with that endpoint theorem. For 0<d<π and parallel signed normal endpoint components α_n,β_n the short-geodesic index form is `Hess d=((α_n²+β_n²)cos d−2α_nβ_n)/sin d`; derive it from the sine Jacobi field. At an interior minimum of distance/subarc-length choose the endpoint variation sign making β_n=α_n, obtaining the favorable curvature-vector difference≥`2α_n²tan(d/2)`. At a fixed-endpoint edge the second variation instead gives the possibly negative `−cot(d)β_n²`; use the proved endpoint graph ratio and δ_a/L_max for the remote subarc. Include diagonal limits and compact initial-time bounds. Strict interior containment and nonvertex endpoints exclude the lune’s only possible antipodal pair, so d<π at all contacts. This gives a positive ratio for the whole parameter-pair domain with uniform constants.

Apply the shared conditional blowup package to the Dirichlet flow. Its distance/subarc ratio gives linear local mass and proper arclength limits, and the boundary estimates keep high-curvature selections away from the endpoints. Prove the homogeneous-Dirichlet total-curvature identity `V′=−2Σ_interior|k_s|−|k_s(A_endpt)|−|k_s(B_endpt)|+∫K_gauss|k|ds` in the distributional sense; on a finite physical singular-time interval it gives a finite sign-loss budget. These inputs supply interval Type-I/II selection and exclusion, hence existence for all time. For infinite time use L≥d(A_endpt,B_endpt)>0 and dissipation. With K_gauss=1, boundary compatibility gives `E₀′=−2E₁+∫k⁴+2E₀` and `E₁′=−2E₂+∫(7k²+2)k_s²`; the boundary terms vanish by k=0 and k_ss=0. Prove the higher boundary energy/trace ladder and decay. Limits are geodesic segments inside Ω; show the long great-circle arc exits the lune, identify its unique joining segment there, and use the positive Dirichlet Jacobi gap `(π/d(A_endpt,B_endpt))²−1` plus nonlinear remainder control to obtain integrable late motion and full smooth convergence.

Use the shared periodic normal-graph parabolic theorem in R4.9.6b for the round metric. For an oriented smooth Jordan curve let A(t) be the area of its selected component. Gauss–Bonnet and A′=−∫k_g ds give `A′=A−2π` on the unit sphere. Establish the area convention and its continuous finite-endpoint trace. The arbitrary-metric finite-time alternative below then gives extinction in finite time exactly when A(0)≠2π; A(0)=2π excludes finite collapse.

For comparison estimates, fix an actual smooth reference flow and express the nearby flow as a normal graph `u(s,t)` over it in one fixed tubular strip and gauge on a common short-time interval. The zero graph is the reference solution; in the graph-difference equation write the lower-order residual as `b(s,t,u,u_s)` with `b(s,t,0,0)=0`. Require the principal coefficient `a≥a₀>0`, uniformly bounded coefficient jets on a fixed compact coefficient box, and common initial H² and C¹ reserves placing the graph inside that box. Put `Y_m(t)=||u(·,t)||_{H^m(S¹)}²` for m≥2. Then prove `Y₂′+a₀||u_sss||²₂≤C(1+Y₂³)`, `||u_t||₂≤C`, and `||u(t)−u(0)||C¹≤C t^{1/8}` on the common short-time interval.

Obtain an integrable coefficient `A_par(t)=1+||u_ss||²∞` for this same reference-flow graph. Prove the differentiated composition/commutator bounds and `Y_m′+a₀Y_(m+1)≤C_m A_par(t)(1+Y_m)`; time averaging on successive interior intervals supplies all positive-time derivatives from the stated initial H²/C¹ reserve. For convergence to the reference, define `E_diff(t)=||u(·,t)||²_{L²(S¹)}` and prove `E_diff′+a₀||u_s||²₂≤C A_par(t)E_diff`, then use interpolation and finite graph restarts. These are local comparison estimates for the selected reference-flow chart and do not restrict the separate common-survival theorem’s arbitrary smooth input flows. Construct these a priori estimates in actual parabolic function spaces and obtain dependence for the common-surviving finite-length engine.

For every compact finite-polyhedron family u and every ε>0, choose a continuous positive small round time on its nonpoint parameter locus, tending to 0 at point parameters and below the survival bound. Joint continuity in V and positive-time smooth dependence give an embedded/point homotopy fixed at every input point, with `L_g(H(p,t))≤L_g(u(p))+ε`, and positive-length endpoints continuous in C∞ away from point parameters. The round auxiliary homotopy has the stated upper g-length allowance. For the intrinsic cubical construction below, choose the time cap on the compact curve image so identified input curves receive the same time.

*Needs:* R4.9.0 (the two-metric comparison of the curve topology), R4.9.6b
(the shared periodic normal-graph theorem, finite-time alternatives and
blowup selection), R1 (stereographic metric and conformal connection
comparison), DifferentialGeometry Layer 5 and 5.6 (Stokes, Green's theorem,
oriented line integrals), R4.7 (the round sphere and its area),
Isoperimetry I3/I6 (planar isoperimetric inequality for small sides),
GeometricMeasureTheory G3–G5 (BV compactness, perimeter lower
semicontinuity), ConformalMapping (Completed) L3/L5 (Riemann map, closed-disc
extension), Mathlib's Riemannian distance on `Metric.sphere`.

###### R4.9.6b. Shared parabolic and conditional blowup theory; arbitrary-metric applications

Construct one shared periodic normal-graph theorem for every fixed smooth surface metric and use its round specialization in R4.9.6a. On the compact graph coefficient box, `u_t=a(s,t,u,u_s)u_ss+b(s,t,u,u_s)` on ℝ/ℤ has a≥a₀>0. Establish short-time existence, energy estimates, compactness and restart while the graph/box persist; prove uniqueness by the L² difference estimate, smooth dependence by differentiated equations, and positive-time smoothing. Reparametrize to obtain geometric uniqueness, embeddedness/avoidance, L′=−∫k²ds, derivative bounds and curvature-bounded continuation.

Construct the linear Dirichlet parabolic inverse independently on a compact interval I=[0,l_I]. Fix 0<alpha_par<1, positive ellipticity a≥a_0 and bounds for a,b,c in the required parabolic Hölder spaces. For `v_t−a v_xx−b v_x−c v=f`, construct a unique solution in `C^(2+alpha_par,1+alpha_par/2)` for f in `C^(alpha_par,alpha_par/2)`, initial data in C^(2+alpha_par), boundary data in C^(1+alpha_par/2), and the actual corner equalities. These include equality of initial/boundary values and equality of the boundary time derivative with a v_0,xx+b v_0,x+c v_0+f at each corner; impose the corresponding differentiated identities at higher finite orders. Prove the inverse estimate with its ellipticity, coefficient, interval and time bounds by the frozen Dirichlet heat inverse, localization/reflection, Schauder estimates and continuity/patching. Use the small-time coefficient reserve for a quasilinear contraction, then construct uniqueness, smooth parameter dependence, positive-time regularity and continuation while the graph/ellipticity and boundary coefficient bounds persist. This is the interval floor used by the spherical fixed-endpoint application, distinct from the periodic construction.

Construct the general periodic linear zero-number theorem for `w_t=a w_xx+b w_x+c w`: on each compact time strip the coefficients are smooth and bounded with the finite derivatives used by the proof, and a≥a₀>0. Either the solution is identically zero, or at every positive interior time its spatial zero set is finite, its zero number is nonincreasing, and a multiple zero gives a strict drop across that time. Prove uniqueness and the identical-zero branch separately. Linearizing the graph difference gives the intersection corollary, with coincident geometric curves handled by uniqueness. In a fixed periodic parametrization of a smooth flow, the curvature equation is a linear equation of this form for w=k, with a=|∂xX|^(−2), the actual reparametrization drift, and c=k²+K_gauss; all coefficients have the stated bounds on compact smooth time strips. This gives the curvature-zero corollary used in BII. Construct separately the local interval theorem on boxes with nonzero lateral values, and the homogeneous-Dirichlet theorem on a fixed compact interval: for a nonzero solution with zero endpoint values the number of interior sign changes is finite at positive interior times, nonincreasing, and drops at interior multiple zeros and the corresponding boundary degeneracies. Prove its boundary classification and separate identical-zero alternative. Apply these domain-specific versions to graph differences and curvature with their actual lateral or endpoint conditions.

Construct the local interior graph/curvature compactness adapter. On a parabolic box with positive separation from its parabolic boundary, a uniform curvature bound and smooth bounded ambient metric jets give small moving graphical patches with controlled height/slope. Derive these patches by the arclength turning bound and a controlled normal/time reparametrization. Apply cutoff energy and parabolic interior estimates on nested boxes, tracking the coefficient jets and cutoff losses. If |k|≤K/r on the outer box, prove bounds `|D_s^j ∂t^q k|≤C_(j,q) r^(−1−j−2q)` on its fixed smaller box, with constants depending on K, box margins and the corresponding rescaled ambient jets. These estimates require no lateral boundary values and supply local smooth pointed subsequence compactness with the separately stated local mass/sheet bounds. They feed point-picking, BI selection and tangent passage.

Construct scalar parabolic Harnack on nested interior cylinders for nonnegative solutions of the linear equation above, with uniform ellipticity and explicit bounded coefficient/geometry/time-gap hypotheses: the supremum on the earlier cylinder is bounded by a finite constant times the infimum on the later cylinder. Include the bounded-potential normalization and the identical-zero case. Its application to positive leaf separation uses actual graph-linearization and straightening estimates. Periodic, local-interior and Dirichlet boundary estimates retain their separate domains and boundary hypotheses.

Give the conditional blowup package one owner here. Type I means `sup_(t<T)(T−t)||k||infinity²<infinity`; Type II is its unbounded complement on a finite singular interval. Its inputs are actual smooth embedded curve flows on interior parabolic domains, uniformly bounded rescaled ambient metric jets, a declared linear local-mass bound `Length(C_t∩B_R(y))≤Lambda R`, controlled local sheets/injectivity and graphical reparametrizations, the parabolic-box derivative estimates above, and the precise monotonicity/error or point-selection hypotheses below. For interval applications require that the outer boxes/cutoffs miss the fixed endpoints, with scaled endpoint distance tending to infinity in a tangent sequence. Under smooth pointed convergence and the mass bound prove the Gaussian tail estimate by dyadic annuli `C Lambda Σ_(j≥0)(2^j R) exp(−c_tail 4^j R²)` and passage of full centered Gaussian ratios. Construct center-uniform local regularity, fixed-center nonflat selection, eternal selection and finite-loss convexity once on these inputs. Closed positive-length, round extinction and interval flows establish their separate application inputs; the conditional package does not require a closed curve or a positive limiting length.

Prove separately the arbitrary-metric maximal-time alternative: for finite maximal time, length and diameter tend to zero and the image converges to one point; for infinite time, subsequences converge smoothly to primitive embedded positive-length closed geodesics. The point limit identifies the finite-time alternative, while the family clock below stops at a positive cutoff length. The round finite-collapse conclusion consumes the finite-time output and Gauss–Bonnet area ODE; circular-singularity asymptotics and great-circle convergence remain separate outputs. The maximal-time alternative follows from the separate global arguments below.

For the arbitrary-metric closed application consume R3’s compact-set uniform normal/strong-convexity radius and smooth two-endpoint short-segment/logarithm theorem, themselves using SBC B6.0, and R4.6’s injectivity consequence. Choose a uniform convex-normal radius r_J within those domains, with the segment and endpoint derivatives smooth on the resulting pair domain including its diagonal. Define `C_J≥0` by the endpoint Jacobi distance-Hessian bound: for `0<d=d_g(x,y)<r_J`, endpoint vectors `V∈T_xS²`, `W∈T_yS²`, and parallel transport `P:T_xS²→T_yS²` along the minimizing geodesic, prove `|Hess d_g((V,W),(V,W))−d^(−1)||(PV−W)^⊥||²|≤C_J d (||V||²+||W||²)`, where the perpendicular projection is to its terminal unit tangent. Construct a uniform `C_J` from the Jacobi index form and compact metric bounds. Assuming `L(t)≥ℓ>0` on a finite interval, derive from this estimate the surface chord–arc inequality

For `psi_CA(L,l)=(L/pi)sin(pi l/L)`, prove the near-pair comparison `d_g(x,y)≥N_CA^(−1) exp(−K_time t) psi_CA(L(t),l(x,y))` when d_g(x,y)<r_J and `0≤l≤L(t)/2`. Include the initial continuous diagonal ratio, the half-arc branches and the two endpoint-normal signs in the Jacobi-Hessian first-contact argument. For the complementary pairs use d_g(x,y)≥r_J and L(t)≤L(0). Choose N_CA from the actual initial near-pair distortion and far-pair ceiling; take `K_time>4C_J+4pi²/L_min²`. Since sin θ≥2θ/π on [0,π/2], conclude

`d_g(x,y)≥beta_CA l(x,y)`, `beta_CA=2exp(−K_time T)/(pi N_CA)>0`.

Prove the application mass estimate explicitly. Fixing one point of C_t∩B_R, all other points there have shorter intrinsic distance≤2R/beta_CA from it, so total ball length≤4R/beta_CA. Normal-coordinate comparison gives a rescaled mass constant, for example Lambda≥8/beta_CA on sufficiently small declared charts. The round closed comparison supplies the analogous constant from its own fixed beta_arc, and the interval distance/subarc comparison gives≤4R/theta_D. Uniform-family use requires a common positive ratio and the same metric/box margins. Use those bounds for the shared tail and compactness theorem. Proper noncompact arclength limits additionally use the actual domain exhaustion and chord–arc injectivity; derivative estimates alone do not imply them.

For the shared localized monotonicity and center-uniform regularity theorem, fix a normal radius r_J and choose `2r_0<r_J`. Let the smooth radial cutoff chi_y equal 1 on B_(r_0)(y), have range[0,1], and be supported in B_(2r_0)(y); in an interval application this support lies away from its endpoints. With q=d_g(y,z)²/2 and tau=T−t set `rho=(4pi tau)^(−1/2)exp(−q/(2tau))`. For 0<tau≤r_0² define `Theta_chi(y,T;tau)=∫_(C_(T−tau))chi_y(z)(4pi tau)^(−1/2)exp(−d_g(y,z)²/(4tau))ds`, using the same localized ratio notation Θ_χ below. Establish the material-time identity

`(∂tρ−k²ρ)+∂ssρ = −ρ|kN+(∇q)^⊥/(2τ)|² + ρ(1−Hess q(T,T))/(2τ)`.

Use the material-time convention for `∂tρ` in the material-time identity. Multiplying that identity by χ and integrating gives the exact cutoff formula

`d/dt ∫χρ ds = −∫χρ|kN+(∇q)^⊥/(2τ)|² ds + E_g(t)+E_χ(t)`,

where `E_g(t)=∫χρ(1−Hess q(T,T))/(2τ) ds` and `E_χ(t)=∫((D_sχ)(D_sρ)+ρ k D_Nχ)ds`. Thus the cutoff error is supported where χ varies; on this convex ball `1−Hess q(T,T)=O_g(d_g(y,·)²)` for its declared centre y. Construct the following conditional center-uniform epsilon-regularity criterion. For fixed `g`, outer cutoff profile, cylinder shape and local-mass bound `Λ`, require the flow and its local-mass estimate on every ball meeting each fixed support `supp(χ_y)` throughout the full integration interval `[s−r²,s]`; these hypotheses apply even when the support extends outside the smaller conclusion cylinder. Prove that there are `ε_*>0`, `r₁∈(0,r₀]` and `C,C_j` such that for every radius `0<r≤r₁`, any smooth flow on the scale-r cylinder satisfying, for every center `(y,s)` in the smaller cylinder and every admissible terminal time, the fixed-scale ratio bound `Θ_{χ_y}(y,s;r²)<1+ε_*/2`, the integrated error bound `∫_(s−r²)^s (|E_g|+|E_χ|)dt≤ε_*/2`, and the local mass estimate `Length(C_t∩B_R(y))≤ΛR` on the rescaled balls used in point-picking, obeys `sup_(Q_(r/2))|k|≤C/r` and `sup_(Q_(r/4))|D_s^j k|≤C_j/r^(j+1)`. Derive the criterion by contradiction: if no positive `ε_*` works, take a sequence with ratio and error excess tending to zero and unbounded normalized curvature. Point-pick and rescale; use the interior parabolic-box derivative theorem on strictly smaller boxes and the common Λ local mass/sheet bound to construct smooth pointed compactness. Pass the center-uniform Gaussian bounds to the limit at every admissible center and scale. For the resulting smooth normalized limit, the density is at least one at a point on a smooth embedded curve; the upper bounds force density exactly one at every center lying on the limit flow and every admissible backward scale. Equality in the Euclidean monotonicity identity makes the limit a static line, contradicting the unit-curvature point. This contradiction establishes a positive ε_* uniform in the declared small scales and cylinder data. The constants are uniform over flows satisfying the same `Λ` and the stated cylinder/error bounds. The cutoff `χ_y` is the same outer radial profile centered at `y`; the theorem fixes r₁, the cylinder-inclusion ratios, error allowance and constants uniformly for all 0<r≤r₁. The chosen r is then free to shrink in the singular-centre application. The neighborhood conclusion has the declared center-uniform hypotheses. To derive the fixed-center density gap at a singular point, argue by contradiction: if `limsup_(τ↓0) Θ_χ(x_*,T;τ)<1+ε_*/4`, choose one sufficiently small fixed `r>0` for which the ratio at `(x_*,T;r²)` is below `1+ε_*/4` and the full-interval cutoff/ambient error budget is below `ε_*/4`. The defining integral is over the smooth time `T−r²`, so at this fixed positive scale it varies continuously with center and terminal time. Prove the corresponding full-interval error bound also persists in a neighborhood of `(x_*,T)`; shrink that neighborhood so the same fixed-scale ratios stay below `1+ε_*/2` and the errors stay below `ε_*/2`. Monotonicity then propagates the ratio bound from `r²` to all smaller scales for those nearby centers. Applying the center-uniform criterion gives curvature bounded near `(x_*,T)`, contradicting singularity. Thus prove `limsup_(τ↓0) Θ_χ(x_*,T;τ)≥1+ε_s` for a positive `ε_s` determined by the error margin. Construct the fixed-scale continuity lemma, persistence of the full-interval error bound, monotonicity propagation and this density-gap application. The constants and cutoff/error allowances are part of these owned theorems, not implicit in their names. For tangent passage use the shared local-mass/Gaussian-tail theorem. For each fixed rescaled scale R, local smooth convergence and cutoff/ambient error estimates give convergence of the centered ratios; the tail estimate then permits passage to the full Gaussian ratio. This fixed-center continuity and monotonicity argument excludes a flat tangent. Blow up at that fixed center and scale; prove smooth pointed compactness on parabolic balls and convergence to the shrinker equation, using the material-time identity and cutoff formula stated above.

Construct the shared Type-II point-picking and eternal-selection theorem on a finite physical singular interval [0,T). Assume unbounded normalized curvature, uniform rescaled local mass/sheets and ambient jets, the interior derivative theorem, and actual expanding arclength domains; in the boundary case supply endpoint exclusion. Choose Hamilton points (x_i,t_i), lambda_i=|k(x_i,t_i)|→infinity with `lambda_i²(T−t_i)→infinity`, and prove the curvature bounds and spacetime domain exhaustion used for pointed compactness. Obtain a complete eternal embedded planar limit with |k|≤1 and |k|(0,0)=1. Prove properness and noncompactness when the application supplies the uniform chord–arc and arclength-exhaustion bounds.

For the shared finite-loss convexity theorem suppose each approximating flow has a nonnegative curvature sign-loss measure mu_loss of finite total mass on [0,T), with the distributional inequality `dV≤C_amb V dt−dmu_loss`, V uniformly bounded there, and mu_loss dominating `2Σ_interior|k_s|dt` at simple sign-changing zeros. Assume the actual periodic or interval zero theorem and smooth interior convergence. If the eternal limit changes sign, choose a compact interval and time subwindow carrying a persistent simple zero with |k_s| bounded below. Rescaling preserves its integrated loss. Select pairwise disjoint physical windows of duration O(lambda_i^(−2))=o(T−t_i) converging to T; each has a fixed positive mu_loss mass, contradicting finiteness. The ambient term vanishes after rescaling. Therefore the nonflat eternal limit is one-signed, and the strong maximum principle makes it strictly convex. Construct the attained-spacetime-maximum differential Harnack equality and the classification of complete convex translators, giving the grim reaper in the noncompact case. Finite loss is required only on the finite physical singular interval; no infinite-immortal-time budget is inferred from V′≤C_amb V.

Prove the closed periodic application of that budget directly. For `V(t)=∫|k|ds`, curvature evolution and `ds_t=−k²ds` yield in the distributional/zero-number sense

`dV/dt=−2 Σ_(z simple sign-changing zero of k)|D_s k(z)| + ∫K_gauss |k|ds`.

The cubic terms cancel and each transverse zero contributes the jump of sgn k. The periodic multiple-zero theorem gives the integrated identity through exceptional times. On finite [0,T), `V(t)≤exp(||K_gauss||infinity T)V(0)`, so the integrated interior sign loss is finite. In the Dirichlet application the separately derived endpoint terms are additional nonnegative losses; the same conditional theorem then applies. Derive these budgets before invoking the shared convexity conclusion.

For the closed arbitrary-metric positive-length application, the Jacobi comparison gives local mass, arclength exhaustion and proper noncompact tangents. Instantiate the shared fixed-center Type-I theorem and eternal Type-II theorem with those inputs. A nonflat planar shrinker `k+a<X,N>=0`, a>0, has first integral `k exp(−a|X|²/2)`; bounded curvature then bounds its image, contradicting proper noncompactness. The grim reaper contradicts the same chord–arc bound. Thus finite maximal time forces L→0. Use the compact-set strong-convexity and short-segment theorem to obtain nested convex-ball confinement and one limiting point.

For an immortal flow first exclude limiting length 0 by the supplied uniform small strongly convex ball and its smooth pair-geodesic distance barriers and the maximum principle. Put `E_j=∫|D_s^j k|² ds`. Prove `E₀→0`, its time integrability and `||k||∞→0` using

`E₀′=−2E₁+∫k⁴+2∫K_gauss k²`,
`E₁′=−2E₂+7∫k²k_s²−2∫K_gauss k k_ss`.

For n≥1, the exact net energy expansion is

`E_n′=−2E_(n+1)+∫D^(n+1)k P_n−2∫D^(n+1)k D^(n−1)(K_gauss k)+∫k²(D^n k)²`,
`P_n=−2D^(n−1)(k³)−2Σ_(j=0)^(n−2)D^j(k²D^(n−1−j)k)`.

The last positive term combines the commutator contribution with the negative measure derivative. Prove the cubic total-order bounds, interpolation and ambient-coefficient bounds giving `E_n′≤−E_(n+1)+C_n E₀` on each sufficiently late tail. Bootstrap uniform decay of every fixed derivative order by compactness and distributional differentiation in the fixed coordinate x∈ℝ/ℤ, where `∂x=L(t)D_s`; retain the converging length factors. Extract primitive embedded geodesic limits using the oriented annular maximum-sheet argument. Prove the corresponding compactness facts uniformly on compact smooth initial-data sets where they are used. The arbitrary-metric conclusion asserts subsequential geodesic convergence. This immortal-flow theorem is a reusable output; the finite-time width localization does not consume it.

*Needs:* R3.1 (H¹ and H² paths, constant-speed representatives), R4.9.0
(the curve topology), PDE A.1–A.6 (scalar weak derivatives on an interval),
Mathlib parabolic energy estimates built from `intervalIntegral` and
Grönwall's inequality, R4.9.5 (compact primitive geodesic sets).

###### R4.9.6c. Smooth local graph retention and positive exit cost

Let K_c be nonempty and U a V-open neighborhood. Consume the primitive normal-annulus construction and the shared local periodic flow theorem, then construct nested controlled smooth graph neighborhoods of the whole compact K_c, with an initial entry candidate N_entry contained in U, uniform signed-distance Fermi tubes, positive dwell time and chart-reset laws. Choose N_entry by low-order height/slope and weak-functional bounds, so it contains an actual C¹-open neighborhood of K_c. The final N_s is selected after the exit constants and retains this C¹-open property. Compactness of K_c follows from initial unit-tangent data: transverse self-crossings persist, tangential returns reduce by the geodesic ODE, and annular degree excludes an iterated limit. Allow nonisolated and infinite K_c.

In a tube `g=dr_F²+G(s,r_F)² ds²`, `G(s,0)=1`, `G_{r_F}(s,0)=0`, put p=u_s, v²=G²+p² and

`Q_graph=u_ss−GG_{r_F}−(G_s/G)p−2(G_{r_F}/G)p²`.

Prove the exact formulas `k=GQ_graph/v³`, `u_t=Q_graph/v²`, `δL/δu=−Gk`; the linearization is `u_t=u_ss+K_gauss(s)u`. Choose initial slope M₀, then the bootstrap slope M and coefficient-box bounds, then small height. Establish scalable retention using the two-point modulus for all ordered shortest circle arcs, with the antipodal bound and a uniform initial near-diagonal reserve. In the first-contact proof use the strict auxiliary barrier `F_ε=F−εe^(κt)`, κ>B_reaction; the unmodified F need not be strictly negative on the diagonal. Finite short/sliding windows retain slope and height until controlled chart reset. Prove chart overlap/quotient control uniformly over K_c. The resulting neighborhoods have the stated V and C¹ properties; construct the additional positive-time derivative bounds for each stronger finite C^k exit statement.

For every V-open `U⊃K_c`, choose `η_V>0` with `Ω₂={dist_V(·,K_c)<2η_V}⊂U` and `Ω={dist_V(·,K_c)<η_V}`. Choose all constants from `(g,c,K_c,U,B_len)` before quantifying over trajectories. With the uniform graph tube, initial slope `M₀`, bootstrap slope `M` and coefficient box, dwell time, height and finite base net fixed, choose `0<b₀<η_V/8`. For nonempty K_c, let Φ be the current-test map defined below, pass its values to the unoriented quotient metric `d_{±}([v],[w])=min(‖v−w‖_{ℓ²},‖v+w‖_{ℓ²})`, and set `r_Φ(C)=dist_{d_{±}}([Φ(C)],[Φ(K_c)])`. Choose a reset tolerance η_* > 0 small enough that V-distance below η_* from K_c lies below the signed-height C⁰ chart-reset threshold with a fixed reserve. Apply the joint compact-closure modulus from the current tests with η=min(η_V/2,η_*); it gives b₀,r₀>0 such that `|L_g−c|≤b₀` and `r_Φ<r₀` imply `dist_V(·,K_c)<η`. When K_c is empty, use the separate empty-critical-set branch in R4.9.6d. Start in the inner height/slope reserve with r_Φ<r₀/2. Retain the trajectory only while it is controlled and r_Φ<r₀. At any proposed first loss of graph control the reset criterion supplies another controlled chart, excluding such loss before r_Φ reaches r₀. Therefore an exit from Ω, and hence from U, must first cross r_Φ=r₀ while control persists. U itself may extend beyond the graph tube. On the controlled crossing annulus prove `||k||₂≥m>0` for a smaller band `|L_g−c|≤b₁`. Define `b_exit=min(b₀,b₁,c/4,(B_len−c)/2)`, `C_(B_len)=√(B_len/3)`, and `e=m r₀/(2C_(B_len))`; now choose the final N_s⊂N_entry satisfying all entry reserves, after r₀,b_exit,m,e are fixed. The controlled annular gap used for this exit cost is independent of the later global curvature gap. Thus there are `b_exit,e>0` and a C¹-open `N_s`, depending only on `(g,c,K_c,U,B_len)`, such that for every `T>0` and every smooth embedded g-CSF `C(t)`, `0≤t≤T`, if `C(0)∈N_s`, `|L_g(C(t))−c|<b_exit` for every `t∈[0,T]`, and `C(t)` leaves `U` at some time `t≤T`, then `L_g(C(0))−L_g(C(T))≥e`. The length identity and `||Φ̇||≤C_(B_len)||k||₂` give this cost on the full annular crossing. The annular gap is asserted only for controlled smooth graphs in `|L_g−c|≤b₁`; outside that band a geodesic of another length may violate the bound. The family reserves additionally require `max(σ,δ+ε)<min(b_gap,b_exit)` and `σ+δ+ε<e`. Keep `b_exit`, `b_gap` and `b₁` distinct. This theorem supplies entry and exit control for the declared smooth trajectories.

Patch charts using a global current test map `Φ(C)=(2^(−j)∫_C α_j)_(j≥1)`. Choose smooth one-forms `α_j` whose real linear span is dense and normalize each so `||α_j||_{C¹}≤1` and the comass `||dα_j||_∞≤1`; rescaling each nonzero form preserves density of the span. Use uniform C¹ bounds and quotient by overall sign for unoriented images. On the compact controlled Lipschitz graph closure, prove continuity of Φ in the C⁰ graph topology by strip Stokes and injectivity up to orientation. Equip unoriented images with the quotient metric `d_{±}([v],[w])=min(‖v−w‖_{ℓ²},‖v+w‖_{ℓ²})`; for an image C and nonempty K_c set `r_Φ(C)=dist_{d_{±}}([Φ(C)],[Φ(K_c)])`. For every η>0 choose b_η,r_η>0 such that every controlled graph with `|L_g(C)−c|≤b_η` and `r_Φ(C)<r_η` satisfies `dist_V(C,K_c)<η`. To prove this joint modulus, argue by contradiction: a violating sequence with length tolerance tending to zero and current distance tending to zero has a C⁰-convergent subsequence in the compact controlled graph closure; compactness of K_c and continuity of Φ identify its limit with a member of K_c, modulo orientation, by injectivity of the dense current tests. Thus its Fréchet distance and length difference both tend to zero, contradicting the fixed V-distance. Choose η small enough for the signed-height C⁰ chart-reset threshold as well as the desired V-neighborhood. This argument applies only on the controlled graph closure; it asserts no global inverse-continuity on V. When K_c is empty, use the separate empty-critical-set branch in R4.9.6d rather than defining r_Φ. For a smooth variation with velocity `kN` (up to tangential reparametrization), Cartan’s formula and Stokes give `d/dt ∫_{C(t)}α_j=∫_{C(t)}dα_j(kN,T)ds`; hence its absolute value is at most `||dα_j||_∞∫|k|ds`. Cauchy–Schwarz and `Σ_(j≥1)4^(−j)=1/3` give `||Φ̇||≤C_B||k||₂`, `C_B=√(B_len/3)`, whenever length≤B_len. For controlled smooth graphs in the fixed graph union with `|L_g−c|≤b₁` and `r_Φ≥r₀/2`, prove `||k||₂≥m>0`: the graph ODE gives H² control for small curvature, hence a C¹ geodesic limit in K_c and a contradiction. Crossing a width r₀/2 annulus costs at least `e=m r₀/(2C_B)` of g-length. In a single fixed graph chart put `G_min=inf_box G>0` and `v_max=sup_box sqrt(G²+p²)<∞`. From u_t=v k/G and ds_curve=v ds_base obtain `||u_t||_(L²(ds_base))≤(sqrt(v_max)/G_min)||k||_(L²(ds_curve))`. Define `C_graph=sqrt(v_max)/G_min`; crossing an actual L²(ds_base) annulus of width ρ/2 costs `mρ/(2C_graph)`.

*Needs:* R4.9.5 (`K_c`, the normal annulus), R4.9.6b (the local periodic
flow theorem and interior compactness), HopfRinow (Completed) Layers 2–3
(the exponential map giving the Fermi tubes of an embedded curve, built as in
R4.9.5), R4.9.0.

###### R4.9.6d. Family stopping and localization

After the final-neighbourhood construction in R4.9.6c, prove a global curvature gap outside that final C¹-open N_s on a strip `|L−c|≤b_gap`: `∫k² ds≥μ>0`. If embedded curves with lengths tending to c had curvature energy tending to zero, their constant-speed parametrizations would have a uniform H² bound; use covariant acceleration and the fixed smooth sphere embedding to pass to a C¹ geodesic limit. The crossing/annular arguments identify a primitive embedded geodesic of length c, and the low-order definition puts the approximating curves in N_s, a contradiction. This supplies the declared strip and curvature-energy lower bound μ. For K_c empty, the same contradiction gives a gap on the whole strip with N_s empty.

When K_c is nonempty, choose σ,δ,ε>0 with `ε<δ/4`, `max(σ,δ+ε)<min(b_gap,b_exit)`, `σ+δ+ε<e` and `c+2δ<B_len`. Thus the entire interval traversed above the low target lies inside both the curvature-gap and exit bands. For empty K_c choose the ceiling and gap-strip reserves without invoking an entry annulus or exit cost e. Choose `0<a_cut<a_cut+η_cut<c−σ` and a smooth nondecreasing chi_clock with chi_clock=0 on lengths≤a_cut and chi_clock=1 on lengths≥a_cut+η_cut. Given the ordinary smooth flow S_t(C), solve

`dt_C/dτ=chi_clock(L_g(S_(t_C)(C)))`, `t_C(0)=0`, and set `S̃_τ(C)=S_(t_C(τ))(C)`.

Prove completeness for every finite artificial time. Since 0≤chi_clock≤1, physical time cannot escape to infinity in finite τ. Approaching a finite maximal physical time would force length to zero by R4.9.6b; the scalar clock becomes stationary at positive cutoff length before that singularity. Local smooth-flow and scalar ODE dependence give finite-time smooth-family continuity; the smooth flat cutoff has no corner at L=a_cut. The positive cutoff makes every finite artificial time well-defined.

Put `Q_low={L<c−σ}`, `B_entry=N_s∪Q_low` and `A_end=U∪Q_low`. While a trajectory is outside N_s and above the low target, the clock has speed 1 and length decreases at rate at least μ, so it reaches the OPEN set B_entry in finite artificial time. A trajectory entering Q_low stays there. After entry into N_s, any exit from U while still above c−σ would cost e, exceeding the available length reserve σ+δ+ε; it therefore reaches Q_low first. This proves post-entry confinement from B_entry into A_end. The post-entry conclusion applies to trajectories entering N_s. For empty K_c take B_entry=A_end=Q_low and use only the gap and monotone length.

For a compact smooth-topology family, choose at each parameter a finite time whose image lies in the open B_entry. Continuity gives an open parameter neighborhood landing in B_entry at that same time. A finite subcover and the maximum of these artificial times are valid: all parameters have entered B_entry and stay in A_end thereafter. More generally, for a locally finite partition of unity on the compact parameter image, suppose every chart active at C supplies an entry time τ_i(C) for this same starting curve and same flow, with entry into B_entry. The minimum τ_min among the finitely many active times is an actual entry; post-entry confinement keeps the trajectory in A_end for all later times. Thus any convex weighted time τ(C)=Σ_i φ_i(C)τ_i(C)≥τ_min is safe. It need not exceed every active chart's entry time. Continuity still requires the stated locally finite cover, continuous local times and common flow domain. Construct the cap on the compact parameter image by the finite/local selection below. The resulting common-time homotopy is continuous and nonincreasing in g-length.

For a V-continuous family first apply R4.9.6a with allowance ε, obtaining F⁺ continuous in V globally and in C∞ away from its original point locus. The compact subset `P_high={p:L_g(F⁺(p))≥c−σ}` is disjoint from that locus and carries the preceding finite-cover construction; all remaining endpoints are already in Q_low and stay there. Near any point parameter, actual V-continuity of F⁺ fixing that point gives `L_g(F⁺(p))<a_cut`, so the clock is stationary there. This point-neighborhood argument uses the actual vanishing length at the point locus. Concatenate regularization and this slowed g-flow. It fixes all input points and stays below `c+δ+ε<c+2δ`, with endpoint in A_end. One clock and time chosen for a family restrict to its faces;6e constructs the exact cubical descent and compatible-choice comparisons from those intrinsic data.

*Needs:* R4.9.6c (the final neighbourhood `N_s` and exit cost), R3.1 (H²
bounds and C¹ limits of constant-speed parametrizations), R4.9.5 (crossing
and annular arguments), R4.9.6b.

###### R4.9.6e. Intrinsic relative cubical construction and restriction laws

Choose the regularization cap on the compact image K_image=u(P) in V. On K_image outside the point locus use the local common-survival and g-length allowance neighborhoods to construct a continuous positive cap b(C), shrinking it to zero as C approaches A; set b=0 on K_image∩A. This is a continuous selection from actual admissible intervals [0,b_local(C)], constructed by a locally finite partition on the metrizable positive-length locus. Halve a cap to leave a reserve. The regularization `S_round(C,s b(C)/2)` therefore depends on the input image C itself. Prove its continuity, all-point fixation and the same length bound. For positive-time smooth dependence at nonpoints consume the actual common-survival normal-graph parameter-dependence theorem in R4.9.6a. Use one cap on the union of the compact images of all faces in the chosen finite family, rather than independently selecting incompatible face times.

Suppose a finite cubical or simplicial parameter presentation has actual face-identification maps and its input u is equal on the identified faces. The equality may arise from reversal of contour parametrization; V already identifies that reversal. The intrinsic cap gives equal regularized curves on those faces, and the same length cutoff chi_clock and common artificial time give equal subsequent curves. Prove the equality at every homotopy time and descend the entire construction through the finite parameter quotient. Point-valued faces and every other originally point-valued parameter are fixed throughout. Construct the induced relative singular-chain prism and subdivision maps and prove their boundary formulas on the supplied AT singular carrier. This is a reusable relative-family output. The width-realization argument consumes the finite-chain adapter and AT prism/subdivision identity; it does not require every reusable cover/choice API below.

On the pullback cover u*E, lift the homotopy starting from its tautological initial side: construct `H̃:u*E×I→E` over H, with H̃((p,e),0)=e. This does not choose a global side section on P. Prove existence and uniqueness by local cover charts and finite parameter-prism subdivision, with the empty/full data fixed on point parameters. Uniqueness gives deck-exchange equivariance and all face/restriction laws, including orientation-reversing presentation identifications. This exports the pulled-back side data and relative-cover compatibility for later consumers; it is not an extra premise of the cap localization argument. No CW-type hypothesis on V is used.

For two admissible intrinsic caps on the same compact image, their convex interpolation stays positive off A and vanishes on A. It remains below the pointwise maximum of the two safe caps, whose whole interval is admissible. Apply regularization and the finite-cover clock construction to this joint compact comparison family. Choose one common artificial endpoint time at least as large as the two previously selected times and all joint-family entry times. At either end enlarge the old clock time to the common time; post-entry confinement keeps those endpoints in the low union. The middle comparison uses the same common time. This constructs an actual comparison of the shortening choices, with the original point locus fixed, the same length ceiling and localized endpoints. The same method on any required finite product of parameter cells supplies compatible finite higher comparisons. The estimates in R4.9.6a and R4.9.6d use compact parameter families, so these comparison products do not require a dimension-dependent geometric cell bound. Restriction of jointly chosen data is the declared face law.

Construct the finite parameter geometry API independently for the selected dimension≤3 cycle carriers: embed each triangulated carrier into R⁷ by moment-curve vertices and prove simplex intersections and relative-face identifications. For finite parameter cutoffs consume native Besicovitch's finite-dimensional theorem, whose conclusion is disjoint closed-ball color families and an open-ball cover; construct the finite extraction, shrunk cover and supported cutoffs. These finite-dimensional embedding and covering results are additional reusable outputs alongside the shortening and cap-localization theorem. The main localization proof chooses σ,δ from geometric entry/exit reserves; family mesh and the number of cells may vary.

*Needs:* R4.9.6a–R4.9.6d (regularization, flows, exit costs, stopping),
R4.9.3 (finite polyhedral carriers), Mathlib
`Besicovitch.exist_disjoint_covering_families` (finite parameter cutoffs),
R4.9.1 (the cover E and its lifting).

##### R4.9.7. Cap localization, realization and three images

Prove the singular-chain localization lemma using the shortening theorem and the R4.9.3 finite relative-chain adapter, which realizes finite relative representatives with their polyhedral face identifications. Consume AlgebraicTopology’s singular small-chain theorem and subdivision chain homotopy, together with its cap-product boundary identity and relative-chain prism formula. Apply these identities to the shortened representative to show it still represents z_(i+1); use the finite-chain adapter and relative prism identity in the realization. If c_i=c_(i+1)=c and `a_cover|U=0` for an open U⊃K_c, deform a finite representative of z_(i+1) below c+δ. Subdivide subordinate to V^(<c−σ)∪U. Choose a cohomologous absolute cocycle for a_cover vanishing on U by extending its coboundary correction. Its cap kills U-supported pieces and gives a representative of z_i below c−σ. Prove the actual relative-boundary, cap and homotopy identities, contradicting the width. The acting class is absolute and the homology target remains relative to A.

If adjacent widths agree, K_c meets every point p, since otherwise U=V_p and the avoidance section would give a_cover|U=0. Consequently K_c contains infinitely many images globally: finitely many rectifiable images have area zero and cannot cover S². This gives at least one geodesic through each point, not an infinite family through each point. If K_(c_i) were empty, apply the shortening with U=∅ to lower its nonzero minimax class; hence every width is realized. Three distinct widths give three different images by length. An equal adjacent pair gives infinitely many images and therefore at least three. These alternatives prove the arbitrary-smooth-metric theorem, including geodesic degeneracies, with all reparametrizations and reversal already identified.

*Needs:* R4.9.6 (uniform shortening and the restriction laws), R4.9.3 (the
finite relative-chain adapter and widths), R4.9.2 (the classes and their
pairings), R4.9.1 (the `V_p` sections), R4.9.5 (`K_c`), AlgebraicTopology
Stage 6 (singular small chains, subdivision, cap-product boundary identity),
R4.6 (short-geodesic uniqueness for the three-image conclusion).

The covering, model and comparison APIs serve geometric topology without changing
its canonical volume or three-dimensional geometric-structure objects.

### Examples

On the unit `S²`, `inj=π` and `Vol(B(p,r))=2π(1−cos r)`, which is equality
in both Günther's and Bishop–Gromov's comparisons; `RP²` with the quotient
metric has `inj=π/2` and area 2π; the unit `Sⁿ` makes Bonnet–Myers sharp
(diameter π for `Ric=(n−1)g`); and on the round `S²` the three coordinate
great circles realize the common width 2π of the three minimax classes.

### Dependencies

Layer 4 uses Layers 1–3, HopfRinow (Completed), UniversalCovers (Completed),
SmoothBundlesConnections B2–B6.0, GeometricTopology Layers 1 and 7–8,
AlgebraicTopology Stages 4.6, 6 and 8, DifferentialGeometry Layers 2 and 10,
DGFloer Layer 1 and Tau Ceti's volume, exponential, isometry, hyperbolic and
real-projective declarations. Construct R4.6's cut-locus and nullity results
before R4.1's polar integration; R4.1's global equality conclusion has its own
complete-cover argument. R4.3 constructs the universal-cover manifold, its
second countability and complete pullback metric before R4.5 applies the
sine-test bound upstairs; finite `π₁` is a conclusion after compactness, not a
hypothesis of that construction. R4.7 consumes Layer 1's round sphere model,
and its real-projective example uses the antipodal quotient and the
projectivization atlas without a global space-form classification. R4.8 uses
R3's finite approximations, the path carrier of R3 and AlgebraicTopology
8.11a, and DGFloer's Moore comparison; DGFloer's free-loop Morse–Bott theory
keeps its own scope. R4.9 uses R4.6's short-geodesic and injectivity
estimates, the geodesic ODE, ConformalMapping (Completed) L3/L5,
GeometricMeasureTheory G1 and G3–G6, Isoperimetry I3/I6 and
CharacteristicClasses C1.5/C2/C3. Its topological order is the
Fréchet-plus-length curve space and component cover, the relative cocycle and
finite Thom detection, the positive widths and finite parameter carriers.
The shared periodic normal-graph theorem, the zero-number theorem, interior
parabolic compactness and the scalar Harnack inequality feed their round and
arbitrary-metric applications; the fixed-endpoint construction separately
uses the Dirichlet boundary theorem. The round small-length two-point
comparison precedes its Type II exclusion and its circular Type I and
stability output, and the final entry neighbourhoods consume the local exit
constants before the global curvature-gap theorem. The round branch then
constructs its finite-length Jordan smoothing and trace and its weak-set
avoidance; its finite-collapse conclusion consumes the arbitrary-metric
finite-time alternative and the Gauss–Bonnet area equation, while the
asymptotics at circular singularities and the convergence to great circles
are separate outputs with the routes stated in R4.9.6a. The arbitrary-metric
branch separately proves the finite-time exclusions, the immortal derivative
estimate, compactness of the primitive geodesic sets and the local graph and
exit estimates. The family clock, the intrinsic restriction and cubical
face-identification laws and the compatible-choice comparisons feed the
finite-family localization and the cap localization and realization. No
minimax or three-geodesic conclusion is an input to either flow analysis.

## Layer 5: immersions and volume variation

### R5. Isometric immersions and minimal geometry

#### R5a. Immersion geometry and first variation

For a smooth isometric immersion f:M→N, construct the tangent/normal orthogonal
splitting of f*TN and the pullback ambient connection. For embeddings compare the
orthogonal-complement normal bundle, topology and smooth structure literally with
GT Layer 1; for immersions use the pullback fibers, without identifying distinct
points of M. Prove the induced tangential connection is Levi-Civita, define B,
the normal connection and S, and prove tensoriality/symmetry/self-adjointness,
frame/normal-change laws and smoothness. Include Gauss, Codazzi and Ricci
equations with the pinned signs, their sectional contraction, and Theorema
Egregium for surfaces and higher-dimensional hypersurfaces. By pair symmetry
they determine every component with at least three tangent slots and
⟨R^N(X,Y)η,ξ⟩; first Bianchi also determines the X↔Y-antisymmetric part
of ⟨R^N(X,η)Y,ξ⟩. Its symmetric part, the one-tangent components and the
all-normal components are not determined by these equations. Compare a
geodesic in hyperbolic space with a Euclidean line for the mixed-sectional case.
For tangent X,Y,Z,W and normal η,ξ pin
`⟨R^M(X,Y)Z,W⟩=⟨R^N(X,Y)Z,W⟩`
`+⟨B(X,W),B(Y,Z)⟩−⟨B(X,Z),B(Y,W)⟩`,
`(R^N(X,Y)Z)^⊥=(∇^⊥_X B)(Y,Z)−(∇^⊥_Y B)(X,Z)`, and
`⟨R^⊥(X,Y)η,ξ⟩=⟨R^N(X,Y)η,ξ⟩+⟨[S_η,S_ξ]X,Y⟩`,
with the normal covariant derivative of B also differentiating its tangent slots.

The second fundamental form B, the shape operator S and the mean curvature H are
definitions with the following unit tests.

**Checks.**
- Unit sphere Sᵐ⊂ℝᵐ⁺¹ with outward normal ν=x: `B(X,Y)=−⟨X,Y⟩x`, `S_ν=−Id`,
  `H=−x` (R5a.2's "H=−position"), and the pinned Gauss equation gives
  `⟨R(X,Y)Z,W⟩=⟨X,W⟩⟨Y,Z⟩−⟨X,Z⟩⟨Y,W⟩`, so K=1 on every two-plane; the Gauss
  equation with the two B-terms exchanged would give K=−1.
- Clifford torus `S¹(1/√2)×S¹(1/√2)⊂S³`: principal curvatures ±1, so
  `B(e₁,e₁)=ν`, `B(e₂,e₂)=−ν`, `B(e₁,e₂)=0`, H=0 and `|B|²=2`; Gauss gives
  `K=1+⟨B(e₁,e₁),B(e₂,e₂)⟩−|B(e₁,e₂)|²=1−1=0`, the flat torus. It is minimal but not
  totally geodesic, so a definition identifying minimality with B=0 is wrong.
- Round cylinder `S¹×ℝ⊂ℝ³`: `B(∂_θ,∂_θ)=−ν`, `B(∂_z,·)=0`, so H=−ν/2≠0 while
  Gauss gives K=0 (Theorema Egregium: the cylinder is intrinsically flat); a
  definition reading minimality off K would call it minimal.

*Needs:* R1 (Levi-Civita connection, curvature tensor and its symmetries), SBC
B2–B5 (pullback bundles, metric connections and their induced derivatives), GT
Layer 1 (normal bundle of an embedding), DG Layers 0–3 (induced metrics,
orthogonal splittings), R4.7 (the hyperbolic-space geodesic for the
mixed-sectional comparison).

##### R5a.1. Orientation-free C² relative volume

Own the C² regularity of the relative-volume functional on these same immersion carriers,
without requiring orientability of the source P. Take a jointly smooth
family of immersions F_t:P→N, F_0=f, for t in an open interval about 0.
For compact P, including smooth boundary or corners, impose no support restriction
on the family for this C² regularity theorem. For noncompact P require F_t=f
outside one fixed compact subset of the interior, uniformly in that interval. Use the native
orientation-free measure `TauCeti.riemannianVolume` for g_0=f*g_N.
Define the positive relative density J_t by the square root of the
Gram determinant of g_t=F_t*g_N relative to g_0, and prove
`dvol_(g_t)=J_t dvol_(g_0)`. Prove chart/basis independence, compatibility
with DG Layer 12's volume densities and with the positive oriented volume form
when an orientation is chosen. This is a density comparison on the same
metric, not a second Riemannian measure.

On each compact parameter subinterval, use compactness of P (in the compact
case), or of the fixed variation support (in the noncompact case), and positivity
for uniform lower Gram and parameter-derivative bounds. Prove the relative-volume functional
`V(t)=∫_P(J_t−1) dvol_(g_0)` is C² and compute its first two derivatives
by differentiation under the integral. On a compact source compare it to
`Vol(F_t)−Vol(F_0)`. On a noncompact source J_t−1 and its relevant derivatives
have the fixed compact support, so V is finite without finite total volume.
The compact case includes pointwise fixed-boundary families F_t|∂P=f|∂P
without requiring them to be fixed on a collar; the C² regularity assertion also
allows moving boundary values and asserts no boundary-variation formula.
Compact interior support on noncompact sources and its smooth-domain restrictions
retain the support-away-from-boundary hypothesis. State explicit mixed parameter/
spatial regularity hypotheses for any finite-regularity extension; joint
smoothness supplies all required derivatives here.

This construction uses only native metric/volume calculus, DG Layer 12 and the
earlier immersion carriers. R5a.2's first variation and R5b's Hessian use this
same relative-volume functional. CalibratedGeometry C3 consumes its C²
dependence and supplies the comparison with C2's oriented chain integration.

The relative density `J_t` and the relative-volume functional `V(t)` are
definitions with the following unit tests.

**Checks.**
- Dilation of the unit sphere: `F_t(x)=(1+t)x` on `Sᵐ⊂ℝᵐ⁺¹` has
  `g_t=(1+t)²g_0`, so `J_t=(1+t)ᵐ`, `V(t)=((1+t)ᵐ−1)Vol(Sᵐ)`,
  `V′(0)=m·Vol(Sᵐ)` and `V″(0)=m(m−1)Vol(Sᵐ)`; the first derivative agrees
  with R5a.2's `−m∫⟨H,X⟩` for `X=x` and `H=−x`.
- A segment tilted in the plane: `F_t(s)=(s,ts)` on `P=[0,1]` has
  `g_t=(1+t²)ds²`, `J_t=√(1+t²)`, `V(t)=√(1+t²)−1`, `V′(0)=0` and `V″(0)=1`;
  a density without the square root, the Gram determinant ratio `1+t²`
  itself, would give `V″(0)=2`.
- A compactly supported graph over the noncompact line: `F_t(s)=(s,tφ(s))`
  with φ smooth of compact support has `V(t)=∫(√(1+t²φ′²)−1)ds`, finite
  although `Vol(ℝ)=∞`, and `V″(0)=∫φ′²ds`; the uncorrected
  `Vol(F_t)−Vol(F_0)` is `∞−∞` here.

*Needs:* R5a (immersion carriers and induced metrics), Tau Ceti
`TauCeti.riemannianVolume`, DG Layer 12 (volume densities and the density/measure
bridge), Mathlib `hasDerivAt_integral_of_dominated_loc_of_deriv_le`
(differentiation under the integral) and the smoothness of `Matrix.det` on the
Gram matrices, SBC B5.0 (jointly smooth families of immersions).

##### R5a.2. First variation and immersion examples

Build the principal-curvature and averaged-H APIs; prove total geodesicity iff
B=0 and hence minimality. For compact boundaryless immersions, and for
compactly supported variations on noncompact boundaryless immersions, derive
the first volume variation
`δVol=∫div_M X^⊤−m⟨H,X^⊥⟩`; compact support kills the divergence term.
Stationarity is equivalent to H=0. In Euclidean space prove `Δ⁺f=−mH`, hence
minimality iff all coordinate functions are harmonic. For submanifolds of a
round sphere prove the sphere/Euclidean mean-curvature dictionary and the
minimal cone equivalence away from the cone vertex. For an m-dimensional
submanifold of the unit sphere, pin
`H_C(rx)=m/((m+1)r)·H_M(x)` for r>0, using the spherical H_M and the
(m+1)-dimensional Euclidean cone.

Give reusable coordinate formulas for induced metrics, Christoffel coefficients,
B, S, H and K; the cross-product formula raises an index with the inverse first
fundamental form. Compute the unit round sphere in stereographic coordinates, with
`g_ij=4δ_ij/(1+|x|²)²`,
`Γ^k_ij=−2(δ^k_i x_j+δ^k_j x_i−δ_ij x_k)/(1+|x|²)`, K=1 and H=−position. Compute the
helicoid `(u,v)↦(v cos u,v sin u,a u)` with pitch a≠0
(H=0, K=−a²/(a²+v²)²), and the paraboloid `(u,v)↦(v cos u,v sin u,v²)`
on v>0 (with a separate Cartesian chart at its vertex),
`K=4/(1+4v²)²` and `H=(2+4v²)/(1+4v²)^(3/2)·ν`,
where `ν=(−2v cos u,−2v sin u,1)/√(1+4v²)`.

For surfaces of revolution `(u,v)↦(f(v)cos u,f(v)sin u,g(v))`, assume f>0 and
`f′²+g′²>0` on the coordinate interval. Compute the metric, all Christoffel
symbols and geodesic equations; for arclength geodesics prove Clairaut's
`f(v)cos β=f(v)² u′` is constant, with β the angle to the parallel circle
direction. Classify regular rotational minimal surfaces
locally: planar pieces and the catenoid family, with complete connected
nonplanar rotational examples classified up to rigid motion and scaling.
Derive the correct generating-curve ODE without assuming g is an invertible
parameter at every point. On the complete paraboloid prove every nonmeridional
geodesic has infinitely many self-intersections by its conserved angular
momentum, a unique turning radius and reflection symmetry for the **maximal
all-time nonconstant** geodesic; establish the
needed ODE limit estimates rather than inferring derivative limits from
bounded monotonicity. Prove its vertex has no conjugate points by explicit
radial/rotational exponential variations despite positive K.

*Needs:* R5a (B, S, H and the Gauss equation), R5a.1 (the relative-volume
functional and its first derivative), DG Layer 12 (divergence theorem, DG Green),
R4.7 (round sphere and its stereographic chart), R2 (Jacobi fields and conjugate
points for the paraboloid), HopfRinow (Completed) Layers 2–4 (geodesic equations
and completeness of the paraboloid).

#### R5b. General normal second variation and hypersurface stability

This item consumes R5a's immersion geometry, R5a.1's orientation-free
C² relative-volume lemma and R5a.2's first variation. CalibratedGeometry C3
also consumes R5a.1; R5b has no CalibratedGeometry input. No current,
minimizing-regularity or positive-mass theorem is an input here.

For a smooth minimal isometric immersion f:P^m→N and smooth compactly
supported normal fields V,W, construct their smooth normal variations
using the pullback normal bundle and the ambient exponential on its
actual local domain. The sources may be nonorientable. On noncompact P,
vary only a compact region containing the variation support and use R5a.1's
relative-volume functional rather than a possibly infinite total volume.
For sources with boundary use variations fixed on a neighborhood of that
boundary. Prove acceleration independence at minimality and the polarized
second-volume-variation formula for normal fields at a minimal immersion:

`Q(V,W)=∫[⟨∇⊥V,∇⊥W⟩−Σ_i⟨R^N(V,e_i)e_i,W⟩`
`−Σ_ij⟨B(e_i,e_j),V⟩⟨B(e_i,e_j),W⟩] dvol_P`.

Prove frame independence, symmetry, compact-support locality, smooth
isometry transport and the actual normal Jacobi differential operator,
its ellipticity, principal symbol and formal self-adjointness. Stability
means Q(V,V)≥0 for every such normal section. Do not identify normal
sections with scalar functions unless a global unit normal is supplied.

For a two-sided hypersurface choose a smooth unit normal ν, set
`A(X,Y)=⟨B(X,Y),ν⟩`, and construct the hypersurface Jacobi operator
`L=Δ⁺−(|A|²+Ric_N(ν,ν))`. Prove
`Q(φν,ψν)=∫[⟨∇φ,∇ψ⟩−(|A|²+Ric_N(ν,ν))φψ]=∫φ Lψ`.
With R5a's B convention, the derivative of trace scalar mean curvature
at a minimal hypersurface is `−Lφ`; that of the averaged scalar mean
curvature is `−Lφ/m`, m>0. Prove these actual linearizations, normal-reversal
and orientation independence. On a one-sided hypersurface give the normal
line-bundle form and its double-cover scalar description with deck-odd
sections, not the scalar inequality for every function on the cover.

Prove the W¹,²_0 quadratic-form extension on relatively compact smooth
domains and its agreement with the smooth form. Consume PDE A.1–A.6, D.16–D.19
and E.20–E.22's Sobolev, trace and bounded-domain elliptic/Dirichlet estimates, and
the abstract coercive, compact-form and represented-operator comparisons of
VariationalMethods §2.3–§2.4 and Layers 3–5.2, consuming
UnboundedOperators §4.7's single generic closed-form representation. Own their finite-chart Riemannian normal-bundle specialization:
actual metric/connection weights, trace-compatible transitions, bounded curvature
potential, coercive shift, form closure and compact embedding. Construct the
Dirichlet self-adjoint realization, domain/regularity comparison, compact resolvent
and variational eigenvalue/index statements on those compact domains. This is not
another generic form/spectral theory; CKG K5a retains compact-boundaryless bundle
Laplace theory and PDO P5/P6 does not supply a Dirichlet boundary theorem.
Own the boundary H² estimate for the normal Jacobi operator on a relatively compact smooth domain D
with smooth boundary and the actual smooth normal bundle/connection. For its
normal Jacobi operator L, a weak u∈W¹,²₀ with Lu=f∈L² satisfies
`‖u‖_(W²,²)≤C(‖f‖_(L²)+‖u‖_(L²))`. Construct the finite-chart bundle W²,²
carrier and equivalent transition/trace norms. Prove the boundary estimate by
smooth boundary flattening, localized tangential difference quotients and the
first-order energy estimate; control connection/metric commutators and recover
the second normal derivative from the uniformly elliptic normal coefficient.
The principal symbol is the scalar metric symbol times the identity. This
boundary H² theorem is a target here, not an assumed PDE E theorem.
Own the Dirichlet-domain identification: the represented
Dirichlet operator has domain exactly W²,²(D;ν)∩W¹,²₀(D;ν), with graph norm
equivalent to W²,². Compare it with the smooth differential operator and give
interior/up-to-boundary higher regularity for smooth data by the same chart
argument. No global Fredholm claim on arbitrary noncompact P is inferred.

Own the scalar Gauss equation of a minimal hypersurface with full scalar curvature:
`Scal_P=Scal_N−2Ric_N(ν,ν)+(tr A)²−|A|²`, and
the full-scalar stability inequality: at minimality stability is
`∫(2|∇φ|²+Scal_P φ²)≥∫(Scal_N+|A|²)φ²`.
In dimension 2, `Scal_P=2K`, so the ambient full scalar appears with
coefficient 1/2 in the equivalent surface inequality. Boundary/free-boundary
formulas require their own stated variation class and outward/normal
second-fundamental-form signs; the compactly supported interior formula
does not silently include them. CalibratedGeometry C6 retains its special
Lagrangian/Hodge Hessian identity on its existing carrier.

The second-variation form Q and the hypersurface Jacobi operator L are definitions
with the following unit tests.

**Checks.**
- Clifford torus in S³: `|A|²=2` and `Ric_(S³)(ν,ν)=2`, so `L=Δ⁺−4` and
  `Q(ν,ν)=−4·Area<0`: unstable. A Jacobi operator with the potential added,
  `Δ⁺+(|A|²+Ric)`, would call every closed minimal hypersurface of `S³`
  stable, since there `|A|²+Ric(ν,ν)≥2`.
- Totally geodesic equator S²⊂S³: `|A|²=0`, `Ric(ν,ν)=2`, `Q(ν,ν)=−2·4π<0`:
  unstable, so vanishing of A alone gives no stability; a plane in ℝ³ has
  `Q(φν,φν)=∫|∇φ|²≥0` on compactly supported φ and is stable.
- Scalar Gauss equation on the Clifford torus: `Scal_P=6−2·2+0²−2=0`, the flat
  value, and the full-scalar inequality at φ=1 reads `0≥(6+2)·Area`, false,
  consistent with instability; the inequality with Scal_N replaced by Ric_N(ν,ν)
  would read `0≥4·Area`, a different false bound.
- Minimality is used: for the round cylinder of radius ρ in ℝ³ the radial variation
  changes `Area=2πρL` at first order, so Q is not its second derivative; a
  definition of Q that drops the minimality hypothesis asserts a false formula.

*Needs:* R5a (B, S, H, Gauss equation), R5a.1 (relative-volume functional, C²
dependence), R5a.2 (first variation), R1 (curvature tensor, Ricci and scalar
curvature), PDE A.1–A.6, D.16–D.19 and E.20–E.22, VariationalMethods §2.3–§2.4
and Layers 3–5.2, UnboundedOperators §4.7, PDO P1.0 (formal adjoints, principal
symbol), DG Layer 12 (DG Green), HopfRinow (Completed) Layer 2 (the ambient
exponential on its natural domain).

### Examples

The unit sphere `Sᵐ⊂ℝᵐ⁺¹` has `B=−g·x` and `H=−x`; the Clifford torus in `S³`
is minimal with `|B|²=2` and flat; the helicoid is minimal with
`K=−a²/(a²+v²)²`; and the dilation `F_t(x)=(1+t)x` of `Sᵐ` has
`V′(0)=m·Vol(Sᵐ)`.

### Dependencies

Layer 5 uses Layer 1, SmoothBundlesConnections B2–B5, GeometricTopology
Layer 1, DifferentialGeometry Layers 0–3 and 12, R4.7's model spaces and, for
R5b, PDE, VariationalMethods §2.3–§2.4 and Layers 3–5.2 and UnboundedOperators
§4.7. The order is immersion geometry, then R5a.1's density calculus, then
R5a.2 and R5b. CalibratedGeometry C3 consumes R5a.1; neither its calibrated
minimization nor GeometricCurrents regularity enters R5b.

## Layer 6: focal points and squared distance

### R6. Focal geometry and squared-distance Morse functions

Define the normal exponential on its open natural domain
`{(p,v)∈νM | v∈expDomain(f(p))}` as the ambient exponential restricted to the
normal bundle. GeometricTopology Layer 1 owns the embedding total-space bundle
and the tubular neighbourhood theorem; R6 owns the normal exponential, its
natural-domain openness and smoothness, derived from HopfRinow's open
`expDomain`, its smooth exponential and the tangent-bundle exponential lemmas.
For complete ambient N the
domain is all of νM. R6 owns focal critical-point and index/Hessian geometry.
For general immersions use R5a’s pullback normal bundle and the same ambient
exponential formula, comparing the embedding specialization to GT literally.
Define a focal point as a critical domain point, with multiplicity the kernel
dimension there; the focal set in N is the image of those points. Distinct
critical domain points can give the same ambient value with different
multiplicities. The zero section is nonfocal. For t₀>0 characterize its kernel
by nonzero Jacobi fields satisfying
`X(0)∈T_pM`, `(D_tX)(0)+S_(γ′(0))X(0)∈ν_pM`, `X(t₀)=0`.
Prove the converse geodesic-variation realization and compare derivatives of
normal exp in base/fiber directions with the induced normal connection.
Manifold Sard then proves the focal set has measure zero for the ambient
Riemannian measure; relate chart Lebesgue nullity to the canonical density.

For a finite interval a<b, a geodesic γ normal to the immersed initial
submanifold at γ(a)=f(p), and final endpoint fixed, use the subspace
V_M0={X | X(a)∈range(df_p) and X(b)=0} of R3's ambient continuous
piecewise C¹ interval sections. Identify T_pM with range(df_p) by the
immersion differential. Restrict the bulk index integral to V_M0 and set
`I_M(X,Y)=I_bulk(X,Y)−⟨S_(γ′(a))X(a),Y(a)⟩`.
Construct its inclusion of V₀₀ and prove the restriction is exactly R3's I.
Prove its smooth/piecewise C¹/H¹ comparisons on this mixed subspace using
the endpoint traces; do not impose a derivative condition on every test field.
Integration by parts identifies its kernel with Jacobi fields satisfying
`(D_tX)(a)+S_(γ′(a))X(a)∈ν_pM` in addition to the two value conditions.
Prove the converse normal-geodesic variation realization, finiteness and
attainment of index, the sum of focal multiplicities strictly inside (a,b),
and focal nullity at b. State the nonfocal-endpoint specialization explicitly.
Passing an interior focal point produces a shortening variation with its
initial point still in M. As a regression, for the unit circle in ℝ²,
p=(1,0), γ(t)=(1−t,0) and X(t)=(1−t/b)(0,1), prove
`I_M(X,X)=1/b−1`: it is negative for b>1 and X is a nonzero kernel
field at b=1. R3's endpoint-zero Euclidean form has neither conclusion.

In Euclidean ambient space compute the normal-exponential derivative block and
`det(I−tS_v)`. Focal times along a unit normal are 1/κ_i for nonzero principal
curvatures, with multiplicity; retain both signs of t and use t>0 for the
chosen forward normal ray. For `h_q(p)=|f(p)−q|²`, criticality is normality
and Hessian is `2(g−⟨B, q−f(p)⟩)`; at q=f(p)+tv this is 2(I−tS_v).
Identify degeneracy/focality and count negative Hessian directions by the
segment f(p)+sv, 0<s<1 when q=f(p)+v: the index of h_q at p is the sum
of those focal multiplicities (Milnor, *Morse Theory*, §6, Lemma 6.5), with
endpoint focality counted as nullity instead of index. Compare with actual
`TauCeti.manifoldMorseIndex` in `Morse/Index.lean`.

Tau Ceti supplies the squared-distance exhaustion and genericity theorems,
and R6 consumes them. `TauCeti.ae_isMorse_norm_sq_sub_comp`
(`Geometry/Manifold/Morse/SquaredDistance.lean`) proves that for a smooth
immersion f of a second-countable boundaryless manifold into a
finite-dimensional real inner product space and almost every q, for every
Haar measure, `h_q(p)=|f(p)−q|²` is a Morse function; its `C²` version
`TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp`
proves that every critical point is nondegenerate. Neither needs the image to
be closed (Milnor, *Morse Theory*, §6, Theorem 6.6, there for submanifolds).
`TauCeti.isProperMap_norm_sq_sub_comp` (`Topology/Maps/Proper/Metric.lean`)
proves that `h_q` is proper for every q when f is a closed embedding. Hence
for a smooth closed embedding `h_q` is a proper Morse function for almost
every q. An arbitrary nonclosed embedding does not give a proper exhaustion:
the open unit disc in ℝ² with q=(2,0) has no minimum of `h_q`. R6 owns the
geometric reading of these theorems: `h_q` has a degenerate critical point
at p exactly when q−f(p) is normal at p and (p,q−f(p)) is a critical point
of the normal map (p,v)↦f(p)+v, so the exceptional set of q is the focal
set. Own the two chart lemmas this identification uses: in a chart x↦f(x)
of a C² embedding, `∂_i∂_j h_q=2(⟨∂_i f,∂_j f⟩+⟨∂_i∂_j f,f−q⟩)`, and for a C¹
normal field ν along f, `⟨∂_i∂_j f,ν⟩=−⟨∂_i f,∂_j ν⟩`. Compare these chart
second derivatives with R5a's intrinsic B/S and normal connection, proving
the Euclidean Hessian and normal-exponential derivative-block formulas on
the shared normal bundle and recovering `2(g−⟨B,q−f(p)⟩)` at a critical
point.

GeometricTopology Layer 1 supplies the normal bundle of an embedding and the
tubular neighbourhood theorem; at the pin,
`TauCeti.exists_isTubularNeighborhood_normalBundle` in
`TubularNeighborhood/Euclidean.lean` gives the Euclidean normal tube of a C²
embedding of a compact manifold. R6 owns the ε-tube inversion for
closed-image Euclidean embeddings: the scaled-positive-Hessian argument gives,
for every ε>0 below the injectivity threshold of the normal tube, a
nearest-point retraction with C¹ inverse for C² embeddings and smooth inverse
for smooth embeddings, and compactness supplies a uniform radius. These
Euclidean constructions are independent of R1–R4; the focal/Jacobi/index
consequences follow from R2–R4.

**Checks.**
- Normal exponential of the unit circle in ℝ² along the inward unit normal
  ν: `(p,tν)↦(1−t)p`, with `det(I−tS_ν)=1−t` for `S_ν=Id`; the only focal
  time is t=1 (the centre), of multiplicity 1, and along the outward ray there
  is none. For the unit sphere `S^(n−1)⊂ℝⁿ` the centre is focal with
  multiplicity n−1, and a plane in ℝ³ has no focal points since S=0. A
  definition with the opposite sign of S would place the focal point at
  t=−1, behind the curve.
- For the point submanifold M={p} the normal exponential is `exp_p` and the
  focal points are the conjugate points of p: none in ℝⁿ, the antipode at
  distance π on the unit sphere with multiplicity n−1.
- `I_M` on the unit circle, p=(1,0), γ(t)=(1−t,0), `X(t)=(1−t/b)(0,1)`:
  `I_bulk(X,X)=∫₀ᵇ|X′|²=1/b`, the boundary term is `−⟨S_(γ′(0))X(0),X(0)⟩=−1`,
  so `I_M(X,X)=1/b−1`; without the boundary term the form would be positive
  for every b and the focal point at b=1 invisible.

*Needs:* Mathlib `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`
(equal-dimension Sard in a chart), DifferentialGeometry Layer 10 (manifold
Sard), GeometricTopology Layer 1 (normal bundle, tubular neighbourhood),
Tau Ceti `TauCeti.exists_isTubularNeighborhood_normalBundle`,
`TauCeti.manifoldMorseIndex`, `TauCeti.ae_isMorse_norm_sq_sub_comp`,
`TauCeti.ae_forall_isManifoldNondegenerateCriticalPoint_norm_sq_sub_comp` and
`TauCeti.isProperMap_norm_sq_sub_comp`, HopfRinow (Completed) Layers 2–3 (exponential
domain), R2 (Jacobi fields), R3 (index form), R5a (B, S, normal connection),
R4.2 (moving-endpoint first variation).

### Examples

For the unit circle in ℝ² the centre is the only focal point along the inward
normal, at t=1, and `I_M(X,X)=1/b−1` for the test field of R6. On the unit
`S^(n−1)⊂ℝⁿ` and q≠0, `h_q(p)=1−2⟨p,q⟩+|q|²` has exactly the critical points
`±q/|q|`, of indices 0 and n−1, while q=0, the focal point, makes `h_q`
constant.

### Dependencies

Layer 6 uses R5a's immersion carriers, GeometricTopology Layer 1 for the
normal bundle and the tubular neighbourhood theorem, DifferentialGeometry
Layer 10 (Sard) and Tau Ceti's squared-distance Morse and properness
theorems. Its Euclidean chart comparison follows R5a; the general focal,
Jacobi and index theory then uses Layers 2–3 and R4.2's moving-endpoint first
variation.

## Layer 7: Bochner identities and curvature vanishing

### R7. Rough Laplacians, Weitzenböck and curvature vanishing

#### R7.0. Scalar Bochner identity and the first positive eigenvalue

Tau Ceti supplies the scalar Bochner identity and the Lichnerowicz estimate,
and R7.0 consumes them. For a smooth real function f on a Riemannian manifold,
`TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient`
(`Geometry/Manifold/Riemannian/Bochner.lean`) proves
`Δ|grad f|²=2|Hess f|²+2⟨grad f,grad Δf⟩+2Ric(grad f,grad f)` for
`Δ=div grad`, Tau Ceti's `TauCeti.Manifold.laplaceBeltrami`, with `|Hess f|²`
computed in an orthonormal basis; and
`TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`
(`Geometry/Manifold/Riemannian/Lichnerowicz.lean`) proves that on a closed
manifold of dimension n≥2 with `Ric≥(n−1)k g`, every λ>0 with a nonzero
smooth f satisfying `Δf=−λf` has `λ≥nk` (Lichnerowicz's estimate, as recalled
in Wei, *Manifolds with a lower Ricci curvature bound*, p. 7). In this roadmap's positive
convention `Δ⁺=−Δ` the identity reads
`Δ⁺|df|²+2|Hess f|²+2Ric(grad f,grad f)=2⟨df,dΔ⁺f⟩` and the eigen-equation
reads `Δ⁺f=λf`; prove this sign dictionary together with frame, coordinate,
isometry and pullback invariance. The identity is local, needs no
compactness, Hodge theorem, cohomology or spin structure, and includes
dimensions 0 and 1.

R7.0 owns the equality case: on a closed connected manifold of dimension n≥2
with `Ric≥(n−1)k g` and k>0, an eigenfunction with `λ=nk` satisfies
`Hess f=−kf g`; [Yamabe Y9](../Yamabe/README.md#y9-existence-uniqueness-and-rigidity)
supplies the separate Obata rigidity theorem identifying the round sphere.
The eigenvalue and equality statements need n≥2 and a nonzero eigenfunction;
the first positive eigenvalue itself comes from K5a's compact scalar spectral
construction. In dimension 1 the Ricci bound is vacuous and gives no bound
depending on k: a circle of circumference L has first positive eigenvalue
`(2π/L)²`. A connected manifold of dimension 0 is a point and has no positive
eigenvalue. Boundary and noncompact statements keep their boundary or
compact-support terms instead of applying the closed integral argument. This
refines the scalar consequence of R7's Weitzenböck calculus without consuming
its later harmonic-form vanishing theorems.

**Checks.**
- Unit `Sⁿ`, n≥2, with k=1: the coordinate function `f=x₁` satisfies
  `Δ⁺f=nf` and `Hess f=−f g`, so λ=n=nk attains the bound and satisfies the
  equality equation; with `Δ⁺=+Δ` the eigen-equation would read `Δ⁺f=−nf`
  and the bound would be reversed.
- Bochner identity on ℝ with `f=x²/2`: `|df|²=x²`, `Δ⁺|df|²=−2`,
  `|Hess f|²=1`, Ric=0 and `Δ⁺f=−1`, so the left side is `−2+2=0` and the
  right side is `2⟨df,d(−1)⟩=0`.
- Dimension 1: on the circle of circumference 4π the first positive
  eigenvalue is ¼, below `nk=k` for every k>¼, although `Ric≥(n−1)k g=0`
  holds; the bound n≥2 is needed.

*Needs:* Tau Ceti `TauCeti.Manifold.laplaceBeltrami`,
`TauCeti.Manifold.laplaceBeltrami_norm_sq_mgradient` and
`TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`, R1
(curvature commutation of third derivatives, Ricci tensor), PDO P1.0 (the
scalar Laplacian `Δ⁺=−div grad` as the rough Laplacian on functions), DG
Layers 5–10 and 12 (gradient, Hessian, divergence, DG Green), K5a (the compact
scalar spectral construction and its first positive eigenvalue), Yamabe Y9
(Obata rigidity).

#### R7.1–R7.8. Bundle identities and geometric consequences

1. On actual finite-rank metric bundles with compatible connections, consume
   PDO P1’s rough-Laplacian definition, invariant negative covariant trace,
   formal L² identification with ∇*∇ and nonnegative energy identity.
   Specialize those supplier identities to geometric moving frames and
   coordinates: `∇*∇φ=−Σ(∇_ei∇_eiφ−∇_(∇_ei ei)φ)`; the shorter sum
   is valid only in a normal frame at its center. Supply the geometric product
   rule `∇*∇(fφ)=(Δ⁺f)φ−2∇_(grad f)φ+f∇*∇φ`, scalar sign, induced tensor/curvature computations and smooth
   distributional/operator-domain comparison with K5a.
2. Consume PDO P1’s differential-operator filtration on bundle sections:
   locality/restriction, order≤k via iterated commutators, principal symbol on
   symmetric cotangent tensors, connection-independent leading term, coordinate
   and covariant-derivative expansion, composition and formal adjoint symbols.
   Consume its `[D,f]` order≤k−1 theorem, geometric/Fourier symbol dictionary
   and d/d*/∇/adjoint examples for the actual DG/SBC carriers. The jet symbol
   without i and Fourier `σ(∂_j)=iξ_j` are P1’s single convention dictionary;
   use that dictionary in the geometric identities below. Degreewise d is not an
   invertible-symbol operator in dimension ≥2; in dimension 1, d:Ω⁰→Ω¹
   is elliptic. De Rham ellipticity is exactness of its symbol
   complex, while d+d* is elliptic on the sum of degrees.
3. Consume PDO P1’s Dirac/Laplace-type and Bochner-connection theorem. For
   a first-order geometric operator D:E→F with jet symbol c(ξ) and
   `c(ξ)*c(ξ)=|ξ|² Id_E`, use its **symmetric** polarization
   `c(α)*c(β)+c(β)*c(α)=2⟨α,β⟩Id_E`.
   Identify D*D’s Laplace-type symbol and its difference from the rough Laplacian for an
   arbitrary chosen metric connection by order≤1. Consume P1’s unique canonical
   Bochner connection/potential; here compute the potential for the actual
   geometric operators and identify the induced metric connection. K5a supplies
   Laplace-type estimates; PDO P5–P6 supplies the wider all-order/Lp theory.
4. On K5a’s real Gram exterior-form bundles, consume its pointwise real
   wedge/contraction adjoint and Hodge-star laws. Supply the geometric
   induced-connection and real-bundle Weitzenböck comparisons, consuming
   K5a's codifferential/Hodge-star sign identity to identify the covariant formula,
   extending the shared formal-adjoint/de Rham system. Consume SpinGeometry
   G1.2/G2.2/G3.4's wedge/contraction Clifford relations and induced
   Levi-Civita exterior connection, comparing their complexifications with
   these real Gram form bundles. Set a_i=ι_ei and a_i*=e^i∧·, and derive
   `Σ a_i*a_i=p Id`, `Σ_(i<j) a_j*a_i*a_i a_j=binomial(p,2) Id` on degree p.
   A degree 0 endomorphism of 1-forms extends as an ordinary derivation; d is a
   degree 1 graded derivation and Lie differentiation is degree 0. Identify the
   induced connection and exterior curvature action, and compute the real
   Weitzenböck potential
   `ℛ_p=−Σ_(i,j) a_i*a_j R^Λ(e_i,e_j)`.
   Prove `Δ_p=∇*∇+ℛ_p`, self-adjointness/frame independence, and ℛ_1=Ric with
   the metric musical identifications. Supply the ordered/increasing-pair
   dictionaries and Rop spectral-expression API, not just one frame formula.
5. Prove the section-norm identity
   `Δ⁺|φ|²+2|∇φ|²=2Re⟨∇*∇φ,φ⟩` and Kato's inequality. The classical derivative
   formula is on φ≠0; at its zero set prove the Sobolev weak/a.e. inequality
   using `√(|φ|²+ε²)` and the completed K5a weak-regularity/domain API.
6. On closed connected M, positive ℛ_p implies H^p(M;ℝ)=0; nonnegative ℛ_p
   implies every harmonic p-form is parallel and b_p≤binomial(n,p) (for p=1,
   Nicolaescu, *Lectures on the Geometry of Manifolds*, Theorem 12.2.5, p. 661). Prove
   evaluation injectivity for parallel forms, and compute equality on the flat
   torus with the de Rham/singular comparison. In particular positive Ricci
   kills b_1. The statements are componentwise without connectedness.
7. For Ricci lower bound λ and Rop upper eigenvalue bound Λ, prove
   `⟨ℛ_pω,ω⟩≥p(λ−(p−1)Λ)|ω|²` by genuine spectral diagonalization of the
   whole curvature operator. Develop its exterior Lie-algebra action/sum-of-
   squares formula; if Rop≥ε Id, derive ℛ_p≥ε p(n−p) Id for 1≤p≤n−1.
   Thus positive Rop on closed connected n≥3 gives b_2=0, with the n=2 sphere
   as the sharp hypothesis guard. Independently, `λ>(p−1)Λ` kills b_p for
   1≤p≤n−1; state this Ricci/curvature-operator criterion precisely. If Rop
   has eigenvalues in [α,β] with α>β/2>0, then Ric≥(n−1)α and this criterion
   for 1≤p≤⌊n/2⌋ and use duality for the remaining interior degrees, killing
   all interior Betti numbers on closed oriented connected
   n≥2 manifolds. Identify the rational homology sphere with coefficient
   comparison. The stronger result that any positive Rop kills all interior
   Betti numbers follows separately from the sum-of-squares bound above. Diagonal values on basis wedges
   alone never establish positivity of a general endomorphism.
8. On every connected smooth Riemannian manifold prove bounded Lipschitz
   functions admit bounded smooth approximations: for continuous
   η:M→(0,∞) and ε>0 produce smooth g with |g−f|≤η and
   sup|dg|≤Lip(f)+ε (Azagra, Ferrera, López-Mesas and Rangel, *Smooth
   approximation of Lipschitz functions on Riemannian manifolds*, Theorem 1,
   p. 2, for separable manifolds). Use min(η,1) so g is bounded even when η
   is not.
   Own the quantitative
   local mollification/partition-of-unity estimates and derivative-bound
   gluing; a qualitative smooth approximation is insufficient. Prove
   the proof inputs: near-isometric exponential charts, McShane extension
   and bounded truncation, Euclidean convolution preserving the Lipschitz
   bound, and countable locally finite smooth partitions with approximation
   errors summable against their derivative bounds. Differentiate the glued
   error using Σdψ_i=0 to control the partition term.
   Prove the headline (`riemannianDist_eq_sSup_smooth`)
   `dist(p,q)=sup{|f(p)−f(q)| : f smooth bounded real, sup|df|≤1}`
   for the intrinsic distance, with no completeness assumption. For the
   de Rham Clifford action supplied by SpinGeometry G3.4, prove on compactly
   supported smooth sections `[d+d*,M_f]=df∧−ι_(grad f)`. More generally,
   for every nonzero-fibre Hermitian Clifford module with compatible
   connection, skew-adjoint cotangent action c and c(α)²=−|α|² Id, prove
   `[D,M_f]=c(df)`, bounded extension exactly when |df| is bounded,
   and operator norm sup|df|. Prove the pointwise norm identity from the
   Clifford and adjoint equations and pass to L² using the full-support
   Riemannian volume. Compare `sup|df|` with the intrinsic
   Lipschitz constant by integration along paths and infinitesimal tests.
   Recover the distance by the commutator seminorm; the SpinGeometry G6
   spin-Dirac example has the same formula when a spin structure is supplied.
   Include connected open Euclidean domains with their intrinsic path metric.
   General spectral triples use
   [NoncommutativeGeometry](../NoncommutativeGeometry/README.md)'s carriers;
   this item specifies the classical manifold commutator-distance theorem.

The rough Laplacian specialization and the Weitzenböck potential ℛ_p are
definitions with the following unit tests.

**Checks.**
- Functions on the circle of length 2π: `∇*∇f=−f″`, so `e^(ikθ)` has eigenvalue
  k²≥0; the sign convention `+f″` would give a negative spectrum, contradicting the
  nonnegative energy identity.
- The Clifford relations on `e¹∧e²` in ℝ², in the pinned order `a₂*a₁*a₁a₂`:
  `a₂(e¹∧e²)=−e¹`, `a₁(−e¹)=−1`, `a₁*(−1)=−e¹`, `a₂*(−e¹)=e¹∧e²`, so the sum
  over i<j is `1·Id=binomial(2,2)Id`; the other order `a₁*a₂*a₁a₂` gives
  `−e¹∧e²`. On `e¹` in ℝ², `Σa_i*a_i e¹=e¹=1·e¹`.
- Section-norm identity on `φ(x)=x` on ℝ: `Δ⁺|φ|²+2|∇φ|²=−2+2=0=2⟨∇*∇φ,φ⟩`; with
  the negative-definite Laplacian the left side would be 4.
- `ℛ_1=Ric` on the unit sphere Sⁿ: `(n−1)Id`, which is the value `ε·p(n−p)` at
  p=1, ε=1 of the sum-of-squares bound, so the bound is sharp there; on the flat
  torus `ℛ_p=0`, every harmonic p-form is parallel and `b_p=binomial(n,p)`.

*Needs:* R1 (curvature tensor, Ricci, curvature operator), R7.0 (scalar identity),
PDO P1.0/P1.1 (rough Laplacian, operator filtration, Dirac/Laplace-type theorem,
canonical Bochner connection), K5a (real Gram form bundles, Hodge star,
codifferential, weak-regularity/domain API), SpinGeometry G1.2/G2.2/G3.4
(Clifford relations, exterior Levi-Civita connection, de Rham calculations), SBC
B2–B5 (geometric bundle carriers and metric connections), DG Layers 5–10 and 12
(exterior calculus, de Rham/singular comparison for the flat torus), R4.6
(exponential charts for the Lipschitz approximation), Tau Ceti
`TauCeti.riemannianVolume`, Mathlib `ContDiffBump` (mollification).

### Examples

On the unit `Sⁿ`, `ℛ_1=Ric=(n−1)Id` and the first positive eigenvalue is n,
attained by the coordinate functions; on the flat torus `ℛ_p=0` and
`b_p=binomial(n,p)`; on the circle of length 2π, `∇*∇e^(ikθ)=k²e^(ikθ)`.

### Dependencies

Layer 7 uses Layer 1, DifferentialGeometry and SmoothBundlesConnections
bundles, PseudodifferentialOperators P1, ComplexKahlerGeometry K5a,
SpinGeometry G1.2/G2.2/G3.4, Yamabe Y9 and Tau Ceti's Laplace–Beltrami,
Bochner and Lichnerowicz declarations; R7.8 also uses R4.6's exponential
charts. R7.0's local scalar identity precedes any Hodge, spin or cohomology
input, and its integrated eigenvalue and equality statements need n≥2. The
later spin Dirac and index consumers follow R7.8.

## Layer 8: spherical harmonics and minimal eigenmaps

### R8. Spherical harmonics and minimal eigenmaps

#### R8.1. Finite harmonic-polynomial construction

Let m≥1, n=m+1 and d≥0. Tau Ceti supplies the finite algebra
(`RingTheory/MvPolynomial/Harmonic.lean`): the polynomial Laplacian
`MvPolynomial.laplacian`, `Σᵢ∂ᵢ²`; the polynomial `MvPolynomial.normSq`,
`r²=Σᵢxᵢ²`; the harmonic homogeneous polynomials of degree d,
`MvPolynomial.harmonicSubmodule`, written `H_d`; the coefficient identity
`MvPolynomial.laplacian_normSq_pow_mul`,
`Δ(r^(2(k+1))h)=2(k+1)(2l+n+2k)r^(2k)h` for `h∈H_l`; the Fischer
decomposition `P_d=H_d⊕r²P_(d−2)` and its iterate
`MvPolynomial.homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow`; and the
dimension count `MvPolynomial.finrank_harmonicSubmodule_add_two`,
`dim H_(e+2)=dim P_(e+2)−dim P_e`. With `dim P_d=binomial(n+d−1,d)` this gives
`dim H_d=binomial(m+d,d)−binomial(m+d−2,d−2)`, the second term read as 0 for
d<2. R8.1 owns the spherical side, which that file leaves out.

On the unit round `Sᵐ`, with R1's round sphere model, use the nonnegative
Laplacian `Δ⁺_S=−div grad`. Away from 0 the Euclidean metric is
`dr²+r²g_S` with density `rᵐ dr dV_S`, so the coordinate divergence formula
gives `Δ_ℝ=∂_r²+(m/r)∂_r−r⁻²Δ⁺_S` for the Euclidean Laplacian `Δ_ℝ=Σᵢ∂ᵢ²`. For
p homogeneous of degree d and h its restriction to the sphere,
`p(rθ)=r^d h(θ)`, and substitution gives `Δ_ℝp=r^(d−2)(d(d+m−1)h−Δ⁺_S h)`.
Hence a harmonic homogeneous p restricts to a smooth eigenfunction of `Δ⁺_S`
with eigenvalue `d(d+m−1)`; this is an inclusion, not yet surjectivity onto
the eigenspace. Restriction is O(n)-equivariant for the action
`(g·p)(x)=p(g⁻¹x)`, because `r²` and `Δ_ℝ` are O(n)-invariant. Restriction is
injective: if h=0, homogeneity gives p=0 away from 0, continuity gives p(0)=0,
and evaluation of real polynomials is injective; for complex coefficients
apply this to the real and imaginary parts. Transport the Euclidean
derivative identities to the round metric and volume with the stated
conventions for m, d and the coefficients, including d=0, d=1 and m=1.
This construction does not identify every smooth or L² eigenfunction,
construct the spectral Hilbert basis or prove irreducibility; those are
R8.2 and R8.3.

The harmonic-polynomial spaces H_d and their restriction to the sphere are
definitions with the following unit tests.

**Checks.**
- m=1: `dim H_d=binomial(1+d,d)−binomial(d−1,d−2)=(d+1)−(d−1)=2` for d≥2, and 1, 2
  for d=0, 1, matching `cos dθ, sin dθ` with eigenvalue `d(d+0)=d²`; the formula
  without the second term would give d+1.
- m=2: `dim H_d=binomial(d+2,2)−binomial(d,2)=2d+1` with eigenvalue `d(d+1)`; at
  d=2 this is 5 (R8.5's N=5), whereas all homogeneous quadratics number 6.
- The coefficient identity: `Δ(r²)=6` in ℝ³ matches `2·1·(0+3+2−2)=6` (l=0, k=1),
  and `Δ(r²x)=Δ(x³+xy²)=8x` in ℝ² matches `2·1·(2+2+2−2)=8` (l=1, k=1); the formula
  without the `−2` would give `2·1·(2+2+2)=12`, that is 12x.
- Restriction of `h=x` to S² (m=2, d=1) has eigenvalue `1·(1+1)=2`, the first
  positive eigenvalue of the round S².

*Needs:* R1 round sphere model (round metric and the polar form
`dr²+r²g_S` of the Euclidean metric), R7.0 and R7.1 item 1 (the scalar
Laplacian Δ⁺ on the sphere), R1 (coordinate divergence formula), Tau Ceti
`MvPolynomial.laplacian`, `MvPolynomial.normSq`, `MvPolynomial.harmonicSubmodule`,
`MvPolynomial.laplacian_normSq_pow_mul`,
`MvPolynomial.homogeneousSubmodule_eq_iSup_map_mulLeft_normSq_pow` and
`MvPolynomial.finrank_harmonicSubmodule_add_two`, Mathlib `MvPolynomial`,
`MvPolynomial.IsHomogeneous` and `MvPolynomial.pderiv`.

#### R8.2. Spectral completeness and eigenspace identification

After the finite polynomial construction, consume K5a's compact scalar
spectral decomposition to prove that restriction identifies `H_d` with the
whole smooth and L² eigenspace of `Δ⁺_S` for `λ_d=d(d+m−1)`. Establish
orthogonality, completeness and the comparison of the polynomial and Hilbert
spectral bases, with the smooth-domain and elliptic-regularity interface.
Keep the dimension formula `binomial(m+d,d)−binomial(m+d−2,d−2)`, with the
second term 0 for d<2, and treat the constants at d=0 and the Fourier pair
`cos dθ, sin dθ` at m=1 explicitly. These surjectivity and completeness
statements come after the finite polynomial calculation and are not inputs
to it. Keep O(m+1)-equivariance throughout.

*Needs:* R8.1 (H_d, injective restriction, dimension), K5a (compact scalar
spectral decomposition, elliptic regularity and the smooth domain), R4.7
(O(m+1) acting by isometries of the round sphere).

#### R8.3. Orthogonal highest weights and low ranks

Construct the harmonic-polynomial representation and compare its
complexification on SO(m+1) with highest weight dε₁ (d times the vector
highest weight), consuming ClassicalGroups Layer 3's highest-weight
classification of the irreducible rational representations of the
connected complex groups SO_N (types B and D) and Layer 5's existing
numerical Weyl-dimension APIs (including
`ClassicalGroups/WeylDimension/OddOrthogonal.lean` and
`ClassicalGroups/WeylDimension/EvenOrthogonal.lean`). Spell out the low-rank fundamental-weight conversions, and handle SO(2) separately
by its pair of characters for d≥1 and one trivial character for d=0; real form, orientation-group restriction and O-action
are explicit. Construct the complex SO-action by
`(g·p)(x)=p(g⁻¹x)`. Choose rotations
R_θ(x₁,x₂)=(cosθ x₁−sinθ x₂,sinθ x₁+cosθ x₂),
ε₁(R_θ)=e^(iθ), and positive roots with vector highest weight ε₁.
Prove `(x₁−ix₂)^d` is a highest-weight vector with character dε₁.

The supplied classification is read against a maximal torus and a Borel
subgroup of SO_N, which R8.3 fixes as follows; it is the standard choice
(Fulton–Harris, *Representation Theory*, Lecture 18, §18.1 for the
quadratic form, torus and roots of so_N, Lecture 19 for the dominant
weights), written in the standard orthonormal basis. Put `N=m+1≥2`,
`r=⌊N/2⌋`, and use the isotropic basis `u_i=e_(2i−1)+i e_(2i)`,
`v_i=(e_(2i−1)−i e_(2i))/2`, 1≤i≤r, of the complexified coordinate
space, with the unpaired `e_N` kept when N is odd; the standard symmetric
form satisfies `B(u_i,v_j)=δ_ij`, `B(u_i,u_j)=B(v_i,v_j)=0` and
`B(e_N,u_i)=B(e_N,v_i)=0`. The torus consists of the elements acting by
`t_i` on `u_i`, by `t_i⁻¹` on `v_i` and by 1 on `e_N`; its i-th
coordinate is the eigenvalue on `u_i`. The Borel is the stabiliser of the
isotropic flag `⟨u₁⟩⊂⟨u₁,u₂⟩⊂…⊂⟨u₁,…,u_r⟩`, upper triangular in the
ordered basis `(u₁,…,u_r,v_r,…,v₁)` (with `e_N` in the middle when N is
odd); its positive roots are `ε_i±ε_j` for i<j, together with `ε_i` when
N is odd, and the dominant weights are `λ₁≥…≥λ_r≥0` for odd N and
`λ₁≥…≥λ_(r−1)≥|λ_r|` for even N. Call this torus, Borel and coordinate
system the Classical convention. In each consecutive coordinate plane let K act by
`diag(1,−1)`, and let it fix an unpaired last coordinate. Prove
`K²=I`, `KᵀK=I` and `det K=(−1)^r`. Conjugation
`σ(g)=KgK` is an algebraic automorphism of the actual complex SO group;
K need only belong to O, and this automorphism need not be inner in SO.
For every plane, prove `KR_θK=R_(−θ)`. In the isotropic basis prove
`Ku_i=2v_i`, `Kv_i=u_i/2`. Thus the Classical torus coordinate
of `σ(R_θ)` is `t_i=e^(iθ_i)` for simultaneous plane rotations.
Fix the R8 Borel as `σ⁻¹(B_Classical)` and transport every Cartan
coordinate and the B/D positive roots through this dictionary. The
untransported Classical character on `R_θ` is `e^(−iθ)`; do not identify
it directly with the fixed R8 character `e^(iθ)`.

Define `U_K p(x)=p(Kx)` on the actual polynomial model. Using its
O-action, prove that U_K preserves homogeneity and the Laplacian kernel,
and prove `U_K ρ(g) U_K⁻¹=ρ(σ(g))`. It sends the specified polynomial
`(x₁−ix₂)^d` to `(x₁+ix₂)^d`. Prove the latter is a highest vector for
the Classical Borel with torus character `t₁^d`, and transport this
statement to the fixed R8 Borel and character `dε₁`. Apply the actual
rational-group classification through this equivariant comparison.
For SO(2) retain both degree-d characters when d≥1 and the single
constant at d=0; do not infer irreducibility of their two-character sum.

For N≥3 use the supplied classification to establish irreducibility; the numerical
Weyl formulas alone are not a supplied highest-weight module. This is the
headline `harmonic_irreducible`: for N≥3 and every d, a complex subspace of
the complex harmonic homogeneous polynomials of degree d on `ℝᴺ` (the
homogeneous polynomials of degree d killed by `Σᵢ∂ᵢ²`) that every element of
`Matrix.specialOrthogonalGroup (Fin N) ℝ` maps into itself under
`(g·p)(x)=p(g⁻¹x)` is 0 or the whole space. For N=2 and d≥1 the invariant
lines spanned by `(x₁±ix₂)ᵈ` show that the bound is needed.

**Checks.**
- `R_θu₁=e^(−iθ)u₁` and `R_θv₁=e^(iθ)v₁`: with `R_θe₁=cosθ e₁+sinθ e₂`
  and `R_θe₂=−sinθ e₁+cosθ e₂`, `R_θ(e₁+ie₂)=(cosθ−i sinθ)(e₁+ie₂)`. So
  the Classical coordinate of R_θ is `e^(−iθ)` and that of `σ(R_θ)=R_(−θ)`
  is `e^(iθ)`, the fixed R8 value; reading the Classical coordinate on
  R_θ itself would attach the weight −dε₁ to `(x₁−ix₂)^d`.
- `KR_θK=R_(−θ)`: `diag(1,−1)·[[cosθ,−sinθ],[sinθ,cosθ]]·diag(1,−1)` has
  entries `[[cosθ,sinθ],[−sinθ,cosθ]]`. `Ku₁=e₁−ie₂=2v₁`, `Kv₁=u₁/2`,
  `B(u₁,v₁)=(1·1+i·(−i))/2=1` and `B(u₁,u₁)=1+i²=0`.
- Under `(g·p)(x)=p(g⁻¹x)`, `(R_θ·(x₁−ix₂))(x)=e^(iθ)(x₁−ix₂)` and
  `(R_θ·(x₁+ix₂))(x)=e^(−iθ)(x₁+ix₂)`; the action `p(gx)` would swap the
  two characters. `x₁+ix₂=B(x,u₁)` is a Borel eigenvector for the
  Classical Borel because `g·B(x,u₁)=B(x,gu₁)` and the Borel preserves
  `⟨u₁⟩`.
- `det K=(−1)^r`: for N=2, `K=diag(1,−1)∉SO(2)`, and σ is the inversion
  `R_θ↦R_(−θ)` of the abelian group SO(2), not inner; for N=3,
  `K=diag(1,−1,1)` has det K=−1, and since `−I` is central, σ is
  conjugation by the rotation `−K=diag(−1,1,−1)`, hence inner on SO(3).
- Dimensions: for N=2 and d≥1, H_d is spanned by `(x₁±ix₂)^d`, two
  characters and no highest-weight irreducibility; for N=3, dim H_d=2d+1
  by R8.1 equals the Weyl dimension of weight dε₁ in type B₁, and for
  N=4, dim H_d=(d+1)² is the dimension of the type D₂ module of highest
  weight (d,0).

*Needs:* R8.1 (the harmonic-polynomial spaces H_d and their dimensions),
R8.2 (eigenspace identification), ClassicalGroups Layer 3 (connected
SO_N highest-weight classification) and Layer 5 (Weyl dimension formula,
`ClassicalGroups/WeylDimension/OddOrthogonal.lean`,
`ClassicalGroups/WeylDimension/EvenOrthogonal.lean`), CompactGroups
(complete reducibility and invariant products), Mathlib
`Matrix.specialOrthogonalGroup`, `MvPolynomial.aeval` and `MvPolynomial.pderiv`.

#### R8.4. Full eigenspace eigenmaps and Takahashi

For an L²-orthonormal basis f_1,…,f_N of a positive eigenspace, prove
`Σf_i²=N/Vol(S^m)` by orthogonal-group transitivity and
`Σdf_i⊗df_i=(λN/(m Vol(S^m)))g` by isotropy invariance and trace.
Normalize the vector-valued map by
`F=√(m Vol(S^m)/(λN))(f_1,…,f_N)`.
It is an isometric immersion into S^(N−1)(√(m/λ)) and is minimal there
(Takahashi 1966, as stated by Toth and Ziller, *Spherical minimal immersions
of the 3-sphere*, abstract, p. 84, with the eigenmap set-up of §1.1, p. 89).
For any isometric immersion into a round sphere prove Takahashi's converse:
minimality iff its Euclidean coordinate functions satisfy Δ⁺f_i=(m/r²)f_i.
An arbitrary list of eigenfunctions need not be an immersion or isometric.

The normalized eigenmap F is a definition with the following unit tests.

**Checks.**
- Degree 1 on `Sᵐ`: λ=m and N=m+1, the L²-orthonormal basis is
  `f_i=√((m+1)/Vol(Sᵐ))·x_i`, so `F=√(m Vol(Sᵐ)/(m(m+1)))·f=x`, the identity
  onto the sphere of radius `√(m/λ)=1`; and `Σf_i²=(m+1)/Vol(Sᵐ)=N/Vol(Sᵐ)`.
- Degree 2 on `S²`: λ=6 and N=5, so the target radius is `√(2/6)=1/√3`, the
  radius of R8.5's Veronese immersion into `S⁴(1/√3)`.
- The factor `m/λ` is needed: the map `√(Vol/N)·f` without it pulls the
  Euclidean metric back to `(λ/m)g`, which is `3g` in degree 2 on `S²` (the
  unit-target map of R8.5) and is isometric only in degree 1.

*Needs:* R8.2 (the full eigenspaces and their L² structure), R8.3 (the O(m+1)
action on the eigenspaces, whose isotropy O(m) acts irreducibly on T_xSᵐ), R5a.2
(`Δ⁺f=−mH` and the sphere/Euclidean mean-curvature dictionary), R4.7 (transitivity
of O(m+1) on the round sphere), R7.0 (Δ⁺ on functions).

#### R8.5. The five-coordinate degree-two example

Compute degree 2 on S²: N=5, not 6. The three diagonal trace-free quadratics
are linearly dependent; pin a five-dimensional traceless-symmetric-matrix model
and an explicit orthonormal coordinate identification. The unit-target map

`(x,y,z) ↦ (√3(x²−y²)/2, √3xy, √3xz, √3yz, (2z²−x²−y²)/2)`

has induced metric 3g; dividing it by √3 gives the isometric minimal immersion
into S⁴(1/√3). Prove its fibers are antipodal pairs and its descent is a smooth
embedding of RP², with induced metric and O(3)-equivariance. These identities,
the stereographic outputs and the catenoid/helicoid/paraboloid computations
are required acceptance cases of the generic APIs.

*Needs:* R8.1 (H_2 on ℝ³, of dimension 5), R8.4 (the eigenmap normalization and
Takahashi), R4.7 (the round RP² quotient), R5a.2 (induced-metric and minimality
computations).

### Examples

On `S²` the harmonic polynomials of degree d have dimension 2d+1 and
eigenvalue d(d+1); in degree 2 they give the Veronese minimal immersion into
`S⁴(1/√3)`, which descends to an embedding of `RP²`. For N=4 the degree-d
harmonic polynomials have dimension `(d+1)²`, and for N=2 and d≥1 they split
into the two characters spanned by `(x₁±ix₂)ᵈ`.

### Dependencies

Layer 8 uses R5a and R7, Layer 1's round sphere model, R4.7's real-projective
quotient, ComplexKahlerGeometry K5a, ClassicalGroups Layers 3 and 5,
CompactGroups and Tau Ceti's harmonic-polynomial algebra. R8.1's restriction,
Fischer decomposition and dimension use no spectral completeness and no
highest-weight classification; R8.2–R8.4 use those suppliers.

## Downstream consumers

- DGFloer consumes R2–R3 (Jacobi, index and path geometry) for its free-loop
  extensions and CP/HP applications on the same finite-vertex carriers.
- AffineMorseLefschetz consumes R5a and R6 (real immersion, shape-operator and
  focal APIs).
- PositiveScalarCurvature consumes R1 (scaling, product, conformal and
  submersion formulas), R2, R4, R4.7 and R5a.
- Poincare3D consumes R1–R5a, R4.9 and R7.0 (conventions, Jacobi fields,
  comparison geometry, model metrics, normal coordinates, immersion area
  calculus and the scalar Bochner identity).
- LieGroups consumes R4.5 (Bonnet–Myers) for compact semisimple integration.
- Yamabe consumes R1's connection, Ricci and scalar formulas, R2–R4 and R7.
- HeegaardFloer consumes R1 and R5a; GeometricCurrents consumes R5 and R5b's
  normal Jacobi operator; SpinGeometry consumes R1, R5 and R7.
- PseudodifferentialOperators P7a consumes R4.7's isometric quotients by free
  finite group actions.
- PositiveMass consumes R1–R5, R7.8, R8 and R4.1's equality API in its §2.3.
- RicciFlow consumes R1 (curvature, Gram and exterior dictionaries, the
  normal-coordinate jets R1.4 and the curvature operator).
- CalibratedGeometry consumes R1, R5a, R5a.1, R5a.2 and R5b's normal Jacobi
  operator.
- NoncompactQuantumSymmetry consumes R1's reductive-complement construction
  and completeness, R2 and R4.
- CompactQuantumMetricSpaces consumes R7.8's smooth bounded approximation and
  commutator distance.

## References

- J. M. Lee, *Introduction to Riemannian Manifolds*, second edition: Chapters 7–8
  for curvature/submanifolds, Chapter 10 for Jacobi/variation and focal
  Problems 10-14 and 10-19, Chapter 11 for comparison and Chapter 12 for the
  local-to-global/space-form theorems.
  This is the principal convention reference. Lee does not prove
  the full Morse index or Hodge theorem; those use their separate suppliers.
- J. Milnor, [*Morse Theory*, Annals of Mathematics Studies 51](https://www.jstor.org/stable/j.ctv3f8rb6), Princeton University Press,
  §6 (Lemma 6.5, Theorem 6.6) for the Euclidean focal-point/squared-distance
  theory and §§13–18 for the finite Jacobi/index and broken-path proof
  architecture.
- B. O'Neill, [The fundamental equations of a submersion](https://doi.org/10.1307/mmj/1028999604),
  Michigan Math. J. 13 (1966), 459–469, Theorem 2 and Corollary 1: the curvature
  identities of a Riemannian submersion used by R1's projective examples.
- L. I. Nicolaescu, [*Lectures on the Geometry of Manifolds*](https://academicweb.nd.edu/~lnicolae/Lectures.pdf),
  author's electronic edition, 2020: Proposition 4.1.25, p. 151 (normal
  coordinates), Theorem 5.2.26, p. 220 (Myers), Theorem 6.2.6, p. 238
  (Cartan–Hadamard), Theorem 12.2.5, p. 661 (Bochner's vanishing of b₁).
- G. Wei, [Manifolds with a lower Ricci curvature bound](https://arxiv.org/abs/math/0612107),
  arXiv:math/0612107v1 (2006): Theorem 4.1, p. 5
  (Bishop–Gromov), Theorem 6.1, p. 8 (Myers), p. 7 (Lichnerowicz's estimate).
- L. Brewin, [Riemann normal coordinate expansions using Cadabra](https://arxiv.org/abs/0903.2087),
  Class. Quantum Grav. 26 (2009) 175017, arXiv v3: equation (11.1), p. 15, the
  metric in Riemann normal coordinates, used by R1.4.
- B. Andrews, [*Lectures on Differential Geometry*, Lecture 16: Curvature](https://maths-people.anu.edu.au/andrews/DG/DG_chap16.pdf),
  Proposition 16.2.1, p. 154: reconstruction of the curvature tensor from
  sectional curvatures, in the slot convention `K(σ)=R(e₁,e₂,e₁,e₂)`.
- D. W. Lyons, [An elementary introduction to the Hopf fibration](https://arxiv.org/abs/2212.01642),
  Mathematics Magazine 76 (2003), 87–98, section "Seeing the Hopf
  fibration": the stereographic picture of the Hopf fibres used by R3.3c.
- W. Fulton and J. Harris, *Representation Theory: A First Course*,
  Graduate Texts in Mathematics 129, Springer, 1991, Lecture 18, §18.1 and
  Lecture 19: the isotropic basis, torus, roots and dominant weights of
  so_N fixed by R8.3's convention bridge.
- Z. Wang, [Riemannian geometry notes](https://xumin.net/c/files/riemannian_geometry.pdf),
  as recorded by X. Liang, Chapters 5–6, provides an accessible finite
  piecewise-Jacobi index reduction and comparison reference.
- Y. Homma,
  [Bochner–Weitzenböck formulas and curvature actions on Riemannian manifolds](https://arxiv.org/abs/math/0307022),
  for the curvature-action/spectral form of the Weitzenböck potential.
- I. A. Taimanov, [On the existence of three nonselfintersecting closed geodesics on manifolds homeomorphic to the 2-sphere](https://doi.org/10.1070/IM1993v040n03ABEH002177), Russian Acad. Sci. Izv. Math. 40:3 (1993), 565–590: simple-image multiplicity and shortening/minimax architecture. R4.9 specifies its own curve metric, relative finite model and uniform shortening maps.
- M. E. Gage, [Curve shortening on surfaces](https://www.numdam.org/item/ASENS_1990_4_23_2_229_0/), Ann. Sci. École Norm. Sup. 23 (1990), 229–256: surface evolution, continuation and long-time derivative estimates.
- B. Ma, [Curve shortening flow on Riemann surfaces with possible ambient conic singularities](https://arxiv.org/html/2007.00089v3), smooth-surface §§2–5: Jacobi distance comparison and localized singularity analysis. R4.9 constructs the explicit centered nonflat and eternal blowup milestones needed for its positive-length reduction.
- J. Lauer, [The evolution of Jordan curves on S² by curve shortening flow](https://arxiv.org/abs/1601.05704), round-sphere zero-area Jordan evolution and initial trace.
- M. A. Grayson, “Shortening embedded curves,” *Annals of Mathematics* 129 (1989), 71–111: finite-time/immortal curve-shortening alternatives and embedded-curve asymptotics; R4.9 states the precise consequences it uses as owned targets.
- S. Angenent, “The zero set of a solution of a parabolic equation,” *Journal für die reine und angewandte Mathematik* 390 (1988), 79–96: one-dimensional zero-number input for scalar parabolic differences.
- B. White, “A local regularity theorem for mean curvature flow,” *Annals of Mathematics* 161 (2005), 1487–1519: center-uniform Gaussian-density local regularity criterion; R4.9 owns its forced-curve specialization and cutoff/error hypotheses.
- P. T. Allen, A. Layne and K. Tsukahara, [The Dirichlet problem for curve shortening flow](https://arxiv.org/abs/1208.3510v2), arXiv:1208.3510v2 (2015): fixed-endpoint flow in convex constant-curvature domains; R4.9 states the actual wedge, boundary-flatness and nonconjugacy hypotheses it consumes.
- M. G. Dobbins, [Continuous dependence of curvature flow on initial conditions](https://arxiv.org/html/2106.08907v1), Lemma 2.2 for pre-extinction Hausdorff dependence; R4.9 supplies its length and positive-time parabolic upgrades.

- D. Azagra, J. Ferrera, F. López-Mesas and Y. Rangel,
  [*Smooth approximation of Lipschitz functions on Riemannian manifolds*](https://arxiv.org/abs/math/0602051),
  for R7.8's quantitative smoothing and intrinsic-distance comparison.
- G. Toth and W. Ziller,
  [Spherical minimal immersions of the 3-sphere](https://ems.press/content/serial-article-files/42818?nt=1),
  introduction and spherical-harmonic setup, for Takahashi/eigenmap normalization
  and the distinction between full eigenspace maps and arbitrary eigenfunction lists.
