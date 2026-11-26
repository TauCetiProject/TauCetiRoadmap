# Roadmap: Lorentzian geometry and causality

**Summary.** This roadmap specializes the semi-Riemannian foundations of
SemiRiemannianFoundations to finite-dimensional Lorentzian cones, time orientations, causal
curves, null geometry, global hyperbolicity and the singularity theorems. Local causal geometry
includes `C^{1,1}` metrics. Domains of dependence are also defined inside an arbitrary subset of
a manifold with boundary or corners, for continuous metrics, and achronal boundaries and Cauchy
horizons are treated for `C¹` metrics; acoustical metrics on `ℝ × Σ` are the model. Conformal
transport relates the causal predicates and null geodesic images while retaining the metric
dependence of length and affine parametrization.

This README is the roadmap. `Suggested.lean` states its headline theorems against the
pinned Mathlib and Tau Ceti, with the definitions they need. The scalar products of every
signature, the metric carrier, connections, curvature, the geodesic flow, immersions and Jacobi
fields that it specializes are SemiRiemannianFoundations', cited here by section.

## How to read the build

Layer 1 is Lorentzian linear algebra: cones, reverse inequalities and causal types of
subspaces. Layer 2 is Lorentzian metrics, model spacetimes and acoustical metrics. Layer 3 is
time orientations, causal curves, length and the causal relations. Layer 4 is spacelike and
null submanifolds, Layer 5 local causality at `C^{1,1}` regularity and conformal null
geodesics, and Layer 6 time separation, the causal ladder, time functions and limit curves.
Layer 7 is achronal sets, domains of dependence, global hyperbolicity with the theorems of
Geroch, Bernal–Sánchez and Avez–Seifert, `C^0`-inextendibility, domains of dependence inside
subsets and the horizons of `C¹` metrics. Layer 8 is focusing and the singularity theorems of
Hawking and Penrose. Each target's *Needs* line lists its own prerequisites, and each layer's
Dependencies subsection collects them; an example can cite a consequence proved in another
section. Each target states its hypotheses; the table summarizes them.

| Targets | Dimension | Regularity | Metric or connection input |
| --- | --- | --- | --- |
| Layers 1–4 | Finite | Continuous metrics and stated immersion orders | Lorentzian, except general null algebra |
| Layer 5 | Finite | `C^{1,1}` local causality; `C¹` conformal null predicates | Time-oriented Lorentzian metric |
| Layers 6–8 | Finite | Smooth for global analytic theorems | Time-oriented Lorentzian metric and stated global hypotheses |
| §2.3 | Finite | Pointwise; `C^k` where the data are | Acoustical form on `ℝ × Σ` |
| §7.6 | Finite, boundary or corners allowed | Continuous on a subset `D` | Lorentzian form field and timelike field on `D` |
| §7.7 | Finite, open subsets without boundary | Locally Lipschitz; `C¹` for geodesic generators | Time-oriented Lorentzian metric |

## Conventions

**Signature.** Signature, vector characters, curvature, hypersurfaces and extensions follow the
conventions of SemiRiemannianFoundations. Lorentzian scalar products have signature `(n, 1)`,
with diagonal `(−, +, …, +)`. A vector `v` is timelike if `g(v,v) < 0`, null if `g(v,v) = 0`
and `v ≠ 0`, causal if timelike or null, and spacelike if `g(v,v) > 0` or `v = 0` (the zero
vector is spacelike and not causal; Minguzzi 2019, §1.3, p. 7). RelativisticQuantumFieldTheory
and LocalVariationalFieldTheory's Klein–Gordon model use `η = diag(+1,−1,−1,−1)`; their
quadratic forms are the negatives of ours, and their timelike vectors are ours.

**Dimension.** Manifolds are finite-dimensional; the sign predicates and cone formulas retain
any stronger generality supplied by their native definitions. Lorentzian statements use
`d=n+1`. Nonzero null vectors exist exactly when `n≥1`. “(3+1)-dimensional” means
`finrank ℝ E=4`.

**Where index one is needed.** §1.2–§1.3 and the causal and focusing results use Lorentzian
signature. The local null-hypersurface algebra in §4.2–§4.3 works in any finite signature. For
`q≥2` the negative vectors are connected, so the metric does not distinguish future and past
components. A null screen `L^⊥/ℝL` has signature `(p−1,q−1)`; its positive definiteness in the
focusing arguments uses `q=1`.

**Manifolds and regularity.** The base manifold is smooth. Metrics and curves carry their own
regularities, with orders encoded by `k : ℕ∞ω`, `k≤∞`, as in SemiRiemannianFoundations.
`C^{1,1}` means `C¹` with locally Lipschitz first chart derivatives. The global splitting and
singularity theorems use smooth metrics.

Optical foliations at corners use the stratum-surjectivity conditions in §4.2; generator flows
at boundary points use face tangency in §4.3. The global causal theory in Layers 5–8 is
boundaryless, except §7.6: its causal curves and domains of dependence live in an arbitrary
subset `D` of a manifold possibly with boundary or corners, with metric and time orientation
needed only at points of `D`. §7.7 works on open subsets of a boundaryless manifold.
Hausdorffness, countability, paracompactness and connectedness are explicit where needed.

**Time orientation.** A time orientation is an equivalence class of continuous timelike
vector fields, `T ~ T'` iff `g(T, T') < 0` everywhere. A causal vector `v` is future-directed
for `[T]` iff `g(v, T) < 0`. A spacetime is a connected time-oriented Lorentzian manifold;
Lean takes the time orientation `τ : TimeOrientation g` as a separate argument and keeps
`[ConnectedSpace M]` as a hypothesis, with no separate spacetime class.

**Curves.** Domains and admissible changes of parameter are those of SemiRiemannianFoundations
§3.1. Compact and open nontrivial domains require `a<b`; inextendibility means absence of the
appropriate endpoint in `M`, with limits taken from within the domain. `I^±` uses regular
piecewise `C¹` timelike curves; `J^±` uses locally Lipschitz curves with nonzero future
causal velocity almost everywhere, and includes the diagonal separately. §5.3 proves
agreement of causal endpoint relations at `C^{1,1}` regularity. A curve with a null geodesic
image need not be a `C²` pregeodesic in its original parameter.

**Lengths and time separation.** The Lorentzian length of a causal curve is
`L(γ) = ∫_a^b √(−g(γ', γ')) dt` (`lorentzianLength`). The time separation is
`τ(p, q) = sup {L(γ) : γ future causal from p to q}` in `ℝ≥0∞` for `q ∈ J^+(p)` and
`τ(p, q) = 0` otherwise (Minguzzi 2019, §2.9, p. 39, where it is called the Lorentzian
distance).

**Hypersurfaces.** The unit normal `ν`, `ε = g(ν, ν)`, scalar second fundamental form and mean
curvature of a nondegenerate hypersurface are those of SemiRiemannianFoundations. For a
Lorentzian spacelike hypersurface with future unit normal `ν`, the second fundamental form is
`k(X, Y) = g(∇_X ν, Y)` and the mean curvature is `H = tr_h k`, so the future unit hyperboloid
`{t² − |x|² = 1, t > 0}` in Minkowski space has `k = h` and `H = n`. For a null hypersurface of
any signature with a chosen null normal `L`, the null second fundamental form is
`B(X, Y) = g(∇_X L, Y)` on `TΣ/ℝL` and the expansion is `θ = tr B` with respect to the
nondegenerate form induced on `TΣ/ℝL`. This form is positive definite in Lorentzian
signature. A closed spacelike codimension-two surface in a spacetime is trapped if both
future null expansions are negative.

**Domains of dependence.** `D^+(A)` is the set of `p` such that every past-inextendible
causal curve through `p` meets `A` (Hawking–Ellis, §6.5; Minguzzi 2019, Definition 3.1, p. 84); `D(A) = D^+(A) ∪
D^−(A)`; the future Cauchy horizon is `H^+(A) = closure(D^+(A)) \ I^−(D^+(A))`. A Cauchy
surface is a set met exactly once by every inextendible timelike curve. Inside a subset `D`,
`D^+_D(S)` is the set of `p ∈ D` such that every future causal curve in `D` ending at `p`
and past-inextendible in `D` meets `S` (§7.6); for open `D` it is `D^+(S ∩ D)` of the
spacetime `(D, g|D)`. Global hyperbolicity
is causality together with compactness of every `J^+(p) ∩ J^−(q)` (Bernal–Sánchez 2007;
Minguzzi 2019, Definition 4.117 (b), p. 146); §7.3
proves the equivalence with the strongly causal form.

**Extensions.** `C^l`-extensions and `C^l`-inextendibility of a connected Lorentzian manifold
without boundary are those of SemiRiemannianFoundations §2.7: a smooth embedding into a
connected Hausdorff manifold without boundary with a `C^l` metric pulling back to `g`, not
surjective. For second-countable `M` it suffices to exclude second-countable extensions.

**Names.** `LorentzianMetric I M k` is the index-one subtype of SemiRiemannianFoundations'
metric carrier, the regularity extension of `TauCeti.Manifold.ContMDiffNondegenerateMetric`.
Suggested homes for the Lorentzian-specific material are
`TauCeti/LinearAlgebra/BilinearForm/Lorentzian/` for Layer 1, in the `LinearMap.BilinForm`
namespace (the predicate `IsLorentzian` and the time cones), and
`TauCeti/Geometry/Manifold/Lorentzian/` for Layers 2–8, in `TauCeti.Manifold`
(`LorentzianMetric`, `TimeOrientation`, `chronologicalFuture`, `causalFuture`,
`IsCauchySurface`, `IsGloballyHyperbolic`, …). The vector characters `IsTimelike`, `IsNull`
and `IsCausal` are SemiRiemannianFoundations §1.1's.

## Prior work and coordination

