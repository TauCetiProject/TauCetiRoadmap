# Roadmap: semi-Riemannian foundations

**Summary.** This roadmap develops shared scalar-product, bundle-connection and metric-pairing
foundations in every signature, a local Banach-manifold theory, one geodesic flow across
regularities, nondegenerate immersion geometry, and Jacobi and variation theory. Its metric
carrier is the regularity extension of the existing nondegenerate metric, with a strongness
predicate for continuous dual inverses and conditional Levi-Civita theory for weak metrics.
For positive-definite metrics its curvature, warped-product, Jacobi, index and immersion
objects agree with Tau Ceti's and RiemannianGeometry's. LorentzianGeometry specializes these
foundations to Lorentzian geometry and causality.

Three theorems head the roadmap. A strong symmetric nondegenerate metric of class `C^{k+1}`,
`k ≤ ∞`, on a smooth manifold modelled on a real Banach space has a torsion-free covariant
derivative of class `C^k` on the tangent bundle compatible with the metric, unique on vector
fields differentiable at the base point. On a Hausdorff Banach manifold without boundary, a
connection whose chart coefficients are locally Lipschitz has a unique maximal geodesic through
each tangent vector, with an open flow domain and an exponential map, and the flow and the
exponential map are of class `C^r` when the coefficients are. For a `C^{1,1}` metric `g` of any
signature on a finite-dimensional Hausdorff manifold and a normal neighbourhood of `p`, the
function `q(exp_p v) = g_p(v, v)` is `C^{1,1}` and `dq = 2g(P, ·)`, where `P` is the position
vector field.

This README is the roadmap. `Suggested.lean` gives the metric carrier, the vector characters
and the extension predicates, states the existence half of the first of these theorems and the
reduction of inextendibility to second-countable extensions against the pinned Mathlib and Tau
Ceti, and names the headline theorems that are not statable there.

## How to read the build

Layer 1 is the linear algebra of scalar products of any signature and their vector characters.
Layer 2 is the bundle calculus, the regularity-graded metric carrier with its strong inverse,
Hölder classes, Levi-Civita connection, curvature, warped products and extensions. Layer 3 is
curves, the one geodesic flow, its exponential map and normal neighbourhoods. Layer 4 is
nondegenerate immersions and Layer 5 Jacobi fields, variations and the Riccati identities. Each
target's *Needs* line lists its own prerequisites, and each layer's Dependencies subsection
collects them; an example can cite a consequence proved in another section. Each target states
its hypotheses; the table summarizes them.

| Targets | Dimension | Regularity | Metric or connection input |
| --- | --- | --- | --- |
| Layer 1 | Finite, except the vector characters | Algebraic | Symmetric nondegenerate form |
| §2.1 | Banach base and fibres | Local coefficient order | Supplied bundle connection |
| §2.2–§2.3 | Normed/Banach | `C^k`, `C^{k,α}` | Pairing; strongness for inverse |
| §2.4–§2.6 | Banach, finite for traces | Stated derivative order | Strong metric or supplied weak Levi-Civita |
| §2.7 | Finite | Metric class `C^k` | Nondegenerate metric |
| §3.1–§3.2 | Banach; Peano finite | Curve order; locally Lipschitz coefficients for flow | Supplied tangent connection |
| §3.3–§3.4 | Banach; Lipschitz convex neighbourhoods finite | `C^r` upgrades; `C^{1,1}` radial Gauss | Same flow; metric only for Gauss |
| Layers 4–5 | Banach; multiplicities/traces finite | Orders stated per target | Strong induced metric or supplied connection |

## Conventions

**Signature and generality.** In finite dimensions write `(p, q)` for `p` positive and `q` negative directions,
so `p + q = dim M`; the index is the maximal dimension of a negative-definite subspace,
Mathlib's `sigNeg` of the associated quadratic form. A nondegenerate metric has locally
constant signature, fixed on each connected component. Results allow every signature,
including `(p, 0)` and `(0, q)`, and every dimension their statements admit. Fixed signature
is a predicate on the shared carrier, not another metric field. Lorentzian scalar products
have signature `(n, 1)`, with diagonal `(−, +, …, +)`; results that need index one belong to
LorentzianGeometry. A vector `v` is timelike if
`g(v,v) < 0`, null if `g(v,v) = 0` and `v ≠ 0`, causal if timelike or null, and spacelike if
`g(v,v) > 0` or `v = 0` (the zero vector is spacelike and not causal; Minguzzi 2019, §1.3,
p. 7).

**Dimension and strength.** Local bundle and connection theory uses real Banach model and
fibre spaces, with Hilbert spaces as an important specialization. Metric fields are bounded
symmetric bilinear pairings and nondegeneracy means injectivity of
`g^♭_x : T_xM →L[ℝ] (T_xM →L[ℝ] ℝ)`. A metric is strong when each `g^♭_x` is a
continuous linear isomorphism (`ContinuousLinearMap.IsInvertible`). Strongness is a predicate
on the same carrier. Finite-dimensional nondegenerate metrics are automatically strong;
in infinite dimensions inverse-metric constructions require strongness explicitly. A weak
metric can be used with a supplied compatible torsion-free connection; existence of such
a connection does not follow from injectivity.

Finite dimension is explicit in Layer 1's inertia and dimension formulas, §2.5's Ricci
and scalar traces, §2.7's extension theory and §5.1's conjugate/focal multiplicities.
For signature `(p,q)`, dimension is `d=p+q`. Nonzero null vectors exist exactly when `p,q≥1`.

**Manifolds and regularity.** The base manifold is smooth. Pairings, connections and
curves carry their own regularities, with orders encoded by `k : ℕ∞ω`, `k≤∞`.
`C^{1,1}` means `C¹` with locally Lipschitz first chart derivatives. The shared flow
uses locally Lipschitz coefficients; `C^r` coefficients improve the regularity of that
same flow.

Bundle fields and their within-chart differential identities permit corners. Unrestricted
two-sided local flows use the interior or manifolds without boundary.
Hausdorffness, countability, paracompactness and connectedness are explicit where needed;
no global smooth bump-function hypothesis enters the local Banach core.

**Curvature.** `R(X,Y)Z = ∇_X∇_Y Z − ∇_Y∇_X Z − ∇_[X,Y] Z`; in finite dimensions
`Ric(u,v) = tr(w ↦ R(w,u)v)`, as in Tau Ceti's `CovariantDerivative.curvatureTensor` and
`CovariantDerivative.ricciTensor`. The scalar curvature is the metric trace
`S = tr_g Ric = Σ_{i} ε_i Ric(e_i, e_i)` in a `g`-orthonormal basis with `ε_i = g(e_i,e_i)`.
The Einstein tensor is `G = Ric − ½ S g`. For a nondegenerate plane `Π = span(X, Y)`,
`K(Π) = g(R(X,Y)Y, X) / (g(X,X)g(Y,Y) − g(X,Y)²)`. With these conventions de Sitter space has
`K = +1`, anti-de Sitter space `K = −1` and the unit round sphere `K = +1`. In coordinates
`R(∂_μ,∂_ν)∂_σ = R^ρ_{σμν} ∂_ρ` with
`R^ρ_{σμν} = ∂_μΓ^ρ_{νσ} − ∂_νΓ^ρ_{μσ} + Γ^ρ_{μλ}Γ^λ_{νσ} − Γ^ρ_{νλ}Γ^λ_{μσ}` and `Γ^ρ_{νσ}` the
`∂_ρ`-coefficient of `∇_{∂_ν}∂_σ`.

**Curves.** Domains and admissible changes of parameter are specified in §3.1.
Compact and open nontrivial domains require `a<b`; inextendibility means absence of the
appropriate endpoint in `M`, with limits taken from within the domain.

**Hypersurfaces.** For a nondegenerate hypersurface choose a unit normal `ν` with
`g(ν, ν) = ε ∈ {−1, 1}`; formulas retain `ε` explicitly. Its scalar second
fundamental form is `k(X, Y) = g(∇_X ν, Y)` and its mean curvature is the metric trace
`H = tr_h k`. RiemannianGeometry's vector-valued second fundamental form, written `B` there,
takes the value `−ε k(X, Y)ν` on `(X, Y)`, and its averaged mean-curvature vector is
`−ε(H/m)ν` for `m = dim Σ > 0`. For example, the future unit hyperboloid
`{t² − |x|² = 1, t > 0}` in Minkowski space `ℝ^{1,n}`, with the future unit normal `ν` given by
the position vector, has `ε = −1`, `k = h` and `H = n`.

**Extensions.** A `C^l`-extension of a connected semi-Riemannian manifold `(M, g)` without boundary
is a smooth embedding `ι : M → M̃` into a connected Hausdorff semi-Riemannian manifold `(M̃, g̃)`
without boundary, modelled on the same `I` and in the same universe, with `g̃` of class `C^l`,
`ι^* g̃ = g` and `ι(M) ≠ M̃`. `(M, g)` is `C^l`-inextendible if it has none. For
second-countable `M` it suffices to exclude second-countable `M̃` (§2.7).

**Names.** Extend the shared `TauCeti/LinearAlgebra/BilinearForm/` and
`TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/` APIs for arbitrary-signature
foundations, and the existing `CovariantDerivative` and immersion APIs for their generalized
objects. The vector characters `IsTimelike`, `IsNull` and `IsCausal` of §1.1 live in
`TauCeti/LinearAlgebra/BilinearForm/`, in the `LinearMap.BilinForm` namespace. The metric
carrier is the regularity extension of `TauCeti.Manifold.ContMDiffNondegenerateMetric`, with
omitted regularity retaining the smooth interface. The connection-level geodesic carriers of
Layer 3 live in the `CovariantDerivative` namespace beside Tau Ceti's along-curve API.

## Prior work and coordination

