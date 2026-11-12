# Roadmap: semi-Riemannian foundations and Lorentzian causality

**Summary.** Part I develops shared scalar-product, bundle-connection and metric-pairing
foundations, a local Banach-manifold theory, one geodesic flow across regularities,
nondegenerate immersion geometry, and Jacobi and variation theory. Its metric carrier is
the regularity extension of the existing nondegenerate metric, with a strongness predicate
for continuous dual inverses and conditional Levi-Civita theory for weak metrics.
Part II specializes these foundations to finite-dimensional Lorentzian cones, time
orientations, causal curves, null geometry, global hyperbolicity and the singularity
theorems. Local causal geometry includes `C^{1,1}` metrics. Conformal transport relates
the causal predicates and null geodesic images while retaining the metric dependence of
length and affine parametrization.

This README is the roadmap. `Suggested.lean` prototypes selected interfaces against the
pinned Mathlib and Tau Ceti; it is not exhaustive. The two parts have section identifiers
`F` (foundations) and `C` (causality), and Part I has no implementation dependency on Part II.

## Scope and ownership

Part I owns the generalizations of the existing bundle, nondegenerate metric, curvature,
geodesic, immersion and variation APIs specified in §F0–§F4. Part II owns the Lorentzian
specializations and causal theorems specified in §C0–§C7. Their common objects and proofs
are shared. Signature, dimension, coefficient regularity and strongness are hypotheses
of individual results, with no second metric, geodesic or curvature theory for a different
signature or regularity.

**Shared foundations.** Every construction and theorem in scope is stated at the weakest
dimension, regularity and geometric hypotheses its mathematics permits: for a connection
on a general bundle, an affine connection on `TM`, a symmetric nondegenerate pairing,
a strong metric, a fixed finite signature, or a Lorentzian metric. Generalizing the existing
Mathlib and Tau Ceti development is an implementation target. Audit each supplier used below
for unnecessary positivity assumptions; extend its carrier and proof in its existing shared
home, and recover the positive-definite statement by specialization. Generalizations of
Mathlib suppliers live in shared Tau Ceti modules using Mathlib's vocabulary. Preserve the
public Riemannian interfaces with aliases, wrappers or compatibility lemmas, with evaluation and
naturality lemmas so existing clients keep using them. A second permanent metric, curvature,
geodesic, Jacobi or immersion theory distinguished only by signature does not satisfy these
targets. Comparison lemmas bridge existing representations during integration; the common
construction and its proof are shared.

**Locality and bundles.** Differential constructions are defined on open sets, depend on
the appropriate germs or jets, commute with restriction and agree on overlaps. Use the
native bundle and `CovariantDerivative` interfaces and preserve their scalar generality
where the arguments permit. A metric on `TM` is a specialization of a fibre pairing;
torsion is specific to tangent-bundle connections, and torsion-free and metric-compatible
are separate hypotheses. Global smooth extensions, partitions of unity, countability and
compactness enter only in the results that need them. These requirements apply to the
generalization of the existing proofs, including the pointwise curvature construction.

HopfRinow supplies smooth nondegenerate metrics, Levi-Civita and Riemannian geodesic
interfaces. RiemannianGeometry R1–R3 and R5a supply curvature, Jacobi, index and immersion
interfaces. Extend their reusable constructions in those shared APIs and preserve their
positive-definite public interfaces by specialization. The one maximal flow and exponential
of §F2.2 receives its stronger regularity properties in §F2.3; normal domains in §F2.4 add
bi-Lipschitz or smooth inverse properties under their own hypotheses. Riemannian distance,
Hopf–Rinow and positivity-dependent comparison and topological consequences remain with
the Riemannian roadmaps.

It leaves to other roadmaps:

- the metric-variation calculus, Hilbert stress-energy, the density `|det g|^{1/2}`, the
  divergence and integration by parts for nondegenerate metrics: LocalVariationalFieldTheory
  LVF6;
- spin structures and Dirac operators: SpinGeometry;
- Euclidean function spaces, in particular `C^{k,α}(Ω)` and `C^{k,α}_loc(Ω)` on open
  `Ω ⊆ ℝⁿ`: PDE §1.7;
- principal bundles, induced connections and parallel transport: SmoothBundlesConnections
  B3–B5; §F1.1 here supplies the local Banach and finite-regularity extensions of those
  interfaces required by the shared theory;
- the positive mass theorem for Riemannian asymptotically Euclidean manifolds: PositiveMass.

Outside this roadmap: wave equations and normally hyperbolic operators on Lorentzian
manifolds, their Green operators and energy estimates, the Cauchy problem for the Einstein
equations and maximal globally hyperbolic developments, matter models, asymptotic flatness,
null infinity, Bondi and spacetime ADM mass, black-hole regions and specific black-hole
families beyond the Schwarzschild exterior of §C1.2. These belong to a hyperbolic-PDE roadmap
and to general-relativity roadmaps that consume this one. On flat Minkowski space the causal
Green operators of Klein–Gordon, Dirac and Maxwell are owned by
RelativisticQuantumFieldTheory, which may consume §C2.3's `J^±`.

Distributional and Sobolev metrics and connections, distributional curvature and weak energy
conditions, full Finsler and Lorentz–Finsler geometry, general closed-cone causality, and
Fréchet or convenient-manifold analysis belong to separately specified developments. They
reuse the local bundle, connection, metric-pairing and ODE interfaces here. No construction
in this roadmap requires multiplying distributions, a Fréchet ODE theorem or a general
Finsler connection. The `C^{1,1}` targets use locally Lipschitz coefficients and classical
geodesics; that regularity alone does not supply a continuous classical curvature tensor. Infinite-dimensional
trace-class Ricci theory, Fredholm/Maslov index theory and global completeness or causality
theorems are also outside this roadmap.

## Conventions

**Signature and generality.** In finite dimensions write `(p, q)` for `p` positive and `q` negative directions,
so `p + q = dim M`; the index is the maximal dimension of a negative-definite subspace,
Mathlib's `sigNeg` of the associated quadratic form. A nondegenerate metric has locally
constant signature, fixed on each connected component. Shared results allow every signature,
including `(p, 0)` and `(0, q)`, and every dimension their statements admit. Fixed signature
is a predicate on the shared carrier, not another metric field. Lorentzian scalar products
have signature `(n, 1)`, with diagonal `(−, +, …, +)`. A vector `v` is timelike if
`g(v,v) < 0`, null if `g(v,v) = 0` and `v ≠ 0`, causal if timelike or null, and spacelike if
`g(v,v) > 0` or `v = 0` (O'Neill's convention; the zero vector is spacelike and not causal).
Tau Ceti's `TauCeti.minkowskiNormSq (t, x) = t² − ‖x‖²` uses the opposite sign; it is the
negative of the quadratic form of `minkowskiForm` below. RelativisticQuantumFieldTheory
and LocalVariationalFieldTheory's Klein–Gordon model use `η = diag(+1,−1,−1,−1)`; their
quadratic forms are the negatives of ours, and their timelike vectors are ours.

**Dimension and strength.** Local bundle and connection theory uses real Banach model and
fibre spaces, with Hilbert spaces as an important specialization. Metric fields are bounded
symmetric bilinear pairings and nondegeneracy means injectivity of
`g^♭_x : T_xM →L[ℝ] (T_xM →L[ℝ] ℝ)`. A metric is strong when each `g^♭_x` is a
continuous linear isomorphism (`ContinuousLinearMap.IsInvertible`). Strongness is a predicate
on the same carrier. Finite-dimensional nondegenerate metrics are automatically strong;
in infinite dimensions inverse-metric constructions require strongness explicitly. A weak
metric can be used with a supplied compatible torsion-free connection; existence of such
a connection does not follow from injectivity.

Finite dimension is explicit in §F0's inertia and dimension formulas, §F1.5's Ricci
and scalar traces, §F1.7's extension theory and §F4.1's conjugate/focal multiplicities.
Part II uses finite-dimensional manifolds; the sign predicates and cone formulas retain
any stronger generality supplied by their native definitions. For signature `(p,q)`,
dimension is `d=p+q`; Lorentzian statements use `d=n+1`. Nonzero null vectors exist
exactly when `p,q≥1`, which is `n≥1` in the Lorentzian case. “(3+1)-dimensional” means
`finrank ℝ E=4`.

**Where index one is needed.** §C0.2–§C0.3 and the causal and focusing results in
Part II use Lorentzian signature. The local null-hypersurface algebra in §C3.2–§C3.3
works in any finite signature. For `q≥2` the negative vectors are connected, so the
metric does not distinguish future and past components. A null screen `L^⊥/ℝL` has
signature `(p−1,q−1)`; its positive definiteness in the focusing arguments uses `q=1`.

**Manifolds and regularity.** The base manifold is smooth. Pairings, connections and
curves carry their own regularities, with orders encoded by `k : ℕ∞ω`, `k≤∞`.
`C^{1,1}` means `C¹` with locally Lipschitz first chart derivatives. The shared flow
uses locally Lipschitz coefficients; `C^r` coefficients improve the regularity of that
same flow. The global splitting and singularity theorems use smooth metrics.

Bundle fields and their within-chart differential identities permit corners. Unrestricted
two-sided local flows use the interior or manifolds without boundary. Optical foliations
at corners use the stratum-surjectivity conditions in §C3.2; generator flows at boundary
points use face tangency in §C3.3. The global causal theory in §C4–§C7 is boundaryless.
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

**Time orientation.** A time orientation is an equivalence class of continuous timelike
vector fields, `T ~ T'` iff `g(T, T') < 0` everywhere. A causal vector `v` is future-directed
for `[T]` iff `g(v, T) < 0`. A spacetime is a connected time-oriented Lorentzian manifold;
Lean bundles the metric and the time orientation (`TimeOrientedLorentzianMetric`) and keeps
`[ConnectedSpace M]` as a hypothesis, with no separate spacetime class.

**Curves.** Domains and admissible changes of parameter are specified in §F2.1.
Compact and open nontrivial domains require `a<b`; inextendibility means absence of the
appropriate endpoint in `M`, with limits taken from within the domain. `I^±` uses regular
piecewise `C¹` timelike curves; `J^±` uses locally Lipschitz curves with nonzero future
causal velocity almost everywhere, and includes the diagonal separately. §C4.3 proves
agreement of causal endpoint relations at `C^{1,1}` regularity. A curve with a null
geodesic image need not be a `C²` pregeodesic in its original parameter.