PhysLean (Lean 4, Apache-2.0) formalizes Minkowski space, the Lorentz group and causal
characters of Lorentz vectors in the `(+, −, −, −)` signature. It is prior art for Layer 1, and the
signature conversion of the Conventions relates its notation to this roadmap's. The Mathlib
pull request [mathlib4#38194](https://github.com/leanprover-community/mathlib4/pull/38194)
proposed an `IndefiniteMetric` structure on bilinear forms; Layer 1 uses Mathlib's
`LinearMap.BilinForm` predicates directly.

## Layer 1: Lorentzian scalar products and cones

Spaces are real. The Lorentzian signature theorems of §1.1 and all of §1.2–§1.3 are
finite-dimensional; the Minkowski formula keeps its algebraic generality. §1.2 fixes a timelike vector.

### 1.1 Lorentzian forms and vector characters

Define, for a real vector space `V` and `b : LinearMap.BilinForm ℝ V`, the predicate
`IsLorentzian b := b.IsSymm ∧ b.Nondegenerate ∧ sigNeg b.toQuadraticMap = 1`. The causal
characters `IsTimelike b v`, `IsNull b v`, `IsCausal b v` and spacelike are those of
SemiRiemannianFoundations §1.1 (Minguzzi 2019, §1.3, p. 7, whose "lightlike" is this roadmap's
null). Define `minkowskiForm E` on `ℝ × E`, for a real inner-product space `E`, by
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
  `minkowskiForm E v v = −v.1² + ‖v.2‖²`.

**Checks.**

- In `ℝ^{1+1}` with `minkowskiForm`: `(1, 0)` is timelike (`−1`), `(1, 1)` is null, `(0, 1)`
  is spacelike, `0` is spacelike and not causal. `(2, 1)` has `minkowskiForm = −4 + 1 = −3`.
- `dim V = 1`, `b(x, y) = −xy` is Lorentzian with no null vectors: a statement asserting null
  vectors without `n ≥ 1` is false.
- `diag(−1, −1, 1)` is nondegenerate of index two, not Lorentzian, though it has timelike
  vectors; `diag(−1, −1, −1)` has negative determinant in dimension three but is negative
  definite on two-planes, so the second clause of the determinant criterion is needed.

*Needs:* SemiRiemannianFoundations §1.1.

### 1.2 Time cones and reverse inequalities

For Lorentzian `b` and timelike `v`, define the time cone `C(v) = {w | IsTimelike b w ∧ b v w < 0}`.
Prove, on finite-dimensional normed `V`:

- (a) the timelike vectors form an open set with exactly two connected components,
  `C(v)` and `C(−v) = −C(v)`; each is an open convex cone;
- (b) timelike `v, w` lie in the same cone iff `b(v, w) < 0`; in particular, for timelike
  `u, v, w`, `b(u, v) < 0` and `b(v, w) < 0` give `b(u, w) < 0` (`IsLorentzian.neg_of_neg_of_neg`);
- (c) for timelike `v`, `b` is positive definite on `v^⊥` and `V = ℝv ⊕ v^⊥` (`IsCompl`);
- (d) every causal vector lies in the closure of exactly one of the two cones, and for timelike
  `v` and causal `w`, `w ∈ closure C(v)` iff `b(v, w) < 0`;
- reverse Cauchy–Schwarz (Minguzzi 2019, Theorem 1.2, p. 8): for timelike `v` and any `w`,
  `b(v, v) b(w, w) ≤ b(v, w)²`, with
  equality iff `v, w` are linearly dependent; for timelike `v, w` in one cone,
  `−b(v, w) ≥ |v||w|` with `|v| = √(−b(v, v))`, so `−b(v, w) = |v||w| cosh φ` for a unique
  `φ ≥ 0`;
- reverse triangle inequality (Minguzzi 2019, Theorem 1.3, p. 8): for causal `v, w` in the
  closure of one cone,
  `|v + w| ≥ |v| + |w|`, with equality for timelike `v, w` iff they are proportional;
- for causal `v, w` in the closure of one cone, `b(v, w) ≤ 0`, with equality iff `v, w` are
  proportional null vectors;
- a time orientation of `V` is a choice of one of the two cones; the `b`-isometries
  preserving each cone (orthochronous isometries) form a subgroup of index two of the
  isometry group, and `−id` is not orthochronous;
- for `minkowskiForm E`, `C((1, 0)) = {v | ‖v.2‖ < v.1}`, and the future unit hyperboloid of
  RiemannianGeometry R4.7 is `{v ∈ C((1, 0)) | minkowskiForm E v v = −1}`.

**Checks.**

- `v = (1, 0)`, `w = (2, 1)` in `ℝ^{1+1}`: `b(v, w) = −2`, `b(v, v) b(w, w) = 3 ≤ 4`;
  `|v| = 1`, `|w| = √3`, `|v + w| = √8 ≈ 2.83 ≥ 1 + √3 ≈ 2.73`.
- `v = (1, 1)`, `w = (1, −1)`: both future null, `b(v, w) = −2 < 0`, not proportional; and
  `v`, `2v` give `b = 0`, the equality case.
- `(1, 0)` and `(−1, 0)` are timelike with `b = 1 > 0`: opposite cones.

*Needs:* §1.1; RiemannianGeometry R4.7 for the future unit hyperboloid.

### 1.3 Causal type of subspaces

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

*Needs:* §1.1–§1.2; SemiRiemannianFoundations §1.2.

### Examples

- `minkowskiForm` on `ℝ^{1+1}` with `(1, 0)`, `(1, 1)`, `(0, 1)` and `(2, 1)` (§1.1–§1.2); the hyperplanes `{t = 0}`, `{x = 0}` and `{t = x}` of `ℝ^{1+2}` (§1.3).

### Dependencies

SemiRiemannianFoundations Layer 1; RiemannianGeometry R4.7.

## Layer 2: Lorentzian metrics and model spacetimes

Manifolds are smooth and finite-dimensional. §2.1 allows boundary or corners and continuous,
finite-order or smooth Lorentzian metrics; the models of §2.2 have no boundary, with regions and
dimensions as stated there; §2.3 takes `Σ` without boundary with a Riemannian metric `h`,
`M = ℝ × Σ`, and speed `c` and velocity `v` arbitrary pointwise, with positivity, continuity or
`C^k` regularity on the sets stated.

### 2.1 Lorentzian specialization of the shared metric carrier

Define `LorentzianMetric I M k` as the index-one subtype of the common carrier in
SemiRiemannianFoundations §2.2 (`ContMDiffNondegenerateMetric.IsLorentzian`: Lorentzian at every point). Finite-dimensional nondegeneracy supplies its strong inverse. Its Hölder classes,
Levi-Civita connection, curvature, restrictions, products with Riemannian factors and
conformal changes are the specializations of SemiRiemannianFoundations, with no additional metric data.
Identify the signature with `(n,1)` in dimension `n+1`; for a connected manifold it suffices
to check the signature at one point (Tau Ceti's
`TauCeti.Manifold.isLocallyConstant_sigPos_sigNeg_of_continuous`). Preserve the existing smooth nondegenerate interface
and the native Riemannian interface through the shared carrier.

**Checks.**

- On `ℝ × (0, 2m) × S²` the Schwarzschild formula of §2.2 is diagonal with entries
  `−(1 − 2m/r) > 0` on `∂_t`, `(1 − 2m/r)^{−1} < 0` on `∂_r` and `r² g_{S²}` on the sphere: one
  negative direction, so it is a `LorentzianMetric` there although `∂_t` is spacelike; a
  definition asking the first coordinate field to be timelike would exclude it.
- An index-two metric remains in the common carrier and is excluded by the Lorentzian predicate.
- `−dt² + t dx²` on `ℝ²` is Lorentzian for `t > 0`, degenerate at `t = 0` and negative definite for `t < 0`, so it is a `LorentzianMetric` on `{t > 0}` only.

*Needs:* §1.1; SemiRiemannianFoundations §2.2–§2.5.

### 2.2 Model spacetimes and extension examples

Use SemiRiemannianFoundations §2.6’s shared warped-product construction to build the following models. A listed
timelike field supplies the time orientation of §3.1.


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
  in the sense of SemiRiemannianFoundations §2.7. Minkowski inextendibility is proved in §7.4.
  The curves `t ↦ (t,x₀)`, `t>0`, are negative unit geodesics with finite past affine
  endpoint and no limit in the Milne manifold, so that region is past geodesically incomplete.
- De Sitter space `ℝ ×_{cosh} S¹` is `−dt² + cosh² t dθ²`, with `K = (cosh t)″/cosh t = 1` by SemiRiemannianFoundations §2.5.
- Two-dimensional anti-de Sitter space `−cosh² r dt² + dr²` has `K = −f″/f = −1` for `f = cosh r` by SemiRiemannianFoundations §2.5.


- Robertson–Walker with flat three-dimensional fibre: `Ric(∂_t, ∂_t) = −3a''/a`.
- The Schwarzschild exterior's base `−(1 − 2m/r)dt² + (1 − 2m/r)^{−1}dr²` has `K = 2m/r³`
  (Gaussian curvature `−F''/2` for `−F dt² + F^{−1} dr²`, `F = 1 − 2m/r`); `Ric = 0` for the
  warped product needs both the base curvature and the warping terms, and fails for
  `F = 1 − 2m/r²`.

*Needs:* §2.1; SemiRiemannianFoundations §2.4–§2.7; Tau Ceti's round sphere `TauCeti.sphereRoundMetric` and `TauCeti.hasConstantSectionalCurvature_sphere`.

### 2.3 Acoustical metrics on product spacetimes

On `M = ℝ × Σ`, with `t` the first coordinate, let `h` be a Riemannian metric on `Σ`,
`c : M → ℝ` a function and `v` a time-dependent vector field on `Σ`, `v(t, x) ∈ T_xΣ`.
Define pointwise the acoustical form by
`g((a, X), (b, Y)) = −c² a b + h(X − a v, Y − b v)`, that is
`g = −c² dt² + h(dx − v dt, dx − v dt)` (for `Σ = ℝ²` Euclidean, Luo–Yu, (1.2), p. 3), and the
vector field `B = ∂_t + v`. Regularity is
a property of these fields, not part of the definition. Prove:

- at a point with `c ≠ 0`, `g` is a Lorentzian scalar product, `g(B, B) = −c²`,
  `g(B, X) = 0` for `X ∈ T_xΣ`, and `g = h` on `T_xΣ`; at a point with `c = 0`, `B` spans
  the radical and `g` is degenerate;
- `g⁻¹ = −c^{−2} B ⊗ B + h⁻¹`, where `h⁻¹` acts on the restrictions of covectors to `TΣ`.
  Hence `g⁻¹(dt, dt) = −c^{−2}`, each tangent space of a slice `Σ_τ = {τ} × Σ` is a
  spacelike subspace (§1.3) with induced form `h`, and
  `g⁻¹(du, du) = −c^{−2}(∂_t u + du(v))² + |d_Σ u|²_h`;
- every causal vector `X` has `dt(X) ≠ 0`, and `g(X, B) = −c² dt(X)` for every `X`. The vector
  `∂_t + Y`, `Y ∈ T_xΣ`, is causal iff `|Y − v|_h ≤ |c|` and null iff `|Y − v|_h = |c|`;
- on an open `U` where `c > 0` and `c`, `v`, `h` are of class `C^k` (`k : ℕ∞ω`, including
  `k = 0`), the acoustical form is a `LorentzianMetric` of class `C^k` on `U`, and `B` is
  a continuous timelike vector field on `U` when `c`, `v` are continuous. §3.1 time orients
  it by `[B]`, and §7.6 uses the pair on subsets where only continuity on the subset is known.

These statements take `c` and `v` as given fields. The fluid side, the sound speed
`c = √(p′(ρ))` of an equation of state and the velocity of a state of the compressible
Euler equations, belongs to CompressibleEulerEquations.

**Checks.**

- `Σ = ℝ^n` Euclidean, `c > 0` and `v` constant: `(t, x) ↦ (ct, x − vt)` is an isometry onto
  `(ℝ × ℝ^n, minkowskiForm)` carrying `[B]` to `[∂_t]`; so `{x¹ = (v¹ + c)t}` is a null
  hyperplane, with null normal `B + c ∂_1`.
- For `Σ = ℝ × (ℝ/2πℤ)^{n−1}` use Mathlib's `Circle` for each periodic factor, with Tau
  Ceti's round metric `TauCeti.roundMetricCircle`; the product metric is flat and the covering
  `ℝ^n → Σ`, `x ↦ (x¹, e^{ix²}, …, e^{ixⁿ})`, is a local isometry. Acoustical forms of
  `x`-periodic `c`, `v` on `ℝ × ℝ^n` are pullbacks of acoustical forms on `ℝ × Σ`.
- `Σ = ℝ`, `c = 1`, `v = 2`: `g = −dt² + (dx − 2dt)²` has Gram matrix `[[3, −2], [−2, 1]]` with
  determinant `−1`, so it is Lorentzian; `g(∂_t, ∂_t) = 3 > 0` while `g(B, B) = 3 − 8 + 4 = −1`, so
  in this supersonic flow `B` orients time and `∂_t` does not.

*Needs:* §1.1–§1.3, §2.1; SemiRiemannianFoundations §2.2; Mathlib Riemannian metrics, product manifolds and `Circle`; Tau Ceti `TauCeti.roundMetricCircle`.

### Examples

- Minkowski, Robertson–Walker, de Sitter, anti-de Sitter and the Schwarzschild exterior, and the Milne region inside Minkowski space (§2.2); acoustical metrics with constant `c` and `v` (§2.3).

### Dependencies

Layer 1; SemiRiemannianFoundations Layer 2 (§2.2–§2.7); Mathlib Riemannian metrics, product manifolds and `Circle`; Tau Ceti `TauCeti.roundMetricCircle`, `TauCeti.sphereRoundMetric` and `TauCeti.hasConstantSectionalCurvature_sphere`.

## Layer 3: time orientations and causal curves

Metrics are finite-dimensional continuous Lorentzian metrics. §3.1 uses Hausdorff
second-countable manifolds for the equivalence of time orientations with sections of the
double cover; §3.2 fixes a time orientation and makes curve domains and admissible parameters
explicit; §3.3 works without boundary and leaves regularity-sensitive consequences to
Layer 5; §3.4 compares two metrics related by a positive continuous factor, with the
transported time orientation and stronger regularity only where stated.

### 3.1 Time orientations and spacetimes

For `g : LorentzianMetric I M k` (any `k`, so continuous metrics are included), define
`TimelikeVectorField g` (continuous sections of `TM` that are timelike everywhere), the
equivalence `T ~ T' ⟺ ∀ x, g(T x, T' x) < 0` (`TimelikeVectorField.setoid`, an equivalence
relation by §1.2 (b)),
`TimeOrientation g` as the quotient, time-orientability (some continuous timelike field
exists), the opposite orientation `[−T]`, and future- and past-directed causal and timelike
vectors (`TimeOrientation.IsFutureCausal`, `TimeOrientation.IsFutureTimelike`; independent of
the representative by §1.2) (Minguzzi 2019, §1.7, p. 10). The quotient-of-fields definition is used on Hausdorff second-countable
manifolds; the correspondence with sections of the time-cone cover and the existence of
smooth field representatives use the resulting paracompactness. Prove:

- a connected time-orientable `M` has exactly two time orientations, `[T]` and `[−T]`;
- every time orientation has a `C^∞` representative when `M` is Hausdorff and σ-compact, by a
  partition of unity and convexity of the cones;
- equivalently, a time orientation is a continuous choice of timelike cone: construct the
  time-orientation double cover of `g`, whose points are pairs of a point and one
  of its two timelike cones, as a smooth two-sheeted covering (on the pattern of Tau Ceti's
  `OrientationCover`), and identify time orientations with its continuous sections; a
  connected `M` is time-orientable iff the cover is disconnected, and is time-orientable when
  simply connected;
- time orientations restrict to open subsets, pull back along local isometries, and are
  reversed by `[T] ↦ [−T]`;
- a future-directed causal vector field and a future-directed timelike vector field pair
  negatively; the sum of future causal vectors is future causal.

A spacetime is a Lorentzian metric with a time orientation on a connected manifold; a
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

*Needs:* §1.2, §2.1; auxiliary Riemannian metrics and the native orientation-cover API; DifferentialGeometry Layer 2.

### 3.2 Causal curves, length and inextendibility

Fix a time orientation `𝔱`. Define:

- `IsFutureTimelikeCurve 𝔱 γ a b` and the future causal piecewise `C¹` curves: piecewise `C¹`
  on `[a, b]`, `a < b`, every one-sided velocity future timelike, resp. future causal;
- `IsLocallyLipschitzCurveOn γ s`: near every parameter, `γ` stays in the chart at its value
  and is Lipschitz in that chart; prove chart independence and, for an auxiliary smooth
  Riemannian metric `h`, the equivalence with local Lipschitz continuity for
  `Manifold.riemannianEDist` when `I` is boundaryless;
- `IsFutureCausalCurve 𝔱 γ a b`: locally Lipschitz on `[a, b]`, differentiable with future
  causal velocity at almost every parameter (the velocity exists almost everywhere by
  Rademacher's theorem in charts);
- future timelike Lipschitz curves: locally Lipschitz on `[a, b]`, `a < b`, with future
  timelike velocity at almost every parameter. Every future timelike piecewise `C¹` curve is
  one, and every one is a future causal curve;
- past-directed versions by `𝔱 ↦ −𝔱`; future- and past-inextendible curves on half-open and
  open intervals, and inextendible timelike and causal curves.

Use the domain and change-of-parameter API of SemiRiemannianFoundations §3.1. Prove that piecewise-`C¹`
future causal curves are locally Lipschitz causal curves, and prove restriction and
concatenation for each class. Increasing piecewise `C¹` changes with positive one-sided
derivatives and equally regular inverse preserve the piecewise-`C¹` classes. Increasing
locally bi-Lipschitz changes preserve the locally Lipschitz causal class. No assertion
that arbitrary monotone `C¹` changes preserve regular timelike curves is made.

Prove arc-length normalization as a separate theorem: every absolutely continuous future
causal curve with nonzero velocity almost everywhere admits an increasing change of
parameter to an auxiliary-Riemannian-unit-speed Lipschitz curve, with the change-of-variables
and inverse-regularity hypotheses established. The same gives the normalization for the
Lipschitz causal curves used in `J^±`. Define `L(γ)` (`lorentzianLength`), prove finiteness on compact intervals,
additivity under concatenation and invariance under these admissible reparametrizations,
and prove `L(γ)>0` for regular timelike curves.

Define a causal curve with null geodesic image by SemiRiemannianFoundations §3.1's change-of-parameter relation
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
- The endpoints of future timelike Lipschitz curves from `p` need not form an open set for a
  continuous metric (Grant–Kunzinger–Sämann–Steinbauer, Example 3.1, pp. 10–12), so `I^±` in §3.3 uses piecewise
  `C¹` curves; §5.3 identifies the two endpoint relations for `C^{1,1}` metrics.

*Needs:* §3.1; SemiRiemannianFoundations §3.1–§3.2; finite-dimensional Rademacher, real change of variables and piecewise curves.

### 3.3 Chronological and causal relations

Define `chronologicalFuture 𝔱 p = I^+(p)` (endpoints of future timelike curves from `p`),
`causalFuture 𝔱 p = J^+(p)` (`p` together with endpoints of future causal curves from `p`),
the pasts `I^−(q) = {p | q ∈ I^+(p)}` and `causalPast 𝔱 q = J^−(q) = {p | q ∈ J^+(p)}`, and
`I^±(S)`, `J^±(S)` as unions over `S`. Prove: `I^+(p) ⊆ J^+(p)`; `I^+` and `J^+` are
transitive; `I^−` and `J^−` are the futures for the opposite orientation `[−T]`, by reversing
curves; `I^+(p)` is open for continuous `g` (Sbierski 2018, Proposition 2.6, p. 8, for piecewise
smooth curves; the same proof applies to piecewise `C¹` ones); `I^+(S)` is open. On
four-dimensional Minkowski space, identified with RelativisticQuantumFieldTheory's `Spacetime`
with the time coordinate first, `J^+(p)` and `J^−(p)` are that roadmap's `causalFuture {p}`
and `causalPast {p}` (§1.1).

**Checks.**

- Minkowski space with `[∂_t]`: `I^+(0) = {t > |x|}`, `J^+(0) = {t ≥ |x|}`.
- The Lorentzian cylinder `(ℝ/2πℤ) × ℝ` with `−dθ² + dx²`, oriented by `∂_θ`: `p ∈ I^+(p)` and
  `I^+(p) = M` for every `p`.
- Push-up `J^+ ∘ I^+ ⊆ I^+` is not asserted here; it is §5.2 for `C^{1,1}` metrics and §7.7
  for locally Lipschitz metrics.

*Needs:* §3.1–§3.2; RelativisticQuantumFieldTheory §1.1 for the Minkowski comparison.

### 3.4 Conformal transport of cones, curves and length

For metrics on the same manifold and `ĝ = Ω² g`, with `Ω` positive and continuous,
construct the canonical transport of time orientations by the identity on timelike fields.
Prove identity, composition, inverse and restriction laws for this transport. With the
transported orientation, vector characters and future directions are unchanged. Prove
equivalence of all the causal and timelike curve predicates of §3.2, including their
inextendibility conditions, and equality of `I^±` and `J^±` as sets and relations.

Prove the length transformation
`L_ĝ(γ) = ∫ Ω(γ(t)) √(−g(γ′(t),γ′(t))) dt`.
For a constant factor `Ω=c>0`, prove `L_ĝ=c L_g`; the time-separation scaling theorem
is in §7.5 after its definition. The causal-relation transport itself requires only the
continuous positive factor, not a derivative of it. The global causal consequences are
proved in §7.5 after their definitions; null affine parameters are treated in §5.4.

**Checks.**

- For `Ω(t, x) = e^x` on Minkowski `ℝ^{1+1}`, `ĝ((1, 1), (1, 1)) = e^{2x} · 0 = 0` and
  `ĝ((1, 0), (1, 0)) = −e^{2x} < 0`, so the characters are unchanged, while the segments from
  `(0, 0)` to `(1, 0)` and from `(0, 1)` to `(1, 1)`, both of `g`-length `1`, have `ĝ`-lengths `1`
  and `e`: length is data beyond the cones.
- `Ω(t, x) = t²` vanishes on `{t = 0}`, where `ĝ = t⁴ g` is degenerate: the factor must be
  positive for `ĝ` to be Lorentzian.
- For `ĝ = 4g` on Minkowski `ℝ^{1+1}` (`Ω = 2`), the segment from `0` to `(1, 0)` has `L_ĝ = 2 = 2L_g`, while `(1, 1)` stays null: `ĝ((1, 1), (1, 1)) = 4 · 0`.

*Needs:* §3.1–§3.3; SemiRiemannianFoundations §2.2; change of variables and the length integral.

### Examples

- Minkowski space with `[∂_t]`, the Lorentzian cylinder and the Lorentzian Möbius band (§3.1, §3.3); lengths of straight, reparametrized and Lipschitz curves (§3.2); constant and nonconstant conformal factors (§3.4).

### Dependencies

Layer 1 (§1.2); Layer 2 (§2.1); SemiRiemannianFoundations Layer 2 (§2.2) and Layer 3 (§3.1–§3.2); DifferentialGeometry Layer 2; RelativisticQuantumFieldTheory §1.1; Mathlib Rademacher theorem and change of variables; Tau Ceti auxiliary Riemannian metrics.

## Layer 4: spacelike and null submanifolds

Everything is finite-dimensional. §4.1 is Lorentzian immersion geometry at the stated finite
regularities, with a time orientation for a global future normal; §4.2 allows continuous metrics
of any signature and `C¹` immersions and functions, with the interior or the stated
corner-compatible submersion hypotheses for foliations; §4.3 uses `C¹` metrics, `C²` null
hypersurfaces and a `C¹` normal field, with the interior or face-tangent fields for two-sided
flows; §4.4 uses smooth null geometry, a time orientation for trapped surfaces, and a labeling
and paracompactness only for global normal fields.

### 4.1 Spacelike hypersurfaces and constraint equations

In the Lorentzian specialization, for a `C¹` immersion `F : Σ → M`
(Mathlib `Manifold.IsImmersion J I 1 F`) and
`g : LorentzianMetric I M k`, define the causal type of `F` at `y` as that of the subspace
`dF_y(T_yΣ)` (§1.3), and spacelike, timelike and null immersions as those of one type at every
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
hypersurface of a vacuum spacetime satisfies the vacuum constraints `S_Σ + H² − |k|² = 0`, `div_Σ k − dH = 0`
(in dimension four, Gourgoulhon, (2.92) and (2.95), p. 35, (2.101) and (2.103), p. 36, with
extrinsic curvature `−k`; the vacuum constraints are its (4.19) and (4.21), p. 54, with zero
sources).

**Checks.**

- In `ℝ^{1,3}` the future unit hyperboloid has `ν` the position vector, `k = h`, `H = 3`; the
  Gauss equation gives `R^Σ(X,Y,Y,X) = 0 − 1 = −1` for orthonormal `X, Y` (hyperbolic space),
  and the constraint `S_Σ + H² − |k|² = −6 + 9 − 3 = 0`.
- `{t = 0}` in Minkowski space has `k = 0`.
- A Riemannian Gauss equation sign (`+`) gives `R^Σ = +1` on the hyperboloid, contradicting
  Tau Ceti's hyperbolic-space model.

*Needs:* §1.3, §3.1; SemiRiemannianFoundations §2.5, §4.1.

### 4.2 Null hypersurfaces, optical functions and corners

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

*Needs:* §2.1; §3.1 for future normals; SemiRiemannianFoundations §1.2, §2.2; native immersion and implicit-function APIs.

### 4.3 Null generators and boundary persistence

Let `g` be a `C¹` nondegenerate metric of any signature and `Σ` a `C²` null hypersurface
with a chosen `C¹` null normal `L`. Prove
`∇_L L = κ L` along `Σ` for a continuous `κ`, so the integral curves of `L` are null
pregeodesics contained in `Σ` and, after the reparametrization of SemiRiemannianFoundations §3.2, null geodesics (the
null generators). If `u` is a `C²` optical function and `L = −grad_g u`, then `∇_L L = 0`.
The two-sided flow and generator-foliation assertions are on the interior of `Σ`.
For a hypersurface with standard corners, extend them to boundary points when `L` is
tangent to every incident boundary face, proving that these faces are preserved by its
`C¹` local flow. Without this tangency hypothesis the identity `∇_L L=κL` still holds
where the differentiable data are given, but no two-sided flow inside `Σ` is asserted.
(Galloway 2004, Proposition 3.1, p. 5; Minguzzi 2019, Theorem 6.7, p. 164). The proof: for `X` tangent to `Σ`,
`g(∇_L L, X) = −g(L, [L, X]) − ½ X g(L, L) = 0`, so `∇_L L ∈ (TΣ)^⊥ = ℝL`; for an optical
function, `∇_{(du)^♯}(du)^♯ = ½ grad_g(g^{−1}(du, du)) = 0`.

**Checks.**

- Generators of the Minkowski light cone are the rays `s ↦ (s, s ω)`, `|ω| = 1`, with
  `∇_L L = 0` for `L = (1, x/|x|)`.
- `L = (1 + t²)(∂_t + ∂_x)` on `{t = x}` has `∇_L L = 2t L`, so `κ = 2t` is nonzero and `L` is
  not geodesic, though its integral curves are null pregeodesics.
- `{t = x}` in `ℝ^{1+2}` with `L = ∂_t + ∂_x` has `∇_L L = 0`; its generators are the lines `s ↦ (s, s, y₀)`.

*Needs:* §4.2; SemiRiemannianFoundations §2.4, §3.2; local vector-field flow and reparametrization.

### 4.4 Null expansion and trapped surfaces

For a smooth nondegenerate `g` of any signature and `Σ` a smooth null hypersurface with a
chosen null normal `L`, define the null second fundamental form `B(X, Y) = g(∇_X L, Y)`
on `TΣ/ℝL`, prove it is well defined and symmetric,
and that `B_{fL} = f B_L`; define the expansion `θ = tr B` and the shear (trace-free part)
with respect to the nondegenerate quotient form of signature `(p − 1, q − 1)` (Lorentzian
case: Galloway 2004, §3, pp. 5–6). Reuse the
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
- Replacing `ℓ_+ = ∂_t + ∂_r` by `2ℓ_+` on the sphere `{t = 0, |x| = r}` of `ℝ^{1,3}` doubles `θ_+` to `4/r` and keeps its sign, as `B_{fL} = f B_L`; trapping is unchanged by positive rescaling.

*Needs:* §4.1–§4.3; SemiRiemannianFoundations §2.5.

### Examples

- The unit hyperboloid of `ℝ^{1,3}` (§4.1); the light cone, the hyperplane `{t = x}` and the double null pair `t ∓ r` (§4.2–§4.3); round spheres in Minkowski space and in the Schwarzschild exterior (§4.4).

### Dependencies

Layer 1 (§1.3); Layer 2 (§2.1); Layer 3 (§3.1); SemiRiemannianFoundations Layer 1 (§1.2), Layer 2 (§2.2, §2.4, §2.5), Layer 3 (§3.2) and Layer 4; Mathlib immersion, implicit-function and local-flow APIs.

## Layer 5: local causality and null conformal geometry

Metrics are finite-dimensional, time-oriented and Lorentzian, on manifolds without boundary.
§5.1–§5.3 assume `C^{1,1}` metrics: §5.1 uses the convex normal neighbourhoods of SemiRiemannianFoundations §3.4,
§5.2 states geodesic images in the sense of SemiRiemannianFoundations §3.1, and in §5.3 the continuous-metric
definitions keep their distinct curve classes. §5.4 assumes `C¹` metrics and a positive `C¹`
factor for a supplied geodesic, and `C^{1,1}` for the unique-flow interpretation.

### 5.1 Local causal structure and maximality

For a convex neighbourhood `U` of a time-oriented `C^{1,1}` Lorentzian manifold and `p, q ∈ U`
(Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*, Theorems 6 and 12,
pp. 16 and 24):

- `q ∈ I^+(p, U)` iff `exp_p^{−1} q` is future timelike; `q ∈ J^+(p, U)` iff it is future
  causal or zero; `J^+(p, U)` is closed in `U`;
- local maximality: if `q ∈ J^+(p, U)`, the radial geodesic from `p` to `q` has Lorentzian
  length `√(−g(v, v))`, `v = exp_p^{−1} q`, which is at least the length of every future causal
  curve in `U` from `p` to `q`, with equality only for admissible increasing reparametrizations of it;
- a future causal curve in `U` from `p` to `q` that does not have a null geodesic image
  in the sense of SemiRiemannianFoundations §3.1 can be deformed
  in `U` to a future timelike curve from `p` to `q`.

**Checks.**

- In Minkowski space the segment from `0` to `(2, 0)` has length 2, and the broken curve through
  `(1, 0.5)` has length `2√(1 − 0.25) = √3 < 2`.
- `(1, 1)` lies in `J^+(0) \ I^+(0)`, joined only by the null segment.
- In Minkowski space with `U = M`, `p = 0` and `q = (1, 2)`, `exp_p^{−1} q = (1, 2)` has `g = −1 + 4 = 3 > 0`, so `q ∉ J^+(0, U)`.

*Needs:* §3.3; SemiRiemannianFoundations §3.2–§3.4; the locally Lipschitz normal theory and Gauss lemma of Minguzzi.

### 5.2 Push-up and boundary rigidity

Prove on a time-oriented `C^{1,1}` Lorentzian manifold: push-up, `I^+ ∘ J^+ ⊆ I^+` and
`J^+ ∘ I^+ ⊆ I^+`; `int J^+(p) = I^+(p)` and `J^+(p) ⊆ closure (I^+(p))`; if `q ∈ J^+(p) \
I^+(p)`, `q ≠ p`, then every future causal curve from `p` to `q` has a null geodesic image;
`I^+(S)` is the interior of `J^+(S)` and `∂I^+(S) = ∂J^+(S)` (Minguzzi, *Convex
neighborhoods…*, Corollary 1, p. 20, and Theorem 6, p. 16; Minguzzi 2019, Theorems 2.24 and
2.27, pp. 36–37, whose proofs need only a `C^{1,1}` metric, §2, p. 25).

**Checks.**

- In Minkowski `ℝ^{1+1}`, `(1, 1) ∈ J^+(0)` and `(2, 1) ∈ I^+((1, 1))` (difference `(1, 0)`), and indeed `(2, 1) ∈ I^+(0)`: `−4 + 1 = −3 < 0` with `t > 0`.
- In Minkowski `ℝ^{1+1}`, `int J^+(0) = {t > |x|} = I^+(0)` and `∂J^+(0) = ∂I^+(0) = {t = |x|}`.
- `(1, 1) ∈ J^+(0) \ I^+(0)`, and every future causal curve from `0` to `(1, 1)` has the image of the null segment `s ↦ (s, s)`.

*Needs:* §5.1, §3.2–§3.3.

### 5.3 Agreement of causal-curve classes

For `C^{1,1}` `g`, `J^+(p)` defined with Lipschitz causal curves equals the set defined with
piecewise-`C¹` causal curves, and `I^+(p)` equals the set of endpoints of Lipschitz causal
curves whose velocity is timelike on a set of positive measure (Minguzzi, *Convex
neighborhoods for Lipschitz connections and sprays*, Theorems 6 and 7, pp. 16–18; for `C²`
metrics, Chruściel, *Elements of causality theory*, Corollaries 2.4.11 and 2.4.16, pp. 24 and
27).
In particular `I^+(p)` is the set of endpoints of the future timelike Lipschitz curves of
§3.2 from `p`.

Use SemiRiemannianFoundations §3.1's admissible changes of parameter and arc-length normalization to prove
agreement with absolutely continuous causal curves with nonzero velocity almost everywhere.
This changes the regularity of a representative without changing its causal endpoints.

**Checks.**

- The Lipschitz curve of §3.2's first Check ends at a point of `I^+(0)` reached by the
  straight timelike segment.
- On `ℝ^{1+1}` minus the point `(1, 1)`, the point `(2, 2)` is in `closure (J^+(0))` but not in
  `J^+(0)`, the only causal curve to it from `0` being the null segment through `(1, 1)`:
  `J^+(p)` need not be closed.
- The broken null curve from `0` to `(1, 1)` and on to `(2, 0)` is piecewise `C¹` causal, never timelike, and ends at `(2, 0) ∈ I^+(0)`: the equality of this section is of endpoint sets, not of curve classes.

*Needs:* §5.1–§5.2, §3.2; the normal-neighbourhood and curve-normalization theorems.

### 5.4 Conformal null geodesics and affine parameters

For `ĝ=Ω²g`, with positive `C¹` factor and `C¹` Lorentzian metrics, use the
shared connection conformal-change formula to prove that null geodesic images coincide.
If `γ(s)` is an affinely parametrized null `g`-geodesic, define the new parameter by
`dŝ/ds = Ω(γ(s))²`; prove that `γ` expressed in `ŝ` is an affine `ĝ`-geodesic, up to the
usual positive affine changes. Prove compatibility with restriction and the image relation
of SemiRiemannianFoundations §3.1. The geodesic predicate and supplied geodesic suffice at `C¹`; for locally
Lipschitz connection coefficients these use the common flow of SemiRiemannianFoundations §3.2.

**Checks.**

- For constant `Ω=c`, the new affine parameter is `c²s` up to translation and positive scaling.
- On Minkowski space take `Ω(t,x)=exp(−t²)`. The complete null line `(s,s)` has finite
  future `ĝ`-affine parameter `∫₀^∞ exp(−2s²) ds`, and escapes every compact set.
  Thus the same null geodesic image is future incomplete for `ĝ`, while §7.5 preserves
  global hyperbolicity. Affine completeness is not determined by the cones.
- For `Ω = e^t` on Minkowski `ℝ^{1+1}` and the null line `(s, s)`, `dŝ/ds = e^{2s}`, so `ŝ = (e^{2s} − 1)/2` ranges over `(−1/2, ∞)`: the line is past incomplete for `ĝ`.

*Needs:* §3.4; SemiRiemannianFoundations §2.4–§2.5, §3.1–§3.2; the conformal connection formula.

### Examples

- Straight and broken curves in Minkowski space (§5.1–§5.3); Minkowski `ℝ^{1+1}` minus `(1, 1)` (§5.3); the conformal factors `exp(−t²)` and `e^t` (§5.4).

### Dependencies

Layer 3 (§3.2–§3.4); SemiRiemannianFoundations Layer 2 (§2.4–§2.5) and Layer 3.

## Layer 6: time separation, causal ladder and limit curves

Spacetimes are smooth, finite-dimensional, time-oriented, Hausdorff and second countable,
without boundary; §6.1–§6.3 also assume connectedness. In §6.3 smoothness is used only for
the temporal representative, and §6.4 fixes an auxiliary complete Riemannian metric.

### 6.1 Time separation

Define `timeSeparation 𝔱 p q : ℝ≥0∞` as in the Conventions. Prove `τ(p, q) > 0` iff
`q ∈ I^+(p)`; the reverse triangle inequality `τ(p, r) ≥ τ(p, q) + τ(q, r)` for `q ∈ J^+(p)`,
`r ∈ J^+(q)`; lower semicontinuity of `τ` on `M × M` (Minguzzi 2019, Theorem 2.32, p. 39,
for both); `τ(p, p) = ∞` if
`p` lies on a closed timelike curve and `0` otherwise.

**Checks.**

- Minkowski space: `τ(p, q) = √(−minkowskiForm (q − p) (q − p))` for `q ∈ J^+(p)`;
  `τ(0, (2, 0)) = 2`, `τ(0, (1, 1)) = 0`, `τ(0, (0, 1)) = 0`.
- On Minkowski space minus `{(1, 0)}`, `τ(0, (2, 0)) = 2` and no causal curve attains it.
- On the Lorentzian cylinder `τ ≡ ∞`.

*Needs:* §3.2–§3.3, §5.1–§5.3.

### 6.2 The causal ladder

Define chronological (`p ∉ I^+(p)`), causal (`IsCausalSpacetime`: `J^+` antisymmetric), distinguishing
(`I^+(p) = I^+(q)` or `I^−(p) = I^−(q)` implies `p = q`), strongly causal (every neighbourhood
of every point contains a causally convex neighbourhood), stably causal (some continuous
Lorentzian metric `g'` with strictly wider cones, `g'(v, v) < 0` for every nonzero `g`-causal
`v`, is causal), causally simple (causal with `J^±(p)` closed for all `p`) spacetimes, and
prove the implications: causally simple ⇒ strongly causal ⇒ distinguishing ⇒ causal ⇒
chronological (Minguzzi 2019, §4.2–§4.5); stably causal ⇒ strongly causal (Minguzzi 2019b,
Definition 2.13 and Theorem 2.29, p. 40, applied to the wider cones of `g′`); compact spacetimes are not
chronological (Minguzzi 2019, Proposition 4.18, p. 113); a chronological spacetime has
`τ(p, p) = 0`.

Define reflective spacetimes, in which `q ∈ closure (J^+(p))` iff `p ∈ closure (J^−(q))`, and
causally continuous spacetimes, which are distinguishing and reflective (Minguzzi 2019b,
Definition 2.15 and Proposition 2.16, p. 41, and the list before Theorem 2.47, p. 58; the notion
is due to Hawking and Sachs, §2.8, p. 41). Prove causally simple ⇒
causally continuous: when `J^±(p)` are closed both sides of the reflectivity condition read
`q ∈ J^+(p)`. The implication causally continuous ⇒ stably causal, which completes the ladder
globally hyperbolic ⇒ causally simple ⇒ causally continuous ⇒ stably causal (Minguzzi 2019b,
Theorem 2.47, p. 59), is proved in §6.3.

**Checks.**

- The Lorentzian cylinder is not chronological.
- Minkowski space minus a point is stably causal (the time function `t`) and not causally
  simple (`J^+(p)` is not closed, as in §5.3).
- Minkowski space is causally simple: `J^+(p) = {q | q_t − p_t ≥ |q_x − p_x|}` is closed and `J^+` is antisymmetric.
- Minkowski space minus a point `o` is causally continuous and not causally simple: a timelike
  curve can be perturbed off `o`, so `I^±(p)` is the Minkowski set minus `o`, the closures of
  `J^±(p)` in `M` are the Minkowski cones minus `o`, and both sides of the reflectivity
  condition are the Minkowski relation.

*Needs:* §3.2–§3.3, §5.1–§5.3.

### 6.3 Time functions and temporal smoothing

Define a time function (continuous, strictly increasing along every future causal curve) and
a temporal function (smooth with past-directed timelike gradient, so `dt(v) > 0` for future
causal `v`). Prove a temporal function is a time function and supplies stable causality by a suitable
cone widening `g′=g−ε dt⊗dt`. For a merely continuous time function, prove existence of
a smooth temporal function by the time-function smoothing theorem (Minguzzi 2019,
Theorem 4.100, pp. 140–141),
building its approximation and patching lemmas in this item. This yields stable causality
without taking the differential of a continuous function.

Prove the converse: a stably causal spacetime has a smooth temporal function (Hawking's
existence of a time function, 1968; in smooth form Minguzzi 2019b, Theorem 3.11, p. 111; stable
causality is the antisymmetry of the Seifert relation by Theorem 3.4, p. 98). So stable
causality, the existence of a time function and the existence of a temporal function are
equivalent. Prove that a causally continuous spacetime is stably causal (Minguzzi 2019b,
Theorem 2.47, p. 59): for a finite measure `μ` with smooth positive density, the volume
function `p ↦ μ(I^−(p)) − μ(I^+(p))` does not decrease along future causal curves, strictly
increases along them because the spacetime is distinguishing, and is continuous because it is
reflective (Minguzzi 2019b, pp. 41–42, for the continuity of volume functions of reflective
spacetimes with locally Lipschitz cones), so it is a time function and the smoothing theorem
applies.

**Checks.**

- `t` is a temporal function on Minkowski space, and `t³` is a time function whose gradient
  vanishes on `{t = 0}`, so it is not temporal.
- On Minkowski `ℝ^{1+1}`, `t + x/2` is temporal: for future causal `v`, `v_t ≥ |v_x|` and `v_t > 0`, so `v_t + v_x/2 > 0`; `t + x` is not even a time function, being constant along the future null line `s ↦ (s, −s)`.
- `arctan t` is a temporal function of Minkowski space with values in `(−π/2, π/2)`: `d(arctan t)(v) = v_t/(1 + t²) > 0` for future causal `v`.
- The Lorentzian cylinder of §6.2 has no time function, since a closed timelike curve would
  make it strictly increase around a loop; it is not stably causal.

*Needs:* §6.2, §5.1, §5.2 (push-up, for the monotonicity of volume functions); partitions of unity and the temporal smoothing construction specified here;
Mathlib measures with smooth density for the volume functions.

### 6.4 Limit curves and length semicontinuity

Prove, for an auxiliary complete Riemannian metric `h` (construct one by conformally rescaling
any smooth Riemannian metric by a proper smooth exhaustion function, Nomizu–Ozeki; Minguzzi
2019, Theorem 1.5, p. 10):
future causal curves parametrized by `h`-arc length are 1-Lipschitz; if `γ_n` are such curves
defined on a common compact interval with `γ_n(0)` convergent, a subsequence converges
uniformly to a future causal curve; if the `γ_n` are future-inextendible, or their `h`-lengths
tend to infinity, a subsequence converges on compact sets to a future-inextendible causal
curve through the limit point (Minguzzi 2019, Theorems 2.50 and 2.51 with Remark 2.52, p. 47;
Minguzzi 2008). The Lorentzian length is upper semicontinuous under this convergence
(Minguzzi 2019, Theorem 2.41, p. 43).

**Checks.**

- In Minkowski space the curves `s ↦ (s, s/n)` converge to `s ↦ (s, 0)`; their lengths
  `√(1 − 1/n²) · s` converge to the limit's.
- Without the arc-length parametrization the theorem fails: the timelike curves
  `s ↦ (n s, 0)` on `[0, 1]` have no uniformly convergent subsequence; parametrized by
  Euclidean arc length they are `s ↦ (s, 0)` on `[0, n]`, which converge on compact sets to the
  inextendible line `s ↦ (s, 0)`, `s ≥ 0`.
- On Minkowski `ℝ^{1+1}` with `h` Euclidean, `s ↦ (s/√2)(1, 1)` is the `h`-arc-length parametrization of a future null line; it is 1-Lipschitz for `h` and has Lorentzian length `0`.

*Needs:* §3.2–§3.3, §5.1–§5.3; Mathlib Arzelà–Ascoli; HopfRinow distance and the complete auxiliary-metric construction specified here.

### Examples

- Time separation in Minkowski space and in Minkowski space minus a point (§6.1); the Lorentzian cylinder and Minkowski space minus a point (§6.2); `t`, `t³`, `t + x/2` and `arctan t`, and the cylinder without a time function (§6.3); limit curves of `s ↦ (s, s/n)` (§6.4).

### Dependencies

Layer 3 (§3.2–§3.3); Layer 5 (§5.1–§5.3); Mathlib Arzelà–Ascoli and partitions of unity; HopfRinow distance.

## Layer 7: Cauchy theory and global hyperbolicity

§7.1–§7.4 concern smooth finite-dimensional time-oriented spacetimes without boundary,
Hausdorff and second countable, with connectedness and completeness as stated. §7.5 compares
conformally related finite-dimensional time-oriented Lorentzian metrics, with a continuous
factor for the causal statements and smooth representatives for the smooth temporal and
splitting statements. §7.6 works on finite-dimensional smooth manifolds, possibly with
boundary or corners, and an arbitrary subset `D` with a Lorentzian form field and a timelike
field continuous on `D`; boundarylessness, openness, closedness and time functions are
hypotheses of the results that use them. §7.7 concerns finite-dimensional time-oriented
Lorentzian metrics on Hausdorff second-countable manifolds without boundary, in particular open
subsets of a spacetime, with locally Lipschitz metrics for the causal and boundary statements
and `C¹` metrics for geodesic generators.

### 7.1 Achronal sets and boundaries

Define achronal sets and the edge of an achronal set (Minguzzi 2019, Definition 2.130,
p. 76): the points
`p ∈ closure A` such that every neighbourhood `U` of `p` contains a timelike curve in `U` from
`I^−(p, U)` to `I^+(p, U)` not meeting `A`. Define a topological (Lipschitz)
hypersurface: locally, in some chart, the graph of a Lipschitz function over a hyperplane.
Prove: an achronal set `A` with empty edge is a closed topological hypersurface (Minguzzi
2019, Theorem 2.149, p. 81); for any `S`, the achronal boundary `∂I^+(S)` is a closed achronal
Lipschitz hypersurface with empty edge (Minguzzi 2019, Proposition 2.101, p. 68, Theorem 2.87
(iii), p. 61, and Proposition 2.136, p. 77); every point of `∂I^+(S) \ closure S` lies on a
null geodesic in `∂I^+(S)` that is past-inextendible or has its past endpoint on `closure S`
(Hawking–Ellis, Lemma 6.3.2; for closed `S`, Minguzzi 2019, Theorems 2.28 and 2.56, pp. 37
and 49).

**Checks.**

- In `ℝ^{1+1}` the set `A = {t = 0, |x| ≤ 1}` is achronal with `edge(A) = {(0, −1), (0, 1)}`; the points `(0, x)`, `|x| < 1`, are not in it, since in a small neighbourhood every timelike curve from below `A` to above it crosses `A`.
- In Minkowski space `∂I^+(0) = {t = |x|}` is a closed achronal Lipschitz hypersurface with empty edge, and every point other than `0` lies on a null ray from `0` inside it.
- The segment `{t = x/2, 0 ≤ x ≤ 1}` is achronal (differences `(Δ/2, Δ)` are spacelike), while the timelike segment `{x = 0, 0 ≤ t ≤ 1}` is not.

*Needs:* §3.3, §5.1–§5.2, §6.4.

### 7.2 Domains of dependence and Cauchy surfaces

Use only nonempty inextendible curve domains `a<b` from §3.2 and SemiRiemannianFoundations §3.1. The
finite-endpoint prototype is justified by the smooth normalization of open intervals;
endpoint conditions are limits from within the domain. Define `D^±(A)`, `D(A)`, `H^±(A)`
(Minguzzi 2019, Definitions 3.1 and 3.14, pp. 84 and 87) and Cauchy surfaces (`IsCauchySurface`, met exactly once
by every inextendible timelike curve `IsInextendibleTimelikeCurve`) as in the Conventions.
Prove for achronal `A`: `A ⊆ D(A)`; `D^+(A) ∩ I^−(A) = ∅` (Minguzzi 2019, Proposition 3.16,
p. 87); for closed `A`, `int D(A)` is globally hyperbolic (Minguzzi 2019, Theorem 3.45,
p. 99); `H^+(A)` is closed and achronal (Proposition 3.15, p. 87), and for closed
`A` every point of `H^+(A) \ edge(A)` lies on a null geodesic in `H^+(A)` that is
past-inextendible or has past endpoint on `edge(A)` (Minguzzi 2019, Theorem 3.24, p. 91;
Hawking–Ellis, Prop. 6.5.3). Prove that
a Cauchy surface is achronal, is met by every inextendible causal curve, is a closed achronal
topological hypersurface, and satisfies `D(S) = M` (for closed achronal `S` the domain of
dependence defined by timelike curves is `M` iff `D(S)` is, Minguzzi 2019, Corollary 3.34,
p. 95); conversely a closed
achronal `S` with `D(S) = M` is a Cauchy surface; any two Cauchy surfaces are homeomorphic
(Geroch 1970; for closed acausal Cauchy hypersurfaces, Minguzzi 2019, Theorem 4.119, p. 147).

**Checks.**

- `{t = 0}` is a Cauchy surface of Minkowski space.
- In `ℝ^{1+1}`, `A = {t = 0, |x| ≤ 1}`: `D^+(A) = {0 ≤ t ≤ 1 − |x|}`, `edge(A) = {(0, ±1)}`,
  and `H^+(A)` is the two null segments `{t = 1 − |x|, 0 ≤ t ≤ 1}`.
- The hyperboloid `{t = √(1 + x²)}` is closed, achronal and spacelike but not a Cauchy surface
  of Minkowski space: the inextendible timelike curve `x = √(t² + 1)` misses it. It is a
  Cauchy surface of `I^+(0) = {t > |x|}`, which equals its domain of dependence.

*Needs:* §3.2–§3.3, §5.1–§5.3, §6.4, §7.1; SemiRiemannianFoundations §3.1.

### 7.3 Global hyperbolicity and splitting

Define `IsGloballyHyperbolic` (causal with compact `J^+(p) ∩ J^−(q)`, Minguzzi 2019,
Definition 4.117 (b), p. 146). Prove:

- equivalence with the strongly causal form (Bernal–Sánchez 2007; Minguzzi 2019, proof of
  Definition 4.117, p. 146, with Minguzzi 2019b, Theorem 2.29, p. 40);
- globally hyperbolic implies causally simple (proof of Definition 4.117, p. 146); `τ` is
  finite and continuous (Minguzzi 2019, Theorem 4.124, p. 148); for `q ∈ J^+(p)`, `q ≠ p`,
  there is a future causal geodesic from `p` to `q` of length `τ(p, q)` (Avez–Seifert;
  Minguzzi 2019, Theorem 4.123, p. 148; `exists_geodesic_lorentzianLength_eq_timeSeparation`);
  the space of future causal curves from `p` to `q`, up to reparametrization, is compact for
  uniform convergence in `h`-arc length;
- Geroch's theorem: `M` is globally hyperbolic iff it has a Cauchy surface (Geroch 1970;
  Minguzzi 2019, Theorem 4.119, p. 147, for its closed acausal Cauchy hypersurfaces,
  Definition 3.35, p. 95, which are Cauchy surfaces here; conversely `D(S) = M` from §7.2 and
  Minguzzi 2019, Theorem 3.45, p. 99, make `M` globally hyperbolic;
  `isGloballyHyperbolic_iff_exists_isCauchySurface`);
- the Bernal–Sánchez splitting: a globally hyperbolic spacetime has a Cauchy temporal
  function `t : M → ℝ` (smooth, `dt(v) > 0` for every future causal `v`, with every level set a
  Cauchy surface; `exists_cauchyTemporalFunction`), so `M` is diffeomorphic to `ℝ × Σ` with
  `g = −β dt² + h_t`, `β > 0` and `h_t` Riemannian metrics on `Σ`, each slice a smooth
  spacelike Cauchy surface (Bernal–Sánchez 2003, 2005; Minguzzi 2019, Theorem 4.120, p. 147);
  every smooth spacelike Cauchy surface is a level set of such a function (Bernal–Sánchez
  2006).

**Checks.**

- Minkowski space is globally hyperbolic, `t` a Cauchy temporal function; Minkowski space minus
  a point `r` is not: `J^+(p) ∩ J^−(q)` is not compact when `r ∈ I^+(p) ∩ I^−(q)`.
- de Sitter space `ℝ ×_{cosh} S^n` is globally hyperbolic with Cauchy surfaces `{t} × S^n`.
- Anti-de Sitter space in the form of §2.2 is strongly causal (`t` is a temporal function) and
  not globally hyperbolic: a radial null geodesic reaches `r = ∞` within coordinate time
  `∫_0^∞ dr / cosh r = π/2`, so for `p = (0, 0)` and `q = (π + ε, 0)`, `ε > 0`, the set
  `J^+(p) ∩ J^−(q)` contains the whole slice `{t = π/2 + ε/2}`, which is not compact.
- A compact spacetime is never globally hyperbolic (§6.2).

*Needs:* §6.1–§6.4, §7.1–§7.2; SemiRiemannianFoundations §3.2 for vector-field flow.

### 7.4 Continuous inextendibility

Call a smooth spacetime timelike geodesically complete (`IsTimelikeGeodesicallyComplete`)
when every geodesic of its Levi-Civita connection that is defined on an open interval and has
timelike velocity extends to a geodesic defined on all of `ℝ`. Prove that a timelike
geodesically complete globally hyperbolic spacetime is `C^0`-inextendible (Galloway–Ling–Sbierski,
Theorem 1, p. 1; `isInextendible_zero_of_isGloballyHyperbolic`), and as its first case that
Minkowski space is `C^0`-inextendible (Sbierski 2018, Theorem 3.1, p. 13;
`minkowski_isInextendible_zero`).

The proof works inside the continuous extension, so it needs the following facts for a
time-oriented continuous Lorentzian metric, with the causal curves of §3.2, their Lorentzian
length, and an auxiliary complete Riemannian metric `h` as in §6.4; by SemiRiemannianFoundations §2.7 the extension may
be taken second countable, so `h` exists on it. Prove:

- every point has, for each `ε > 0`, a neighbourhood in which every causal curve has Lorentzian
  length and `h`-length less than `ε` (Galloway–Ling–Sbierski, Lemma 2.1, p. 5);
- limit curves: in a strongly causal spacetime, future causal curves in a compact set `K`,
  parametrized by `h`-arc length, whose initial points converge to `p` and final points to `q`
  have a subsequence converging uniformly to a future causal curve in `K` from `p` to `q`
  (Lemma 2.2, p. 6, from Chruściel–Grant, Theorem 1.6, p. 7);
- the Lorentzian length is upper semicontinuous under uniform convergence of future causal
  curves (Proposition 2.3, p. 6);
- in a strongly causal spacetime whose causal diamonds `J^+(p) ∩ J^−(q)` are compact, any two
  causally related points are joined by a causal curve of maximal length (Theorem 2.4, p. 8);
- a `C^0`-extension of a smooth time-oriented spacetime contains a timelike curve that leaves
  the image of the spacetime: it lies in the image except at its endpoint (Sbierski 2018,
  Lemma 2.17, p. 12).

The proof takes such a curve ending at a boundary point, applies the maximal-curve theorem in
a small neighbourhood of that point on which the cones of the extended metric lie between
those of two flat metrics (so that it is globally hyperbolic), and uses §5.1 and global
hyperbolicity of the given spacetime to show that the part of the maximal curve inside the
spacetime is a timelike geodesic with an endpoint on the boundary, which completeness excludes
(Galloway–Ling–Sbierski, Theorem 3.3, pp. 9–14).

**Checks.**

- The Milne region is smoothly extendible and timelike geodesically incomplete, as
  computed in §2.2, consistent with the theorem.
- Minkowski space is timelike geodesically complete: its geodesics are the affine lines `s ↦ p + sv`, defined on `ℝ`.
- The half space `{t < 0}` of Minkowski space is globally hyperbolic, with Cauchy surfaces `{t = t₀}`, `t₀ < 0`, and timelike incomplete, as `s ↦ (s, 0)`, `s < 0`, has no future extension; it extends into Minkowski space, so completeness cannot be dropped.

*Needs:* §3.2–§3.3, §5.1, §6.4, §7.3; SemiRiemannianFoundations §2.7, §3.2; the continuous-metric statements above.

### 7.5 Conformal invariance of the global causal theory

For positive continuous conformal rescaling with the orientation transport of §3.4,
prove equivalence of chronology, causality, distinction, strong and stable causality, and
causal simplicity (conformally related metrics have the same causal cones, Minguzzi 2019,
Corollary 1.13, p. 14). Prove equality of achronal sets, their edges and achronal boundaries,
`D^±(A)` and `H^±(A)`, and equivalence of the Cauchy-surface and global-hyperbolicity
predicates. Use equality of causal curves and their endpoint/inextendibility conditions;
these are the same global sets on the same underlying manifold. State each theorem for
the regularity at which its predicates are defined; applications of smooth splitting
require smooth representatives on both sides.

For a constant factor `Ω=c>0`, prove `τ_ĝ=c τ_g` in `ℝ≥0∞`, including infinite values.
Time functions are unchanged. Where defined, prove `grad_ĝ f=Ω⁻² grad_g f` and equivalence
of the temporal and Cauchy-temporal conditions. Lorentzian length transforms by §3.4;
the affine-null parameter transformation and a completeness counterexample are in §5.4.

**Checks.**

- The metric `exp(−2t²)(−dt²+dx²)` has exactly the Minkowski Cauchy surfaces and causal
  diamonds and is globally hyperbolic, although its null affine completeness differs.
- For `ĝ = 4g` on Minkowski `ℝ^{1+1}` (`Ω = 2`), `τ_ĝ(0, (2, 0)) = 4 = 2τ_g(0, (2, 0))`, not
  `Ω²τ_g = 8`; on the Lorentzian cylinder of §3.3, `τ_ĝ = τ_g = ∞`.
- For `ĝ = e^{2t}(−dt² + dx²)` on `ℝ^{1+1}`, `J^+_ĝ(0) = J^+_g(0) = {t ≥ |x|}`, while the segment from `0` to `(1, 0)` has `ĝ`-length `∫_0^1 e^s ds = e − 1` instead of `1`.

*Needs:* §3.4, §5.4, §6.1–§6.3, §7.1–§7.3.

### 7.6 Causal curves and domains of dependence in subsets

Let `M` be a finite-dimensional smooth manifold, possibly with boundary or corners, and
`D ⊆ M` any subset. Define `TimeOrientedLorentzianFieldOn D`: a pointwise field of bounded
bilinear forms on `TM` and a pointwise vector field `T`, both continuous on `D` as maps
into their total spaces, with the form Lorentzian and `T` timelike at every point of `D`.
Values off `D` are never used. A `LorentzianMetric I M k` with a timelike field
representing a time orientation restricts to such a field on every `D`, and `mono` restricts
along `D' ⊆ D`. Future-directed vectors at points of `D` are defined by `g(v, T) < 0`, as in
§3.1. Replacing `T` by `T'` with `g(T, T') < 0` on `D`, or the form by a positive continuous
multiple on `D`, changes none of the sets below.

For an interval `J ⊆ ℝ` (`J.OrdConnected`; a single point, open, closed or half-open,
bounded or not), define:

- `IsFutureCausalCurveIn 𝔤 γ J`: `γ` maps `J` into `D`, is locally Lipschitz on `J` in the
  sense of §3.2, and has future causal velocity at almost every parameter of `J`. Every
  map on a one-point `J` with value in `D` qualifies. For `J = [a, b]`, `a < b`, and `D = M`
  this is §3.2's `IsFutureCausalCurve` for the restricted field;
- the curve ends at `γ(b)` when `b` is the maximum of `J`;
- `IsPastInextendibleIn 𝔤 γ J`: if `J` has a minimum `a`, no future causal curve in `D` on a
  nontrivial `[a', a]` ends at `γ(a)`; if `J` has no minimum, `γ(s)` has no limit in `D` as
  `s` decreases to `inf J` within `J` (as `s → −∞` when `J` is unbounded below);
- `futureDomainOfDependenceIn 𝔤 S`, written `D^+_D(S)`, for any `S ⊆ M`: the `p ∈ D` such
  that every future causal curve in `D` ending at `p` and past-inextendible in `D` meets `S`;
  `D^−_D(S)` by reversing `T`, and `D_D(S) = D^+_D(S) ∪ D^−_D(S)`.

Prove:

- `S ∩ D ⊆ D^+_D(S)`, and `D^+_D(S)` is monotone in `S`;
- the endpoint and past-inextendibility are invariant under SemiRiemannianFoundations §3.1's admissible changes of
  parameter, and concatenation at a common point of two future causal curves in `D` is one,
  after such a change;
- if `J` has no minimum and `γ(s)` has a limit `q ∈ D` at its past end, then adding `q`
  and reparametrizing by auxiliary Riemannian arc length gives a future causal curve in `D`
  on an interval with minimum. So `IsPastInextendibleIn` says that no admissible
  reparametrization of `γ` is the restriction of a future causal curve in `D` on a strictly
  larger interval with the same maximum;
- open sets: for `M` without boundary and `D = U` open, these curve classes and
  past-inextendibility agree, after SemiRiemannianFoundations §3.1's reduction to intervals with `a < b`, with those
  of §3.2 on the spacetime `(U, g|U)`, and `D^+_U(S)` is §7.2's `D^+(S ∩ U)` for
  `(U, g|U)`: a past-inextendible curve through `p` restricts to one ending at `p`. This
  holds for continuous metrics; the theorems of §7.2 then apply to `D^+_U(S)` for smooth
  `g|U`, and §7.7 treats its horizons for `C¹` metrics;
- time functions: call `t : M → ℝ` a time function on `D` if `t` is continuous on `D` and
  `t ∘ γ` is strictly increasing on `J` for every future causal curve in `D`. If `t` is `C¹` on a neighbourhood of `D`, with
  `g⁻¹(dt, dt) < 0` and `dt(T) > 0` on `D`, then `t` is a time function on `D`, the future
  causal vectors at points of `D` are the causal vectors with `dt(X) > 0`, and every future
  causal curve in `D` on a nontrivial interval is related by SemiRiemannianFoundations §3.1's change of parameter
  `φ = t ∘ γ` (locally Lipschitz, `φ′ > 0` almost everywhere) to a locally Lipschitz
  `t`-parametrized curve, `t(γ(s)) = s`. For `t`-parametrized curves, past-inextendibility
  in `D` is equivalent to the extension form: no `t`-parametrized future causal curve in `D`
  on an interval `J' ⊋ J` with the same maximum restricts to `γ` on `J`. Hence `D^+_D(S)` is
  the set defined using only `t`-parametrized curves on arbitrary intervals, including
  one-point intervals, with this extension form. The acoustical forms of §2.3 with the
  field `B` satisfy these hypotheses with `t` the time coordinate, on every subset `D` of
  `ℝ × Σ` where `c > 0` and `c`, `v` are continuous on `D`;
- slabs: if `t` is a time function on `D`, `D ⊆ {t ≥ t₀}` and `S ⊆ {t = t₀}`, then
  `D^+_D(S) ∩ {t = t₀} = S ∩ D`;
- determination (`futureDomainOfDependenceIn_self`): if `M` has no boundary, `U ⊆ M` is
  open, `S ⊆ U` is closed in `U`, and `D = D^+_U(S)`, then `D^+_D(S) = D` for the field
  restricted to `D`. (Let a curve in `D`
  ending at `p ∈ D` be past-inextendible in `D` and miss `S`. It is not past-inextendible in
  `U`, so it has a past limit `q ∈ U \ D`, and concatenation shows `q ∈ D^+_U(S)`; or its
  parameter interval has a minimum `a`, with `q = γ(a) ∈ D \ S`, and by the definition of
  past-inextendibility in `U` some future causal curve `σ` in `U` on a nontrivial `[a', a]`
  ends at `q`. As `S` is closed in `U`, `σ⁻¹(S)` is closed, so `σ` meets `S` at a last
  parameter, less than `a` as `q ∉ S`, or not at all; every point of `σ` after that parameter
  (every point, if `σ` misses `S`) lies in `D`, by concatenation, so a nontrivial final segment of `σ` is a future causal curve in
  `D` ending at `q`.)
- coverings: if `π : M̃ → M` is a smooth covering map and a local isometry carrying the
  time field of `M̃` to that of `M`, then `π⁻¹(D^+_D(S)) = D^+_{π⁻¹D}(π⁻¹S)`, by unique
  lifting of locally Lipschitz curves and of their past limits.

**Checks.**

- Minkowski `ℝ^{1+1}`, `U = M`, `S = {t = 0, |x| ≤ 1}`: `D^+_U(S) = {0 ≤ t ≤ 1 − |x|}`, as in §7.2.
- `D = {t ≥ 0} ⊆ ℝ^{1+1}`, `S = {t = 0, x ≥ 0}`: `D^+_D(S) = {t ≥ 0, x ≥ t}`. At `(0, x)`,
  `x < 0`, the one-point curve is past-inextendible in `D` and misses `S`; one-point
  curves are what make the slab statement hold. The same set is `D^+_U(S)` for `U = M`, and
  by the determination statement it is also `D^+_{D'}(S)` for `D' = {t ≥ 0, x ≥ t}`.
- `s ↦ (√s, 0)` on `(0, 1]` is a future causal curve in `D = {t ≥ 0}` that is not Lipschitz
  up to `s = 0` in its parameter but has the past limit `(0, 0) ∈ D`: it is
  past-extendible, which the endpoint form records and a fixed-parameter extension form
  would not.
- For the acoustical metric of §2.3 with `Σ = ℝ^n` and constant `c > 0`, `v`, take
  `D = {t ≥ 0}` and `S = {t = 0, x¹ ≥ 0}`: `D^+_D(S) = {t ≥ 0, x¹ ≥ (v¹ + c)t}`. A
  `t`-parametrized curve `(t, x(t))` is future causal iff `|ẋ − v| ≤ c` almost everywhere.

*Needs:* §2.3 for the acoustical checks, §3.1–§3.3, §7.2; §7.4's local length bound (Galloway–Ling–Sbierski, Lemma 2.1, p. 5), for adding a past limit point, with its argument applied to curves in `D` near the point, where the metric is continuous on `D`; SemiRiemannianFoundations §3.1; Mathlib covering maps and path lifting.

### 7.7 Achronal boundaries and Cauchy horizons of `C¹` metrics

Extend to locally Lipschitz metrics, which include `C¹` metrics: the limit curve theorem, that
future-directed inextendible causal curves accumulating at a point accumulate at a
future-directed inextendible causal curve through it (Chruściel, *Elements of causality theory*, Theorem 2.6.7, p. 36, which
holds for `C^{0,1}` metrics by Chruściel–Grant, Corollary 1.26, p. 19); push-up
`I^+ ∘ J^+ ⊆ I^+` and `J^+ ∘ I^+ ⊆ I^+`, and `I^+(p) = int J^+(p)` (Chruściel–Grant,
Corollary 1.17, p. 16, Lemma 1.22, p. 17, and Corollary 1.26, p. 19); for every
`S`, `∂I^+(S)` is a closed achronal locally Lipschitz topological hypersurface in the sense of
§7.1; every point of `∂I^+(S) \ closure S` lies on a future causal curve contained in
`∂I^+(S)`, no two of whose points are chronologically related, that is past-inextendible or
has its past endpoint in `closure S`.

Call a future causal curve no two of whose points are chronologically related achronal.

Filippov geodesics. For locally Lipschitz `g` and a chart, the chart components of `g` are
differentiable almost everywhere (Rademacher), and the coordinate formula of SemiRiemannianFoundations §2.4 defines the
Christoffel field `Γ` at those points; it is locally bounded. A curve `x` in the chart whose
derivative `x′` is absolutely continuous solves the geodesic equation in Filippov's sense if,
for almost every `s`, `−x″(s)` lies in the essential convex hull
`⋂_{δ>0} ⋂_{μ(N)=0} closure conv {Γ_y(w, w) : (y, w) ∉ N, |(y, w) − (x(s), x′(s))| < δ}`, where
`μ` is Lebesgue measure on the chart's `ℝⁿ × ℝⁿ` (Lange–Lytchak–Sämann, §3.1, p. 7). Prove that
this condition is invariant under smooth changes of chart, so that it defines Filippov
geodesics on `M`, and that for continuous `Γ` (a `C¹` metric) a curve is a Filippov geodesic
iff it is `C²` and solves `x″ = −Γ_x(x′, x′)`.

For locally Lipschitz `g`, prove that an achronal causal curve has an admissible change of
parameter (SemiRiemannianFoundations §3.1) to a `C^{1,1}` curve with null velocity everywhere that is a Filippov
geodesic (Lange–Lytchak–Sämann, Theorem 1.1 and Proposition 1.2, p. 3; Graf–Ling,
Theorem 1.1, p. 2). For `C¹` `g` the Christoffel field of SemiRiemannianFoundations §2.4 is continuous, so the curve is
a `C²` null geodesic of the Levi-Civita connection in the sense of SemiRiemannianFoundations §3.2. Geodesics of `C¹`
metrics need not be unique, so these generators are asserted to exist, not to form a flow.

Horizons relative to an open set: for `U` open, `S ⊆ U` closed in `U` and achronal in
`(U, g|U)`, let `D^+_U(S)` be as in §7.6, `H^+_U(S) = closure_U(D^+_U(S)) \ I^−_U(D^+_U(S))`
with closure and `I^−` taken in `U`, and `edge_U(S)` the edge of §7.1 in `(U, g|U)`. For
locally Lipschitz `g` prove that `H^+_U(S)` is closed in `U` and achronal, and that every point of
`H^+_U(S) \ edge_U(S)` lies on an achronal causal curve in `H^+_U(S)` that is
past-inextendible in `U` or has its past endpoint on `edge_U(S)`; for `C¹` `g` that curve
is a null geodesic after reparametrization, by the Filippov-geodesic theorem above. (For smooth `g`
this is Minguzzi 2019, Theorem 3.24, p. 91; the route is its argument, with the limit curve
theorem and push-up of this section in place of their smooth versions.)

Slices of a temporal function: let `t` be `C¹` on `U` with `g⁻¹(dt, dt) < 0` and `dt > 0` on
future vectors, and let `S` be closed in the slice `Σ_{t₀} = {t = t₀}`. Prove that `S` is
achronal in `U`, that `edge_U(S)` is the topological boundary `∂_{Σ_{t₀}} S` of `S` in the
slice, and that the characteristic boundary satisfies
`∂_U D^+_U(S) ∩ {t > t₀} = H^+_U(S) ∩ {t > t₀}`. Where `H^+_U(S)` is a `C¹` embedded
hypersurface near a point, it is null there in the sense of §4.2 and contains the tangent
line of each generator through the point: a `C¹` hypersurface in an achronal set has no
timelike tangent vector, for continuous `g`, and the generator supplies a null one.

**Checks.**

- For the constant acoustical state of §7.6's last Check, the characteristic boundary is
  `{x¹ = (v¹ + c)t, t > 0}`, a null hyperplane whose generators `t ↦ (t, x₀ + t(v + c e₁))`,
  `x₀¹ = 0`, issue from `edge(S) = {t = 0, x¹ = 0}`.
- On `(−1/2, 1/2) × ℝ` with `−dt² + (1 + t|t|^α) dx²`, `0 < α < 1` (SemiRiemannianFoundations §2.3), the metric is `C¹`
  and not `C^{1,1}`; this section applies to its domains of dependence, while Layer 5 does not.
- For the locally Lipschitz metric `−dt² + e^{2|t|} dx²` on `ℝ²`, in the coordinates `(t, x)`
  and off `t = 0`, `Γ_y(w, w) = (sign(t) e^{2|t|} w_x², 2 sign(t) w_t w_x)`. The curve
  `s ↦ (0, s)` lies in the null set `t = 0`, where `Γ` is undefined, so a definition evaluating
  `Γ` along the curve says nothing about it. Near `((0, s), (0, 1))` the values approach `(1, 0)`
  from `t > 0` and `(−1, 0)` from `t < 0`, so the essential convex hull contains `0 = −x″` and the
  curve is a Filippov geodesic.
- For the same metric, near `w = (1, 0)` both components of `Γ_y(w, w)` carry a factor `w_x` and
  tend to `0`, so `s ↦ (s, x₀)`, which crosses `t = 0`, is a Filippov geodesic with `x″ = 0`.
- For merely continuous (Hölder) metrics Chruściel–Grant construct causal bubbles, open sets in
  `J^+(p) \ closure (I^+(p))` (Chruściel–Grant, Theorem 1.20 (i), p. 17, and Proposition 1.10
  (vi), p. 9); the push-up and boundary statements need the locally Lipschitz hypothesis.

*Needs:* §3.2–§3.3, §4.2, §7.1–§7.2, §7.6; SemiRiemannianFoundations §2.4 for the chart Christoffel field and §3.1–§3.2; Rademacher's theorem.

### Examples

- Achronal segments and `∂I^+(0)` (§7.1); `{t = 0}` and `{t = 0, |x| ≤ 1}` in Minkowski space (§7.2); de Sitter and anti-de Sitter (§7.3); the half space `{t < 0}` and the Milne region (§7.4); domains of dependence in `{t ≥ 0}` and for constant acoustical states (§7.6–§7.7).

### Dependencies

Layer 2 (§2.3); Layer 3; Layer 4 (§4.2); Layer 5; Layer 6; SemiRiemannianFoundations Layer 2 (§2.4, §2.7) and Layer 3 (§3.1–§3.2); Mathlib covering maps, path lifting and Rademacher theorem.

## Layer 8: focusing and singularity theorems

Metrics are smooth, finite-dimensional and Lorentzian. §8.1 uses regular timelike and null
geodesics and a positive-definite orthogonal or screen metric; §8.2 uses affine geodesic
parameters, with convergence conditions and dimensions as stated; §8.3 concerns globally
hyperbolic spacetimes with the stated convergence, Cauchy-surface and trapped-surface
hypotheses.

### 8.1 Lorentzian index and maximizing consequences

In Lorentzian signature, along a unit timelike geodesic restrict `I` to fields orthogonal
to `γ'`: before the first conjugate point it is positive definite on nonzero fields with
zero endpoints. The second variation of proper-time length is `−I`, hence negative
definite. Along a null geodesic use the same index form on the quotient bundle
`γ'^⊥/ℝγ'`, whose induced metric is positive definite. Specialize focal points to spacelike
hypersurfaces and spacelike codimension-two submanifolds. Prove: a timelike geodesic from
`p` with a conjugate point `r` before `q` is not maximizing from `p` to `q`; a null geodesic
from `p` with a conjugate point
before `q` has `q ∈ I^+(p)`; and the focal analogues for hypersurfaces and codimension-two
surfaces (Minguzzi 2019, Theorem 6.16 (a), pp. 171–172, for focal points, and with Remark 6.17,
p. 172, for conjugate points).

**Checks.**

- In constant curvature `κ`, for a unit timelike geodesic and `J ⊥ γ'`, `J'' = κ J`: de
  Sitter (`κ = 1`) has no conjugate points along timelike geodesics, anti-de Sitter
  (`κ = −1`) has them at proper time `π`.
- For a positive unit geodesic the same shared formula gives `J'' = −κ J`, recovering
  the spherical and hyperbolic Jacobi fields from R2.
- For a straight negative-unit geodesic in flat signature `(2, 2)`, orthogonal fields
  along a positive direction give `I(X,X) > 0`, and along the second negative direction
  give `I(X,X) < 0`, even though there are no conjugate points.

*Needs:* §4.1–§4.4, §5.1; SemiRiemannianFoundations §5.1.

### 8.2 Raychaudhuri equations and focusing

Use the operator and finite-dimensional trace identities of SemiRiemannianFoundations §5.2. For null hypersurfaces
use the quotient metric of §4.4 and prove the corresponding quotient Riccati identity.
For an affinely parametrized null hypersurface congruence derive the corresponding
quotient-bundle identities, with `m = dim M − 2 > 0`. In arbitrary signature the
self-adjoint shear can have `tr(σ²) < 0`; keep it as a metric contraction without a
positivity claim. Riemannian hypersurface evolution and Lorentzian Raychaudhuri use
these same identities.

Specialize to a Lorentzian spacelike hypersurface, with expansion `θ` and shear `σ`,
to obtain the timelike Raychaudhuri equation
`θ' = −θ²/n − |σ|² − Ric(u, u)`, `u` the unit tangent, in dimension `n + 1` (Minguzzi 2019,
§1.2, pp. 161–163); for the generators
of a smooth null hypersurface, `θ' = −θ²/(n − 1) − |σ|² − Ric(L, L)` with `L` affinely
parametrized, `n ≥ 2` (Minguzzi 2019, §6.3 and Proposition 6.11, pp. 164–167). Define the timelike convergence condition (`Ric(v, v) ≥ 0` for timelike
`v`) and the null convergence condition (`Ric(ℓ, ℓ) ≥ 0` for null `ℓ`); vacuum metrics satisfy
both. Prove the focusing lemmas: under timelike convergence, a normal geodesic from a spacelike
hypersurface with `θ(0) = θ₀ < 0` has a focal point within proper time `n/|θ₀|` if defined that
long; under null convergence, a null generator with `θ(0) = θ₀ < 0` has a focal point within
affine parameter `(n − 1)/|θ₀|` (Minguzzi 2019, Propositions 6.6 and 6.13, pp. 164 and 168,
with Theorem 6.16, p. 171, identifying the first focal point with `θ → −∞`).

**Checks.**

- `ℝ^{1,3}` light cone from the origin, affine parameter `r`: `θ = 2/r`, `θ' = −2/r² = −θ²/2`
  with `σ = 0`, `Ric = 0`.
- Robertson–Walker with flat three-dimensional fibre, congruence `∂_t`: `θ = 3a'/a`,
  `θ' = 3a''/a − 3a'²/a²`, `−θ²/3 = −3a'²/a²`, so `Ric(∂_t, ∂_t) = −3a''/a`, matching §2.2.
- Relative to a screen metric `diag(−1, 1)`, the trace-free self-adjoint matrix
  `σ = [[0, 1], [−1, 0]]` has `tr(σ²) = −2`. The trace identity alone therefore
  does not yield the Lorentzian focusing bound in higher index.

*Needs:* §4.1–§4.4, §8.1; SemiRiemannianFoundations §5.2.

### 8.3 Hawking and Penrose theorems

Prove Hawking's theorem: if `M` is globally hyperbolic and satisfies the timelike convergence
condition, and `S` is a smooth spacelike Cauchy surface with future mean curvature
`H ≤ b < 0`, then every future causal curve from `S` has Lorentzian length at most `n/|b|`, so
`M` is future timelike geodesically incomplete (O'Neill, Theorem 14.55A; Hawking 1967; for a
compact contracting Cauchy surface, Minguzzi 2019, Theorem 6.49, p. 191). By §7.3 every smooth
spacelike Cauchy surface is the level set `t⁻¹(0)` of a smooth temporal function `t`, and the
theorem is stated in that form (`lorentzianLength_le_of_meanCurvature_le`), with `Ric` the Ricci
tensor `ricci` of the Levi-Civita connection, `ν = −grad t/|grad t|` the future unit normal
`levelSetUnitNormal`, and `H` the trace on `T_xM` of `X ↦ ∇_X ν` (`levelSetMeanCurvature`),
which is `tr_h k` because `g(ν, ν) = −1` makes `g(∇_X ν, ν)` vanish. Prove Penrose's
theorem: if `M` is globally hyperbolic with a noncompact Cauchy surface, satisfies the null
convergence condition and contains a closed trapped surface, then `M` is future null
geodesically incomplete (Minguzzi 2019, Theorem 6.25, p. 180; Penrose 1965).

**Checks.**

- Minkowski space is null and timelike complete, has noncompact Cauchy surfaces and satisfies
  both convergence conditions; consistently it has no closed trapped surface (§4.4) and no
  Cauchy surface with `H ≤ b < 0`.
- The Milne region `{t > 0}` with `−dt² + t² dx²` (`n = 1`) is flat and globally hyperbolic
  with Cauchy surfaces `{t = t₀}`, and `k = (1/t₀) h` for the future normal `∂_t`. For the
  time-reversed orientation the mean curvature is `H = −1/t₀`, so the time-reversed Hawking
  bound is `n/|b| = t₀`, attained by the past-incomplete geodesics `t ↦ (t, x₀)` of §2.2.
- Minkowski space minus a point is null and timelike incomplete and has no closed trapped surface; it is not globally hyperbolic (§7.3), so neither theorem applies to it.

*Needs:* §7.2–§7.3, §8.1–§8.2.

### Examples

- Conjugate points in de Sitter and anti-de Sitter (§8.1); the light cone and flat Robertson–Walker (§8.2); Minkowski space, the Milne region and Minkowski space minus a point (§8.3).

### Dependencies

Layer 4; Layer 5 (§5.1); Layer 7 (§7.2–§7.3); SemiRiemannianFoundations Layer 5.


## Downstream consumers

- CompressibleEulerEquations consumes §1.1, §1.3, §2.3, §3.2 and §7.6 for the acoustical
  metric of a fluid state on `ℝ × E`. It owns the fluid side: equations of state and sound
  speed, quasilinear symmetric hyperbolic systems, initial data, developments (sets `D` with
  `D = D^+_D(S)` for the acoustical metric of §2.3 built from the solution itself), their
  uniqueness and maximal developments, and local well-posedness.
- Hyperbolic-PDE roadmaps on Lorentzian manifolds (wave equations and normally hyperbolic
  operators, their domains of dependence and finite speed of propagation, characteristic
  hypersurfaces) consume Layers 2–4, §7.2 and §7.6–§7.7. They prove that a hypersurface is
  characteristic for `□_g` iff it is null in the sense of §4.2.
- General-relativity roadmaps (the Cauchy problem for the Einstein equations, black holes,
  Cauchy horizons, `C^0`-extendibility statements) consume Layers 2–4, §7.2 and §7.4.

## Scope and ownership

This roadmap owns the Lorentzian specializations and causal theorems specified in Layers 1–8.
SemiRiemannianFoundations owns the shared objects they specialize: scalar products of every
signature and their vector characters, the regularity-graded metric carrier, connections,
curvature, warped products, extensions, the geodesic flow and exponential map, normal
neighbourhoods, immersion geometry, Jacobi fields and variation theory. Every Lorentzian object
here is the index-one specialization of those objects, with no second metric, geodesic or
curvature theory.

It leaves to other roadmaps:

- the shared semi-Riemannian foundations listed above: SemiRiemannianFoundations;
- the metric-variation calculus, Hilbert stress-energy, the density `|det g|^{1/2}`, the
  divergence and integration by parts for nondegenerate metrics: LocalVariationalFieldTheory
  LVF6;
- spin structures and Dirac operators: SpinGeometry.

Outside this roadmap: wave equations and normally hyperbolic operators on Lorentzian
manifolds, their Green operators and energy estimates, characteristic hypersurfaces of
hyperbolic operators and systems, the Cauchy problem for the Einstein
equations and maximal globally hyperbolic developments, matter models, asymptotic flatness,
null infinity, Bondi and spacetime ADM mass, black-hole regions and specific black-hole
families beyond the Schwarzschild exterior of §2.2. These belong to hyperbolic-PDE and
general-relativity roadmaps that consume this one. The compressible Euler equations, their
states, developments and maximal developments belong to CompressibleEulerEquations, and linear
symmetric hyperbolic systems on `ℝ × ℝⁿ` to SymmetricHyperbolicSystems. On flat Minkowski
space the causal Green operators of Klein–Gordon, Dirac and Maxwell are owned by
RelativisticQuantumFieldTheory.

Distributional and Sobolev metrics, distributional curvature and weak energy conditions, full
Lorentz–Finsler geometry and general closed-cone causality belong to separately specified
developments. They reuse the interfaces here and in SemiRiemannianFoundations. The
`C^{1,1}` targets use locally Lipschitz coefficients and classical geodesics; that regularity
alone does not supply a continuous classical curvature tensor.

## Exact supplier contracts

### From Mathlib

- Bilinear and quadratic forms: `LinearMap.BilinForm.IsSymm`, `.Nondegenerate`, `.toDual`,
  `.restrict`, `.orthogonal`, `LinearMap.BilinMap.toQuadraticMap`,
  `ContinuousLinearMap.toBilinForm`; the inertia index `sigNeg` and Sylvester's law of inertia
  (`Mathlib/LinearAlgebra/QuadraticForm/{Signature,Real}.lean`), which §1.1 consumes rather than
  reproving.
- Manifolds and bundles: `ModelWithCorners`, `IsManifold`, `TangentSpace`, `TangentBundle`,
  `mfderiv`, `mfderivWithin`, `extChartAt`, the hom-bundle instances, `Manifold.IsImmersion`,
  `Manifold.IsSmoothEmbedding`, covering maps and path lifting.
- Connections: `CovariantDerivative` (`Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/`).
- Analysis: `LipschitzOnWith`, `LocallyLipschitzOn`, Rademacher's theorem
  `LipschitzWith.ae_differentiableAt` and its one-variable form
  `LipschitzWith.ae_differentiableAt_real`, Arzelà–Ascoli
  (`BoundedContinuousFunction.arzela_ascoli`), and the ODE API of `Mathlib/Analysis/ODE/`.
- Riemannian distance: `Manifold.pathELength`, `Manifold.riemannianEDist`,
  `EMetricSpace.ofRiemannianMetric`, `IsRiemannianManifold`.

### From Tau Ceti

- Signature of continuous families of forms:
  `TauCeti.Manifold.isLocallyConstant_sigPos_sigNeg_of_continuous`
  (`TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Signature.lean`), used in §2.1.
- The smooth nondegenerate metric `TauCeti.Manifold.ContMDiffNondegenerateMetric`, its musical
  map `sharp`, its Levi-Civita connection `ContMDiffNondegenerateMetric.leviCivitaConnection`
  with `isLeviCivitaConnection_leviCivitaConnection` and
  `IsLeviCivitaConnection.contMDiffCovariantDerivative`, `CovariantDerivative.accelerationWithin`
  and `CovariantDerivative.ricciTensor`, through which `Suggested.lean` states the smooth
  theorems of Layers 7–8; SemiRiemannianFoundations generalizes them.
- The unit round sphere `TauCeti.sphereRoundMetric`
  (`TauCeti/Geometry/Manifold/Riemannian/Sphere/Basic.lean`) and its constant sectional
  curvature `1`, `TauCeti.hasConstantSectionalCurvature_sphere` (`.../Sphere/Curvature.lean`),
  used for the spherical factors of §2.2.
- `TauCeti.nonempty_contMDiffRiemannianMetric`
  (`TauCeti/Geometry/Manifold/VectorBundle/Riemannian/Existence.lean`): auxiliary Riemannian
  metrics, used for smoothing time orientations and for Lipschitz parametrizations.
- `TauCeti.Manifold.IsPiecewiseContMDiffOn` (`TauCeti/Geometry/Manifold/PiecewisePath.lean`).
- `TauCeti.roundMetricCircle` (`TauCeti/Geometry/Manifold/Riemannian/Circle.lean`): the round
  metric of the unit circle, used for the periodic factors of §2.3.
- The orientation double cover `TauCeti.Manifold.OrientationCover`
  (`TauCeti/Geometry/Manifold/Orientation/Cover/`) as the model for §3.1's double cover.

### From TauCetiRoadmap.SemiRiemannianFoundations

§1.1: the vector characters `IsTimelike`, `IsNull`, `IsCausal` and spacelike of a bilinear
form, and signatures; §1.2: orthogonal complements and null hyperplanes; §2.2: the
regularity-graded metric carrier `ContMDiffNondegenerateMetric k`, its strong inverse,
restrictions, products and conformal changes; §2.3: Hölder classes; §2.4: the Levi-Civita
connection at finite regularity, the Christoffel formula and the conformal connection formula;
§2.5: curvature, Ricci, scalar and Einstein tensors; §2.6: warped products; §2.7: extensions,
`C^l`-inextendibility and the second-countable reduction; §3.1: curve domains, admissible
changes of parameter and the change-of-parameter relation; §3.2: the geodesic predicate,
pregeodesics, the common geodesic flow and exponential map; §3.3: their regularity; §3.4:
convex normal neighbourhoods and the Gauss lemmas, including the `C^{1,1}` ones; §4.1:
nondegenerate immersion geometry and the Gauss–Codazzi–Ricci equations with `ε`; §5.1: Jacobi
fields, energy variations, index forms and conjugate and focal points; §5.2: the operator
Riccati and trace identities.

### From TauCetiRoadmap.HopfRinow (completed)

The Riemannian distance of an auxiliary metric, used with the complete auxiliary metrics of
§6.4.

### From TauCetiRoadmap.RiemannianGeometry (on main)

R2: Jacobi fields of Riemannian metrics, whose spherical and hyperbolic cases §8.1 recovers;
R4.7: the hyperboloid model of hyperbolic space on the future unit hyperboloid, which §1.2
places in the future time cone of `minkowskiForm`.

### From TauCetiRoadmap.RelativisticQuantumFieldTheory (on main)

§1.1: the four-dimensional Minkowski space `Spacetime` with time coordinate first, its form
`minkowskiSquare` of signature `(+, −, −, −)` and the flat causal sets `causalFuture` and
`causalPast` of a subset. §3.3 proves that the manifold `J^±(p)` of Minkowski space agree with
them.

### From TauCetiRoadmap.DifferentialGeometry (on main)

Layer 2: the orientation double cover, used as the pattern for the time-orientation double
cover; Layer 3: flows of vector fields.

## References

Theorem and page numbers of a preprint are those of the arXiv version named in its entry.

- D. Joyce, *On manifolds with corners*, [arXiv:0910.3518](https://arxiv.org/abs/0910.3518):
  boundary-compatible submersions and fibres; §4.2 states the particular sufficient hypotheses used here.
- E. Minguzzi, *Convex neighborhoods for Lipschitz connections and sprays*,
  [arXiv:1308.6675v2](https://arxiv.org/abs/1308.6675v2): quantitative ODE, low-regularity
  inverse and Gauss lemmas, convex normal neighbourhoods and local causal maximality.
- B. O'Neill, *Semi-Riemannian Geometry with Applications to Relativity*, Academic Press
  (1983): Ch. 5 (Lorentz causal character, timecones, convex neighbourhoods), Ch. 10
  (variations, Jacobi fields, focal points), Ch. 14 (causality, Cauchy surfaces, singularity
  theorems).
- J. K. Beem, P. E. Ehrlich, K. L. Easley, *Global Lorentzian Geometry*, 2nd ed., Dekker
  (1996): Ch. 3 (causality, limit curves), Ch. 4 (Lorentzian distance).
- S. W. Hawking, G. F. R. Ellis, *The Large Scale Structure of Space-Time*, Cambridge (1973):
  Ch. 4 (Raychaudhuri, energy conditions), Ch. 6 (causal structure), Ch. 8 (singularities).
- E. Minguzzi, *Lorentzian causality theory*, Living Rev. Relativ. 22 (2019) 3 (open access;
  page numbers of the article).
- E. Minguzzi, *Limit curve theorems in Lorentzian geometry*, J. Math. Phys. 49 (2008) 092501.
- E. Minguzzi (2019b), *Causality theory for closed cone structures with applications*, Rev.
  Math. Phys. 31 (2019) 1930001; [arXiv:1709.06494v4](https://arxiv.org/abs/1709.06494v4)
  (page numbers of the arXiv version): reflectivity and causal continuity, the causal ladder,
  stable causality and smooth temporal functions.
- S. W. Hawking, *The existence of cosmic time functions*, Proc. Roy. Soc. A 308 (1968)
  433–435.
- S. W. Hawking, R. K. Sachs, *Causally continuous spacetimes*, Comm. Math. Phys. 35 (1974)
  287–296.
- P. T. Chruściel, *Elements of causality theory*, arXiv:1110.6706v1 (printed page numbers).
- P. T. Chruściel, J. D. E. Grant, *On Lorentzian causality with continuous metrics*, Class.
  Quantum Grav. 29 (2012) 145001; arXiv:1111.0400v3.
- J. D. E. Grant, M. Kunzinger, C. Sämann, R. Steinbauer, *The future is not always open*,
  Lett. Math. Phys. 110 (2020) 83–103; arXiv:1901.07996v2.
- A. Lange, A. Lytchak, C. Sämann, *Lorentz meets Lipschitz*, Adv. Theor. Math. Phys. 25
  (2021); arXiv:2009.08834v2: maximal causal curves of Lipschitz metrics as Filippov
  geodesics.
- M. Graf, E. Ling, *Maximizers in Lipschitz spacetimes are either timelike or null*, Class.
  Quantum Grav. 35 (2018) 087001; arXiv:1712.06504v2.
- A. F. Filippov, *Differential Equations with Discontinuous Righthand Sides*, Kluwer (1988).
- D. Christodoulou, *The Formation of Shocks in 3-Dimensional Fluids*, EMS (2007): acoustical
  metrics and developments of compressible Euler data, the model consumer of §2.3 and §7.6.
- É. Gourgoulhon, *3+1 Formalism and Bases of Numerical Relativity*,
  [arXiv:gr-qc/0703035v1](https://arxiv.org/abs/gr-qc/0703035v1): Gauss–Codazzi relations of
  spacelike hypersurfaces and the constraint equations.
- T.-W. Luo, P. Yu, *On the stability of multi-dimensional rarefaction waves I: the energy
  estimates*, [arXiv:2302.09714v2](https://arxiv.org/abs/2302.09714v2): the acoustical metric of
  two-dimensional compressible Euler flow.
- R. Geroch, *Domain of dependence*, J. Math. Phys. 11 (1970) 437–449.
- A. N. Bernal, M. Sánchez, *On smooth Cauchy hypersurfaces and Geroch's splitting theorem*,
  Comm. Math. Phys. 243 (2003) 461–470; *Smoothness of time functions and the metric splitting
  of globally hyperbolic spacetimes*, Comm. Math. Phys. 257 (2005) 43–50; *Further results on
  the smoothability of Cauchy hypersurfaces and Cauchy time functions*, Lett. Math. Phys. 77
  (2006) 183–197; *Globally hyperbolic spacetimes can be defined as 'causal' instead of
  'strongly causal'*, Class. Quantum Grav. 24 (2007) 745–749.
- G. J. Galloway, *Null geometry and the Einstein equations*, in *The Einstein Equations and
  the Large Scale Behavior of Gravitational Fields*, Birkhäuser (2004); page numbers of the
  author's copy.
- G. J. Galloway, E. Ling, J. Sbierski, *Timelike completeness as an obstruction to
  `C^0`-extensions*, Comm. Math. Phys. 359 (2018) 937–949; arXiv:1704.00353v4.
- J. Sbierski, *The `C^0`-inextendibility of the Schwarzschild spacetime and the spacelike
  diameter in Lorentzian geometry*, J. Differential Geom. 108 (2018) 319–378;
  arXiv:1507.00601v2.
- K. Nomizu, H. Ozeki, *The existence of complete Riemannian metrics*, Proc. Amer. Math. Soc.
  12 (1961) 889–891.
- R. Penrose, *Gravitational collapse and space-time singularities*, Phys. Rev. Lett. 14 (1965)
  57–59.
- S. W. Hawking, *The occurrence of singularities in cosmology. III*, Proc. Roy. Soc. A 300
  (1967) 187–201.