The Mathlib pull request [mathlib4#38194](https://github.com/leanprover-community/mathlib4/pull/38194)
proposed an `IndefiniteMetric` structure on bilinear forms; Layer 1 uses Mathlib's
`LinearMap.BilinForm` predicates directly.

## Layer 1: scalar products and finite signature

Vector spaces are real and finite-dimensional, and scalar products are symmetric and
nondegenerate of any signature; no manifold or regularity enters.

### 1.1 Signature and scalar products

For a finite-dimensional real vector space, use Mathlib's symmetry, nondegeneracy and inertia
indices to express signature `(p, q)`. Derive the diagonal normal form with `q` negative
and `p` positive unit entries from Sylvester's law; each signature class is open among
symmetric forms. Orthogonal sums add signatures, a positive scaling preserves signature,
and a negative scaling interchanges `p` and `q`. Reuse existing quadratic-form results.
Define the vector characters of the Conventions for every real bilinear form `b`, with no
signature or finite-dimensionality hypothesis: `IsTimelike b v` (`b v v < 0`), `IsNull b v`
(`b v v = 0` and `v ≠ 0`), `IsCausal b v` (timelike or null) and spacelike (`b v v > 0` or
`v = 0`) (for Lorentzian forms, Minguzzi 2019, §1.3, p. 7, whose "lightlike" is this roadmap's
null). The Lorentzian cone theorems built on them belong to LorentzianGeometry.


**Checks.**

- Orthogonal sums of signatures `(2,1)` and `(1,2)` have signature `(3,3)`.
- Multiplication by `−1` exchanges the two inertia indices.
- In `diag(−1, −1, 1)`, `e₀` is timelike, `e₀ + e₂` is null, `e₂` and `0` are spacelike, and `0` is not causal.
- The form `x₁y₂ + x₂y₁` on `ℝ²` takes the values `−1` and `1` on `(e₁ − e₂)/√2` and `(e₁ + e₂)/√2`, which are orthogonal, so it has signature `(1, 1)` although its standard Gram matrix has zero diagonal: a definition reading signs off diagonal entries gives `(0, 0)`.

*Needs:* Mathlib's bilinear forms, inertia indices and Sylvester theorem.

### 1.2 Orthogonal subspaces and null hyperplanes

For a symmetric nondegenerate `b` of signature `(p, q)` and any subspace `W`, Mathlib
supplies `dim W + dim W^⊥ = dim V` (`LinearMap.BilinForm.finrank_orthogonal`),
`(W^⊥)^⊥ = W` (`LinearMap.BilinForm.orthogonal_orthogonal`) and, for nondegenerate `b|W`,
`V = W ⊕ W^⊥` (`LinearMap.BilinForm.isCompl_orthogonal_of_restrict_nondegenerate`), in
`Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`. Prove `rad(b|W) = W ∩ W^⊥` and that
the signatures of `W` and `W^⊥` add when `b|W` is nondegenerate. For a nonzero covector `ξ`,
`(ker ξ)^⊥ = ℝ ξ^♯`, since `ker ξ = (ℝ ξ^♯)^⊥` by Mathlib's
`LinearMap.BilinForm.orthogonal_span_singleton_eq_toLin_ker`; its kernel is degenerate
iff `ξ^♯` is null, and then its radical is exactly this line. A negative unit normal gives
kernel signature `(p, q − 1)`, a positive unit normal `(p − 1, q)`, and a null normal
gives quotient signature `(p − 1, q − 1)`. General degenerate subspaces can have larger
radicals; classify restrictions by their inertia indices and radical dimension.


**Checks.**

- In `diag(−1,−1,1,1)`, the span of `e₀+e₂` and `e₁+e₃` is totally null of dimension two.
- In `diag(−1, 1, 1)`, of signature `(2, 1)`, `ξ = dx` has `ξ^♯ = e₁`, a positive unit normal, and
  `ker dx = span(e₀, e₂)` has signature `(1, 1) = (p − 1, q)`; `ξ = dt` has `ξ^♯ = −e₀`, a negative
  unit normal, and `ker dt = span(e₁, e₂)` has signature `(2, 0) = (p, q − 1)`. Exchanging the two
  rules would give `ker dx` signature `(2, 0)`.
- In `diag(−1, 1)` the null line `W = ℝ(1, 1)` has `W^⊥ = W`, so `dim W + dim W^⊥ = 2` while `W + W^⊥ ≠ ℝ²`: the splitting `V = W ⊕ W^⊥` needs `b|W` nondegenerate.

*Needs:* §1.1; Mathlib orthogonal complements, restrictions and dual maps.

### Examples

- `diag(−1, −1, 1, 1)` has signature `(2, 2)` and a totally null plane (§1.2); `x₁y₂ + x₂y₁` on `ℝ²` has signature `(1, 1)` (§1.1).

### Dependencies

Mathlib's bilinear and quadratic forms, inertia indices, Sylvester's law, orthogonal complements and dual maps. No other layer.

## Layer 2: local bundle calculus and metric pairings

Hypotheses by target: §2.1 concerns supplied smooth Banach bundles, with local coefficient
regularity as stated and no metric or global bump function; §2.2 uses normed bundle pairings,
Banach completeness for its analytic steps, strongness only for inverses and finite dimension
only for inertia indices; §2.3 uses Banach-valued local derivatives, with finite dimension only
for the comparison with Euclidean components; §2.4 concerns strong `C^k` metrics, `k ≥ 1`, on
Banach manifolds, and weak metrics through the stated representation criterion; §2.5 concerns
strong `C²` metrics or a supplied `C¹` Levi-Civita connection, with finite dimension for Ricci
and scalar traces and smooth data for differentiated identities; §2.6 builds pairings at the
common regularity of the data, with strong smooth Banach metrics for connections and curvature
and finite dimension for Ricci; §2.7 concerns finite-dimensional connected Hausdorff manifolds
without boundary, metrics of any signature and the stated regularities.

### 2.1 Local bundle connections and curvature

For a supplied smooth vector bundle `V → M` with Banach model and fibre spaces, extend
the existing local `IsCovariantDerivativeOn` and `ContMDiffCovariantDerivative` APIs.
In a bundle chart the connection is
`∇_X s = Ds(X) + Γ(X)s`, where `Γ_x : E →L[ℝ] F →L[ℝ] F`. Develop restriction,
overlap and change-of-trivialization formulas, pullback, dual, tensor and hom connections,
and differentiation of bounded fibre pairings. Use the suppliers from
SmoothBundlesConnections B3–B5, adding their local Banach and finite-order generalizations
in the shared APIs. Torsion belongs to the tangent-bundle specialization.

Connection regularity is tested on sections smooth on a neighbourhood, through
`ContMDiffCovariantDerivativeOn` and local coefficient fields. Prove the equivalence of
these local formulations and their implication for the existing global interface; do not
infer local regularity solely from testing globally smooth sections on a Banach manifold
without a smooth-extension hypothesis. Pullback of a `C^r` connection along a `C^{r+1}`
map has class `C^r`, with the derivative loss explicit.

For `C^r` coefficient fields, `r ≥ 1`, generalize the curvature operator and prove its
tensoriality locally, producing a continuous multilinear tensor of class `C^{r−1}`.
In a trivialization its value is
`R_x(u,v) = DΓ_x(u)(v) − DΓ_x(v)(u) + [Γ_x(u), Γ_x(v)]` (for the tangent bundle in
coordinates, Barzen–Leymann, Lemma 24, (54), p. 42).
Prove agreement with the existing `CovariantDerivative.curvatureTensor` in finite dimensions,
and recover its algebraic tensor interface from the continuous multilinear one. Prove
alternation, naturality, the covariant exterior Bianchi identity for `C²` coefficients,
and the metric-pairing skew identity for a compatible connection. The first Bianchi and
pair-interchange identities use the tangent-bundle, torsion-free specialization.
The construction and proofs use local sections or their germs, not global smooth extensions.

Generalize the local parallel-transport API of B5 by the linear Banach ODE for continuous
connection coefficients along a `C¹` curve. Prove existence, uniqueness, composition,
reversal, preservation of compatible pairings and dependence on initial data; for smooth
coefficients prove smooth dependence on smooth curve families. Add the evaluation and
restriction lemmas connecting this to the existing transport interface. Banach ODE and
inverse-function steps use completeness explicitly. These results concern supplied bundles
and connections; constructing them globally by partitions of unity has separate hypotheses.

**Checks.**

- The trivial bundle over a Banach space with `Γ = 0` has zero curvature and constant
  parallel sections along curves.
- On the trivial line bundle over `ℝ²` with `Γ = x dy`, parallel transport along `s ↦ (1, s)`
  solves `σ′ + Γ(∂_y)σ = σ′ + σ = 0`, so `σ(s) = e^{−s}σ₀`, and along `s ↦ (s, 0)` it is constant
  as `Γ(∂_x) = 0`; the opposite convention `∇ = D − Γ` would give `e^{s}σ₀`.
- On the trivial line bundle over `ℝ²` with `Γ = x dy`, the curvature formula gives `R(∂_x, ∂_y) = DΓ(∂_x)(∂_y) − DΓ(∂_y)(∂_x) = 1 − 0 = 1`: a connection with commuting coefficients is still curved, so the derivative terms cannot be dropped.

*Needs:* Mathlib local connections, continuous multilinear maps, Banach ODE; SmoothBundlesConnections B3–B5 and the existing Tau Ceti curvature interfaces.

### 2.2 Regularity-graded pairings and strong inverses

The shared pairing core is a `ContMDiffSection` of the bounded bilinear-form bundle of
an arbitrary supplied vector bundle `V`, with symmetry and nondegeneracy predicates.
State the pairing, restriction, dual-map, strong-inverse and regularity lemmas for this
bundle-level data. The tangent-metric carrier below packages its `V = TM` specialization;
its underlying field and operations are those of this common bundle API.

Generalize `TauCeti.Manifold.ContMDiffNondegenerateMetric` to regularity `k : ℕ∞ω`,
with `k ≤ ∞` in the results below and omitted `k` retaining the smooth interface.
Its data are a `C^k` section
`Cₛ^k⟮I; E →L[ℝ] E →L[ℝ] ℝ, fun x ↦ T_xM →L[ℝ] T_xM →L[ℝ] ℝ⟯` whose value at every point is a
symmetric nondegenerate bounded bilinear pairing. The carrier uses arbitrary normed model
spaces; the local analytic theorems use Banach completeness. `k = 0` gives continuous metrics. The manifold
is smooth and may have boundary or corners. In finite dimensions define the predicate that `g` has signature `(p, q)`
pointwise through `sigPos` and `sigNeg`. Positive-definite strong metrics give the native Riemannian specialization,
with the existing `Bundle.ContMDiffRiemannianMetric` interface retained. A tangent vector,
a vector field, or a piecewise `C¹` curve's one-sided velocities are timelike, null, causal
or spacelike when their values are.

Call `g` strong (`ContMDiffNondegenerateMetric.IsStrong`) when `(g x).IsInvertible` for every
`x`, using the metric itself as the continuous flat map into the continuous dual. Develop the
pairing and injectivity API without strongness.
For strong metrics, construct the continuous linear musical isomorphisms and inverse metric,
prove that the inverses have the same regularity, since operator inversion is smooth at
invertible maps of a Banach space (Mathlib's `ContinuousLinearMap.IsInvertible.contDiffAt_map_inverse`),
and retain the existing finite-dimensional `flat` and `sharp` interfaces as specializations.
Every finite-dimensional nondegenerate metric is strong: at each point this is Tau Ceti's
`ContinuousLinearMap.isInvertible_of_separatingLeft`, which
`TauCeti.Manifold.ContMDiffNondegenerateMetric.isInvertible` applies to the smooth carrier. Smooth strong metrics
and weak metrics with supplied connections use the same downstream connection API.

- Lowering the order from `k` to `l ≤ k`, with identity and composition laws, preserving
  symmetry, nondegeneracy, signature, strongness and positive definiteness.
- Extend the existing `chartMetric`, `inCoordinates`, restrictions, local-isometry and
  parameter-family APIs to every admissible regularity and Banach dimension; musical
  inverses require strongness. At order `∞` recover the existing smooth carrier
  (`ContMDiffNondegenerateMetric.toSmoothMetric`) and operations, with compatibility on evaluation and existing theorem interfaces. Identify
  the positive-definite strong specialization with the native Riemannian metric carrier at the
  corresponding regularity. On a connected manifold, a fixed finite signature can be checked
  at one point. The index-one (Lorentzian) subtype and its specializations belong to
  LorentzianGeometry.
- Strong invertibility is open in the operator norm. In finite dimensions every signature
  class is open: a continuous symmetric bilinear-form field close to one of
  signature `(p, q)` at a point has that signature near the point (Tau Ceti's
  `isLocallyConstant_sigPos_sigNeg_of_continuous` together with openness of nondegeneracy).
- Constructions, each preserving the class `C^k`: restriction to open subsets, pullback along
  `C^∞` local diffeomorphisms, orthogonal products, conformal change
  `e^{2u} g` with `u` of class `C^k`, and the warped products of §2.6. Prove their regularity,
  evaluation and naturality laws, preservation of strongness, and finite-dimensional
  additivity of signatures once, and specialize them to Riemannian metrics and to metrics of
  a fixed signature.

**Checks.**

- For a finite-dimensional real inner-product space `E`, the constant metric
  `((t, x), (s, y)) ↦ −ts + ⟪x, y⟫` on `ℝ × E` has signature `(dim E, 1)` and is a metric of
  every class in the shared carrier.
- The 2-dimensional double null metric `−2Ω²(du ⊗ dv + dv ⊗ du)` with `Ω > 0` has Gram matrix
  `[[0, −2Ω²], [−2Ω², 0]]`, determinant `−4Ω⁴ < 0`, so it is Lorentzian, with `∂_u`, `∂_v`
  null. Adding `g̸_AB (dθ^A − b^A du)(dθ^B − b^B du)` with `g̸` positive definite keeps it
  Lorentzian: in the coframe `du, dv, dθ^A − b^A du` it is block diagonal with blocks of
  signatures `(1, 1)` and `(2, 0)`.
- The acoustical metric `−c² dt² + Σ_i (dx^i − v^i dt)²` (`c > 0`) on an open subset of
  `ℝ × ℝ²`: `B = ∂_t + v^i ∂_i` has `g(B, B) = −c²`, `g(B, ∂_i) = 0`, `g(∂_i, ∂_j) = δ_ij`, so it
  is Lorentzian with `B` timelike.
- `−dt² − dx² + dy²` on `ℝ³` is nondegenerate of index two, signature `(1, 2)`, so it is not
  Lorentzian.
- The product of two copies of `−dt² + dx²` has signature `(2, 2)` and is a metric of
  every regularity in the shared carrier; a Euclidean metric has signature `(d, 0)`.
- The constant inner product on a real Hilbert space is strong. On real `ℓ²`, the constant
  pairing `g(u,v) = Σ_{j≥0} u_j v_j/(j+1)²` is positive definite and continuous, but its
  flat map is not a continuous linear isomorphism: the images of the standard unit vectors
  have dual norms tending to zero. This is a weak metric in the same carrier; `Γ = 0`
  supplies its Levi-Civita connection without a total musical inverse.

*Needs:* §1.1 for finite signatures; §2.1; native sections, continuous duals and continuous-linear invertibility.

### 2.3 Hölder classes

For `k : ℕ` with `k` at most the order of `g` and `0 < α ≤ 1`, define the local Hölder
class `C^{k,α}_loc` for metrics of any signature: `g` lies in it when, for every `x`, the chart
representative of `g` in
`extChartAt I x` (the generalization to every order of Tau Ceti's `chartMetric`) has `k`-th
`iteratedFDerivWithin` relative to `range I` that is `α`-Hölder (`HolderOnWith`) on
`K ∩ range I` for some neighbourhood `K` of `extChartAt I x x`. Prove:

- independence of the chart: `C^{k,α}_loc` on a relatively open subset of `range I` is
  preserved by composition with `C^∞` diffeomorphisms of such subsets and by multiplication
  by `C^∞` functions; hence the condition holds in every chart of the atlas once it holds in
  one chart around each point;
- for `I` boundaryless and finite-dimensional, `g` is `C^{k,α}_loc` iff every chart component `g_μν` lies in
  PDE §1.7's `C^{k,α}_loc` of the chart target;
- `C^{k+1}` implies `C^{k,α}`, and `C^{k,α}` implies `C^k`;
- the Hölder class is preserved by the constructions of §2.2 with `C^∞` data.

The chartwise definition and change-of-chart lemmas use Banach-valued Fréchet derivatives;
the comparison with PDE §1.7 uses its finite-dimensional Euclidean domains. In particular,
`C^{1,1}_loc` supplies the `C^{1,1}` metric hypotheses of §2.4 and §3.4.

**Checks.**

- On `(−1/2, 1/2) × ℝ` the metric `−dt² + (1 + t|t|^α) dx²`, `0 < α < 1`, is Lorentzian,
  `C^{1,α}` and not `C²`: the component's derivative `(1 + α)|t|^α` is `α`-Hölder and not
  differentiable at `t = 0`.
- `α > 1` is excluded: on a connected chart a `C^{0,α}` component with `α > 1` is constant.
- `f(t) = t|t|^{1/2}` has `f′(t) = (3/2)|t|^{1/2}`, which is `½`-Hölder with constant `3/2` and not Lipschitz at `0`; so `1 + f` is a component of class `C^{1,1/2}` and not `C^{1,1}`.

*Needs:* §2.2; PDE §1.7; Mathlib Hölder and derivative APIs.

### 2.4 Levi-Civita construction and conditional weak theory

For a strong nondegenerate metric `g` on a Banach manifold with `1 ≤ k`, extend
`g.leviCivitaConnection` as a
`CovariantDerivative I E (TangentSpace I)` with `ContMDiffCovariantDerivative _ (k − 1)`:
torsion-free, metric-compatible on differentiable fields
(`X g(Y, Z) = g(∇_X Y, Z) + g(Y, ∇_X Z)`), unique on differentiable section germs,
with the Koszul
identity. The existence statement, for `g` of class `C^{l+1}` with `l ≤ ∞` on a manifold
modelled on a Banach space, is `ContMDiffNondegenerateMetric.exists_leviCivitaConnection`; it
writes torsion-freeness as `∇_X Y − ∇_Y X = [X, Y]` on fields differentiable at the base point,
since Mathlib's torsion tensor assumes a finite-dimensional model. The local construction uses
the inverse continuous flat map and Fréchet derivatives of `g` (for Riemannian metrics on
Banach and Fréchet manifolds, Bruveris, §2.3, formula (1), pp. 8–9, which also notes that a weak
metric needs the right-hand side of that formula in the image of its flat map); in finite
dimensions it gives the Christoffel formula
`Γ^k_ij = ½ g^{kl}(∂_i g_jl + ∂_j g_il − ∂_l g_ij)` of class `C^{k−1}`, and of class
`C^{k−1,α}` when `g` is `C^{k,α}`. For `∞ ≤ k` it agrees with Tau Ceti's
`ContMDiffNondegenerateMetric.leviCivitaConnection`. Generalize the existing Koszul
construction of HopfRinow Layer 1 to finite order, and retain the Riemannian public interface
as a specialization; LorentzianGeometry uses the same API for Lorentzian metrics. Prove compatibility with restriction,
local isometries, products, constant scaling and lowering regularity.

For a strong `C¹` metric and `u` of class `C¹`, prove the conformal connection formula
for `ĝ=e^{2u}g` at this regularity:
`ĝ.∇_X Y = g.∇_X Y + du(X)Y + du(Y)X − g(X,Y) g.sharp(du)`.
The formula uses the same continuous Levi-Civita connection and its uniqueness on
section germs; the curvature change laws in §2.5 require their additional derivatives.

For a weak metric, prove uniqueness on differentiable section germs of a compatible
torsion-free connection from injectivity alone. Prove that such a connection exists exactly when the covectors in the
local Koszul formula are represented by a Christoffel field of the claimed regularity
and obey the connection change-of-chart law. The strong construction supplies this
representation automatically. When a weak metric is supplied with such a connection,
use it in the same along-curve, curvature and variation interfaces; no total inverse
metric or automatic existence theorem is asserted for weak metrics.


For `C^{1,1}` strong metrics prove that the Christoffel field is locally Lipschitz,
so it supplies the hypothesis of the single flow construction in §3.2.

**Checks.**

- A constant strong metric has zero Christoffel field.
- For `−dt² + a(t)² dx²` the Christoffel formula gives `Γ^t_xx = −½ g^{tt} ∂_t g_xx = a a′` and
  `Γ^x_tx = ½ g^{xx} ∂_t g_xx = a′/a`; raising with `+1` in place of `g^{tt} = −1` would give
  `Γ^t_xx = −a a′`.
- For `ĝ = e^{2t}(−dt² + dx²)`, that is `u = t` and `g` flat, the conformal formula gives
  `ĝ.∇_{∂_x}∂_x = −g(∂_x, ∂_x) g.sharp(dt) = ∂_t`, as `g.sharp(dt) = −∂_t`; directly,
  `Γ̂^t_xx = −½ ĝ^{tt} ∂_t ĝ_xx = −½ (−e^{−2t})(2e^{2t}) = 1`. The sign `+g(X, Y) g.sharp(du)`
  would give `−∂_t`.
- The constant weighted `ℓ²` metric of §2.2 is weak but its Koszul covectors are represented by `Γ = 0`.
- For the `C^{1,α}` metric of §2.3 the Christoffel field is `C^{0,α}`; local geodesic uniqueness is a separate question.

*Needs:* §2.1–§2.3; Mathlib's `CovariantDerivative` and `VectorField.mlieBracket`; HopfRinow nondegenerate Koszul and along-curve interfaces.

### 2.5 Curvature identities and finite-dimensional contractions

For a strong metric of class `C²` on a Banach manifold, or a nondegenerate metric supplied
with a compatible torsion-free connection of class `C¹`, use §2.1's curvature tensor.
Generalize the metric-pairing identities at that regularity; no trace is needed for the
curvature tensor, its skew and pair-interchange symmetries, or sectional curvature of a
nondegenerate two-plane. For smooth data the connection is smooth by the generalization of
`IsLeviCivitaConnection.contMDiffCovariantDerivative`. Reuse Tau Ceti's first and second
Bianchi identities `CovariantDerivative.curvatureTensor_cyclic_eq_zero` and
`CovariantDerivative.covariantDerivative_curvatureOperator_cyclic_eq_zero` for torsion-free
connections. Generalize the metric compatibility API, including
`IsMetricCompatible.inner_curvatureTensor_eq_neg` and `inner_curvatureTensor_swap_pairs`,
to the nondegenerate pairing: `g(R(X,Y)Z, W)` is skew in `(X, Y)` and in `(Z, W)` and
symmetric under pair interchange. Keep the inner-product statements
as specializations. For a weak metric with a supplied connection these pairing identities
use that connection without constructing a musical inverse.

In finite dimensions, use the existing `CovariantDerivative.ricciTensor`, prove `Ric`
is symmetric, and extend
the metric trace of a bilinear form via `sharp`, the scalar curvature `S`, the Einstein tensor
`G` and the sectional curvature of nondegenerate planes through the existing curvature API.
Prove the existing scalar curvature is its positive-definite specialization; constant
sectional curvature `κ` iff `R(X,Y)Z = κ(g(Y,Z)X − g(X,Z)Y)` in dimension `d ≥ 2`, and then
`Ric = (d − 1) κ g`, `S = d(d − 1)κ` (Barzen–Leymann, Theorem 8, p. 50, for semi-Riemannian
metrics); the contracted Bianchi identity `div G = 0` with
LVF6's divergence. Prove at every signature the local-isometry naturality, constant-scaling,
product and conformal-change laws, covariant curvature identities, and Schur and
Einstein-factor constancy in connected dimension `d ≥ 3` that Tau Ceti proves for Riemannian
metrics (supplier contract), and prove that for positive-definite `g` they agree with Tau
Ceti's.
Re-use the metric-free connection results directly.

Define the vacuum Einstein equations `Ric = 0`, and with cosmological constant `Λ`,
`G + Λ g = 0`; prove the latter is `Ric = (2Λ/(d − 2)) g` in dimension `d ≥ 3`,
independently of signature.

For `C²` metrics, prove that the local construction agrees with the coordinate formula of
the Conventions and with Tau Ceti's existing smooth tensor; in finite dimensions define
`Ric`, `S`, `G` and the vacuum equations at this regularity. General Banach curvature is
not contracted to Ricci or scalar curvature without additional trace hypotheses, which
are outside this roadmap.

**Checks.**

- `−dt² + a(t)² dx²`: `R(∂_x, ∂_t)∂_t = −(a''/a)∂_x`, so `K = a''/a`, `S = 2a''/a`;
  `a = cosh t` (de Sitter) gives `K = 1`; `a = t` on `t > 0` (the Milne region) gives `K = 0`.
- `−f(x)² dt² + dx²` has `K = −f''/f`; `f = cosh x` gives `K = −1` (anti-de Sitter).
- Dimension four, `Λ = 3`: `Ric = 3g`; dimension three, `Λ = 1`: `Ric = 2g`.
- A sectional curvature formula without the `g(X,X)g(Y,Y) − g(X,Y)²` denominator gives the
  wrong sign on de Sitter, whose spanning planes have negative Gram determinant.

*Needs:* §2.1, §2.4; existing curvature and Ricci APIs; LVF6 divergence for contracted Bianchi; Tau Ceti's Riemannian curvature laws (supplier contract) for the positive-definite comparison.

### 2.6 Products and warped products

Generalize the existing warped-product API to a semi-Riemannian base `(B, g_B)` and fibre
`(F, g_F)` of arbitrary signatures and a positive function `f` on `B`. The metric
`π^*g_B + (f ∘ π)² σ^*g_F` has their sum signature and the common regularity of the data.
For strong smooth data on Banach factors generalize Tau Ceti's warped-product Levi-Civita
formula and RiemannianGeometry R1.3's uncontracted curvature formulas. In finite dimensions
generalize R1.3's Ricci formulas, with metric traces and signed orthonormal contractions (for
semi-Riemannian factors, Barzen–Leymann, Lemmas 34–36, pp. 61–62, whose Lemma 35 (iii)–(v)
gives the warping terms the signs of the opposite curvature convention; O'Neill, Ch. 7, Propositions 35 and 42 and Corollary 43). The Riemannian formulas
and the Lorentzian-base/Riemannian-fibre formulas are specializations. LorentzianGeometry's model spacetimes use these same formulas.

**Checks.**

- A constant warping function gives the orthogonal-product connection and curvature.
- Base `(ℝ, ±dt²)`, fibre `(ℝ, dx²)` and `f = cosh t`: the mixed sectional curvature
  `K(∂_t, ∂_x) = −Hess f(∂_t, ∂_t)/(f g(∂_t, ∂_t))` is `−1` for the Riemannian base (the hyperbolic
  plane `dt² + cosh²t dx²`) and `+1` for the Lorentzian base (de Sitter, §2.5); the Riemannian
  value `−f″/f` copied without the metric sign would give `−1` for both.
- The base `((0, ∞), −dt²)`, the fibre `(ℝ, dx²)` and `f(t) = t` give the Milne metric `−dt² + t² dx²`, whose curvature `K = f″/f = 0` (§2.5) shows it is flat.

*Needs:* §2.2, §2.4–§2.5; Tau Ceti's product and warped-product APIs; RiemannianGeometry R1.3.

### 2.7 Extensions and inextendibility

In finite dimensions, for nondegenerate metrics of any signature define `IsExtension g g̃ ι` and
`IsInextendible l g` as in the Conventions, quantifying over
connected Hausdorff `M̃` in the universe of `M` with the model `I`; the results about them
assume `[I.Boundaryless]`. Prove: if
`l ≤ l'`, `C^l`-inextendible implies `C^{l'}`-inextendible; an extension restricts the metric
on `ι(M)`, which is open; a proper open connected subset `U` of a connected semi-Riemannian manifold
`(N, h)` gives the extension `(U, h|U) → (N, h)`; extensions compose with isometric
embeddings. The isometry identity preserves signature on the image, and connectedness of
the extension forces the same signature throughout. The Lorentzian extension API is a
specialization; LorentzianGeometry's completeness obstruction to `C⁰`-extensions assumes index
one and causality.

Prove that the choice of boundaryless model is immaterial: if `I'` is a boundaryless model
on a finite-dimensional `E'` with `finrank ℝ E' = finrank ℝ E`, transporting charts along
`I`, `I'` and a linear equivalence `E' ≃L[ℝ] E` turns a `C^l`-extension modelled on `I'`
into one modelled on `I`. So `IsInextendible l g` is inextendibility among all extensions of
the same dimension.

Prove that for connected, second-countable `M` the target may be taken second countable: given a
`C^l`-extension `ι : M → M̃`, the open set `ι(M)` is nonempty and not closed in the connected
`M̃`, so some `p` lies in `closure ι(M) \ ι(M)`; for a connected chart neighbourhood `U` of `p`,
the open set `ι(M) ∪ U` is connected, Hausdorff and second countable, and `ι` into it with the
restricted metric is a `C^l`-extension. Hence `IsInextendible l g` is equivalent to the same
predicate quantified over second-countable `M̃` only
(`ContMDiffNondegenerateMetric.isInextendible_iff_forall_secondCountable`).

**Checks.**

- A proper connected open Euclidean ball, with its restricted metric, extends to Euclidean space.
- `(ℝ, −dt²)` has no `C⁰`-extension: an isometric embedding into a connected one-manifold with a
  continuous metric, locally `−a² ds²` with `a > 0`, has as image a proper open arc of infinite
  `a`-length towards each end, while near an endpoint of the arc in the target `a` is bounded, so
  that end has finite length. A target of higher dimension would make it extendible, by
  `t ↦ (t, 0)` into Minkowski `ℝ^{1+1}`.
- The identity of a connected manifold is a smooth isometric embedding onto the whole manifold; the clause `ι(M) ≠ M̃` makes it no extension of `M`.

*Needs:* §2.2; Mathlib smooth embeddings and open submanifolds.

### Examples

- The constant Minkowski, double-null and acoustical metrics and the weak weighted `ℓ²` metric (§2.2); `−dt² + (1 + t|t|^α) dx²` on `(−1/2, 1/2) × ℝ` (§2.3); de Sitter, anti-de Sitter and the Milne metric through the curvature formulas of §2.5–§2.6; a Euclidean ball inside Euclidean space as an extendible manifold (§2.7).

### Dependencies

Layer 1 (§1.1); Mathlib connections, sections, continuous multilinear maps, Banach ODE, continuous-linear invertibility, Hölder and derivative APIs, smooth embeddings; Tau Ceti's nondegenerate metric, Levi-Civita, curvature, Ricci, product and warped-product APIs; SmoothBundlesConnections B3–B5; HopfRinow Layer 1; RiemannianGeometry R1.3; PDE §1.7; LocalVariationalFieldTheory LVF6.

## Layer 3: curves and one geodesic flow

Hypotheses by target: §3.1 works on smooth manifolds, including Banach models, and assumes
tangent differentiability almost everywhere only as an explicit hypothesis; §3.2 uses
continuous coefficients for the geodesic predicate, finite dimension for Peano existence, and
Hausdorff manifolds with Banach models and locally Lipschitz coefficients for the unique flow;
§3.3 uses Banach model spaces and `C^r` coefficients, `r ≥ 1`, with joint smoothness for smooth
families; §3.4 uses
Banach models with `C¹` or smooth coefficients for differentiable normal coordinates, finite
dimension for Lipschitz convex normal neighbourhoods, and `C^{1,1}` metrics for the radial
Gauss identity.

### 3.1 Curve domains and admissible reparametrizations

Use native maps, paths, interval sets and filters to develop a shared curve interface.
Every nontrivial compact or open parameter interval carries `a < b`. For open intervals
allow extended-real endpoints, interpret endpoints at infinity by `atTop`/`atBot`, and
take endpoint limits from within the parameter interval. Define restriction, concatenation,
change of parameter and endpoint existence on the actual domain. Prove that every nonempty
open interval is related to a bounded open interval by an increasing smooth diffeomorphism;
this justifies finite-endpoint prototypes for inextendible curves.

Keep the following reparametrization hypotheses distinct:

- Piecewise `C¹` curves with nonzero one-sided velocities use increasing piecewise `C¹`
  bijections whose inverses have the same regularity and whose one-sided derivatives are
  positive. Increasing `C¹` diffeomorphisms are a sufficient special case.
- Locally Lipschitz curves with nonzero velocity almost everywhere use increasing locally
  bi-Lipschitz changes of parameter. Prove the chain rule and preservation of the exceptional
  null sets in both directions.
- Absolutely continuous arc-length normalization in a Banach chart uses the model norm
  and is a separate theorem, with positive speed almost everywhere and the required
  absolute-continuity properties of the inverse proved. The global auxiliary-Riemannian
  version for causal curves belongs to LorentzianGeometry; no such metric is assumed to exist
  on every Banach manifold.

Define local absolute continuity and local Lipschitz continuity through bundle charts and
prove chart independence. Do not invoke finite-dimensional Rademacher for arbitrary Banach
targets: a tangent velocity almost everywhere is an explicit hypothesis unless supplied by
a theorem valid for the target space. The finite-dimensional causal curves of LorentzianGeometry
use Rademacher. Geodesics obtained from continuous ODE coefficients are `C²` directly.

Define an oriented change-of-parameter relation between maps by an increasing locally
absolutely continuous homeomorphism with positive derivative almost everywhere. Prove its
restriction, composition and inverse properties under the inverse-regularity hypotheses
specified above. §3.2 applies this relation to affine geodesics, and LorentzianGeometry defines
null geodesic images through it. The original map need not have the regularity of its representative.

**Checks.**

- The empty interval `a = b` is not an inextendible curve domain.
- `s ↦ s³` is increasing but introduces zero velocity at `s = 0`; it does not preserve
  the class of regular timelike `C¹` curves.
- A nonsmooth increasing bi-Lipschitz parametrization of a null affine segment has a null
  geodesic image even when the parametrized curve is not a `C²` pregeodesic.

*Needs:* Native path and interval/filter APIs, real change of variables, chain rules, and existing piecewise-curve interfaces.

### 3.2 Geodesic predicates, spray, maximal flow and exponential

Define, for any `cov : CovariantDerivative I E (TangentSpace I)`, the geodesic predicate
in the `CovariantDerivative` namespace: `γ` is a geodesic of `cov` on `s` when `s` has unique
derivatives, `γ` is `C²` on `s`, and `accelerationWithin cov γ s = 0` on `s`. Prove
`TauCeti.Manifold.IsGeodesicCurveOn I γ s` iff `γ` is a geodesic on `s` of the Levi-Civita
connection of the Riemannian metric. A pregeodesic is a `C²`
curve with nowhere-zero velocity and `∇_{γ'} γ' = f γ'` for a continuous `f`; prove that a
pregeodesic has a reparametrization that is a geodesic, by solving `φ'' + (f ∘ φ) φ'² = 0`.
For a `C¹` nondegenerate metric with a supplied compatible connection, `g(γ', γ')` is
constant along any of its geodesics, so the sign of that quadratic value is constant (Tau Ceti's
`IsMetricCompatible.apply_curveVelocityWithin_self_eq_of_accelerationWithin_eq_zero` in the
smooth case).

The geodesic predicate is independent of local existence or uniqueness. Supply the
finite-dimensional Peano existence lemma for continuous vector fields, by compactness of
Euler approximations and Arzelà–Ascoli (Mathlib's `BoundedContinuousFunction.arzela_ascoli`),
and apply it to continuous connection coefficients.
This gives local existence but no uniqueness for `C¹` metric coefficients.

For Banach model spaces define locally Lipschitz connection coefficients intrinsically
through the chart field `Γ_x : E →L[ℝ] E →L[ℝ] E`, and prove chart independence. Construct
the geodesic spray once, with chart expression `z' = (v, −Γ_x(v,v))`, `z = (x,v)` (the chart
geodesic equation `c″ + Γ(c)(c′, c′) = 0` of a Riemannian metric on a Banach manifold is
Bruveris, §2.5, p. 9). Identify its integral curves with velocity lifts of the geodesic
predicate. On a Hausdorff manifold, under local Lipschitz hypotheses use Banach
Picard–Lindelöf (Mathlib's `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`, with
uniqueness from `ODE_solution_unique_of_mem_Icc`) to construct unique maximal geodesics,
their open flow domain and flow, and the open domain and map of the exponential of `cov`.
Prove locally Lipschitz dependence on initial data, the flow composition and uniqueness
laws, the rescaling law `γ_cv(t) = γ_v(ct)`, and `d(exp_p)_0 = id`.

These are the single flow, maximal-curve and exponential constructions at every regularity.
Smooth connections enter through their local Lipschitz property; §3.3 strengthens regularity
of these same objects. Make the existing Riemannian geodesic, spray, flow and exponential
interfaces specializations, with evaluation and restriction lemmas. Prove that changing the
proof of a regularity hypothesis does not change any object. Construct locally and patch
by uniqueness, without global smooth extensions. Only the symmetric part of the connection
coefficient field enters the spray.

**Checks.**

- `Γ = 0` on a Banach space gives the affine flow and `exp_p(v) = p + v`.
- On `ℝ²` the continuous field `Γ_x(v, v) = (0, −12|x₂|^{1/2} v₁²)` has the two geodesics
  `s ↦ (s, 0)` and `s ↦ (s, max(s, 0)⁴)` with initial data `(0, e₁)`, since
  `x₂″ = 12s² = 12|x₂|^{1/2}` for `s > 0`: the geodesic predicate holds without uniqueness.
- For `Γ_x(v, v) = v²` on `ℝ` the geodesic with `x(0) = 0`, `x′(0) = c > 0` is
  `log(1 + ct) = γ_1(ct)`, as the rescaling law requires; `c log(1 + t)` is not a geodesic for
  `c ≠ 1`.
- On the line with two origins, which is not Hausdorff, `Γ = 0` in both charts gives two maximal
  geodesics `s ↦ s − 1` with initial data `(−1, 1)`, one through each origin, which differ at
  `s = 1`: uniqueness of maximal geodesics needs the Hausdorff hypothesis.

*Needs:* §2.1, §2.4, §3.1; Mathlib Banach Picard–Lindelöf and Grönwall; existing HopfRinow geodesic interfaces.

### 3.3 Regularity and naturality of the common flow

For connection coefficients of class `C^r`, `r ≥ 1`, prove that the flow, open exponential
domain and exponential map of §3.2 have the corresponding `C^r` regularity. In particular,
smooth coefficients make that same flow and exponential smooth. Prove naturality under
local affine diffeomorphisms and restriction, and smooth dependence on jointly smooth
connection families and initial data. State the coefficient regularity separately from
the regularity of any metric supplying the connection: a strong `C^{r+1}` metric supplies
a `C^r` connection by §2.4.

Prove agreement with the existing smooth Riemannian objects through their specialization
maps, upgrading their regularity theorems to the common construction. No second smooth
flow or exponential is defined and then compared to the locally Lipschitz one.

**Checks.**

- Constant flat coefficients give a smooth flow through the common API.
- For `Γ_x(v, v) = v²` on `ℝ` the exponential at `0` has the open domain `(−1, ∞)` and
  `exp_0(v) = log(1 + v)`, smooth with `d(exp_0)_0 = 1`; the domain is not all of `T_0ℝ`.
- The smooth coefficient field `Γ_x(v, v) = v²` on `ℝ` gives `x″ = −x′²`, whose geodesic with `x(0) = 0`, `x′(0) = 1` is `x(t) = log(1 + t)`, defined exactly for `t > −1`: a smooth flow need not be complete.

*Needs:* §3.2; Mathlib regularity of ODE solutions and the existing smooth-flow arguments.

### 3.4 Normal domains and Gauss lemmas

For a `C¹` connection on a Banach tangent bundle: every point has a normal neighbourhood
(image of a star-shaped open set on which `exp_p` is a `C¹` diffeomorphism). In finite dimensions
prove a basis of convex neighbourhoods `U` (normal neighbourhoods of each of their points, so any two points of `U`
are joined by a unique geodesic in `U`, depending `C¹` on the endpoints, `C^r` for a `C^r`
connection by §3.3, and smoothly for a smooth one) (Kobayashi–Nomizu,
Vol. I, §III.8; Minguzzi 2019, Theorem 2.4, pp. 26–27). For a smooth strong metric, or a weak metric with a supplied
smooth compatible torsion-free connection, prove the
semi-Riemannian Gauss lemma `g(d(exp_p)_v(v), d(exp_p)_v(w)) = g(v, w)` and that the position
vector field `P` of a normal neighbourhood satisfies `dq = 2g(P,·)` for `q = g(P, P)`;
for strong metrics this is `grad_g q = 2P`
(Minguzzi 2019, Theorem 2.6, p. 27). Generalize the existing normal-domain and Gauss-lemma APIs and their
proofs, retaining the positive-definite interfaces as specializations. Normal-coordinate
vanishing of Christoffel symbols for a torsion-free connection, and of first derivatives
of its compatible metric, are shared statements.

A normal domain is expressed first through its open domain and the exponential
homeomorphism. Bi-Lipschitz and differentiable-inverse properties are separate conclusions
under their stated coefficient regularity. Extend the native normal-domain API in this
form and retain the smooth Riemannian interface as a specialization.

In finite dimensions prove the bi-Lipschitz normal-neighbourhood and totally normal convex
neighbourhood theorems for locally Lipschitz connections, using quantitative Picard–Lindelöf
estimates to establish `HasStrictFDerivAt` for the exponential map at the zero section,
then applying Mathlib's `HasStrictFDerivAt.toOpenPartialHomeomorph` and the quantitative
`ApproximatesLinearOn` estimates (Minguzzi, *Convex neighborhoods for Lipschitz connections
and sprays*, Theorems 3 and 4, pp. 11–12; for `C^{1,1}` metrics, Kunzinger–Steinbauer–Stojković,
Theorems 2.1 and 4.1, pp. 2 and 10). For a `C^{1,1}` metric of any signature and a
normal neighbourhood of `p`, set `q(exp_p(v)) = g_p(v,v)` and
`P(exp_p(v)) = γ_v'(1)`. Prove the low-regularity Gauss lemma:
`q` is `C^{1,1}` and `dq_x(w) = 2g_x(P(x),w)`, with agreement with §3.4 for smooth
metrics (Minguzzi, *Convex neighborhoods…*, Theorem 5, p. 14). This formulation does not
presuppose a smooth `exp`.

**Checks.**

- The flat Banach connection has global affine exponential coordinates.
- `−dt² + (1 + (max(t,0))²) dx²` is `C^{1,1}` and not `C²`; its connection has a unique
  flow and locally bi-Lipschitz normal coordinates, without a continuous curvature tensor.
- On Minkowski `ℝ^{1+1}` with `p = 0`, `q(x) = −t² + x²` and `P(x) = x`; `dq_x(w) = −2t w_t + 2x w_x = 2g(P(x), w)`, the Gauss identity of this section.

*Needs:* §2.4, §3.2–§3.3; native inverse-function, HasStrictFDerivAt and ApproximatesLinearOn APIs; Minguzzi as cited.

### Examples

- The flat Banach connection with `exp_p(v) = p + v` (§3.2); `x″ = −x′²` on `ℝ`, whose geodesic `log(1 + t)` is defined on `(−1, ∞)` (§3.3); `−dt² + (1 + max(t, 0)²) dx²`, which is `C^{1,1}` and not `C²` (§3.4).

### Dependencies

Layer 2 (§2.1, §2.4); Mathlib paths, interval filters, change of variables, Picard–Lindelöf, Grönwall, ODE regularity, inverse-function and `ApproximatesLinearOn` APIs; Tau Ceti's piecewise curves and Riemannian geodesic interfaces; HopfRinow Layer 1.

## Layer 4: nondegenerate immersion geometry

Immersions are split Banach immersions whose induced tangent metric is strong, with a strong
ambient metric or a supplied weak Levi-Civita connection, at the derivative orders stated in
§4.1.

### 4.1 Induced connections and Gauss–Codazzi–Ricci

For a strong metric `g` on a Banach manifold and a `C^m` split immersion `F`, `m ≥ 1`, whose
induced tangent form is strong, develop the immersion theory that RiemannianGeometry R5a
states for Riemannian metrics.
A split immersion has a closed complemented differential range, with the native local
immersion chart. The
induced metric has class `C^{min(k, m−1)}` for `g` of class `C^k`. Split the ambient
tangent bundle into tangent and normal bundles, and prove both induced pairings are strong;
in finite dimensions their signatures add. Construct the
induced and normal connections, the vector-valued second fundamental form and shape operators,
and prove the Gauss–Codazzi–Ricci equations. The second fundamental form uses `g` of class `C¹`
and `F` of class `C²`; the curvature equations use `g` of class `C²` and `F` of class `C³`.
Prove their symmetry, regularity and local-isometry
naturality, and prove that for positive-definite `g` they agree with R5a's definitions.
For hypersurfaces with a chosen unit normal, use `ε = g(ν, ν)` explicitly in the scalar
formulas; a global unit normal is a hypothesis. For spacelike hypersurfaces of Lorentzian
manifolds, LorentzianGeometry supplies one from a time orientation.
For a weak ambient pairing with a supplied compatible connection and a strong induced
tangent metric, construct the orthogonal projection onto the tangent bundle, its kernel
as normal bundle and the induced connections; no normal musical inverse is needed for
the vector-valued identities. The strong ambient case supplies the strong normal metric.
The Gauss equation is
`R^Σ(X,Y,Y,X) = R(X,Y,Y,X) + ε(k(X,X)k(Y,Y) − k(X,Y)²)` (for spacelike hypersurfaces of
four-dimensional Lorentzian manifolds, `ε = −1`, Gourgoulhon, Gauss relation (2.92), p. 35, and
Codazzi relation (2.101), p. 36, whose extrinsic curvature is `−k`; for `ε = 1` and Euclidean
`ℝ³`, the contracted form (2.96), p. 35).
A finite-dimensional positive-definite submanifold has dimension at most `p`, so a spacelike hypersurface
cannot occur when the ambient negative index is greater than one.


**Checks.**

- The unit sphere in Euclidean `ℝ³` (`ε = 1`, `k = h` for the outward normal) has
  `R^Σ(X, Y, Y, X) = 0 + (1 − 0) = 1` for orthonormal `X, Y`, and the future unit hyperboloid in
  `ℝ^{1,2}` (Conventions; `ε = −1`, `k = h`) has `0 − (1 − 0) = −1`; a Gauss equation without `ε` gives `+1` for both.
- The de Sitter surface `{−t² + x² + y² = 1}` in `ℝ^{1,2}` is timelike, with spacelike unit
  normal the position vector (`ε = 1`, `k = h`), so `R^Σ(X, Y, Y, X) = h(X, X)h(Y, Y) − h(X, Y)²`
  and `K = 1`, as in §2.5; taking `ε = −1` for every hypersurface of a Lorentzian manifold would
  give `K = −1`.
- The line `{t = 0}` of Minkowski `ℝ^{1+1}` has unit normal `∂_t` with `ε = −1`, induced metric `dx²` and `k = 0`; the line `{x = 0}` has unit normal `∂_x` with `ε = 1` and induced metric `−dt²`, so the induced signatures `(1, 0)` and `(0, 1)` add with the normal's to `(1, 1)`.

*Needs:* §1.2 for finite signatures; §2.1–§2.5; RiemannianGeometry R5a and native immersion charts.

### Examples

- The spacelike and timelike lines of Minkowski `ℝ^{1+1}` with `ε = −1` and `ε = 1` (§4.1); the unit hyperboloid in `ℝ^{1,2}` (§4.1).

### Dependencies

Layer 1 (§1.2); Layer 2 (§2.1–§2.5); RiemannianGeometry R5a; Mathlib immersion charts.

## Layer 5: Jacobi fields and variation theory

§5.1 concerns smooth Banach affine connections, with strong metrics or supplied weak
Levi-Civita connections for the metric identities and finite dimension for conjugate and focal
multiplicities; §5.2 concerns smooth normal geodesic foliations with the pairing and connection
hypotheses of §4.1, with finite dimension only for the trace.

### 5.1 Jacobi fields, energy variations and index forms

Define Jacobi fields along geodesics of a smooth torsion-free connection on a Banach
manifold by `J'' + R(J, γ')γ' = 0` (Lorentzian case: Minguzzi 2019, Proposition 6.3, p. 159),
with the solution API that RiemannianGeometry R2–R3 states for Riemannian metrics.
Prove existence and uniqueness from initial data and a continuous linear identification
of the solution space with the product of the two initial-data fibres, using convergence
of `J` and `D_t J` uniformly on compact parameter intervals in bundle charts. Finite-dimensionality
of that space follows in finite dimensions. Generalize the identification of `d(exp_p)`
with the Jacobi field of initial data `(0, w)`. For a smooth strong metric, or a weak
metric supplied with a smooth compatible torsion-free connection, generalize the
Wronskian conservation law (Lorentzian case: Minguzzi 2019, p. 160), first and second variations of
energy `E(γ) = ½∫g(γ', γ')`, and the index form
`I(X,Y) = ∫[g(D_t X,D_t Y) − g(R(X,γ')γ',Y)] dt` on fields with fixed zero endpoints.
Generalize the index boundary term from the shape operators of §4.1. In finite dimensions
define conjugate points with multiplicities and focal points of nondegenerate immersed
submanifolds, using this same Jacobi and variation API. For the Levi-Civita connection of a
positive-definite metric, prove that these objects agree with those of RiemannianGeometry
R2–R3. No finite-dimensional multiplicity, ordinary finite Morse index or
equivalence of injectivity and surjectivity of `d(exp_p)` is asserted for Banach manifolds;
Fredholm and mono-/epiconjugate-point theory belongs to a separate development.


**Checks.**

- For `J ⊥ γ′` in constant curvature `κ`, the shared equation is `J″ = −κ g(γ′,γ′) J`.
- On the de Sitter surface of §4.1 (`κ = 1`), along a unit timelike geodesic
  (`g(γ′, γ′) = −1`) the equation is `J″ = J`, and the field with `J(0) = 0` and `J′(0)` a unit
  normal is `sinh s` times that parallel normal, which never vanishes again; on the unit sphere
  along a unit geodesic `J″ = −J` gives `sin s`, vanishing at `s = π`.
- In Minkowski space along `s ↦ (s, 0)`, `J(s) = s∂_x` solves `J″ = 0 = −R(J, γ′)γ′` with `J(0) = 0`, `J′(0) = ∂_x`, and `d(exp_0)_{(1, 0)}(∂_x) = J(1) = ∂_x`, as `exp_0` is the identity.

*Needs:* §2.5, §3.2–§3.4, §4.1; existing RiemannianGeometry R2–R3 interfaces.

### 5.2 Operator Riccati and finite-dimensional trace identities

For normal geodesic families of §4.1's hypersurfaces on Banach manifolds, generalize the
Jacobi/shape-operator evolution API to the operator Riccati identity `B' + B² + R_u = 0`,
where `B(X) = ∇_X u` and `R_u(X) = R(X,u)u`, wherever the family supplies a local foliation
(Lorentzian case: Minguzzi 2019, Proposition 6.5, p. 163).
This identity does not require a trace. In finite dimensions, before focal points derive the trace
identity `θ' = −tr(B²) − Ric(u,u)`. With `m = dim M − 1 > 0` and
`σ = B − (θ/m) id`, this is `θ' = −θ²/m − tr(σ²) − Ric(u,u)`.
In indefinite finite signature, `tr(σ²)` need not be nonnegative. The quotient-bundle
null version and the positive-transverse-metric focusing consequences belong to
LorentzianGeometry.

**Checks.**

- On `diag(−1,1)`, `σ = [[0,1],[−1,0]]` is trace-free and self-adjoint but `tr(σ²) = −2`.
- Along unit-speed geodesics from a point of the unit round `S²` (`m = 1`, `Ric(u, u) = 1`) the
  distance circles have `B = cot r`, so `θ = cot r` and `θ′ = −1/sin² r = −θ² − Ric(u, u)`;
  without the Ricci term the identity would give `−cot² r`.
- For the radial unit lines of Euclidean `ℝ³` (`R = 0`, `m = 2`), `B = (1/r)` on `u^⊥`, `θ = 2/r`, `σ = 0`, and `θ′ = −2/r² = −θ²/2`.

*Needs:* §2.5, §4.1, §5.1.

### Examples

- Jacobi fields in constant curvature and in Minkowski space (§5.1); radial lines in Euclidean `ℝ³` and the indefinite screen matrix `σ = [[0, 1], [−1, 0]]` (§5.2).

### Dependencies

Layer 2 (§2.5); Layer 3 (§3.2–§3.4); Layer 4; RiemannianGeometry R2–R3.


## Downstream consumers

- LorentzianGeometry specializes Layers 1–5 to Lorentzian geometry and causality: the vector
  characters and orthogonal-subspace algebra of Layer 1, the Lorentzian subtype of the metric
  carrier with its Levi-Civita connection, curvature, warped products and extensions (§2.2–§2.7),
  the curve domains, geodesic flow and normal neighbourhoods of Layer 3, spacelike and null
  immersion geometry (§4.1), and the Jacobi, index and Riccati identities of Layer 5.
- Hyperbolic-PDE roadmaps on Lorentzian manifolds (wave equations and normally hyperbolic
  operators, characteristic hypersurfaces) consume Layers 2–4.
- General-relativity roadmaps (the Cauchy problem for the Einstein equations, black holes,
  `C^0`-extendibility statements) consume §2.5–§2.7.
- Infinite-dimensional geometry of mappings and shapes can use the Banach local connection,
  strong metric, supplied weak Levi-Civita, geodesic and variation APIs. The weak-metric
  applications and their analytic hypotheses are described by Bruveris and Michor–Mumford;
  constructing particular mapping spaces or Fréchet manifolds is outside this roadmap.
- Geometric PDE and nonsmooth geometry can use §3.2's locally Lipschitz connection flow
  and §3.4’s `C^{1,1}` metric normal-neighbourhood theory. Distributional, Finsler and Fréchet
  developments consume these interfaces under the scope boundary below.

## Scope and ownership

This roadmap owns the generalizations of the existing bundle, nondegenerate metric, curvature,
geodesic, immersion and variation APIs specified in Layers 1–5. LorentzianGeometry owns their
Lorentzian specializations and the causal theorems, built on these objects and proofs.
Signature, dimension, coefficient regularity and strongness are hypotheses of individual
results, with no second metric, geodesic or curvature theory for a different signature or
regularity.

**Shared foundations.** Every construction and theorem in scope is stated at the weakest
dimension, regularity and geometric hypotheses its mathematics permits: for a connection
on a general bundle, an affine connection on `TM`, a symmetric nondegenerate pairing,
a strong metric or a fixed finite signature. Generalizing the existing
Mathlib and Tau Ceti development is an implementation target: a Tau Ceti carrier or proof that
assumes positivity it does not use is extended in its existing shared home, and the
positive-definite statement is recovered by specialization. Generalizations of
Mathlib suppliers live in shared Tau Ceti modules using Mathlib's vocabulary. Preserve the
public Riemannian interfaces with aliases, wrappers or compatibility lemmas, with evaluation and
naturality lemmas so existing clients keep using them. A second permanent metric, curvature,
geodesic, Jacobi or immersion theory distinguished only by signature does not satisfy these
targets; the common construction and its proof are shared.

**Locality and bundles.** Differential constructions are defined on open sets, depend on
the appropriate germs or jets, commute with restriction and agree on overlaps. Use the
native bundle and `CovariantDerivative` interfaces and preserve their scalar generality
where the arguments permit. A metric on `TM` is a specialization of a fibre pairing;
torsion is specific to tangent-bundle connections, and torsion-free and metric-compatible
are separate hypotheses. Global smooth extensions, partitions of unity, countability and
compactness enter only in the results that need them. These requirements apply to the
generalization of the existing proofs, including the pointwise curvature construction.

HopfRinow supplies smooth nondegenerate metrics, Levi-Civita and Riemannian geodesic
interfaces. RiemannianGeometry R1.3, R2–R3 and R5a supply warped-product curvature, Jacobi,
index and immersion interfaces for positive-definite metrics; for positive-definite `g`, this
roadmap proves that its warped-product curvature, Jacobi, index and immersion objects agree
with those of RiemannianGeometry R1.3, R2–R3 and R5a. The one maximal flow and exponential
of §3.2 receives its stronger regularity properties in §3.3; normal domains in §3.4 add
bi-Lipschitz or smooth inverse properties under their own hypotheses. Riemannian distance,
Hopf–Rinow and positivity-dependent comparison and topological consequences remain with
the Riemannian roadmaps.

It leaves to other roadmaps:

- Lorentzian cones, time orientations, causal curves and relations, spacelike and null
  submanifolds, global hyperbolicity, `C^0`-inextendibility, focusing and the singularity
  theorems: LorentzianGeometry;
- the metric-variation calculus, Hilbert stress-energy, the density `|det g|^{1/2}`, the
  divergence and integration by parts for nondegenerate metrics: LocalVariationalFieldTheory
  LVF6;
- spin structures and Dirac operators: SpinGeometry;
- Euclidean function spaces, in particular `C^{k,α}(Ω)` and `C^{k,α}_loc(Ω)` on open
  `Ω ⊆ ℝⁿ`: PDE §1.7;
- principal bundles, induced connections and parallel transport: SmoothBundlesConnections
  B3–B5; §2.1 here supplies the local Banach and finite-regularity extensions of those
  interfaces required by the shared theory;
- the positive mass theorem for Riemannian asymptotically Euclidean manifolds: PositiveMass.

Distributional and Sobolev metrics and connections, distributional curvature, full Finsler
geometry and Fréchet or convenient-manifold analysis belong to separately specified
developments. They reuse the local bundle, connection, metric-pairing and ODE interfaces here.
No construction in this roadmap requires multiplying distributions, a Fréchet ODE theorem or a
general Finsler connection. The `C^{1,1}` targets use locally Lipschitz coefficients and
classical geodesics; that regularity alone does not supply a continuous classical curvature
tensor. Infinite-dimensional trace-class Ricci theory, Fredholm/Maslov index theory and global
completeness theorems are also outside this roadmap.

## Exact supplier contracts

### From Mathlib

- Bilinear and quadratic forms: `LinearMap.BilinForm.IsSymm`, `.Nondegenerate`, `.toDual`,
  `.restrict`, `.orthogonal`, `.finrank_orthogonal`, `.orthogonal_orthogonal`,
  `.isCompl_orthogonal_of_restrict_nondegenerate`, `.orthogonal_span_singleton_eq_toLin_ker`
  (`Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean`), `LinearMap.BilinMap.toQuadraticMap`,
  `ContinuousLinearMap.toBilinForm`; the inertia indices `sigPos`, `sigNeg` with
  `QuadraticForm.sigPos_add_sigNeg_add_radical`,
  `QuadraticForm.sigNeg_of_equiv_weightedSumSquares` and
  `QuadraticForm.equivalent_signType_weighted_sum_squared`
  (`Mathlib/LinearAlgebra/QuadraticForm/{Signature,Real}.lean`). These give Sylvester's law
  of inertia; §1.1 consumes it rather than reproving it.
- Manifolds and bundles: `ModelWithCorners`, `IsManifold`, `TangentSpace`, `TangentBundle`,
  `mfderiv`, `mfderivWithin`, `extChartAt`, `ContMDiffSection` with its notation `Cₛ^k⟮…⟯`,
  the hom-bundle instances, `Manifold.IsImmersion`, `Manifold.IsSmoothEmbedding`,
  `IsMIntegralCurve` and its existence and uniqueness theorems
  (`Mathlib/Geometry/Manifold/IntegralCurve/`).
- Connections: `CovariantDerivative`, `IsCovariantDerivativeOn`,
  `ContMDiffCovariantDerivative` (graded by `k : ℕ∞ω`) and the torsion API
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/`); the Lie bracket of vector
  fields `VectorField.mlieBracket` (`Mathlib/Geometry/Manifold/VectorField/LieBracket.lean`),
  in which §2.4 states torsion-freeness on Banach manifolds.
- Analysis: `LipschitzOnWith`, `LocallyLipschitzOn`, `HolderOnWith`, `iteratedFDerivWithin`,
  Arzelà–Ascoli (`BoundedContinuousFunction.arzela_ascoli`), and the ODE API of
  `Mathlib/Analysis/ODE/`.
- Banach local analysis: `ContinuousLinearMap.IsInvertible`, its continuous inverse, the
  smoothness of inversion `ContinuousLinearMap.IsInvertible.contDiffAt_map_inverse`
  (`Mathlib/Analysis/Calculus/ContDiff/Operations.lean`, for a complete domain),
  `ContinuousLinearEquiv`, continuous multilinear maps, operator-norm differentiation,
  the Banach inverse-function and Picard–Lindelöf APIs, in particular
  `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt` and
  `ODE_solution_unique_of_mem_Icc` (`Mathlib/Analysis/ODE/ExistUnique.lean`). The existing manifold theorem
  `exists_isMIntegralCurveAt_of_contMDiffAt` requires `CompleteSpace E`, not finite dimension
  (`Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.lean`). Use these suppliers for
  §2.1 and §3.2–§3.3; the finite-dimensional Peano lemma is a target of §3.2.
- Quantitative local inversion: `HasStrictFDerivAt.toOpenPartialHomeomorph`,
  `HasStrictFDerivAt.localInverse`, and the Lipschitz and antilipschitz estimates for
  `ApproximatesLinearOn` (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/`). These
  already apply in Banach spaces; §3.4 supplies the strict derivative and approximation
  estimates for the exponential map before applying them.

### From Tau Ceti

The metric carrier and native bundle vocabulary do not impose finite dimension throughout.
The musical-invertibility, Levi-Civita and curvature-tensor implementations cited below
use finite-dimensional hypotheses; generalizing the inverse step to strong metrics and
the local tensor construction to Banach bundles is part of §2.1–§2.5. Preserve their
finite-dimensional public interfaces.

- Smooth nondegenerate metrics: `TauCeti.Manifold.ContMDiffNondegenerateMetric`, its chart
  representative `chartMetric`, `inCoordinates` and the musical maps `flat` and `sharp`
  (`TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Basic.lean`), the invertibility
  of the flat map `ContMDiffNondegenerateMetric.isInvertible` and `contMDiff_sharp`
  (`.../NondegenerateMetric/Musical.lean`), the restriction
  `restrictOpenTangentSpace` (`.../Restriction.lean`), the local-isometry predicate
  `ContMDiffNondegenerateMetric.IsLocalIsometry` (`.../LocalIsometry.lean`), and the
  parameter families `ContMDiffNondegenerateMetricFamily` (`.../Family.lean`).
- Signature: `ContMDiffNondegenerateMetric.signature`, `isLocallyConstant_signature`,
  `signature_eq_of_mem_connectedComponent`, `signature_eq`, and
  `TauCeti.Manifold.isLocallyConstant_sigPos_sigNeg_of_continuous` for continuous families
  (`.../NondegenerateMetric/Signature.lean`).
- The nondegenerate Levi-Civita connection:
  `ContMDiffNondegenerateMetric.leviCivitaConnection`,
  `isLeviCivitaConnection_leviCivitaConnection`, `koszul`, `IsMetricCompatible`,
  `IsLeviCivitaConnection.uniqueness`, `IsLeviCivitaConnection.christoffelSymbol_eq` and
  `IsLeviCivitaConnection.contMDiffCovariantDerivative`
  (`TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/`).
- Along curves: `TauCeti.Manifold.curveVelocityWithin`, `CovariantDerivative.accelerationWithin`
  and the nondegenerate compatibility theorems, in particular
  `IsMetricCompatible.apply_curveVelocityWithin_self_eq_of_accelerationWithin_eq_zero`
  (`.../CovariantDerivative/AlongCurve/NondegenerateMetric.lean`).
- Curvature of a smooth connection: `CovariantDerivative.curvatureTensor`
  (`.../Curvature/Tensor.lean`) and `CovariantDerivative.ricciTensor` (`.../Curvature/Ricci.lean`),
  both metric-free; the positive-definite `CovariantDerivative.scalarCurvature`
  (`.../Curvature/Scalar.lean`).
- Curvature laws of Riemannian metrics, generalized in §2.5: local-isometry naturality
  `TauCeti.IsLocalRiemannianIsometry.mfderiv_curvatureTensor`
  (`TauCeti/Geometry/Manifold/Riemannian/Isometry/Curvature.lean`), constant scaling
  `Bundle.ContMDiffRiemannianMetric.curvatureTensor_leviCivitaConnection_rescale_const`
  (`TauCeti/Geometry/Manifold/Riemannian/Scaling.lean`), the product law
  `TauCeti.Manifold.tangentSpaceProdEquiv_curvatureTensor_leviCivitaConnection_prod`
  (`.../Curvature/Prod.lean`), the conformal-change law
  `Bundle.ContMDiffRiemannianMetric.curvatureTensor_leviCivitaConnection_rescale`
  (`.../Curvature/Conformal.lean`), Schur's theorem
  `CovariantDerivative.hasConstantSectionalCurvature_of_forall_hasSectionalCurvatureAt`
  (`.../Curvature/Schur.lean`) and constancy of the Einstein factor
  `CovariantDerivative.eq_of_ricciTensor_eq_smul_inner` (`.../Curvature/Einstein.lean`).
- Warped products: the Riemannian warped-product metric `TauCeti.Manifold.IsWarpedProduct`
  (`TauCeti/Geometry/Manifold/Riemannian/WarpedProd.lean`) and its Levi-Civita connection
  `TauCeti.Manifold.IsWarpedProduct.tangentSpaceProdEquiv_leviCivitaConnection_prodVectorField`
  (`.../LeviCivita/WarpedProd.lean`), generalized in §2.6; their curvature is
  RiemannianGeometry R1.3's.
- Riemannian geodesics: `TauCeti.Manifold.IsGeodesicCurveOn`, `TauCeti.Manifold.geodesicSpray`,
  `TauCeti.Manifold.expDomain`, `TauCeti.Manifold.riemannianExp` and
  `TauCeti.Manifold.IsNormalDomain` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/`),
  whose implementations are generalized to the common connection-level API in Layer 3.
- `TauCeti.Manifold.IsPiecewiseContMDiffOn` (`TauCeti/Geometry/Manifold/PiecewisePath.lean`).
- `TauCeti.HolderSpace` and `TauCeti.CkHolderSpace` (`TauCeti/Analysis/Holder/`), for §2.3.
- `ContinuousLinearMap.isInvertible_of_separatingLeft`
  (`TauCeti/Topology/Algebra/Module/BilinearForm.lean`): on a finite-dimensional space a
  continuous map into the dual whose bilinear form is left-separating is invertible, which makes
  every finite-dimensional nondegenerate metric strong (§2.2).

### From TauCetiRoadmap.HopfRinow (completed)

Layer 1: the nondegenerate Levi-Civita supplier listed above, the covariant derivative along
a curve, the Riemannian geodesic spray, flow, maximal intervals and exponential map, normal
neighbourhoods and the manifold inverse-function theorem. Layer 3 here generalizes the local
flow and inverse-function arguments to Banach connections, with the separate locally
Lipschitz theory in §3.2.

### From TauCetiRoadmap.SmoothBundlesConnections (on main)

B3.1–B3.3: principal connections, the Atiyah sequence, and the connections induced on
associated bundles, identified with Mathlib's `CovariantDerivative`, with their dual, tensor and
Hom connections; B4.1: curvature and the exterior covariant derivative; B5.0 and B5.2:
horizontal lifts and parallel transport along piecewise `C¹` paths, holonomy and flat
connections. They are stated for smooth finite-rank bundles over finite-dimensional manifolds
without boundary; §2.1 uses them in that setting and adds the local Banach and
finite-regularity generalizations.

### From TauCetiRoadmap.RiemannianGeometry (on main)

R1.3: the curvature and Ricci tensors of warped products;
R2: Jacobi fields, initial data, Wronskians and the differential of the exponential map;
R3: energy variations, index forms and conjugate points; R5a: immersion geometry. This roadmap
states the semi-Riemannian versions of these objects and proves that for positive-definite
metrics they agree with R1.3, R2–R3 and R5a; the results using positive-definite
estimates are used as RiemannianGeometry states them. The curvature identities and the curvature
of products are Tau Ceti's, under From Tau Ceti.

### From TauCetiRoadmap.PDE (on main)

§1.7: `C^{k,α}(Ω)`, `C^{k,α}_loc(Ω)` and their product estimates. §2.3 here compares the
chartwise Hölder classes of a metric with `C^{k,α}_loc` of its components.

### From TauCetiRoadmap.LocalVariationalFieldTheory (on main)

LVF6: the density `|det g|^{1/2}`, the divergence of a vector field and integration by parts
for a nondegenerate metric. §2.5 consumes the divergence for the contracted Bianchi identity.

## References

Theorem and page numbers of a preprint are those of the arXiv version named in its entry.

- M. Bruveris, *Riemannian geometry for shape analysis and computational anatomy*,
  [arXiv:1807.11290v1](https://arxiv.org/abs/1807.11290v1): Banach/Hilbert foundations,
  strong and weak metrics, connections and the limits of infinite-dimensional completeness.
- P. W. Michor, D. Mumford, *Vanishing geodesic distance on spaces of submanifolds and
  diffeomorphisms*, [arXiv:math/0409303](https://arxiv.org/abs/math/0409303): weak metrics
  and the distinction between positivity and distance separation.
- M. Kunzinger, R. Steinbauer, M. Stojković, *The exponential map of a `C^{1,1}`-metric*,
  [arXiv:1306.4776v3](https://arxiv.org/abs/1306.4776v3): locally bi-Lipschitz exponential
  maps and totally normal neighbourhoods for finite-dimensional semi-Riemannian metrics.
- E. Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*,
  [arXiv:1308.6675v2](https://arxiv.org/abs/1308.6675v2): quantitative ODE, low-regularity
  inverse and Gauss lemmas and convex normal neighbourhoods.
- P. G. LeFloch, C. Mardare, *Definition and stability of Lorentzian manifolds with
  distributional curvature*, [arXiv:0712.0122](https://arxiv.org/abs/0712.0122): context
  for the separately scoped distributional geometry, not an implementation target here.
- B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, Academic Press
  (1983): Ch. 2 (scalar products), Ch. 3 (semi-Riemannian manifolds), Ch. 4 (submanifolds),
  Ch. 7 (warped products), Ch. 10 (variations, Jacobi fields, focal points).
- E. Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019) 3 (open access;
  page numbers of the article).
- J. Barzen, F. Leymann, *Mathematics of Spacetime: A Guided Tour Through The Underlying
  Differential Topology and Differential Geometry*,
  [arXiv:2606.02616](https://arxiv.org/abs/2606.02616): constant curvature and warped products of
  semi-Riemannian metrics.
- É. Gourgoulhon, *3+1 Formalism and Bases of Numerical Relativity*,
  [arXiv:gr-qc/0703035v1](https://arxiv.org/abs/gr-qc/0703035v1): Gauss–Codazzi relations of
  spacelike hypersurfaces.
- S. Kobayashi, K. Nomizu, *Foundations of Differential Geometry*, Vol. I, Wiley (1963), §III.8.