**Lengths and time separation.** The Lorentzian length of a causal curve is
`L(γ) = ∫_a^b √(−g(γ', γ')) dt`. The time separation is
`τ(p, q) = sup {L(γ) : γ future causal from p to q}` in `ℝ≥0∞` for `q ∈ J^+(p)` and
`τ(p, q) = 0` otherwise (O'Neill, Ch. 14).

**Hypersurfaces.** For a nondegenerate hypersurface choose a unit normal `ν` with
`g(ν, ν) = ε ∈ {−1, 1}`; formulas retain `ε` explicitly. Its scalar second
fundamental form is `k(X, Y) = g(∇_X ν, Y)` and its mean curvature is the metric trace
`H = tr_h k`. With RiemannianGeometry's vector-valued second fundamental form `II`,
`II(X, Y) = −ε k(X, Y)ν`; its averaged mean-curvature vector is `−ε(H/m)ν` for
`m = dim Σ > 0`. For a Lorentzian spacelike hypersurface with future unit normal `ν`, the second
fundamental form is `k(X, Y) = g(∇_X ν, Y)` and the mean curvature is `H = tr_h k`, so the
future unit hyperboloid `{t² − |x|² = 1, t > 0}` in Minkowski space has `k = h` and `H = n`.
For a null hypersurface of any signature with a chosen null normal `L`, the null second fundamental form is
`B(X, Y) = g(∇_X L, Y)` on `TΣ/ℝL` and the expansion is `θ = tr B` with respect to the
nondegenerate form induced on `TΣ/ℝL`. This form is positive definite in Lorentzian
signature. A closed spacelike codimension-two surface in a spacetime is trapped if both
future null expansions are negative.

**Domains of dependence.** `D^+(A)` is the set of `p` such that every past-inextendible
causal curve through `p` meets `A` (Hawking–Ellis, §6.5; O'Neill, Ch. 14); `D(A) = D^+(A) ∪
D^−(A)`; the future Cauchy horizon is `H^+(A) = closure(D^+(A)) \ I^−(D^+(A))`. A Cauchy
surface is a set met exactly once by every inextendible timelike curve. Global hyperbolicity
is causality together with compactness of every `J^+(p) ∩ J^−(q)` (Bernal–Sánchez 2007); §C6.3
proves the equivalence with the strongly causal form.

**Extensions.** A `C^l`-extension of a connected semi-Riemannian manifold `(M, g)` without boundary
is a smooth embedding `ι : M → M̃` into a connected Hausdorff semi-Riemannian manifold `(M̃, g̃)`
without boundary, modelled on the same `I` and in the same universe, with `g̃` of class `C^l`,
`ι^* g̃ = g` and `ι(M) ≠ M̃`. `(M, g)` is `C^l`-inextendible if it has none.

**Names.** Extend the shared `TauCeti/LinearAlgebra/BilinearForm/` and
`TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/` APIs for arbitrary-signature
foundations, and the existing `CovariantDerivative` and immersion APIs for their generalized
objects. The metric carrier is the regularity extension of
`TauCeti.Manifold.ContMDiffNondegenerateMetric`, with omitted regularity retaining the smooth
interface; `LorentzianMetric I M k` is its index-one subtype. Suggested homes for the
Lorentzian-specific material are `TauCeti/LinearAlgebra/BilinearForm/Lorentzian/` for §C0,
in the `LinearMap.BilinForm` namespace (`LinearMap.BilinForm.IsLorentzian`, `.IsTimelike`,
`.IsNull`, `.IsCausal`, `.IsSpacelike`, `.timeCone`), and
`TauCeti/Geometry/Manifold/Lorentzian/` for Part II, in `TauCeti.Manifold`
(`TauCeti.Manifold.LorentzianMetric`, `LorentzianMetric.TimeOrientation`,
`chronologicalFuture`, `causalFuture`, `IsCauchySurface`, `IsGloballyHyperbolic`, …). The
connection-level geodesic carriers of §F2 live in the `CovariantDerivative`
namespace beside Tau Ceti's along-curve API.

## Exact supplier contracts

### From Mathlib

- Bilinear and quadratic forms: `LinearMap.BilinForm.IsSymm`, `.Nondegenerate`, `.toDual`,
  `.restrict`, `.orthogonal`, `LinearMap.BilinMap.toQuadraticMap`,
  `ContinuousLinearMap.toBilinForm`; the inertia indices `sigPos`, `sigNeg` with
  `QuadraticForm.sigPos_add_sigNeg_add_radical`,
  `QuadraticForm.sigNeg_of_equiv_weightedSumSquares` and
  `QuadraticForm.equivalent_signType_weighted_sum_squared`
  (`Mathlib/LinearAlgebra/QuadraticForm/{Signature,Real}.lean`). These give Sylvester's law
  of inertia; §F0.1 consumes it rather than reproving it.
- Manifolds and bundles: `ModelWithCorners`, `IsManifold`, `TangentSpace`, `TangentBundle`,
  `mfderiv`, `mfderivWithin`, `extChartAt`, `ContMDiffSection` with its notation `Cₛ^k⟮…⟯`,
  the hom-bundle instances, `Manifold.IsImmersion`, `Manifold.IsSmoothEmbedding`,
  `IsMIntegralCurve` and its existence and uniqueness theorems
  (`Mathlib/Geometry/Manifold/IntegralCurve/`).
- Connections: `CovariantDerivative`, `IsCovariantDerivativeOn`,
  `ContMDiffCovariantDerivative` (graded by `k : ℕ∞ω`) and the torsion API
  (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/`).
- Analysis: `LipschitzOnWith`, `LocallyLipschitzOn`, Rademacher's theorem
  `LipschitzWith.ae_differentiableAt` and its one-variable form
  `LipschitzWith.ae_differentiableAt_real`, `HolderOnWith`, `iteratedFDerivWithin`,
  Arzelà–Ascoli (`BoundedContinuousFunction.arzela_ascoli`), and the ODE API of
  `Mathlib/Analysis/ODE/`.
- Banach local analysis: `ContinuousLinearMap.IsInvertible`, its continuous inverse,
  `ContinuousLinearEquiv`, continuous multilinear maps, operator-norm differentiation,
  the Banach inverse-function and Picard–Lindelöf APIs. The existing manifold theorem
  `exists_isMIntegralCurveAt_of_contMDiffAt` requires `CompleteSpace E`, not finite dimension
  (`Mathlib/Geometry/Manifold/IntegralCurve/ExistUnique.lean`). Use these suppliers for
  §F1.1 and §F2.3/§F2.2; the finite-dimensional Peano lemma is a target of §F1.4.
- Quantitative local inversion: `HasStrictFDerivAt.toOpenPartialHomeomorph`,
  `HasStrictFDerivAt.localInverse`, and the Lipschitz and antilipschitz estimates for
  `ApproximatesLinearOn` (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/`). These
  already apply in Banach spaces; §F2.2 supplies the strict derivative and approximation
  estimates for the exponential map before applying them.
- Riemannian distance: `Manifold.pathELength`, `Manifold.riemannianEDist`,
  `EMetricSpace.ofRiemannianMetric`, `IsRiemannianManifold`.

### From Tau Ceti

The metric carrier and native bundle vocabulary do not impose finite dimension throughout.
The musical-invertibility, Levi-Civita and curvature-tensor implementations cited below
use finite-dimensional hypotheses; generalizing the inverse step to strong metrics and
the local tensor construction to Banach bundles is part of §F1.1–§F1.5. Preserve their
finite-dimensional public interfaces.

- Smooth nondegenerate metrics: `TauCeti.Manifold.ContMDiffNondegenerateMetric`
  (`TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Basic.lean`), its chart
  representative `chartMetric`, `inCoordinates`, the musical maps `flat` and `sharp` with
  `contMDiff_sharp` (`.../NondegenerateMetric/Musical.lean`), the restriction
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
  (`.../Curvature/Scalar.lean`) and the Riemannian warped-product curvature
  (`.../Curvature/WarpedProd*.lean`), whose signature-independent formulas are generalized in §F1.5–§F1.6.
- Riemannian geodesics: `TauCeti.Manifold.IsGeodesicCurveOn`, `TauCeti.Manifold.geodesicSpray`,
  `TauCeti.Manifold.expDomain`, `TauCeti.Manifold.riemannianExp` and
  `TauCeti.Manifold.IsNormalDomain` (`TauCeti/Geometry/Manifold/Riemannian/Geodesic/`), as
  whose implementations are generalized to the common connection-level API in §F2.
- `TauCeti.nonempty_contMDiffRiemannianMetric`
  (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`): auxiliary Riemannian
  metrics, used for smoothing time orientations and for Lipschitz parametrizations.
- `TauCeti.Manifold.IsPiecewiseContMDiffOn` (`TauCeti/Geometry/Manifold/PiecewisePath.lean`).
- `TauCeti.minkowskiNormSq`, `TauCeti.futureCone`, `TauCeti.hyperboloid`
  (`TauCeti/Geometry/Hyperbolic/Hyperboloid/Basic.lean`): the Minkowski square norm in the
  opposite signature, its open future cone and the unit hyperboloid.
- `TauCeti.HolderSpace` and `TauCeti.CkHolderSpace` (`TauCeti/Analysis/Holder/`), and the
  orientation double cover `TauCeti.Manifold.OrientationCover`
  (`TauCeti/Geometry/Manifold/Orientation/Cover/`) as the model for §C2.1's double cover.

### From TauCetiRoadmap.HopfRinow (completed)

Layer 1: the nondegenerate Levi-Civita supplier listed above, the covariant derivative along
a curve, the Riemannian geodesic spray, flow, maximal intervals and exponential map, normal
neighbourhoods and the manifold inverse-function theorem. §F2 generalizes the local
flow and inverse-function arguments to Banach connections, with the separate locally
Lipschitz theory in §F2.2.

### From TauCetiRoadmap.RiemannianGeometry (on main)

R1: curvature identities and the curvature of products, warped products and the round sphere;
R2: Jacobi fields, initial data, Wronskians and the differential of the exponential map;
R3: energy variations, index forms and conjugate points; R5a: immersion geometry. Generalize
these APIs wherever positivity is unnecessary, using the shared-foundations contract above.
The sphere and results using positive-definite estimates use the Riemannian specialization.

### From TauCetiRoadmap.PDE (on main)

§1.7: `C^{k,α}(Ω)`, `C^{k,α}_loc(Ω)` and their product estimates. §F1.3 here compares the
chartwise Hölder classes of a metric with `C^{k,α}_loc` of its components.

### From TauCetiRoadmap.LocalVariationalFieldTheory (on main)

LVF6: the density `|det g|^{1/2}`, the divergence of a vector field and integration by parts
for a nondegenerate metric. §F1.5 consumes the divergence for the contracted Bianchi identity.

### From TauCetiRoadmap.DifferentialGeometry (on main)

Layer 2: the orientation double cover, used as the pattern for the time-orientation double
cover; Layer 3: flows of vector fields.

## Prior work and coordination

PhysLean (Lean 4, Apache-2.0) formalizes Minkowski space, the Lorentz group and causal
characters of Lorentz vectors in the `(+, −, −, −)` signature. It is prior art for §C0;
coordinate notation and the signature conversion with its authors where practical. The
closed Mathlib PR [mathlib4#38194](https://github.com/leanprover-community/mathlib4/pull/38194)
proposed an `IndefiniteMetric` structure on bilinear forms; it did not land, and §F0/§C0 use
Mathlib's `LinearMap.BilinForm` predicates directly. If Mathlib later adopts an indefinite
scalar-product carrier, adopt it.

## Build order and hypotheses

Read Part I in order §F0 → §F1 → §F2 → §F3 → §F4. Read Part II in order
§C0 → §C1 → §C2 → §C3 → §C4 → §C5 → §C6 → §C7, importing the indicated
foundation sections. An example can cite a consequence proved in another section;
each target's *Needs* line identifies its actual construction prerequisites. Hypotheses
appear on every milestone, with the following overview.

| Targets | Dimension | Regularity | Metric or connection input |
| --- | --- | --- | --- |
| §F0 | Finite | Algebraic | Symmetric nondegenerate form |
| §F1.1 | Banach base and fibres | Local coefficient order | Supplied bundle connection |
| §F1.2–§F1.3 | Normed/Banach | `C^k`, `C^{k,α}` | Pairing; strongness for inverse |
| §F1.4–§F1.6 | Banach, finite for traces | Stated derivative order | Strong metric or supplied weak Levi-Civita |
| §F1.7 | Finite | Metric class `C^k` | Nondegenerate metric |
| §F2.1–§F2.2 | Banach; Peano finite | Curve order; locally Lipschitz coefficients for flow | Supplied tangent connection |
| §F2.3–§F2.4 | Banach; Lipschitz convex neighbourhoods finite | `C^r` upgrades; `C^{1,1}` radial Gauss | Same flow; metric only for Gauss |
| §F3–§F4 | Banach; multiplicities/traces finite | Orders stated per target | Strong induced metric or supplied connection |
| §C0–§C3 | Finite | Continuous metrics and stated immersion orders | Lorentzian, except general null algebra |
| §C4 | Finite | `C^{1,1}` local causality; `C¹` conformal null predicates | Time-oriented Lorentzian metric |
| §C5–§C7 | Finite | Smooth for global analytic theorems | Time-oriented Lorentzian metric and stated global hypotheses |

## Part I: shared foundations

### F0 Scalar products and finite signature

#### F0.1 Signature and scalar products

*Hypotheses:* Finite-dimensional real vector spaces; no manifold or metric regularity.

For a finite-dimensional real vector space, use Mathlib's symmetry, nondegeneracy and inertia
indices to express signature `(p, q)`. Derive the diagonal normal form with `q` negative
and `p` positive unit entries from Sylvester's law; each signature class is open among
symmetric forms. Orthogonal sums add signatures, a positive scaling preserves signature,
and a negative scaling interchanges `p` and `q`. Reuse existing quadratic-form results.
Vector-character predicates use the sign of the quadratic form; the Lorentzian cone
theorems are the specializations in §C0.


**Checks.**

- Orthogonal sums of signatures `(2,1)` and `(1,2)` have signature `(3,3)`.
- Multiplication by `−1` exchanges the two inertia indices.

*Needs:* Mathlib's bilinear forms, inertia indices and Sylvester theorem.

#### F0.2 Orthogonal subspaces and null hyperplanes

*Hypotheses:* Finite-dimensional real scalar products of any signature.

For a symmetric nondegenerate `b` of signature `(p, q)` and any subspace `W`, develop
orthogonal complements, `dim W + dim W^⊥ = dim V`, `(W^⊥)^⊥ = W`, and
`rad(b|W) = W ∩ W^⊥`. A nondegenerate restriction gives `V = W ⊕ W^⊥` with additive
signatures. For a nonzero covector `ξ`, `(ker ξ)^⊥ = ℝ ξ^♯`; its kernel is degenerate
iff `ξ^♯` is null, and then its radical is exactly this line. A negative unit normal gives
kernel signature `(p, q − 1)`, a positive unit normal `(p − 1, q)`, and a null normal
gives quotient signature `(p − 1, q − 1)`. General degenerate subspaces can have larger
radicals; classify restrictions by their inertia indices and radical dimension.


**Checks.**

- In `diag(−1,−1,1,1)`, the span of `e₀+e₂` and `e₁+e₃` is totally null of dimension two.
- A null hyperplane has a radical line, although general degenerate subspaces can have larger radicals.

*Needs:* §F0.1; Mathlib orthogonal complements, restrictions and dual maps.

### F1 Local bundle calculus and metric pairings

#### F1.1 Local bundle connections and curvature

*Hypotheses:* Supplied smooth Banach bundles; local coefficient regularity as stated; no metric or global bump functions.

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
`R_x(u,v) = DΓ_x(u)(v) − DΓ_x(v)(u) + [Γ_x(u), Γ_x(v)]`.
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
- A connection on a bundle other than `TM` has curvature without any tangent metric or
  notion of torsion; restriction to an open chart requires no global smooth bump functions.

*Needs:* Mathlib local connections, continuous multilinear maps, Banach ODE; SmoothBundlesConnections B3–B5 and the existing Tau Ceti curvature interfaces.

#### F1.2 Regularity-graded pairings and strong inverses

*Hypotheses:* Normed bundle pairings, Banach completeness for analytic steps; strongness only for inverses; finite dimension for inertia indices.

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
is smooth and may have boundary or corners. In finite dimensions define `HasSignature g p q`
pointwise through `sigPos` and `sigNeg`. Positive-definite strong metrics give the native Riemannian specialization,
with the existing `Bundle.ContMDiffRiemannianMetric` interface retained. A tangent vector,
a vector field, or a piecewise `C¹` curve's one-sided velocities are timelike, null, causal
or spacelike when their values are.

Define `IsStrong g := ∀ x, (g x).IsInvertible` using the metric itself as the continuous
flat map into the continuous dual. Develop the pairing and injectivity API without strongness.
For strong metrics, construct the continuous linear musical isomorphisms and inverse metric,
prove that the inverses have the same regularity by the Banach inverse-operator theorem,
and retain the existing finite-dimensional `flat` and `sharp` interfaces as specializations.
Prove that every finite-dimensional nondegenerate metric is strong. Smooth strong metrics
and weak metrics with supplied connections use the same downstream connection API.

- Lowering the order: `g.ofLE (h : l ≤ k)`, with identity and composition laws, preserving
  symmetry, nondegeneracy, signature, strongness and positive definiteness.
- Extend the existing `chartMetric`, `inCoordinates`, restrictions, local-isometry and
  parameter-family APIs to every admissible regularity and Banach dimension; musical
  inverses require strongness. At order `∞` recover the existing smooth carrier
  and operations, with compatibility on evaluation and existing theorem interfaces. Identify
  the positive-definite strong specialization with the native Riemannian metric carrier at the
  corresponding regularity. On a connected manifold, a fixed finite signature can be checked
  at one point. The Lorentzian subtype and its specializations are defined in §C1.1.
- Strong invertibility is open in the operator norm. In finite dimensions every signature
  class is open: a continuous symmetric bilinear-form field close to one of
  signature `(p, q)` at a point has that signature near the point (Tau Ceti's
  `isLocallyConstant_sigPos_sigNeg_of_continuous` together with openness of nondegeneracy).
- Constructions, each preserving the class `C^k`: restriction to open subsets, pullback along
  `C^∞` local diffeomorphisms, orthogonal products, conformal change
  `e^{2u} g` with `u` of class `C^k`, and the warped products of §F1.6. Prove their regularity,
  evaluation and naturality laws, preservation of strongness, and finite-dimensional
  additivity of signatures once, and specialize them to Riemannian and Lorentzian metrics.

**Checks.**

- The constant metric `minkowskiForm E` on `ℝ × E` is a `LorentzianMetric` of every class.
- The 2-dimensional double null metric `−2Ω²(du ⊗ dv + dv ⊗ du)` with `Ω > 0` has Gram matrix
  `[[0, −2Ω²], [−2Ω², 0]]`, determinant `−4Ω⁴ < 0`, so it is Lorentzian, with `∂_u`, `∂_v`
  null. Adding `g̸_AB (dθ^A − b^A du)(dθ^B − b^B du)` with `g̸` positive definite keeps it
  Lorentzian: in the coframe `du, dv, dθ^A − b^A du` it is block diagonal with blocks of
  signatures `(1, 1)` and `(2, 0)`.
- The acoustical metric `−c² dt² + Σ_i (dx^i − v^i dt)²` (`c > 0`) on an open subset of
  `ℝ × ℝ²`: `B = ∂_t + v^i ∂_i` has `g(B, B) = −c²`, `g(B, ∂_i) = 0`, `g(∂_i, ∂_j) = δ_ij`, so it
  is Lorentzian with `B` timelike.
- `−dt² − dx² + dy²` on `ℝ³` is nondegenerate of index two and is not a `LorentzianMetric`.
- The product of two copies of `−dt² + dx²` has signature `(2, 2)` and is a metric of
  every regularity in the shared carrier; a Euclidean metric has signature `(d, 0)`.
- The constant inner product on a real Hilbert space is strong. On real `ℓ²`, the constant
  pairing `g(u,v) = Σ_{j≥0} u_j v_j/(j+1)²` is positive definite and continuous, but its
  flat map is not a continuous linear isomorphism: the images of the standard unit vectors
  have dual norms tending to zero. This is a weak metric in the same carrier; `Γ = 0`
  supplies its Levi-Civita connection without a total musical inverse.

*Needs:* §F0.1 for finite signatures; §F1.1; native sections, continuous duals and continuous-linear invertibility.

#### F1.3 Hölder classes

*Hypotheses:* Banach-valued local derivatives; finite dimension only for the Euclidean component comparison.

For `k : ℕ` with `k` at most the order of `g` and `0 < α ≤ 1`, define
`ContMDiffNondegenerateMetric.IsLocallyHolder g k α` for metrics of any signature: for every `x`, the chart representative of `g` in
`extChartAt I x` (the generalization to every order of Tau Ceti's `chartMetric`) has `k`-th
`iteratedFDerivWithin` relative to `range I` that is `α`-Hölder (`HolderOnWith`) on
`K ∩ range I` for some neighbourhood `K` of `extChartAt I x x`. Prove:

- independence of the chart: `C^{k,α}_loc` on a relatively open subset of `range I` is
  preserved by composition with `C^∞` diffeomorphisms of such subsets and by multiplication
  by `C^∞` functions; hence the condition holds in every chart of the atlas once it holds in
  one chart around each point;
- for `I` boundaryless and finite-dimensional, `IsLocallyHolder g k α` iff every chart component `g_μν` lies in
  PDE §1.7's `C^{k,α}_loc` of the chart target;
- `C^{k+1}` implies `C^{k,α}`, and `C^{k,α}` implies `C^k`;
- the Hölder class is preserved by the constructions of §F1.2 with `C^∞` data.

The chartwise definition and change-of-chart lemmas use Banach-valued Fréchet derivatives;
the comparison with PDE §1.7 uses its finite-dimensional Euclidean domains. In particular,
`IsLocallyHolder g 1 1` supplies the `C^{1,1}` metric hypothesis of §F2.2.

**Checks.**

- On `(−1/2, 1/2) × ℝ` the metric `−dt² + (1 + t|t|^α) dx²`, `0 < α < 1`, is Lorentzian,
  `C^{1,α}` and not `C²`: the component's derivative `(1 + α)|t|^α` is `α`-Hölder and not
  differentiable at `t = 0`.
- `α > 1` is excluded: on a connected chart a `C^{0,α}` component with `α > 1` is constant.

*Needs:* §F1.2; PDE §1.7; Mathlib Hölder and derivative APIs.

#### F1.4 Levi-Civita construction and conditional weak theory

*Hypotheses:* Strong `C^k` metrics, `k ≥ 1`, on Banach manifolds; weak metrics use the stated representation criterion.

For a strong nondegenerate metric `g` on a Banach manifold with `1 ≤ k`, extend
`g.leviCivitaConnection` as a
`CovariantDerivative I E (TangentSpace I)` with `ContMDiffCovariantDerivative _ (k − 1)`:
torsion-free, metric-compatible on differentiable fields
(`X g(Y, Z) = g(∇_X Y, Z) + g(Y, ∇_X Z)`), unique on differentiable section germs,
with the Koszul
identity. The local construction uses the inverse continuous flat map and Fréchet
derivatives of `g`; in finite dimensions it gives the Christoffel formula
`Γ^k_ij = ½ g^{kl}(∂_i g_jl + ∂_j g_il − ∂_l g_ij)` of class `C^{k−1}`, and of class
`C^{k−1,α}` when `g` is `C^{k,α}`. For `∞ ≤ k` it agrees with Tau Ceti's
`ContMDiffNondegenerateMetric.leviCivitaConnection`. Generalize the existing Koszul
construction of HopfRinow Layer 1 to finite order, and retain the Riemannian public interface
as a specialization; §C1.1 uses the same API for Lorentzian metrics. Prove compatibility with restriction,
local isometries, products, constant scaling and lowering regularity.

For a strong `C¹` metric and `u` of class `C¹`, prove the conformal connection formula
for `ĝ=e^{2u}g` at this regularity:
`ĝ.∇_X Y = g.∇_X Y + du(X)Y + du(Y)X − g(X,Y) g.sharp(du)`.
The formula uses the same continuous Levi-Civita connection and its uniqueness on
section germs; the curvature change laws in §F1.5 require their additional derivatives.

For a weak metric, prove uniqueness on differentiable section germs of a compatible
torsion-free connection from injectivity alone. Prove that such a connection exists exactly when the covectors in the
local Koszul formula are represented by a Christoffel field of the claimed regularity
and obey the connection change-of-chart law. The strong construction supplies this
representation automatically. When a weak metric is supplied with such a connection,
use it in the same along-curve, curvature and variation interfaces; no total inverse
metric or automatic existence theorem is asserted for weak metrics.


For `C^{1,1}` strong metrics prove that the Christoffel field is locally Lipschitz,
so it supplies the hypothesis of the single flow construction in §F2.2.

**Checks.**

- A constant strong metric has zero Christoffel field.
- The constant weighted `ℓ²` metric of §F1.2 is weak but its Koszul covectors are represented by `Γ = 0`.
- For the `C^{1,α}` metric of §F1.3 the Christoffel field is `C^{0,α}`; local geodesic uniqueness is a separate question.

*Needs:* §F1.1–§F1.3; HopfRinow nondegenerate Koszul and along-curve interfaces.

#### F1.5 Curvature identities and finite-dimensional contractions

*Hypotheses:* Strong `C²` metrics or a supplied `C¹` Levi-Civita connection; finite dimension for Ricci/scalar traces; smooth data for differentiated identities.

For a strong metric of class `C²` on a Banach manifold, or a nondegenerate metric supplied
with a compatible torsion-free connection of class `C¹`, use §F1.1's curvature tensor.
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
`Ric = (d − 1) κ g`, `S = d(d − 1)κ`; the contracted Bianchi identity `div G = 0` with
LVF6's divergence. Generalize RiemannianGeometry R1's signature-independent local-isometry
naturality, constant-scaling, product and conformal-change laws, covariant curvature
identities, and Schur and Einstein-factor constancy in connected dimension `d ≥ 3`.
Re-use the metric-free connection results directly and retain the Riemannian statements
as specializations of the generalized proofs.

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

*Needs:* §F1.1, §F1.4; existing curvature and Ricci APIs; LVF6 divergence for contracted Bianchi.

#### F1.6 Products and warped products

*Hypotheses:* Pairing constructions at the common regularity of the data; strong smooth Banach metrics for connections and curvature; finite dimension for Ricci.

Generalize the existing warped-product API to a semi-Riemannian base `(B, g_B)` and fibre
`(F, g_F)` of arbitrary signatures and a positive function `f` on `B`. The metric
`π^*g_B + (f ∘ π)² σ^*g_F` has their sum signature and the common regularity of the data.
For strong smooth data on Banach factors generalize the existing Levi-Civita and
uncontracted curvature formulas. In finite dimensions generalize the Ricci formulas, with
metric traces and signed orthonormal contractions (O'Neill, Ch. 7). The Riemannian formulas
and the Lorentzian-base/Riemannian-fibre formulas are specializations. Particular Lorentzian models use these same formulas in §C1.2.

**Checks.**

- A constant warping function gives the orthogonal-product connection and curvature.
- Finite signatures add; strongness is preserved on products of strong Banach factors.

*Needs:* §F1.2, §F1.4–§F1.5; existing product and warped-product APIs.

#### F1.7 Extensions and inextendibility

*Hypotheses:* Finite-dimensional connected Hausdorff manifolds without boundary; arbitrary signature and the stated metric regularities.

In finite dimensions, for nondegenerate metrics of any signature define `IsExtension g g̃ ι` and
`IsInextendible l g` as in the Conventions, quantifying over
connected Hausdorff `M̃` in the universe of `M` with the model `I`; the results about them
assume `[I.Boundaryless]`. Prove: if
`l ≤ l'`, `C^l`-inextendible implies `C^{l'}`-inextendible; an extension restricts the metric
on `ι(M)`, which is open; a proper open connected subset `U` of a connected semi-Riemannian manifold
`(N, h)` gives the extension `(U, h|U) → (N, h)`; extensions compose with isometric
embeddings. The isometry identity preserves signature on the image, and connectedness of
the extension forces the same signature throughout. The Lorentzian extension API is a
specialization; §C6.4's completeness obstruction specifically assumes index one and causality.

**Checks.**

- A proper connected open Euclidean ball, with its restricted metric, extends to Euclidean space.
- Openness of an embedding into the same-dimensional target is a finite-dimensional step here; no infinite-dimensional invariance-of-domain claim is used.

*Needs:* §F1.2; Mathlib smooth embeddings and open submanifolds.

### F2 Curves and one geodesic flow

#### F2.1 Curve domains and admissible reparametrizations

*Hypotheses:* Smooth manifolds, including Banach models for the domain/regularity API; a.e. tangent differentiability only under explicit hypotheses.

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
  version is supplied in §C2.2; no such metric is assumed to exist on every Banach manifold.

Define local absolute continuity and local Lipschitz continuity through bundle charts and
prove chart independence. Do not invoke finite-dimensional Rademacher for arbitrary Banach
targets: a tangent velocity almost everywhere is an explicit hypothesis unless supplied by
a theorem valid for the target space. The finite-dimensional causal specialization uses
Rademacher in §C2.2. Geodesics obtained from continuous ODE coefficients are `C²` directly.

Define an oriented change-of-parameter relation between maps by an increasing locally
absolutely continuous homeomorphism with positive derivative almost everywhere. Prove its
restriction, composition and inverse properties under the inverse-regularity hypotheses
specified above. §F2.2 applies this relation to affine geodesics, and §C2.2 defines a null
geodesic image through it. The original map need not have the regularity of its representative.

**Checks.**

- The empty interval `a = b` is not an inextendible curve domain.
- `s ↦ s³` is increasing but introduces zero velocity at `s = 0`; it does not preserve
  the class of regular timelike `C¹` curves.
- A nonsmooth increasing bi-Lipschitz parametrization of a null affine segment has a null
  geodesic image even when the parametrized curve is not a `C²` pregeodesic.

*Needs:* Native path and interval/filter APIs, real change of variables, chain rules, and existing piecewise-curve interfaces.

#### F2.2 Geodesic predicates, spray, maximal flow and exponential

*Hypotheses:* Continuous coefficients for the predicate; finite dimension for Peano existence; Banach models and locally Lipschitz coefficients for the unique flow.

Define, for any `cov : CovariantDerivative I E (TangentSpace I)`, the geodesic predicate
`CovariantDerivative.IsGeodesicOn cov γ s`: `s` has unique derivatives, `γ` is `C²` on `s`,
and `accelerationWithin cov γ s = 0` on `s`. Prove `TauCeti.Manifold.IsGeodesicCurveOn I γ s`
iff `IsGeodesicOn` for Mathlib's positive Levi-Civita connection. A pregeodesic is a `C²`
curve with nowhere-zero velocity and `∇_{γ'} γ' = f γ'` for a continuous `f`; prove that a
pregeodesic has a reparametrization that is a geodesic, by solving `φ'' + (f ∘ φ) φ'² = 0`.
For a `C¹` nondegenerate metric with a supplied compatible connection, `g(γ', γ')` is
constant along any of its geodesics, so the sign of that quadratic value is constant (Tau Ceti's
`IsMetricCompatible.apply_curveVelocityWithin_self_eq_of_accelerationWithin_eq_zero` in the
smooth case).

The geodesic predicate is independent of local existence or uniqueness. Supply the
finite-dimensional Peano existence lemma for continuous vector fields, by compactness of
Euler approximations and Arzelà–Ascoli, and apply it to continuous connection coefficients.
This gives local existence but no uniqueness for `C¹` metric coefficients.

For Banach model spaces define locally Lipschitz connection coefficients intrinsically
through the chart field `Γ_x : E →L[ℝ] E →L[ℝ] E`, and prove chart independence. Construct
the geodesic spray once, with chart expression `z' = (v, −Γ_x(v,v))`, `z = (x,v)`.
Identify its integral curves with velocity lifts of the geodesic predicate. Under local
Lipschitz hypotheses use Banach Picard–Lindelöf to construct unique maximal geodesics,
their open flow domain and flow, and the open domain `cov.expDomain` and map `cov.exp`.
Prove locally Lipschitz dependence on initial data, the flow composition and uniqueness
laws, the rescaling law `γ_cv(t) = γ_v(ct)`, and `d(exp_p)_0 = id`.

These are the single flow, maximal-curve and exponential constructions at every regularity.
Smooth connections enter through their local Lipschitz property; §F2.3 strengthens regularity
of these same objects. Make the existing Riemannian geodesic, spray, flow and exponential
interfaces specializations, with evaluation and restriction lemmas. Prove that changing the
proof of a regularity hypothesis does not change any object. Construct locally and patch
by uniqueness, without global smooth extensions. Only the symmetric part of the connection
coefficient field enters the spray.

**Checks.**

- `Γ = 0` on a Banach space gives the affine flow and `exp_p(v) = p + v`.
- The geodesic predicate applies to continuous coefficients even when no unique flow is available.
- Smooth and `C^{1,1}` metrics use this same construction through their Levi-Civita connections.

*Needs:* §F1.1, §F1.4, §F2.1; Mathlib Banach Picard–Lindelöf and Grönwall; existing HopfRinow geodesic interfaces.

#### F2.3 Regularity and naturality of the common flow

*Hypotheses:* Banach model spaces; `C^r` coefficients, `r ≥ 1`; smooth family statements use joint smoothness.

For connection coefficients of class `C^r`, `r ≥ 1`, prove that the flow, open exponential
domain and exponential map of §F2.2 have the corresponding `C^r` regularity. In particular,
smooth coefficients make that same flow and exponential smooth. Prove naturality under
local affine diffeomorphisms and restriction, and smooth dependence on jointly smooth
connection families and initial data. State the coefficient regularity separately from
the regularity of any metric supplying the connection: a strong `C^{r+1}` metric supplies
a `C^r` connection by §F1.4.

Prove agreement with the existing smooth Riemannian objects through their specialization
maps, upgrading their regularity theorems to the common construction. No second smooth
flow or exponential is defined and then compared to the locally Lipschitz one.

**Checks.**

- Constant flat coefficients give a smooth flow through the common API.
- A merely locally Lipschitz coefficient field supplies locally Lipschitz dependence from
  §F2.2; differentiability throughout its domain is not part of that hypothesis.

*Needs:* §F2.2; Mathlib regularity of ODE solutions and the existing smooth-flow arguments.

#### F2.4 Normal domains and Gauss lemmas

*Hypotheses:* Banach models and `C¹` or smooth coefficients for differentiable normal coordinates; finite dimension for Lipschitz convex normal neighbourhoods; `C^{1,1}` metrics for the radial Gauss identity.

For a `C¹` connection on a Banach tangent bundle: every point has a normal neighbourhood
(image of a star-shaped open set on which `exp_p` is a diffeomorphism). In finite dimensions
prove a basis of convex neighbourhoods `U` (normal neighbourhoods of each of their points, so any two points of `U`
are joined by a unique geodesic in `U`, depending smoothly on the endpoints) (Kobayashi–Nomizu,
Vol. I, §III.8; O'Neill, Ch. 5). For a smooth strong metric, or a weak metric with a supplied
smooth compatible torsion-free connection, prove the
semi-Riemannian Gauss lemma `g(d(exp_p)_v(v), d(exp_p)_v(w)) = g(v, w)` and that the position
vector field `P` of a normal neighbourhood satisfies `dq = 2g(P,·)` for `q = g(P, P)`;
for strong metrics this is `grad_g q = 2P`
(O'Neill, Ch. 5). Generalize the existing normal-domain and Gauss-lemma APIs and their
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
and sprays*). For a `C^{1,1}` metric of any signature and a
normal neighbourhood of `p`, set `q(exp_p(v)) = g_p(v,v)` and
`P(exp_p(v)) = γ_v'(1)`. Prove the low-regularity Gauss lemma:
`q` is `C^{1,1}` and `dq_x(w) = 2g_x(P(x),w)`, with agreement with §F2.4 for smooth
metrics (Kunzinger–Steinbauer–Stojković; Minguzzi, Theorem 5). This formulation does not
presuppose a smooth `exp`.

**Checks.**

- The flat Banach connection has global affine exponential coordinates.
- `−dt² + (1 + (max(t,0))²) dx²` is `C^{1,1}` and not `C²`; its connection has a unique
  flow and locally bi-Lipschitz normal coordinates, without a continuous curvature tensor.

*Needs:* §F1.4, §F2.2–§F2.3; native inverse-function, HasStrictFDerivAt and ApproximatesLinearOn APIs; O’Neill and Minguzzi as cited.

### F3 Nondegenerate immersion geometry

#### F3.1 Induced connections and Gauss–Codazzi–Ricci

*Hypotheses:* Split Banach immersions with strong induced tangent metric; ambient strongness or a supplied weak Levi-Civita connection; derivative orders as stated.

Generalize RiemannianGeometry R5a's immersion API to a strong metric `g` on a Banach
manifold and a `C^m` split immersion `F`, `m ≥ 1`, whose induced tangent form is strong.
A split immersion has a closed complemented differential range, with the native local
immersion chart. The
induced metric has class `C^{min(k, m−1)}` for `g` of class `C^k`. Split the ambient
tangent bundle into tangent and normal bundles, and prove both induced pairings are strong;
in finite dimensions their signatures add. Generalize the
induced and normal connections, the vector-valued second fundamental form, shape operators,
and Gauss–Codazzi–Ricci equations. The second fundamental form uses `g` of class `C¹`
and `F` of class `C²`; the curvature equations use `g` of class `C²` and `F` of class `C³`.
Prove their symmetry, regularity and local-isometry
naturality, preserving the existing Riemannian definitions and theorems as specializations.
For hypersurfaces with a chosen unit normal, use `ε = g(ν, ν)` explicitly in the scalar
formulas; a global unit normal is a hypothesis. The Lorentzian specialization supplies
one from a time orientation in §C3.1.
For a weak ambient pairing with a supplied compatible connection and a strong induced
tangent metric, construct the orthogonal projection onto the tangent bundle, its kernel
as normal bundle and the induced connections; no normal musical inverse is needed for
the vector-valued identities. The strong ambient case supplies the strong normal metric.
The Gauss equation is
`R^Σ(X,Y,Y,X) = R(X,Y,Y,X) + ε(k(X,X)k(Y,Y) − k(X,Y)²)`.
A finite-dimensional positive-definite submanifold has dimension at most `p`, so a spacelike hypersurface
cannot occur when the ambient negative index is greater than one.


**Checks.**

- A strong induced tangent metric gives a bounded orthogonal tangent projection.
- The hypersurface Gauss equation retains `ε = g(ν,ν)`; setting `ε = 1` gives the Riemannian specialization.

*Needs:* §F0.2 for finite signatures; §F1.1–§F1.5; RiemannianGeometry R5a and native immersion charts.

### F4 Jacobi fields and variation theory

#### F4.1 Jacobi fields, energy variations and index forms

*Hypotheses:* Smooth Banach affine connections; strong metrics or supplied weak Levi-Civita connections for metric identities; finite dimension for conjugate/focal multiplicities.

Generalize RiemannianGeometry R2–R3's Jacobi predicate and solution API to geodesics of a
smooth torsion-free connection on a Banach manifold, using `J'' + R(J, γ')γ' = 0`.
Prove existence and uniqueness from initial data and a continuous linear identification
of the solution space with the product of the two initial-data fibres, using convergence
of `J` and `D_t J` uniformly on compact parameter intervals in bundle charts. Finite-dimensionality
of that space follows in finite dimensions. Generalize the identification of `d(exp_p)`
with the Jacobi field of initial data `(0, w)`. For a smooth strong metric, or a weak
metric supplied with a smooth compatible torsion-free connection, generalize the
Wronskian conservation law, first and second variations of
energy `E(γ) = ½∫g(γ', γ')`, and the index form
`I(X,Y) = ∫[g(D_t X,D_t Y) − g(R(X,γ')γ',Y)] dt` on fields with fixed zero endpoints.
Generalize the index boundary term from the shape operators of §F3.1. In finite dimensions
define conjugate points with multiplicities and focal points of nondegenerate immersed
submanifolds, using this same Jacobi and variation API. The Riemannian objects and formulas
are specializations. No finite-dimensional multiplicity, ordinary finite Morse index or
equivalence of injectivity and surjectivity of `d(exp_p)` is asserted for Banach manifolds;
Fredholm and mono-/epiconjugate-point theory belongs to a separate development.


**Checks.**

- For `J ⊥ γ′` in constant curvature `κ`, the shared equation is `J″ = −κ g(γ′,γ′) J`.
- Positive and negative unit tangents give the spherical/hyperbolic and Lorentzian sign specializations of this same equation.

*Needs:* §F1.5, §F2.2–§F2.4, §F3.1; existing RiemannianGeometry R2–R3 interfaces.

#### F4.2 Operator Riccati and finite-dimensional trace identities

*Hypotheses:* Smooth normal geodesic foliations with the pairing/connection hypotheses of §F3.1; finite dimension only for the trace.

For normal geodesic families of §F3.1's hypersurfaces on Banach manifolds, generalize the
Jacobi/shape-operator evolution API to the operator Riccati identity `B' + B² + R_u = 0`,
where `B(X) = ∇_X u` and `R_u(X) = R(X,u)u`, wherever the family supplies a local foliation.
This identity does not require a trace. In finite dimensions, before focal points derive the trace
identity `θ' = −tr(B²) − Ric(u,u)`. With `m = dim M − 1 > 0` and
`σ = B − (θ/m) id`, this is `θ' = −θ²/m − tr(σ²) − Ric(u,u)`.
In indefinite finite signature, `tr(σ²)` need not be nonnegative. The quotient-bundle
null version and the positive-transverse-metric focusing consequences are in §C7.2.

**Checks.**

- On `diag(−1,1)`, `σ = [[0,1],[−1,0]]` is trace-free and self-adjoint but `tr(σ²) = −2`.
- The operator equation needs no trace; a finite-dimensional shear norm inequality needs a definite transverse metric.

*Needs:* §F1.5, §F3.1, §F4.1.

## Part II: Lorentzian geometry and causality

### C0 Lorentzian scalar products and cones

#### C0.1 Lorentzian forms and vector characters

*Hypotheses:* Finite-dimensional real spaces for the Lorentzian signature theorems; sign predicates and the Minkowski formula have their natural algebraic generality.

Define, for a real vector space `V` and `b : LinearMap.BilinForm ℝ V`, the predicate
`IsLorentzian b := b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1`, and the causal
characters `IsTimelike b v`, `IsNull b v`, `IsCausal b v`, `IsSpacelike b v` of the
Conventions. Define `minkowskiForm E` on `ℝ × E`, for a real inner-product space `E`, by
`((t, x), (s, y)) ↦ −ts + ⟪x, y⟫`.

- On finite-dimensional `V`, `IsLorentzian b` iff some basis `e_0, …, e_n` has
  `b(e_i, e_j) = η_ij`, `η = diag(−1, 1, …, 1)`; derive this from Sylvester's law of inertia
  in Mathlib.
- `IsLorentzian b` iff `b` is symmetric, `V` contains a timelike vector, and `b` is positive
  definite on the orthogonal complement of some (equivalently, every) timelike vector.
- Determinant criterion: for `dim V ≥ 2`, a symmetric `b` is Lorentzian iff the Gram
  determinant in some basis is negative and `b` is negative definite on no two-dimensional
  subspace; for `dim V = 1`, iff the Gram determinant is negative.
- The Lorentzian forms are an open subset of the symmetric forms on finite-dimensional `V`.
- `minkowskiForm E` is Lorentzian for finite-dimensional `E`, and
  `minkowskiForm E v v = −TauCeti.minkowskiNormSq v`.

**Checks.**

- In `ℝ^{1+1}` with `minkowskiForm`: `(1, 0)` is timelike (`−1`), `(1, 1)` is null, `(0, 1)`
  is spacelike, `0` is spacelike and not causal. `(2, 1)` has `minkowskiForm = −3` and
  `TauCeti.minkowskiNormSq = 3`.
- `dim V = 1`, `b(x, y) = −xy` is Lorentzian with no null vectors: a statement asserting null
  vectors without `n ≥ 1` is false.
- `diag(−1, −1, 1)` is nondegenerate of index two, not Lorentzian, though it has timelike
  vectors; `diag(−1, −1, −1)` has negative determinant in dimension three but is negative
  definite on two-planes, so the second clause of the determinant criterion is needed.

*Needs:* §F0.1; Tau Ceti Minkowski/hyperboloid comparison interfaces.

#### C0.2 Time cones and reverse inequalities

*Hypotheses:* Finite-dimensional Lorentzian scalar products; a chosen timelike vector.

For Lorentzian `b` and timelike `v`, define `timeCone b v = {w | IsTimelike b w ∧ b v w < 0}`.
Prove, on finite-dimensional normed `V`:

- (a) the timelike vectors form an open set with exactly two connected components,
  `timeCone b v` and `timeCone b (−v) = −timeCone b v`; each is an open convex cone;
- (b) timelike `v, w` lie in the same cone iff `b(v, w) < 0`;
- (c) for timelike `v`, `b` is positive definite on `v^⊥` and `V = ℝv ⊕ v^⊥` (`IsCompl`);
- (d) every causal vector lies in the closure of exactly one of the two cones, and for timelike
  `v` and causal `w`, `w ∈ closure (timeCone b v)` iff `b(v, w) < 0`;
- reverse Cauchy–Schwarz: for timelike `v` and any `w`, `b(v, v) b(w, w) ≤ b(v, w)²`, with
  equality iff `v, w` are linearly dependent; for timelike `v, w` in one cone,
  `−b(v, w) ≥ |v||w|` with `|v| = √(−b(v, v))`, so `−b(v, w) = |v||w| cosh φ` for a unique
  `φ ≥ 0`;
- reverse triangle inequality: for causal `v, w` in the closure of one cone,
  `|v + w| ≥ |v| + |w|`, with equality for timelike `v, w` iff they are proportional;
- for causal `v, w` in the closure of one cone, `b(v, w) ≤ 0`, with equality iff `v, w` are
  proportional null vectors;
- a time orientation of `V` is a choice of one of the two cones; the `b`-isometries
  preserving each cone (orthochronous isometries) form a subgroup of index two of the
  isometry group, and `−id` is not orthochronous;
- for `minkowskiForm E`, `timeCone (1, 0) = TauCeti.futureCone E`, and Tau Ceti's
  `TauCeti.hyperboloid E` is `{v ∈ timeCone (1, 0) | minkowskiForm v v = −1}`.

**Checks.**

- `v = (1, 0)`, `w = (2, 1)` in `ℝ^{1+1}`: `b(v, w) = −2`, `b(v, v) b(w, w) = 3 ≤ 4`;
  `|v| = 1`, `|w| = √3`, `|v + w| = √8 ≈ 2.83 ≥ 1 + √3 ≈ 2.73`.
- `v = (1, 1)`, `w = (1, −1)`: both future null, `b(v, w) = −2 < 0`, not proportional; and
  `v`, `2v` give `b = 0`, the equality case.
- `(1, 0)` and `(−1, 0)` are timelike with `b = 1 > 0`: opposite cones.

*Needs:* §C0.1.

#### C0.3 Causal type of subspaces

*Hypotheses:* Finite-dimensional Lorentzian scalar products.

For Lorentzian `b` on finite-dimensional `V` and a subspace `W`, prove that exactly one holds:
`b|W` is positive definite (`W` spacelike); `b|W` is nondegenerate of index one, equivalently
`W` contains a timelike vector (`W` timelike); `b|W` is degenerate (`W` null). In the null
case `b|W` is positive semidefinite, its radical `W ∩ W^⊥` is a line spanned by a null vector,
`W` contains no timelike vector, and the null vectors in `W` are exactly the nonzero multiples
of the radical. Also `W` is timelike iff `W^⊥` is spacelike, and `W` is null iff `W^⊥` is.

For a nonzero covector `ξ`, let `ξ^♯ = (b.toDual _).symm ξ` and `b⁻¹(ξ, ξ) = b(ξ^♯, ξ^♯)`.
Prove `(ker ξ)^⊥ = ℝ ξ^♯` and the hyperplane trichotomy: `ker ξ` is spacelike iff
`b⁻¹(ξ, ξ) < 0` iff `ξ^♯` is timelike; timelike iff `b⁻¹(ξ, ξ) > 0` iff `ξ^♯` is spacelike;
null iff `b⁻¹(ξ, ξ) = 0`, and then `ξ^♯` is null and lies in `ker ξ`. A hyperplane is null iff
it contains a null vector and no timelike vector.

**Checks.**

- In `ℝ^{1+2}`, `ξ = dt`: `ξ^♯ = −∂_t`, `b⁻¹(ξ, ξ) = −1`, `{t = 0}` is spacelike. `ξ = dx`:
  `{x = 0}` is timelike. `ξ = dt − dx`: `ξ^♯ = (−1, −1, 0)`, null, in `{t = x}`; the induced
  form on `{t = x}` in the basis `(1, 1, 0)`, `(0, 0, 1)` is `diag(0, 1)`.
- `W = span{(1, 1, 0)}` is null and one-dimensional; `W^⊥ = {t = x}` is null too.
- For `diag(−1, −1, 1, 1)`, the span of `e_0 + e_2` and `e_1 + e_3` is a totally
  null two-plane. The hyperplane `(e_0 + e_2)^⊥` has a one-dimensional radical and quotient
  signature `(1, 1)`, so its induced form is not positive semidefinite.

*Needs:* §F0.2, §C0.1–§C0.2.

### C1 Lorentzian metrics and model spacetimes

#### C1.1 Lorentzian specialization of the shared metric carrier

*Hypotheses:* Finite-dimensional smooth manifolds, possibly with boundary/corners; continuous, finite-order or smooth Lorentzian metrics.

Define `LorentzianMetric I M k` as the index-one subtype of the common carrier in
§F1.2. Finite-dimensional nondegeneracy supplies its strong inverse. Its Hölder classes,
Levi-Civita connection, curvature, restrictions, products with Riemannian factors and
conformal changes are the specializations of Part I, with no additional metric data.
Identify the signature with `(n,1)` in dimension `n+1`; for a connected manifold it suffices
to check the signature at one point. Preserve the existing smooth nondegenerate interface
and the native Riemannian interface through the shared carrier.

**Checks.**

- Minkowski, double-null and acoustical metrics are supplied by the checks of §F1.2.
- An index-two metric remains in the common carrier and is excluded by the Lorentzian predicate.

*Needs:* §F1.2–§F1.5; §C0.1.

#### C1.2 Model spacetimes and extension examples

*Hypotheses:* Finite-dimensional smooth models without boundary; individual regions and dimensions as stated.

Use §F1.6’s shared warped-product construction to build the following models. A listed
timelike field supplies the time orientation of §C2.1.


- Minkowski space `ℝ^{1,n}`, time oriented by `∂_t`;
- Robertson–Walker spacetimes `I ×_a Σ` with `−dt² + a(t)² h`;
- de Sitter space `ℝ ×_{cosh} S^n`, of constant curvature `+1`;
- anti-de Sitter space `−cosh²r dt² + dr² + sinh²r g_{S^{n−1}}` on `ℝ × ℝ^n` in polar form,
  of constant curvature `−1`;
- the Schwarzschild exterior `ℝ × (2m, ∞) × S²` with
  `−(1 − 2m/r) dt² + (1 − 2m/r)^{−1} dr² + r² g_{S²}`, `m > 0`, which is Ricci-flat.

**Checks.**

- The Milne region `{t>0}` with `−dt²+t²dx²` embeds isometrically into Minkowski space by
  `(t,x) ↦ (t cosh x,t sinh x)`, with proper image `{T>|X|}`; it is smoothly extendible
  in the sense of §F1.7. Minkowski inextendibility is proved in §C6.4.
  The curves `t ↦ (t,x₀)`, `t>0`, are negative unit geodesics with finite past affine
  endpoint and no limit in the Milne manifold, so that region is past geodesically incomplete.


- Robertson–Walker with flat three-dimensional fibre: `Ric(∂_t, ∂_t) = −3a''/a`.
- The Schwarzschild exterior's base `−(1 − 2m/r)dt² + (1 − 2m/r)^{−1}dr²` has `K = 2m/r³`
  (Gaussian curvature `−F''/2` for `−F dt² + F^{−1} dr²`, `F = 1 − 2m/r`); `Ric = 0` for the
  warped product needs both the base curvature and the warping terms, and fails for
  `F = 1 − 2m/r²`.

*Needs:* §F1.4–§F1.7, §C1.1; RiemannianGeometry R1 for round spheres.

### C2 Time orientations and causal curves

#### C2.1 Time orientations and spacetimes

*Hypotheses:* Finite-dimensional continuous Lorentzian metrics; Hausdorff second-countable manifolds for the global field/cover equivalence.

For `g : LorentzianMetric I M k` (any `k`, so continuous metrics are included), define
`TimelikeVectorField g` (continuous sections of `TM` that are timelike everywhere), the
equivalence `T ~ T' ⟺ ∀ x, g(T x, T' x) < 0` (an equivalence relation by §C0.2 (b)),
`TimeOrientation g` as the quotient, `IsTimeOrientable g`, the opposite orientation
`[−T]`, future- and past-directed causal and timelike vectors (independent of the
representative by §C0.2), and `TimeOrientedLorentzianMetric I M k` bundling `g` with a time
orientation. The quotient-of-fields definition is used on Hausdorff second-countable
manifolds; the correspondence with sections of the time-cone cover and the existence of
smooth field representatives use the resulting paracompactness. Prove:

- a connected time-orientable `M` has exactly two time orientations, `[T]` and `[−T]`;
- every time orientation has a `C^∞` representative when `M` is Hausdorff and σ-compact, by a
  partition of unity and convexity of the cones;
- equivalently, a time orientation is a continuous choice of timelike cone: construct the
  time-orientation double cover `TimeConeCover g`, whose points are pairs of a point and one
  of its two timelike cones, as a smooth two-sheeted covering (on the pattern of Tau Ceti's
  `OrientationCover`), and identify time orientations with its continuous sections; a
  connected `M` is time-orientable iff the cover is disconnected, and is time-orientable when
  simply connected;
- time orientations restrict to open subsets, pull back along local isometries, and are
  reversed by `[T] ↦ [−T]`;
- a future-directed causal vector field and a future-directed timelike vector field pair
  negatively; the sum of future causal vectors is future causal.

A spacetime is a `TimeOrientedLorentzianMetric` on a connected manifold; a
(3+1)-dimensional spacetime is one with `finrank ℝ E = 4`.

**Checks.**

- Minkowski space has the two orientations `[∂_t]` and `[−∂_t]`; `(1, 1)` is future null for
  `[∂_t]`, `(−1, 0)` past timelike.
- The disjoint union of two Minkowski spaces has four time orientations: connectedness is
  needed for "exactly two".
- The quotient of `(ℝ², −dt² + dx²)` by the isometry `(t, x) ↦ (−t, x + 1)` is a Lorentzian
  Möbius band that is not time-orientable: the deck transformation reverses `∂_t`.
- The acoustical metric is time oriented by `B = ∂_t + v^i ∂_i`, and `∂_t` is future
  timelike iff `c² > |v|²`.

*Needs:* §C0.2, §C1.1; auxiliary Riemannian metrics and the native orientation-cover API; DifferentialGeometry Layer 2.

#### C2.2 Causal curves, length and inextendibility

*Hypotheses:* Finite-dimensional continuous Lorentzian metrics and a time orientation; actual curve domains and admissible parameters are explicit.

Fix a time orientation `𝔱`. Define:

- `IsFutureTimelikeCurve 𝔱 γ a b`, `IsFutureCausalPiecewiseCurve 𝔱 γ a b`: piecewise `C¹` on
  `[a, b]`, `a < b`, every one-sided velocity future timelike, resp. future causal;
- `IsLocallyLipschitzCurveOn γ s`: near every parameter, `γ` stays in the chart at its value
  and is Lipschitz in that chart; prove chart independence and, for an auxiliary smooth
  Riemannian metric `h`, the equivalence with local Lipschitz continuity for
  `Manifold.riemannianEDist` when `I` is boundaryless;
- `IsFutureCausalCurve 𝔱 γ a b`: locally Lipschitz on `[a, b]`, differentiable with future
  causal velocity at almost every parameter (the velocity exists almost everywhere by
  Rademacher's theorem in charts);
- past-directed versions by `𝔱 ↦ −𝔱`; future- and past-inextendible curves on half-open and
  open intervals, and inextendible timelike and causal curves.

Use the domain and change-of-parameter API of §F2.1. Prove that piecewise-`C¹`
future causal curves are locally Lipschitz causal curves, and prove restriction and
concatenation for each class. Increasing piecewise `C¹` changes with positive one-sided
derivatives and equally regular inverse preserve the piecewise-`C¹` classes. Increasing
locally bi-Lipschitz changes preserve the locally Lipschitz causal class. No assertion
that arbitrary monotone `C¹` changes preserve regular timelike curves is made.

Prove arc-length normalization as a separate theorem: every absolutely continuous future
causal curve with nonzero velocity almost everywhere admits an increasing change of
parameter to an auxiliary-Riemannian-unit-speed Lipschitz curve, with the change-of-variables
and inverse-regularity hypotheses established. The same gives the normalization for the
Lipschitz causal curves used in `J^±`. Define `L(γ)`, prove finiteness on compact intervals,
additivity under concatenation and invariance under these admissible reparametrizations,
and prove `L(γ)>0` for regular timelike curves.

Define a causal curve with null geodesic image by §F2.1's change-of-parameter relation
to a null affine geodesic. A rough parametrization can have this property without being
a `C²` pregeodesic. Inextendible curve domains are nonempty open intervals `a<b`, with
no endpoint in `M` at the appropriate ends. Prove invariance under admissible changes
of parameter and the reduction to bounded open domains used in `Suggested.lean`.

**Checks.**

- In `ℝ^{1+1}`, `s ↦ (s, f(s))` with `f` `½`-Lipschitz and not piecewise `C¹` (for example
  `f(s) = ½ ∫_0^s sign(sin(1/u)) du`) is a future causal (indeed timelike almost everywhere)
  Lipschitz curve that is not piecewise `C¹`.
- `s ↦ (s, s)` has `L = 0`; `s ↦ (s, 0)` on `[0, 2]` has `L = 2`; `s ↦ (2s, 0)` on `[0, 1]`
  has `L = 2` too.
- `s ↦ (|s|, 0)` on `[−1, 1]` is not future causal: its velocity is past-directed for `s < 0`.

*Needs:* §F2.1–§F2.2, §C2.1; finite-dimensional Rademacher, real change of variables and piecewise curves.

#### C2.3 Chronological and causal relations

*Hypotheses:* Finite-dimensional continuous time-oriented Lorentzian manifolds without boundary; regularity-sensitive consequences are stated in §C4.

Define `chronologicalFuture 𝔱 p = I^+(p)` (endpoints of future timelike curves from `p`),
`causalFuture 𝔱 p = J^+(p)` (`p` together with endpoints of future causal curves from `p`),
the pasts `I^−`, `J^−` by reversing `𝔱`, and `I^±(S)`, `J^±(S)` as unions over `S`. Prove:
`I^+(p) ⊆ J^+(p)`; `I^+` and `J^+` are transitive; `q ∈ I^+(p) ⟺ p ∈ I^−(q)` and likewise for
`J`; `I^+(p)` is open for continuous `g` (Chruściel–Grant, §1); `I^+(S)` is open.

**Checks.**

- Minkowski space with `[∂_t]`: `I^+(0) = {t > |x|} = TauCeti.futureCone`,
  `J^+(0) = {t ≥ |x|}`.
- The Lorentzian cylinder `(ℝ/2πℤ) × ℝ` with `−dθ² + dx²`, oriented by `∂_θ`: `p ∈ I^+(p)` and
  `I^+(p) = M` for every `p`.
- Push-up `J^+ ∘ I^+ ⊆ I^+` is not asserted here; it is §C4.3 for smooth metrics.

*Needs:* §C2.1–§C2.2.

#### C2.4 Conformal transport of cones, curves and length

*Hypotheses:* Finite-dimensional continuous Lorentzian metrics, positive continuous factor, transported time orientation; stronger regularity only where separately required.

For metrics on the same manifold and `ĝ = Ω² g`, with `Ω` positive and continuous,
construct the canonical transport of time orientations by the identity on timelike fields.
Prove identity, composition, inverse and restriction laws for this transport. With the
transported orientation, vector characters and future directions are unchanged. Prove
equivalence of all the causal and timelike curve predicates of §C2.2, including their
inextendibility conditions, and equality of `I^±` and `J^±` as sets and relations.

Prove the length transformation
`L_ĝ(γ) = ∫ Ω(γ(t)) √(−g(γ′(t),γ′(t))) dt`.
For a constant factor `Ω=c>0`, prove `L_ĝ=c L_g`; the time-separation scaling theorem
is in §C6.5 after its definition. The causal-relation transport itself requires only the
continuous positive factor, not a derivative of it. The global causal consequences are
proved in §C6.5 after their definitions; null affine parameters are treated in §C4.4.

**Checks.**

- A nonconstant positive conformal factor preserves Minkowski light cones and `I^±,J^±`.
- A constant factor `c` multiplies lengths by `c`, so length is additional data beyond the cones.

*Needs:* §F1.2, §C2.1–§C2.3; change of variables and the length integral.

### C3 Spacelike and null submanifolds

#### C3.1 Spacelike hypersurfaces and constraint equations

*Hypotheses:* Finite-dimensional Lorentzian immersion geometry; stated finite regularities; time orientation for a global future normal.

In the Lorentzian specialization, for a `C¹` immersion `F : Σ → M`
(Mathlib `Manifold.IsImmersion J I 1 F`) and
`g : LorentzianMetric I M k`, define the causal type of `F` at `y` as that of the subspace
`dF_y(T_yΣ)` (§C0.3), and spacelike, timelike and null immersions as those of one type at every
point. For `g` continuous, these are open conditions for spacelike and timelike.

For a spacelike hypersurface: the induced metric `F^*g` is a Riemannian metric of class
`C^{min(k, m−1)}` when `F` is `C^m`; with a time orientation there is a unique future-directed
unit timelike normal `ν`, of the same class. For `g` of class `C²` and `F` of class `C³`, use the second
fundamental form `k(X, Y) = g(∇_X ν, Y)`, symmetric, and `H = tr k`, and specialize the
shared Gauss and Codazzi equations to

`R^Σ(X, Y, Y, X) = R(X, Y, Y, X) − (k(X, X)k(Y, Y) − k(X, Y)²)`,
`(∇^Σ_X k)(Y, Z) − (∇^Σ_Y k)(X, Z) = −R(X, Y, Z, ν)` (with `R(X,Y,Z,W) = g(R(X,Y)Z, W)`),

and their contractions, the constraint equations
`2 G(ν, ν) = S_Σ + H² − |k|²` and `G(ν, ·)|_{TΣ} = div_Σ k − dH`. In particular a spacelike
hypersurface of a vacuum spacetime satisfies the vacuum constraints `S_Σ + H² − |k|² = 0`, `div_Σ k − dH = 0`.

**Checks.**

- In `ℝ^{1,3}` the future unit hyperboloid has `ν` the position vector, `k = h`, `H = 3`; the
  Gauss equation gives `R^Σ(X,Y,Y,X) = 0 − 1 = −1` for orthonormal `X, Y` (hyperbolic space),
  and the constraint `S_Σ + H² − |k|² = −6 + 9 − 3 = 0`.
- `{t = 0}` in Minkowski space has `k = 0`.
- A Riemannian Gauss equation sign (`+`) gives `R^Σ = +1` on the hyperboloid, contradicting
  Tau Ceti's hyperbolic-space model.

*Needs:* §F3.1, §F1.5, §C0.3, §C2.1.

#### C3.2 Null hypersurfaces, optical functions and corners

*Hypotheses:* Continuous finite-dimensional metrics of any signature; `C¹` immersions/functions; interior or the stated corner-compatible submersion hypotheses for foliations.

In finite dimensions, for a continuous nondegenerate `g` of signature `(p, q)` and
`F : Σ → M` a `C¹` immersion
with `dim Σ + 1 = dim M`, define `F` to be
a null hypersurface when `g` restricted to `dF_y(T_yΣ)` is degenerate at every `y`. Prove the
equivalent forms: the normal line `(dF_y T_yΣ)^⊥` is spanned by a null vector;
`(dF_y T_yΣ)^⊥ ⊆ dF_y T_yΣ`; and, where `Σ = {u = c}` near `p` with `u` of class `C¹`,
`du_p ≠ 0`, `g^{−1}(du, du)(p) = 0`. Define:

- a null normal: a continuous nowhere-vanishing vector field `L` along `F` with
  `L_y ∈ (dF_y T_yΣ)^⊥`; prove local existence, that `L` is null and tangent to `Σ`, that any
  two differ by a nowhere-vanishing continuous factor. Its line is the radical of the induced
  form, and the quotient has signature `(p − 1, q − 1)`. A global nonzero normal requires
  triviality of that line; in Lorentzian signature a time orientation supplies its future
  direction and, on a paracompact `Σ`, a global future-directed null normal;
- an optical function on an open `U`: `u` of class `C¹` with `du ≠ 0` and the eikonal
  equation `g^{−1}(du, du) = 0` on `U`; prove that its level sets are null hypersurfaces
  with null normal `−grad_g u = −(du)^♯`. On the interior, these level sets form a null
  hypersurface foliation by the ordinary submersion theorem;
- a double null foliation on `U`: two optical functions `u`, `u̲` with `g^{−1}(du, du̲) < 0`
  on `U`; prove that their differentials are independent and that the level sets
  `{u = a, u̲ = b}` in the interior have codimension two and signature `(p − 1, q − 1)`.
  In Lorentzian signature they are spacelike.

The tangent-form and optical-function definitions apply on manifolds with corners, but
the foliation conclusions at boundary points require additional hypotheses. For standard
orthant corner charts, require that `du` restricted to the tangent space of each boundary
stratum be surjective for the single foliation, and that `d(u,u̲)` restricted there be
surjective for the double foliation. Prove the corresponding corner-compatible submersion
theorem by applying the ordinary implicit-function theorem in the free stratum directions,
keeping the boundary coordinates fixed. Then the fibres are neat hypersurfaces or neat
codimension-two submanifolds with the stated tangent signatures. These sufficient
conditions are explicit inputs; `du ≠ 0` alone at a corner does not supply them.
Future/past choices use the Lorentzian specialization; the local linear-algebra equivalences
and the eikonal equation do not.

**Checks.**

- In Minkowski space `u = t − |x|` on `{x ≠ 0}`: `g^{−1}(du, du) = −1 + 1 = 0`, and
  `L = −grad u = (1, x/|x|)` is future null; the cone `{t = |x|, x ≠ 0}` is null.
- `{t = x}` in `ℝ^{1+2}` is null with null normal `∂_t + ∂_x`; `{t = 0}` and `{x = 0}` are not.
- `u = t − r`, `u̲ = t + r` on `{r > 0}` in `ℝ^{1,3}`: `g^{−1}(du, du̲) = −2`, and the level sets
  are round spheres of radius `(u̲ − u)/2`.
- For the acoustical metric `g^{−1} = −c^{−2} B ⊗ B + Σ_i ∂_i ⊗ ∂_i`, so the eikonal equation
  is `(∂_t u + v · ∇_x u)² = c² |∇_x u|²`.
- On the quadrant `x,y≥0`, `g=−dx²+dy²` and `u=x+y` have `du≠0` and
  `g⁻¹(du,du)=0`, but `u⁻¹(0)={(0,0)}`. Stratum surjectivity fails at the corner.

*Needs:* §F0.2, §F1.2, §C1.1; native immersion and implicit-function APIs; §C2.1 for future normals.

#### C3.3 Null generators and boundary persistence

*Hypotheses:* Finite-dimensional `C¹` metrics, `C²` null hypersurfaces and `C¹` normal field; interior or face-tangent fields for two-sided flow.

Let `g` be a `C¹` nondegenerate metric of any signature and `Σ` a `C²` null hypersurface
with a chosen `C¹` null normal `L`. Prove
`∇_L L = κ L` along `Σ` for a continuous `κ`, so the integral curves of `L` are null
pregeodesics contained in `Σ` and, after the reparametrization of §F2.2, null geodesics (the
null generators). If `u` is a `C²` optical function and `L = −grad_g u`, then `∇_L L = 0`.
The two-sided flow and generator-foliation assertions are on the interior of `Σ`.
For a hypersurface with standard corners, extend them to boundary points when `L` is
tangent to every incident boundary face, proving that these faces are preserved by its
`C¹` local flow. Without this tangency hypothesis the identity `∇_L L=κL` still holds
where the differentiable data are given, but no two-sided flow inside `Σ` is asserted.
The proof is the one displayed in O'Neill's and Galloway's treatments: for `X` tangent to `Σ`,
`g(∇_L L, X) = −g(L, [L, X]) − ½ X g(L, L) = 0`, so `∇_L L ∈ (TΣ)^⊥ = ℝL`; for an optical
function, `∇_{(du)^♯}(du)^♯ = ½ grad_g(g^{−1}(du, du)) = 0`.

**Checks.**

- Generators of the Minkowski light cone are the rays `s ↦ (s, s ω)`, `|ω| = 1`, with
  `∇_L L = 0` for `L = (1, x/|x|)`.
- `L = (1 + t²)(∂_t + ∂_x)` on `{t = x}` has `∇_L L = 2t L`, so `κ = 2t` is nonzero and `L` is
  not geodesic, though its integral curves are null pregeodesics.

*Needs:* §F1.4, §F2.2, §C3.2; local vector-field flow and reparametrization.

#### C3.4 Null expansion and trapped surfaces

*Hypotheses:* Smooth finite-dimensional null geometry; time orientation for trapped surfaces; labeling and paracompactness only for global chosen normal fields.

For a smooth nondegenerate `g` of any signature and `Σ` a smooth null hypersurface with a
chosen null normal `L`, define the null second fundamental form `B(X, Y) = g(∇_X L, Y)`
on `TΣ/ℝL`, prove it is well defined and symmetric,
and that `B_{fL} = f B_L`; define the expansion `θ = tr B` and the shear (trace-free part)
with respect to the nondegenerate quotient form of signature `(p − 1, q − 1)`. Reuse the
shared metric trace and trace-free endomorphism API; definiteness is only needed for norm
inequalities, not these definitions.

Specialize to Lorentzian signature, where the quotient form is positive definite. For a
smooth spacelike codimension-two submanifold `S` of a time-oriented manifold, the normal
plane has two future null rays. Construct local future null normal fields `ℓ_±`, normalized
by `g(ℓ_+, ℓ_−) = −2` or considered up to positive rescaling, and the null expansions
`θ_± = tr_S(g(∇ ℓ_±, ·))`. A choice of orientation of the spacelike normal direction
(equivalently, a labeling of those rays), together with paracompactness of `S`, gives
global fields. Define trapped, marginally trapped and untrapped surfaces pointwise through
the two rays. These conditions are invariant under positive rescaling and interchange
of the labels, so their definitions require no global labeling.

**Checks.**

- The round sphere `{t = 0, |x| = r}` in `ℝ^{1,3}` with `ℓ_± = ∂_t ± ∂_r` has `θ_± = ±2/r`:
  untrapped; Minkowski space has no closed trapped surface.
- In the Schwarzschild exterior the spheres `{t = t₀, r = r₀}`, `r₀ > 2m`, have
  `θ_+ > 0 > θ_−`: untrapped.

*Needs:* §F1.5, §C3.1–§C3.3.

### C4 Local causality and null conformal geometry

#### C4.1 Local causal structure and maximality

*Hypotheses:* Finite-dimensional time-oriented `C^{1,1}` Lorentzian metrics on manifolds without boundary; convex normal neighbourhoods from §F2.4.

For a convex neighbourhood `U` of a time-oriented `C^{1,1}` Lorentzian manifold and `p, q ∈ U`
(Minguzzi’s locally Lipschitz theory; O'Neill, Ch. 5 and Ch. 14 for smooth metrics):

- `q ∈ I^+(p, U)` iff `exp_p^{−1} q` is future timelike; `q ∈ J^+(p, U)` iff it is future
  causal or zero; `J^+(p, U)` is closed in `U`;
- local maximality: if `q ∈ J^+(p, U)`, the radial geodesic from `p` to `q` has Lorentzian
  length `√(−g(v, v))`, `v = exp_p^{−1} q`, which is at least the length of every future causal
  curve in `U` from `p` to `q`, with equality only for admissible increasing reparametrizations of it;
- a future causal curve in `U` from `p` to `q` that does not have a null geodesic image
  in the sense of §F2.1 can be deformed
  in `U` to a future timelike curve from `p` to `q`.

**Checks.**

- In Minkowski space the segment from `0` to `(2, 0)` has length 2, and the broken curve through
  `(1, 0.5)` has length `2√(1 − 0.25) = √3 < 2`.
- `(1, 1)` lies in `J^+(0) \ I^+(0)`, joined only by the null segment.

*Needs:* §F2.2–§F2.4, §C2.3; the locally Lipschitz normal theory and Gauss lemma of Minguzzi.

#### C4.2 Push-up and boundary rigidity

*Hypotheses:* Finite-dimensional time-oriented `C^{1,1}` Lorentzian metrics; geodesic-image statements use §F2.1 rather than regularity of the original parameter.

Prove on a time-oriented `C^{1,1}` Lorentzian manifold: push-up, `I^+ ∘ J^+ ⊆ I^+` and
`J^+ ∘ I^+ ⊆ I^+`; `int J^+(p) = I^+(p)` and `J^+(p) ⊆ closure (I^+(p))`; if `q ∈ J^+(p) \
I^+(p)`, `q ≠ p`, then every future causal curve from `p` to `q` has a null geodesic image
(O'Neill, Ch. 10 and Ch. 14); `I^+(S)` is the interior of `J^+(S)` and `∂I^+(S) = ∂J^+(S)`.

*Needs:* §C4.1, §C2.2–§C2.3.

#### C4.3 Agreement of causal-curve classes

*Hypotheses:* Finite-dimensional time-oriented `C^{1,1}` metrics; the continuous-metric definitions themselves retain their distinct curve classes.

For `C^{1,1}` `g`, `J^+(p)` defined with Lipschitz causal curves equals the set defined with
piecewise-`C¹` causal curves, and `I^+(p)` equals the set of endpoints of Lipschitz causal
curves whose velocity is timelike on a set of positive measure (Chruściel, *Elements of
causality theory*, §2; Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*).

Use §F2.1's admissible changes of parameter and arc-length normalization to prove
agreement with absolutely continuous causal curves with nonzero velocity almost everywhere.
This changes the regularity of a representative without changing its causal endpoints.

**Checks.**

- The Lipschitz curve of §C2.2's first Check ends at a point of `I^+(0)` reached by the
  straight timelike segment.
- On `ℝ^{1+1}` minus the point `(1, 1)`, the point `(2, 2)` is in `closure (J^+(0))` but not in
  `J^+(0)`, the only causal curve to it from `0` being the null segment through `(1, 1)`:
  `J^+(p)` need not be closed.

*Needs:* §C4.1–§C4.2, §C2.2; the normal-neighbourhood and curve-normalization theorems.

#### C4.4 Conformal null geodesics and affine parameters

*Hypotheses:* Finite-dimensional `C¹` Lorentzian metrics and positive `C¹` factor for a supplied geodesic; `C^{1,1}` for the unique-flow interpretation.

For `ĝ=Ω²g`, with positive `C¹` factor and `C¹` Lorentzian metrics, use the
shared connection conformal-change formula to prove that null geodesic images coincide.
If `γ(s)` is an affinely parametrized null `g`-geodesic, define the new parameter by
`dŝ/ds = Ω(γ(s))²`; prove that `γ` expressed in `ŝ` is an affine `ĝ`-geodesic, up to the
usual positive affine changes. Prove compatibility with restriction and the image relation
of §F2.1. The geodesic predicate and supplied geodesic suffice at `C¹`; for locally
Lipschitz connection coefficients these use the common flow of §F2.2.

**Checks.**

- For constant `Ω=c`, the new affine parameter is `c²s` up to translation and positive scaling.
- On Minkowski space take `Ω(t,x)=exp(−t²)`. The complete null line `(s,s)` has finite
  future `ĝ`-affine parameter `∫₀^∞ exp(−2s²) ds`, and escapes every compact set.
  Thus the same null geodesic image is future incomplete for `ĝ`, while §C6.5 preserves
  global hyperbolicity. Affine completeness is not determined by the cones.

*Needs:* §F1.4–§F1.5, §F2.1–§F2.2, §C2.4; the conformal connection formula.

### C5 Time separation, causal ladder and limit curves

#### C5.1 Time separation

*Hypotheses:* Smooth finite-dimensional connected time-oriented spacetimes; Hausdorff and second countable; no boundary.

Define `timeSeparation 𝔱 p q : ℝ≥0∞` as in the Conventions. Prove `τ(p, q) > 0` iff
`q ∈ I^+(p)`; the reverse triangle inequality `τ(p, r) ≥ τ(p, q) + τ(q, r)` for `q ∈ J^+(p)`,
`r ∈ J^+(q)`; lower semicontinuity of `τ` on `M × M` (O'Neill, Ch. 14); `τ(p, p) = ∞` if
`p` lies on a closed timelike curve and `0` otherwise.

**Checks.**

- Minkowski space: `τ(p, q) = √(−minkowskiForm (q − p) (q − p))` for `q ∈ J^+(p)`;
  `τ(0, (2, 0)) = 2`, `τ(0, (1, 1)) = 0`, `τ(0, (0, 1)) = 0`.
- On Minkowski space minus `{(1, 0)}`, `τ(0, (2, 0)) = 2` and no causal curve attains it.
- On the Lorentzian cylinder `τ ≡ ∞`.

*Needs:* §C2.2–§C2.3, §C4.1–§C4.3.

#### C5.2 The causal ladder

*Hypotheses:* Smooth finite-dimensional connected time-oriented spacetimes; Hausdorff and second countable; no boundary.

Define chronological (`p ∉ I^+(p)`), causal (`J^+` antisymmetric), distinguishing
(`I^+(p) = I^+(q)` or `I^−(p) = I^−(q)` implies `p = q`), strongly causal (every neighbourhood
of every point contains a causally convex neighbourhood), stably causal (some continuous
Lorentzian metric `g'` with strictly wider cones, `g'(v, v) < 0` for every nonzero `g`-causal
`v`, is causal), causally simple (causal with `J^±(p)` closed for all `p`) spacetimes, and
prove the implications: causally simple ⇒ strongly causal ⇒ distinguishing ⇒ causal ⇒
chronological; stably causal ⇒ strongly causal; compact spacetimes are not chronological
(O'Neill, Ch. 14); a chronological spacetime has `τ(p, p) = 0`.

**Checks.**

- The Lorentzian cylinder is not chronological.
- Minkowski space minus a point is stably causal (the time function `t`) and not causally
  simple (`J^+(p)` is not closed, as in §C4.3).

*Needs:* §C2.2–§C2.3, §C4.1–§C4.3.

#### C5.3 Time functions and temporal smoothing

*Hypotheses:* Smooth finite-dimensional connected time-oriented spacetimes; Hausdorff second countable; smoothness only for the temporal representative.

Define a time function (continuous, strictly increasing along every future causal curve) and
a temporal function (smooth with past-directed timelike gradient, so `dt(v) > 0` for future
causal `v`). Prove a temporal function is a time function and supplies stable causality by a suitable
cone widening `g′=g−ε dt⊗dt`. For a merely continuous time function, prove existence of
a smooth temporal function by the time-function smoothing theorem (Minguzzi 2019),
building its approximation and patching lemmas in this item. This yields stable causality
without taking the differential of a continuous function.

**Checks.**

- `t` is a temporal function on Minkowski space, and `t³` is a time function whose gradient
  vanishes on `{t = 0}`, so it is not temporal.

*Needs:* §C5.2, §C4.1; partitions of unity and the temporal smoothing construction specified here.

#### C5.4 Limit curves and length semicontinuity

*Hypotheses:* Smooth finite-dimensional time-oriented spacetimes; Hausdorff second countable; auxiliary complete Riemannian metric; strong causality where stated.

Prove, for an auxiliary complete Riemannian metric `h` (construct one by conformally rescaling
any smooth Riemannian metric by a proper smooth exhaustion function, Nomizu–Ozeki):
future causal curves parametrized by `h`-arc length are 1-Lipschitz; if `γ_n` are such curves
defined on a common compact interval with `γ_n(0)` convergent, a subsequence converges
uniformly to a future causal curve; if the `γ_n` are future-inextendible, or their `h`-lengths
tend to infinity, a subsequence converges on compact sets to a future-inextendible causal
curve through the limit point (Minguzzi 2008). In a strongly causal spacetime the Lorentzian
length is upper semicontinuous under this convergence (Beem–Ehrlich–Easley, §C3.3).

**Checks.**

- In Minkowski space the curves `s ↦ (s, s/n)` converge to `s ↦ (s, 0)`; their lengths
  `√(1 − 1/n²) · s` converge to the limit's.
- Without the arc-length parametrization the theorem fails: the timelike curves
  `s ↦ (n s, 0)` on `[0, 1]` have no uniformly convergent subsequence; parametrized by
  Euclidean arc length they are `s ↦ (s, 0)` on `[0, n]`, which converge on compact sets to the
  inextendible line `s ↦ (s, 0)`, `s ≥ 0`.

*Needs:* §C2.2–§C2.3, §C4.1–§C4.3; Mathlib Arzelà–Ascoli; HopfRinow distance and the complete auxiliary-metric construction specified here.

### C6 Cauchy theory and global hyperbolicity

#### C6.1 Achronal sets and boundaries

*Hypotheses:* Smooth finite-dimensional time-oriented spacetimes without boundary; Hausdorff second countable; connectedness and completeness as stated.

Define achronal sets and the edge of an achronal set (O'Neill, Ch. 14): the points
`p ∈ closure A` such that every neighbourhood `U` of `p` contains a timelike curve in `U` from
`I^−(p, U)` to `I^+(p, U)` not meeting `A`. Define a topological (Lipschitz)
hypersurface: locally, in some chart, the graph of a Lipschitz function over a hyperplane.
Prove: an achronal set `A` with empty edge is a closed topological hypersurface; for any `S`,
the achronal boundary `∂I^+(S)` is a closed achronal Lipschitz hypersurface with empty edge
(O'Neill, Ch. 14); every point of `∂I^+(S) \ closure S` lies on a null geodesic in
`∂I^+(S)` that is past-inextendible or has its past endpoint on `closure S` (Hawking–Ellis,
Prop. 6.3.1).

*Needs:* §C2.3, §C4.1–§C4.2, §C5.4.

#### C6.2 Domains of dependence and Cauchy surfaces

*Hypotheses:* Smooth finite-dimensional time-oriented spacetimes without boundary; Hausdorff second countable; connectedness and completeness as stated.

Use only nonempty inextendible curve domains `a<b` from §F2.1 and §C2.2. The
finite-endpoint prototype is justified by the smooth normalization of open intervals;
endpoint conditions are limits from within the domain. Define `D^±(A)`, `D(A)`, `H^±(A)` and Cauchy surfaces as in the Conventions. Prove for achronal
`A`: `A ⊆ D(A)`; `D^+(A) ∩ I^−(A) = ∅`; `int D(A)` is open and, for closed `A`, globally
hyperbolic (O'Neill, Ch. 14); `H^+(A)` is closed and achronal, and for closed `A` every
point of `H^+(A) \ edge(A)` lies on a null geodesic in `H^+(A)` that is past-inextendible or
has past endpoint on `edge(A)` (O'Neill, Ch. 14; Hawking–Ellis, Prop. 6.5.3). Prove that
a Cauchy surface is achronal, is met by every inextendible causal curve, is a closed achronal
topological hypersurface, and satisfies `D(S) = M`; conversely a closed achronal `S` with
`D(S) = M` is a Cauchy surface; any two Cauchy surfaces are homeomorphic.

**Checks.**

- `{t = 0}` is a Cauchy surface of Minkowski space.
- In `ℝ^{1+1}`, `A = {t = 0, |x| ≤ 1}`: `D^+(A) = {0 ≤ t ≤ 1 − |x|}`, `edge(A) = {(0, ±1)}`,
  and `H^+(A)` is the two null segments `{t = 1 − |x|, 0 ≤ t ≤ 1}`.
- The hyperboloid `{t = √(1 + x²)}` is closed, achronal and spacelike but not a Cauchy surface
  of Minkowski space: the inextendible timelike curve `x = √(t² + 1)` misses it. It is a
  Cauchy surface of `I^+(0) = {t > |x|}`, which equals its domain of dependence.

*Needs:* §F2.1, §C2.2–§C2.3, §C4.1–§C4.3, §C5.4, §C6.1.

#### C6.3 Global hyperbolicity and splitting

*Hypotheses:* Smooth finite-dimensional time-oriented spacetimes without boundary; Hausdorff second countable; connectedness and completeness as stated.

Define `IsGloballyHyperbolic` (causal with compact `J^+(p) ∩ J^−(q)`). Prove:

- equivalence with the strongly causal form (Bernal–Sánchez 2007);
- globally hyperbolic implies causally simple; `τ` is finite and continuous; for
  `q ∈ J^+(p)` there is a causal geodesic from `p` to `q` of length `τ(p, q)` (Avez–Seifert;
  O'Neill, Ch. 14); the space of future causal curves from `p` to `q`, up to
  reparametrization, is compact for uniform convergence in `h`-arc length;
- Geroch's theorem: `M` is globally hyperbolic iff it has a Cauchy surface (Geroch 1970;
  O'Neill, Ch. 14);
- the Bernal–Sánchez splitting: a globally hyperbolic spacetime has a Cauchy temporal
  function `t : M → ℝ` (temporal, with every level set a Cauchy surface), so `M` is
  diffeomorphic to `ℝ × Σ` with `g = −β dt² + h_t`, `β > 0` and `h_t` Riemannian metrics on `Σ`,
  each slice a smooth spacelike Cauchy surface (Bernal–Sánchez 2003, 2005); every smooth
  spacelike Cauchy surface is a level set of such a function (Bernal–Sánchez 2006).

**Checks.**

- Minkowski space is globally hyperbolic, `t` a Cauchy temporal function; Minkowski space minus
  a point `r` is not: `J^+(p) ∩ J^−(q)` is not compact when `r ∈ I^+(p) ∩ I^−(q)`.
- de Sitter space `ℝ ×_{cosh} S^n` is globally hyperbolic with Cauchy surfaces `{t} × S^n`.
- Anti-de Sitter space in the form of §C1.2 is strongly causal (`t` is a temporal function) and
  not globally hyperbolic: a radial null geodesic reaches `r = ∞` within coordinate time
  `∫_0^∞ dr / cosh r = π/2`, so for `p = (0, 0)` and `q = (π + ε, 0)`, `ε > 0`, the set
  `J^+(p) ∩ J^−(q)` contains the whole slice `{t = π/2 + ε/2}`, which is not compact.
- A compact spacetime is never globally hyperbolic (§C5.2).

*Needs:* §F2.2 for vector-field flow, §C5.1–§C5.4, §C6.1–§C6.2.

#### C6.4 Continuous inextendibility

*Hypotheses:* Smooth finite-dimensional time-oriented spacetimes without boundary; Hausdorff second countable; connectedness and completeness as stated.

Prove that a timelike geodesically complete globally hyperbolic spacetime is
`C^0`-inextendible (Galloway–Ling–Sbierski 2017), and as its first case that Minkowski space
is `C^0`-inextendible (Sbierski 2018). The proof uses §C6.3 for the given spacetime and only
§C2.3 for the continuous extension.

**Checks.**

- The Milne region is smoothly extendible and timelike geodesically incomplete, as
  computed in §C1.2, consistent with the theorem.

*Needs:* §F1.7, §F2.2, §C2.3, §C6.3.

#### C6.5 Conformal invariance of the global causal theory

*Hypotheses:* Finite-dimensional conformally related time-oriented Lorentzian metrics; continuous factor for causal statements, smooth representatives for the smooth temporal/splitting statements.

For positive continuous conformal rescaling with the orientation transport of §C2.4,
prove equivalence of chronology, causality, distinction, strong and stable causality, and
causal simplicity. Prove equality of achronal sets, their edges and achronal boundaries,
`D^±(A)` and `H^±(A)`, and equivalence of the Cauchy-surface and global-hyperbolicity
predicates. Use equality of causal curves and their endpoint/inextendibility conditions;
these are the same global sets on the same underlying manifold. State each theorem for
the regularity at which its predicates are defined; applications of smooth splitting
require smooth representatives on both sides.

For a constant factor `Ω=c>0`, prove `τ_ĝ=c τ_g` in `ℝ≥0∞`, including infinite values.
Time functions are unchanged. Where defined, prove `grad_ĝ f=Ω⁻² grad_g f` and equivalence
of the temporal and Cauchy-temporal conditions. Lorentzian length transforms by §C2.4;
the affine-null parameter transformation and a completeness counterexample are in §C4.4.

**Checks.**

- The metric `exp(−2t²)(−dt²+dx²)` has exactly the Minkowski Cauchy surfaces and causal
  diamonds and is globally hyperbolic, although its null affine completeness differs.
- Constant positive rescaling leaves all the causal sets unchanged and multiplies time separation by the constant factor.

*Needs:* §C2.4, §C4.4, §C5.1–§C5.3, §C6.1–§C6.3.

### C7 Focusing and singularity theorems

#### C7.1 Lorentzian index and maximizing consequences

*Hypotheses:* Smooth finite-dimensional Lorentzian metrics; regular timelike/null geodesics; positive-definite orthogonal or screen metric.

In Lorentzian signature, along a unit timelike geodesic restrict `I` to fields orthogonal
to `γ'`: before the first conjugate point it is positive definite on nonzero fields with
zero endpoints. The second variation of proper-time length is `−I`, hence negative
definite. Along a null geodesic use the same index form on the quotient bundle
`γ'^⊥/ℝγ'`, whose induced metric is positive definite. Specialize focal points to spacelike
hypersurfaces and spacelike codimension-two submanifolds. Prove: a timelike geodesic from
`p` with a conjugate point `r` before `q` is not maximizing from `p` to `q`; a null geodesic
from `p` with a conjugate point
before `q` has `q ∈ I^+(p)`; and the focal analogues for hypersurfaces and codimension-two
surfaces (O'Neill, Ch. 10).

**Checks.**

- In constant curvature `κ`, for a unit timelike geodesic and `J ⊥ γ'`, `J'' = κ J`: de
  Sitter (`κ = 1`) has no conjugate points along timelike geodesics, anti-de Sitter
  (`κ = −1`) has them at proper time `π`.
- For a positive unit geodesic the same shared formula gives `J'' = −κ J`, recovering
  the spherical and hyperbolic Jacobi fields from R2.
- For a straight negative-unit geodesic in flat signature `(2, 2)`, orthogonal fields
  along a positive direction give `I(X,X) > 0`, and along the second negative direction
  give `I(X,X) < 0`, even though there are no conjugate points.

*Needs:* §F4.1, §C3.1–§C3.4, §C4.1.

#### C7.2 Raychaudhuri equations and focusing

*Hypotheses:* Smooth finite-dimensional Lorentzian metrics; affine geodesic parameters; convergence conditions and dimensions as stated.

Use the operator and finite-dimensional trace identities of §F4.2. For null hypersurfaces
use the quotient metric of §C3.4 and prove the corresponding quotient Riccati identity.
For an affinely parametrized null hypersurface congruence derive the corresponding
quotient-bundle identities, with `m = dim M − 2 > 0`. In arbitrary signature the
self-adjoint shear can have `tr(σ²) < 0`; keep it as a metric contraction without a
positivity claim. Riemannian hypersurface evolution and Lorentzian Raychaudhuri use
these same identities.

Specialize to a Lorentzian spacelike hypersurface, with expansion `θ` and shear `σ`,
to obtain the timelike Raychaudhuri equation
`θ' = −θ²/n − |σ|² − Ric(u, u)`, `u` the unit tangent, in dimension `n + 1`; for the generators
of a smooth null hypersurface, `θ' = −θ²/(n − 1) − |σ|² − Ric(L, L)` with `L` affinely
parametrized, `n ≥ 2`. Define the timelike convergence condition (`Ric(v, v) ≥ 0` for timelike
`v`) and the null convergence condition (`Ric(ℓ, ℓ) ≥ 0` for null `ℓ`); vacuum metrics satisfy
both. Prove the focusing lemmas: under timelike convergence, a normal geodesic from a spacelike
hypersurface with `θ(0) = θ₀ < 0` has a focal point within proper time `n/|θ₀|` if defined that
long; under null convergence, a null generator with `θ(0) = θ₀ < 0` has a focal point within
affine parameter `(n − 1)/|θ₀|`.

**Checks.**

- `ℝ^{1,3}` light cone from the origin, affine parameter `r`: `θ = 2/r`, `θ' = −2/r² = −θ²/2`
  with `σ = 0`, `Ric = 0`.
- Robertson–Walker with flat three-dimensional fibre, congruence `∂_t`: `θ = 3a'/a`,
  `θ' = 3a''/a − 3a'²/a²`, `−θ²/3 = −3a'²/a²`, so `Ric(∂_t, ∂_t) = −3a''/a`, matching §C1.2.
- Relative to a screen metric `diag(−1, 1)`, the trace-free self-adjoint matrix
  `σ = [[0, 1], [−1, 0]]` has `tr(σ²) = −2`. The trace identity alone therefore
  does not yield the Lorentzian focusing bound in higher index.

*Needs:* §F4.2, §C3.1–§C3.4, §C7.1.

#### C7.3 Hawking and Penrose theorems

*Hypotheses:* Smooth finite-dimensional globally hyperbolic spacetimes; stated convergence, Cauchy-surface and trapped-surface hypotheses.

Prove Hawking's theorem: if `M` is globally hyperbolic and satisfies the timelike convergence
condition, and `S` is a smooth spacelike Cauchy surface with future mean curvature
`H ≤ b < 0`, then every future causal curve from `S` has Lorentzian length at most `n/|b|`, so
`M` is future timelike geodesically incomplete (O'Neill, Ch. 14; Hawking 1967). Prove Penrose's
theorem: if `M` is globally hyperbolic with a noncompact Cauchy surface, satisfies the null
convergence condition and contains a closed trapped surface, then `M` is future null
geodesically incomplete (O'Neill, Ch. 14; Penrose 1965).

**Checks.**

- Minkowski space is null and timelike complete, has noncompact Cauchy surfaces and satisfies
  both convergence conditions; consistently it has no closed trapped surface (§C3.4) and no
  Cauchy surface with `H ≤ b < 0`.
- The Milne region `{t > 0}` with `−dt² + t² dx²` (`n = 1`) is flat and globally hyperbolic
  with Cauchy surfaces `{t = t₀}`, and `k = (1/t₀) h` for the future normal `∂_t`. For the
  time-reversed orientation the mean curvature is `H = −1/t₀`, so the time-reversed Hawking
  bound is `n/|b| = t₀`, attained by the past-incomplete geodesics `t ↦ (t, x₀)` of §C1.2.

*Needs:* §C6.2–§C6.3, §C7.1–§C7.2.

## Downstream consumers

- A hyperbolic-PDE roadmap (wave equations on Lorentzian manifolds, symmetric hyperbolic
  systems, domains of dependence and finite speed of propagation, the compressible Euler
  equations and their acoustical metric) consumes §F1–§F3, §C1–§C3 and §C6.2.
- General-relativity roadmaps (the Cauchy problem for the Einstein equations, black holes,
  Cauchy horizons, `C^0`-extendibility statements) consume §F1.5–§F1.7, §C1–§C3, §C6.2
  and §C6.4.
- RelativisticQuantumFieldTheory can state its causal supports with §C2.3's `J^±` on
  Minkowski space after the signature conversion of the Conventions.
- LocalVariationalFieldTheory LVF6 can take its Lorentzian metrics in `LorentzianMetric` and
  its time orientations from §C2.1.
- RiemannianGeometry and other differential-geometric consumers use the generalized
  nondegenerate metric, curvature, geodesic, immersion and variation APIs through their
  existing positive-definite interfaces. Semi-Riemannian consumers use those same APIs
  at arbitrary signature through Part I without importing Part II.
- Infinite-dimensional geometry of mappings and shapes can use the Banach local connection,
  strong metric, supplied weak Levi-Civita, geodesic and variation APIs. The weak-metric
  applications and their analytic hypotheses are described by Bruveris and Michor–Mumford;
  constructing particular mapping spaces or Fréchet manifolds is outside this roadmap.
- Geometric PDE and nonsmooth geometry can use §F2.2's locally Lipschitz connection flow
  and §F2.4’s `C^{1,1}` metric normal-neighbourhood theory. Distributional, Finsler and Fréchet
  developments consume these interfaces under the scope boundary above.

## References

- D. Joyce, *On manifolds with corners*, [arXiv:0910.3518](https://arxiv.org/abs/0910.3518):
  boundary-compatible submersions and fibres; §C3.2 states the particular sufficient hypotheses used here.

- M. Bruveris, *Riemannian geometry for shape analysis and computational anatomy*,
  [arXiv:1807.11290](https://arxiv.org/abs/1807.11290): Banach/Hilbert foundations,
  strong and weak metrics, connections and the limits of infinite-dimensional completeness.
- P. W. Michor, D. Mumford, *Vanishing geodesic distance on spaces of submanifolds and
  diffeomorphisms*, [arXiv:math/0409303](https://arxiv.org/abs/math/0409303): weak metrics
  and the distinction between positivity and distance separation.
- M. Kunzinger, R. Steinbauer, M. Stojković, *The exponential map of a `C^{1,1}`-metric*,
  [arXiv:1306.4776](https://arxiv.org/abs/1306.4776): locally bi-Lipschitz exponential
  maps and totally normal neighbourhoods for finite-dimensional semi-Riemannian metrics.
- E. Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*,
  [arXiv:1308.6675](https://arxiv.org/abs/1308.6675): quantitative ODE, low-regularity
  inverse and Gauss lemmas, convex normal neighbourhoods and local causal maximality.
- P. G. LeFloch, C. Mardare, *Definition and stability of Lorentzian manifolds with
  distributional curvature*, [arXiv:0712.0122](https://arxiv.org/abs/0712.0122): context
  for the separately scoped distributional geometry, not an implementation target here.
- B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, Academic Press
  (1983): Ch. 2 (scalar products), Ch. 3 (semi-Riemannian manifolds), Ch. 4 (submanifolds),
  Ch. 5 (Lorentz causal character, timecones, convex neighbourhoods), Ch. 7 (warped products),
  Ch. 10 (variations, Jacobi fields, focal points), Ch. 14 (causality, Cauchy surfaces,
  singularity theorems).
- J. K. Beem, P. E. Ehrlich, K. L. Easley, *Global Lorentzian Geometry*, 2nd ed., Dekker
  (1996): Ch. 3 (causality, limit curves), Ch. 4 (Lorentzian distance).
- S. W. Hawking, G. F. R. Ellis, *The Large Scale Structure of Space-Time*, Cambridge (1973):
  Ch. 4 (Raychaudhuri, energy conditions), Ch. 6 (causal structure), Ch. 8 (singularities).
- E. Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019) 3.
- E. Minguzzi, *Limit curve theorems in Lorentzian geometry*, J. Math. Phys. 49 (2008) 092501.
- P. T. Chruściel, *Elements of causality theory*, arXiv:1110.6706.
- P. T. Chruściel, J. D. E. Grant, *On Lorentzian causality with continuous metrics*, Class.
  Quantum Grav. 29 (2012) 145001.
- R. Geroch, *Domain of dependence*, J. Math. Phys. 11 (1970) 437–449.
- A. N. Bernal, M. Sánchez, *On smooth Cauchy hypersurfaces and Geroch's splitting theorem*,
  Comm. Math. Phys. 243 (2003) 461–470; *Smoothness of time functions and the metric splitting
  of globally hyperbolic spacetimes*, Comm. Math. Phys. 257 (2005) 43–50; *Further results on
  the smoothability of Cauchy hypersurfaces and Cauchy time functions*, Lett. Math. Phys. 77
  (2006) 183–197; *Globally hyperbolic spacetimes can be defined as 'causal' instead of
  'strongly causal'*, Class. Quantum Grav. 24 (2007) 745–749.
- G. J. Galloway, *Null geometry and the Einstein equations*, in *The Einstein Equations and
  the Large Scale Behavior of Gravitational Fields*, Birkhäuser (2004).
- G. J. Galloway, E. Ling, J. Sbierski, *Timelike completeness as an obstruction to
  `C^0`-extensions*, Comm. Math. Phys. 359 (2018) 937–949.
- J. Sbierski, *The `C^0`-inextendibility of the Schwarzschild spacetime and the spacelike
  diameter in Lorentzian geometry*, J. Differential Geom. 108 (2018) 319–378.
- S. Kobayashi, K. Nomizu, *Foundations of Differential Geometry*, Vol. I, Wiley (1963), §III.8.
- K. Nomizu, H. Ozeki, *The existence of complete Riemannian metrics*, Proc. Amer. Math. Soc.
  12 (1961) 889–891.
- R. Penrose, *Gravitational collapse and space-time singularities*, Phys. Rev. Lett. 14 (1965)
  57–59.
- S. W. Hawking, *The occurrence of singularities in cosmology. III*, Proc. Roy. Soc. A 300
  (1967) 187–201.
