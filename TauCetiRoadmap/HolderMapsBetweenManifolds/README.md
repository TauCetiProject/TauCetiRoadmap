# Roadmap: Hölder maps between manifolds and Hölder diffeomorphism groups

**Summary.** A map `f : M → N` between smooth finite-dimensional manifolds is of class
`C^{k,α}`, for an integer `k ≥ 0` and an exponent `0 < α ≤ 1`, when it is continuous and its
coordinate representatives are `k` times continuously differentiable with `α`-Hölder `k`th
derivatives on compact subsets of the chart domains. For `k ≥ 1` a `C^{k,α}` diffeomorphism is a
bijection with `f` and `f⁻¹` of class `C^{k,α}`; for `k = 1` these are the `C^{1+α}`
diffeomorphisms of smooth ergodic theory and Pesin theory. This roadmap builds the class, its
calculus, the group `Diff^{k,α}(M)` and its topologies, together with the function spaces
`C^{k,α}(M, F)` on a compact manifold and their basic facts. Manifolds may have boundary
and corners except where a statement says otherwise.

The first main result is that the class is intrinsic: reading `f` in the preferred charts of
Mathlib or in all charts of the maximal atlases gives the same class. On a compact `M`, the
`C^{k,α}` maps into a Banach space `F` are exactly the maps of finite norm for one finite compact
chart atlas, and they form a Banach space `C^{k,α}(M, F)` whose norms for any two such atlases are
equivalent. The second is the calculus. For `k ≥ 1` the composite of
`C^{k,α}` maps is `C^{k,α}`, and the composite of an `α`-Hölder and a `β`-Hölder map is
`αβ`-Hölder, which is sharp. The tangent map of a `C^{k,α}` map is `C^{k-1,α}`. The inverse of a
`C^k` diffeomorphism that is `C^{k,α}` is `C^{k,α}`, and at interior points a `C^{k,α}` map with
invertible differential is a local `C^{k,α}` diffeomorphism. Hence the `C^{k,α}` self-diffeomorphisms
of `M` form a subgroup of the `C^k` diffeomorphism group.

The third concerns topology, for compact `M`. The `C^{k,α}` topology on `C^{k,α}(M, N)` is defined
by Hölder tests in charts. For `k ≥ 1`, precomposition by a fixed `C^{k,α}` map is continuous for
it, but postcomposition is not: on the circle, a rotation by `t` tends to the identity as `t → 0`,
while its composite with a fixed `C^{1,α}` diffeomorphism whose derivative has an `α`-cusp stays at
`C^{1,α}` distance at least a positive constant from that diffeomorphism. So `Diff^{k,α}(M)` with the
`C^{k,α}` topology is not a topological group in positive dimension. With the coarser topology of
convergence in `C^{k,β}` for every `β < α` it is one. The proof rests on de la Llave and Obaya's
continuity theorem for composition in Hölder spaces, which loses an arbitrarily small amount of
Hölder exponent, and on the interpolation of Hölder exponents.

Within Tau Ceti, the local analysis starts from Mathlib's calculus of Hölder maps and Tau Ceti's
compact chart `C^k` seminorms; Layer 1 adds the Euclidean composition and inverse estimates in
Hölder norms. PseudodifferentialOperators §5.4 has the finite-chart Hölder norms of finite-rank
bundles on compact boundaryless manifolds; the finite-atlas spaces here are those of maps into a
Banach space on compact manifolds with corners. GeometricTopology Layer 3 supplies the `C^n`
diffeomorphism group with the weak Whitney topology, which `Diff^{k,α}(M)` refines, and
SmoothBundlesConnections B6.0 the uniform normal radius used in exponential charts. Statements
about `C^{1+α}` diffeomorphisms in smooth dynamics, such as Dolgopyat, Kanigowski and Rodriguez
Hertz's theorem that exponential mixing implies Bernoulli, consume the class, the group and the
uniform Hölder estimates in exponential charts; the hyperbolic dynamics roadmap, which leaves these
classes out of its scope, could consume them.

Layer 1 is Euclidean: the composition, interpolation and inverse estimates the rest needs. Layer 2
defines `C^{k,α}` maps, proves chart independence and the calculus, and builds the finite-atlas
spaces of a compact manifold. Layer 3 defines Hölder diffeomorphisms, proves the inverse function
theorems and builds the group, with uniform estimates in exponential charts. Layer 4 puts the
topologies on maps and diffeomorphisms. Layer 5 proves the function-space facts about
`C^{k,α}(M, F)`: inclusions, the real-index scale `C^r(M)`, the
Riemannian description of `C^{0,α}(M)`, pullback by Hölder maps and smoothing.

## How to read the build

Layer 1 needs only the Euclidean Hölder spaces and Mathlib calculus. Layer 2 needs §§1.1 and 1.3.
Layer 3 needs Layer 2 and §1.3; §3.4 also needs the Riemannian exponential map. Layer 4 needs
Layers 2 and 3 and §§1.1 and 1.2. Layer 5 needs Layer 2 and §1.2; §5.3 needs §2.3, and §5.2 needs
the Riemannian distance. Within each layer the sections are in build order.

## Conventions

- **Manifolds.** `M`, `N`, `P` are Hausdorff topological spaces with `ChartedSpace H M` and
  `IsManifold I ∞ M` for a model with corners `I : ModelWithCorners ℝ E H` on a finite-dimensional
  real normed space `E` (and `J` on `E'`, `K` on `E''` for `N` and `P`). Boundary and corners are
  allowed unless a statement assumes `BoundarylessManifold I M`. Results that use a finite atlas or
  a topology on a space of maps assume `CompactSpace M`. Real-, complex- or Banach-valued functions
  are maps into the manifold `F` with model `𝓘(ℝ, F)`.
- **Exponents.** `k : ℕ` and `α : ℝ≥0`. The definitions accept every `α`; theorems assume
  `0 < α ≤ 1` and say so. `α = 1` is the Lipschitz case. `C^{k+α}` means `C^{k,α}`, and `C^{1+α}`
  means `C^{1,α}`. Diffeomorphisms assume `1 ≤ k`: for `k = 0` and `0 < α < 1` the composite of two
  `α`-Hölder maps is in general only `α²`-Hölder, so the `C^{0,α}` homeomorphisms with `C^{0,α}`
  inverse do not form a group (near `0`, `x ↦ sign(x)|x|^α` has a Lipschitz inverse and its square
  `x ↦ sign(x)|x|^{α²}` is not `α`-Hölder). For `α = 1` they do, by §2.3 item 2.
- **Charts and representatives.** Charts are Mathlib's preferred extended charts `extChartAt`.
  The representative of `f : M → N` at `x : M` is `writtenInExtChartAt I J x f`. For a pair of
  points `x : M`, `y : N` the representative is `extChartAt J y ∘ f ∘ (extChartAt I x).symm` on
  `Ω_{x,y}(f) = (extChartAt I x).target ∩ (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J y).source)`,
  which is open in `Set.range I`. All derivatives of representatives are `iteratedFDerivWithin`
  on a set of the form `Set.range I ∩ U` with `U` open, which is a set of unique differentiability
  (`ModelWithCorners.uniqueDiffOn` and `UniqueDiffOn.inter`). Statements quantifying over all
  charts of the maximal atlases are theorems (§2.2), not the definition.
- **Hölder seminorms.** For `S ⊆ E` and `v : E → V`, `[v]_{α,S}` is the least `C` with
  `HolderOnWith C α v S`, which is Mathlib's `eHolderNorm` of the restriction of `v` to `S`. The
  `C^{k,α}` norm of a representative on a compact `K` is `max_{m ≤ k} sup_K ‖D^m v‖ + [D^k v]_{α,K}`.
- **Groups.** `TauCeti.Diff I M n` is `M ≃ₘ^n⟮I, I⟯ M` with `f * g = f ∘ g` (Tau Ceti
  `Geometry/Diffeomorphism/Group.lean`). Right multiplication by `g` is precomposition `f ↦ f ∘ g`
  and left multiplication by `f` is postcomposition `g ↦ f ∘ g`.
- **Topologies.** Topologies on spaces of maps assume a compact source and are introduced as
  scoped instances, following `TauCeti.DiffeomorphWeakWhitney`, since a type of maps can carry
  several of them.
- **Lean names.** Names below are suggestions in the namespace `TauCeti`. `Suggested.lean` states
  the headline theorems of Layers 2–4, with the definitions they need, at the pinned Mathlib and
  Tau Ceti.

## Layer 1: Euclidean composition, interpolation and inverse estimates (H1)

### 1.1 The Hölder chain rule

Prove the local Hölder chain rule, for `k ≥ 1`, within sets of the form `Set.range I ∩ U`: if `τ`
is `C^k` on a neighbourhood `s` of `z₀` within such a set with `α`-Hölder `k`th derivative on `s`,
maps `s` into `t`, and `g` is `C^k` on `t` with `α`-Hölder `k`th derivative near `τ z₀` within `t`,
then `D^k(g ∘ τ)` is `α`-Hölder on a neighbourhood of `z₀` within `s`. The proof is the Faà di
Bruno argument (Mathlib's `iteratedFDerivWithin_comp`): in each term
`D^j g(τ z){D^{i₁}τ(z), …, D^{iⱼ}τ(z)}` the factor `D^k g ∘ τ` is `α`-Hölder because `τ` is
locally Lipschitz (`k ≥ 1`), the lower derivatives are `C^1` and so locally Lipschitz, and the
single factor `D^k τ` appearing in the term `j = 1` is `α`-Hölder by hypothesis.

Prove the global estimates on bounded convex open sets `U ⊆ E`, `V ⊆ E'` (convex sets are
compensated in the sense of de la Llave and Obaya, with constant `1`, and their inner parallel sets
`{y : dist(y, Vᶜ) > ε}` are again open and convex, which is the domain condition of their continuity
theorems), with Hölder norms as in the conventions, and in the same form on relatively open convex
sets `Set.range I ∩ U` with derivatives within the set, which the corners case of Layers 2–4 uses.
The proofs use the Faà di Bruno formula and the mean value inequality along segments, which stay in
these convex sets.

1. *Order zero.* If `f : U → V` is `β`-Hölder and `g : V → G` is `γ`-Hölder, with `β, γ ≤ 1`, then
   `g ∘ f` is `βγ`-Hölder with `[g ∘ f]_{βγ} ≤ [g]_γ [f]_β^γ`. If `f` is Lipschitz with constant
   `L`, `g ∘ f` is `γ`-Hölder with `[g ∘ f]_γ ≤ [g]_γ L^γ`; if `g` is Lipschitz with constant `L`,
   `g ∘ f` is `β`-Hölder with `[g ∘ f]_β ≤ L [f]_β` (dLO §4, the order-zero cases of the theorem on
   the range of composition). Mathlib's `HolderOnWith.comp` proves all three, a Lipschitz map being
   `1`-Hölder, without convexity.
2. *Positive order.* For `k ≥ 1`, `f ∈ C^{k,α}(U, E')` with `f(U) ⊆ V` and `g ∈ C^{k,α}(V, G)`,
   `g ∘ f ∈ C^{k,α}(U, G)` with `‖g ∘ f‖_{C^{k,α}} ≤ M ‖g‖_{C^{k,α}} (1 + ‖f‖_{C^{k,α}}^{k+α})`,
   `M` depending only on `k` and `α` (dLO §4, the same theorem with both exponents at least `1`).
3. *Continuity.* For fixed `f ∈ C^{k,α}(U, E')`, `k ≥ 1`, with `f(U) ⊆ V`, precomposition
   `g ↦ g ∘ f` is a continuous linear map `C^{k,α}(V, G) → C^{k,α}(U, G)` (dLO §6, continuity of
   `g ↦ g ∘ f`). For `k ≥ 1` and `0 ≤ β < β' ≤ 1`, composition `(f, g) ↦ g ∘ f` is jointly
   continuous from `{f ∈ C^{k,β'}(U, E') : dist(f(U), Vᶜ) > 0} × C^{k,β'}(V, G)` to
   `C^{k,β}(U, G)` (dLO §6: continuity of `f ↦ g ∘ f` for target exponent `k + γ` with `k ≥ 1` and
   `γ` below the Lipschitz endpoint, which needs outer exponent above and inner exponent at least
   the target exponent, and the theorem on joint continuity of composition that combines it with
   continuity in `g`, with outer and inner exponents `k + β'` and target exponent `k + β`). The
   case `β = β'` is false (Check below and §4.3). With a smoother outer map nothing is lost: for
   `k ≥ 1`, `0 < α ≤ 1` and a fixed `g ∈ C^{k+1,α}(V, G)`, `f ↦ g ∘ f` is continuous from
   `{f ∈ C^{k,α}(U, E') : dist(f(U), Vᶜ) > 0}` to `C^{k,α}(U, G)`. In the Faà di Bruno expansion of
   `D^k(g ∘ f_n)` the factors `D^i f_n` converge in `C^{0,α}`, and for `j ≤ k`,
   `D^j g ∘ f_n − D^j g ∘ f = (∫₀¹ D^{j+1} g(f + s(f_n − f)) ds)(f_n − f)` is the product of a
   factor bounded in `C^{0,α}` and one tending to `0` in `C^{0,α}`.

Here `C^{k,α}(U, G)` is the space of `C^k` maps `U → G` of finite norm
`max_{m ≤ k} sup_U ‖D^m v‖ + [D^k v]_{α,U}`, as in the Conventions; for real functions on a bounded
convex open subset of `ℝⁿ` it is PDE §1.7's `C^{k,α}(Ω)`, whose sum norm is equivalent. Mathlib's
`iteratedFDerivWithin_comp` is the Faà di Bruno formula.

**Checks.**

- On `[-1, 1]`, with `f_β(x) = |x|^β`, the composite `f_α ∘ f_β = f_{αβ}` is `γ`-Hölder exactly for
  `γ ≤ αβ` (dLO §4, the sharpness example after the theorem on the range of composition); the
  exponent in item 1 is sharp, and for `α = β = 1/2` the composite `|x|^{1/4}` has quotient
  `|h|^{1/4} / |h|^{1/2} = |h|^{-1/4} → ∞` for exponent `1/2`.
- *Translation.* Let `u(x) = ψ(x)|x|^α` with `ψ` a smooth cutoff equal to `1` on `[-1, 1]` and
  `0 < α ≤ 1`, and `h_t(x) = u(x + t) − u(x)` for `0 < t < 1/2`. Then `h_t(0) = t^α`,
  `h_t(−t) = −t^α`, so `[h_t]_α ≥ 2t^α / t^α = 2` while `sup |h_t| → 0`. Translation `x ↦ x + t`
  tends to the identity in every `C^k` norm, but precomposing the fixed `u` with it does not tend to
  `u` in `C^{0,α}`; with `u` as a `k`th derivative this is the failure of item 3 at `β = β'`.

*Needs:* Mathlib `HolderOnWith`, `HolderOnWith.comp`, `iteratedFDerivWithin_comp`, the mean value
inequality `norm_image_sub_le_of_norm_fderivWithin_le`.

### 1.2 Interpolation of Hölder exponents

For `0 < β < α ≤ 1` and any bounded `v : S → V`,
`[v]_{β,S} ≤ 2^{1−β/α} (sup_S ‖v‖)^{1−β/α} [v]_{α,S}^{β/α}`: this is Mathlib's
`HolderOnWith.interpolate` applied to the `α`-Hölder bound and to the exponent-`0` bound
`‖v(x) − v(y)‖ ≤ 2 sup_S ‖v‖`, with weights `β/α` and `1 − β/α`. Prove the consequence that is
used in Layers 4 and 5: on a compact `K`, a sequence (or filter) of `C^k` functions that is bounded
in the `C^{k,α}(K)` norm and converges in `C^k(K)` converges in `C^{k,β}(K)` for every `β < α`.

**Checks.**

- With `h_t` from the Check in §1.1, `sup |h_t| ≤ [u]_α t^α` and `[h_t]_α ≤ 2[u]_α`, so
  `[h_t]_β ≤ 2[u]_α t^{α−β} → 0` for `β < α`, while `[h_t]_α ≥ 2`: convergence in every lower
  exponent without convergence at the top.

*Needs:* Mathlib `HolderOnWith.interpolate`.

### 1.3 Inverses

Prove:

1. the within-set form: if `φ` is a `C^k` homeomorphism between relatively open subsets of
   `Set.range I` and `Set.range J`, `k ≥ 1`, with invertible derivative everywhere and `C^{k,α}` on
   compact sets, then `φ⁻¹` is `C^{k,α}` on compact sets. The proof does not use an inverse function
   theorem: `D(φ⁻¹) = (Dφ ∘ φ⁻¹)⁻¹`, so §1.1 and the Hölder estimate for operator inversion give
   the claim by induction on `k`. That estimate comes from `a⁻¹ − b⁻¹ = a⁻¹(b − a)b⁻¹`: if
   `z ↦ A(z)` is `α`-Hölder with constant `C` on a set `S` and every `A(z)` is invertible with
   `‖A(z)⁻¹‖ ≤ B`, then `z ↦ A(z)⁻¹` is `α`-Hölder on `S` with constant `B²C`. For
   `Set.range I = E` and `Set.range J = E'` the item is the Hölder regularity of the inverse of a
   `C^{k,α}` diffeomorphism between open sets;
2. the quantitative bound: on compact sets the `C^{k,α}` norm of `φ⁻¹` is bounded by a constant
   depending only on `k`, `α`, the `C^{k,α}` norm of `φ`, a bound for `‖(Dφ)⁻¹‖` and the Lipschitz
   constant of `φ⁻¹`.

*Needs:* §1.1; Mathlib `ContinuousLinearMap.inverse`.

## Layer 2: `C^{k,α}` maps between manifolds (H2)

### 2.1 The class

```lean
/-- `f` is `C^{k,α}` at `x`: continuous at `x`, and on a relative ball around `extChartAt I x x`
inside the domain of its representative, the representative is `C^k` with `α`-Hölder `k`th
derivative. -/
def ContMDiffHolderAt (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ E' H')
    (k : ℕ) (α : ℝ≥0) (f : M → N) (x : M) : Prop :=
  ContinuousAt f x ∧ ∃ r > 0, ∃ C : ℝ≥0,
    let s := Set.range I ∩ Metric.ball (extChartAt I x x) r
    s ⊆ (extChartAt I x).target ∩ (extChartAt I x).symm ⁻¹' (f ⁻¹' (extChartAt J (f x)).source) ∧
    ContDiffOn ℝ k (writtenInExtChartAt I J x f) s ∧
    HolderOnWith C α (iteratedFDerivWithin ℝ k (writtenInExtChartAt I J x f) s) s

def ContMDiffHolderOn (I J) (k : ℕ) (α : ℝ≥0) (f : M → N) (s : Set M) : Prop :=
  ∀ x ∈ s, ContMDiffHolderAt I J k α f x

def ContMDiffHolder (I J) (k : ℕ) (α : ℝ≥0) (f : M → N) : Prop :=
  ∀ x, ContMDiffHolderAt I J k α f x
```

`ContMDiffHolderOn` is the local class `C^{k,α}_loc` on an open set; on a noncompact manifold the
class `ContMDiffHolder` is the local class, with no global bound. Prove the basic API:

1. `ContMDiffHolder I J k α f → ContMDiff I J k f` (`ContMDiffHolder.contMDiff`);
   `ContMDiff I J (k + 1) f → ContMDiffHolder I J k 1 f` (`ContMDiff.contMDiffHolder_one`);
   `ContMDiff I J ∞ f → ∀ k, ∀ α ≤ 1, ContMDiffHolder I J k α f`;
2. monotonicity: for `k' ≤ k`, `α' ≤ 1` and `k' + α' ≤ k + α`, `C^{k,α}` maps are `C^{k',α'}`
   (with `α' = 0` meaning `C^{k'}`), using Mathlib's `HolderOnWith.of_le` on the bounded sets `s`
   and the mean value inequality on these convex sets;
3. locality: membership is local in `x`, `ContMDiffHolderOn` on an open cover gives
   `ContMDiffHolder`, and the predicates are invariant under `Filter.EventuallyEq`;
4. the identity, constant maps, `Prod.fst`, `Prod.snd`, `Prod.mk` of two `C^{k,α}` maps and the
   charts `extChartAt` on their sources are `C^{k,α}`;
5. for maps into a normed space `F` (model `𝓘(ℝ, F)`), sums, scalar multiples and, for
   `F` a normed algebra, products of `C^{k,α}` maps are `C^{k,α}` (the Leibniz formula within a
   set, with Mathlib's `norm_iteratedFDerivWithin_mul_le`, and
   `[ab]_α ≤ sup ‖a‖ [b]_α + [a]_α sup ‖b‖`).

### 2.2 Chart independence

Prove that `ContMDiffHolder I J k α f`, for `0 < α ≤ 1`, holds exactly when `f` is continuous and
for every pair of charts `e ∈ maximalAtlas I ∞ M`, `e' ∈ maximalAtlas J ∞ N` and every compact
`K ⊆ e.extend I '' (e.source ∩ f ⁻¹' e'.source)`, the map `e'.extend J ∘ f ∘ (e.extend I).symm` is
`C^k` on `e.extend I '' (e.source ∩ f ⁻¹' e'.source)` with `α`-Hölder `k`th derivative on `K`
(`contMDiffHolder_iff_maximalAtlas`). The ingredients are §1.1 for the smooth transition maps on
both sides, the passage from local to compact Hölder bounds, and the convexity of `Set.range I`.
The passage: if `v` is `α`-Hölder within `S` on a neighbourhood of each point of a compact
`L ⊆ S`, it is `α`-Hölder on `L`, since points of `L` closer than a Lebesgue number `δ` of a finite
subcover lie in one of its sets, and for points at distance at least `δ` the quotient is at most
`2 sup_L ‖v‖ / δ^α`. In particular the preferred charts at `x` and `f x` may be replaced by the
charts at any `x'`, `y'` whose sources contain `x` and `f x`.

For compact `M`, a *compact chart atlas* `A` is a finite family of points `x_i : M` with compact sets
`L_i ⊆ (extChartAt I x_i).target` such that the sets `(extChartAt I x_i).symm '' L_i` cover `M`. One
exists: `extChartAt I x` maps a neighbourhood of `x` onto a neighbourhood of `extChartAt I x x` in
the closed set `Set.range I`, so a small closed ball meets `Set.range I` in a compact subset of the
target whose image is a neighbourhood of `x`. For a complete normed space `F` and a `C^k` map
`u : M → F` with representatives `u_i = u ∘ (extChartAt I x_i).symm`, the *finite-atlas `C^k` norm*
`‖u‖_{C^k_A}` is the maximum over `i` of Tau Ceti's compact chart `C^k` seminorms
`ContMDiffMap.chartCkSeminorm` at `x_i` on `L_i`, that is `max_i max_{m ≤ k} sup_{L_i} ‖D^m u_i‖`
with derivatives within the chart target, and the *finite-atlas `C^{k,α}` norm* is
`‖u‖_{C^{k,α}_A} = ‖u‖_{C^k_A} + max_i [D^k u_i]_{α,L_i}`. They vanish only at `0` because the pieces
cover `M`. Let `C^k_A(M, F)` be the space of `C^k` maps with the first norm and `C^{k,α}_A(M, F)`
the space of those of finite second norm with the second. Prove, with boundary and corners allowed
and `0 < α ≤ 1`: a `C^k` map `u` lies in `C^{k,α}_A(M, F)` exactly when
`ContMDiffHolder I 𝓘(ℝ, F) k α u`, so this set `C^{k,α}(M, F)` does not depend on `A`; both spaces
are complete; and two compact chart atlases give equivalent norms, by the closed graph theorem
(`LinearMap.continuous_of_isClosed_graph`) once the sets agree.

### 2.3 Composition

1. For `1 ≤ k` and `0 < α ≤ 1`:
   `ContMDiffHolder J K k α g → ContMDiffHolder I J k α f → ContMDiffHolder I K k α (g ∘ f)`
   (`ContMDiffHolder.comp`), and the `On` and `At` versions.
2. For `k = 0` and `0 < β, γ ≤ 1`: if `f` is `C^{0,β}` and `g` is `C^{0,γ}` then `g ∘ f` is
   `C^{0,βγ}` (`ContMDiffHolder.comp_zero`); if one of them is `C^1`, the composite has the other's
   exponent.
3. Precomposition with smooth maps and postcomposition with smooth maps preserve `C^{k,α}` for
   every `k`, including `k = 0`.

### 2.4 The tangent map

For `1 ≤ k` and `0 < α ≤ 1`, prove that `tangentMap I J f : TangentBundle I M → TangentBundle J N`
is `C^{k-1,α}` for the tangent bundle charts when `f` is `C^{k,α}`
(`ContMDiffHolder.contMDiffHolder_tangentMap`), the Hölder analogue of
`ContMDiff.contMDiff_tangentMap`. In the tangent bundle charts the representative is
`(z, v) ↦ (f̂ z, Df̂(z) v)`, whose `(k−1)`th derivative is a sum of terms linear in `v` with
coefficients the derivatives of `f̂` of orders at most `k`, the top one `α`-Hölder.

### 2.5 The bundled type

Define the type of `C^{k,α}` maps, written `C^{k,α}⟮I, M; J, N⟯`, with the coercion to continuous
maps, the forgetful map to `C^k⟮I, M; J, N⟯`, the identity, composition for `1 ≤ k`, and
extensionality.

**Checks.**

- On `AddCircle 1`, the function equal near `0` to `x ↦ x|x|` and smooth elsewhere is `C^{1,1}`
  and not `C^2`, so `C^{k,1} ⊄ C^{k+1}`, and `C^2 ≠ C^{1,1}`.
- On `AddCircle 1`, the function equal near `0` to `x ↦ |x|^{3/2}` is `C^{1,1/2}` and not `C^{1,β}`
  for `β > 1/2`; `x ↦ |x|` near `0` is `C^{0,1}` and not `C^1`.
- *Boundary.* On `Set.Icc (0 : ℝ) 1` with its half-space model, `x ↦ x^{1/2}` is `C^{0,1/2}` and not
  `C^{0,β}` for `β > 1/2`: at the boundary point `0` the quotient `h^{1/2}/h^β` is unbounded. A
  definition testing only interior points would accept it in every class `C^{k,β}`, since it is
  smooth on `(0, 1]`.
- *Composition exponent.* With `f(x) = g(x) = |x|^{1/2}` near `0` on the circle,
  `g ∘ f = |x|^{1/4}`: the exponent `βγ` of item 2 of §2.3 is attained.

*Needs:* Layer 1; Mathlib `writtenInExtChartAt`, `extChartAt`, `maximalAtlas`, `ContMDiff`,
`ContMDiff.contMDiff_tangentMap`, `HolderOnWith.of_le`, `norm_iteratedFDerivWithin_mul_le`,
`LinearMap.continuous_of_isClosed_graph`; Tau Ceti `ContMDiffMap.chartCkSeminorm`.

## Layer 3: Hölder diffeomorphisms and the group `Diff^{k,α}(M)` (H3)

### 3.1 Hölder diffeomorphisms

```lean
structure HolderDiffeomorph (I J M N) (k : ℕ) (α : ℝ≥0) extends M ≃ₘ^k⟮I, J⟯ N where
  contMDiffHolder_toFun : ContMDiffHolder I J k α toFun
  contMDiffHolder_invFun : ContMDiffHolder J I k α invFun
```

with `refl`, `symm`, `trans` (for `1 ≤ k`), `toDiffeomorph`, `toHomeomorph` and `ext`. A
`C^{1+α}` diffeomorphism is a `HolderDiffeomorph I J M N 1 α`.

Prove, for `1 ≤ k` and `0 < α ≤ 1`, with boundary and corners allowed: a `C^k` diffeomorphism
`f : M ≃ₘ^k⟮I, J⟯ N` with `ContMDiffHolder I J k α f` has `ContMDiffHolder J I k α f.symm`
(`Diffeomorph.contMDiffHolder_symm`). The proof is §1.3 item 1 applied to representatives.

### 3.2 Inverse function theorems

Assume `1 ≤ k` and `0 < α ≤ 1`.

1. *Local.* If `f` is `C^{k,α}` on an open set `s`, `x ∈ s` is an interior point
   (`I.IsInteriorPoint x`) and `mfderiv I J f x` is a continuous linear equivalence, then `f` is a
   local `C^{k,α}` diffeomorphism at `x`: there is a `PartialDiffeomorph I J M N k` whose source
   contains `x`, which agrees with `f` on its source and whose inverse is `C^{k,α}` on its target
   (`exists_partialDiffeomorph_contMDiffHolderOn_symm`). Tau Ceti's
   `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq` supplies the `C^k` local diffeomorphism, whose
   source can be shrunk into `s`, and §3.1's argument the Hölder regularity of its inverse.
2. *Global.* For boundaryless `M` and `N`, a bijective `C^{k,α}` map whose differential is a
   continuous linear equivalence at every point is a `HolderDiffeomorph`.

### 3.3 The group

`HolderDiff I M k α` is the subgroup of `TauCeti.Diff I M k` generated by the diffeomorphisms `f`
with `ContMDiffHolder I I k α f` and `ContMDiffHolder I I k α f.symm`. Prove that for `1 ≤ k` and
`0 < α ≤ 1` it consists of exactly these diffeomorphisms (`coe_holderDiff`): the identity is smooth,
the set is closed under inverses by its symmetry, and §2.3 item 1, applied to `f ∘ g` and to
`g.symm ∘ f.symm`, gives closure under composition. By §3.1 the second condition follows from the
first. For `k = 0` and `α < 1` the set is not closed under composition (Conventions). For `1 ≤ k` and
`0 < α ≤ 1`, prove the multiplicative equivalence between `HolderDiff I M k α` and
`HolderDiffeomorph I I M M k α` with its `trans`/`symm` group structure. Prove that the forgetful
homomorphism `TauCeti.Diff I M (k + 1) → TauCeti.Diff I M k` maps `HolderDiff I M (k + 1) α` into
`HolderDiff I M k 1`, that `HolderDiff I M k α ≤ HolderDiff I M k β` for `β ≤ α`, and that the
forgetful homomorphism from `TauCeti.Diff I M ∞` maps into `HolderDiff I M k α` for every `k` and
`α ≤ 1`.

### 3.4 Uniform estimates in exponential charts

Let `M` be compact and boundaryless with a smooth Riemannian metric (`Bundle.RiemannianBundle` with
`IsContMDiffRiemannianBundle`), `0 < α ≤ 1` and `f : HolderDiffeomorph I I M M 1 α`. Prove that
there are radii `0 < ρ ≤ r` and a constant `C` such that the tangent ball of radius `r` at every
point is a normal domain (`TauCeti.Manifold.IsNormalDomain`; SmoothBundlesConnections B6.0's
uniform normal radius on the compact set `M` gives such an `r`), and for every `p : M` the map
`f̂_p = riemannianLog (f p) (ball 0 r) ∘ f ∘ riemannianExp p` maps the ball of radius `ρ` of
`T_p M` into the ball of radius `r` of `T_{f p} M`, is `C^1` there with invertible derivative, and
its derivative satisfies `‖(Df̂_p(z₁))⁻¹ − (Df̂_p(z₂))⁻¹‖ ≤ C ‖z₁ − z₂‖^α` and
`‖Df̂_p(z₁) − Df̂_p(z₂)‖ ≤ C ‖z₁ − z₂‖^α`, norms being those of the metric
(`exists_holder_riemannianExp_chart`). This is the form (DKRH (2.2)) in which the `C^{1+α}`
hypothesis enters Pesin theory. The proof: a finite compact chart atlas, the smooth dependence of
`exp` and `log` on the base point on compact sets, §2.3 and §1.3, with all constants uniform by
compactness.

**Checks.**

- On `AddCircle 1`, `x ↦ x + ε sin(2πx)/(2π)` with `|ε| < 1` has derivative `1 + ε cos(2πx) > 0`;
  it is a smooth diffeomorphism and so lies in `HolderDiff I M k α` for every `k` and `α ≤ 1`.
- *A non-smooth element.* With `φ` the periodic primitive of the mean-zero function
  `ψ(x)|x|^α − c` (`ψ` a smooth cutoff equal to `1` near `0` with small support in `(−1/2, 1/2)`,
  `c` its mean), `x ↦ x + εφ(x)` for small `ε > 0` lies in `HolderDiff I M 1 α` and not in
  `HolderDiff I M 1 β` for `β > α`, nor in `TauCeti.Diff I M 2`.
- *Invertible differential.* The cube map `x ↦ x³` on `ℝ` is a smooth bijection whose derivative
  vanishes at the interior point `0`, and its inverse, the real cube root, is `C^{0,1/3}` and not
  differentiable at `0`: the invertibility hypotheses of §3.2 cannot be dropped.

*Needs:* Layer 2; §1.3; Mathlib `Diffeomorph`, `PartialDiffeomorph`, `Subgroup.closure`,
`Bundle.RiemannianBundle`, `IsContMDiffRiemannianBundle`, `ContinuousLinearMap.inverse`; Tau Ceti
`TauCeti.Diff`, `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`, `TauCeti.Manifold.riemannianExp`,
`TauCeti.Manifold.riemannianLog`, `TauCeti.Manifold.IsNormalDomain`; SmoothBundlesConnections B6.0
for the uniform normal radius.

## Layer 4: topologies (H4)

Throughout, `M` is compact and `1 ≤ k` unless stated, and `0 < α ≤ 1`.

### 4.1 The `C^{k,α}` topology on maps

For `x : M`, `y : N`, `L ⊆ E`, `φ : E → E'` and `ε`, the *Hölder chart test*
`holderTest I J k α x y L φ ε` is the set of maps `g : M → N` with
`MapsTo g ((extChartAt I x).symm '' L) (extChartAt J y).source` and
`max_{m ≤ k} sup_L ‖D^m(ĝ − φ)‖ + [D^k(ĝ − φ)]_{α,L} < ε`, where
`ĝ = extChartAt J y ∘ g ∘ (extChartAt I x).symm` and the derivatives are within `Set.range I`.
The tests with `L` compact in `(extChartAt I x).target`, `φ` of class `C^k` within `Set.range I`
and `ε > 0` generate the topology `holderMapTopology I J k α` on maps `M → N`; on
`C^{k,α}⟮I, M; J, N⟯` it induces the *`C^{k,α}` topology*, a scoped instance. Since `φ` is tested
only within `Set.range I`, no extension theorem is needed at corner points: for `g` of class
`C^{k,α}`, a smooth cutoff equal to `1` near `L` whose support meets `Set.range I` inside the domain
of `ĝ`, times `ĝ` and extended by zero, is such a `φ`, equal to `ĝ` near `L` within `Set.range I`.
This definition also covers `k = 0`. Prove:

1. a filter converges to `g` exactly when, for every test containing `g` with `φ = ĝ` near `L`
   within `Set.range I`, eventually the maps lie in it; the topology is Hausdorff;
2. the forgetful map `C^{k,α}⟮I, M; J, N⟯ → C^k⟮I, M; J, N⟯` is continuous for the weak Whitney
   topology `ContMDiffMap.manifoldWeakWhitneyTopology`;
3. for `N = F` a complete normed space, the topology is the norm topology of
   `C^{k,α}_A(M, F)` for every compact chart atlas `A` (§2.2);
4. precomposition `f ↦ f ∘ g` by a fixed `g : C^{k,α}⟮I, M; J, N⟯` is continuous
   `C^{k,α}⟮J, N; K, P⟯ → C^{k,α}⟮I, M; K, P⟯` (§1.1 item 3, first part);
5. postcomposition `g ↦ f ∘ g` by a fixed `f : C^{k,α}⟮J, N; K, P⟯` is continuous from the
   `C^{k,α}` topology to the `C^{k,β}` topology for every `β < α`, and for `f : C^{k+1,α}` it is
   continuous into the `C^{k,α}` topology (§1.1 item 3: the joint continuity with `β' = α` for the
   first statement, the case of a fixed outer map of class `C^{k+1,α}` for the second).

### 4.2 Openness of diffeomorphisms

For compact boundaryless `M` and `N`, prove that the set of `g : C^{k,α}⟮I, M; J, N⟯` that are
`C^{k,α}` diffeomorphisms is open in the `C^{k,α}` topology. By item 2 of §4.1 it suffices that
the `C^1` diffeomorphisms are open in the weak Whitney `C^1` topology: a map `C^1`-close to a
diffeomorphism `h` has invertible differential everywhere (compactness and openness of invertible
operators), is injective (a uniform radius on which `h` is injective with a uniform lower bound for
`dist (h a) (h b) / dist a b` in charts persists under `C^1`-small perturbation, and points farther
apart than that radius have images apart by `C^0`-closeness), and is surjective (its image is open
by the inverse function theorem and closed by compactness, and meets every component of `N`
because it is `C^0`-close to `h`). §3.2 item 2 then gives the Hölder inverse.

### 4.3 The `C^{k,α}` topology on `Diff^{k,α}(M)` is not a group topology

Give `HolderDiff I M k α` the topology `holderTopology I M k α` induced from
`holderMapTopology I I k α` by the underlying maps. Prove that right multiplication by a fixed
element is continuous (§4.1 item 4), and that for nonempty compact boundaryless `M` of positive
dimension there is `f` such that left multiplication by `f` is not continuous at the identity;
hence `HolderDiff I M k α` with this topology is not a topological group
(`not_isTopologicalGroup_holderTopology`). Construct `f` in one chart: a smooth vector field
supported in the chart and equal to the coordinate field `∂₁` near a point has a flow `φ_t` with
`φ_t → 1` in `TauCeti.Diff I M ∞` and so in this topology, and `f = id + εξ`, with `ξ` supported in
the chart and `∂₁^k ξ₁` having an `α`-cusp as in the Check of §1.1 at that point, satisfies
`[D^k(f ∘ φ_t − f)]_α ≥ 2ε` near the point for all small `t`.

### 4.4 The group topology

The *lower Hölder topology* `lowerHolderTopology I M k α` on `HolderDiff I M k α` is the coarsest
topology finer than the topologies induced from `holderMapTopology I I k β` for `0 < β < α` (their
infimum in Mathlib's order on topologies, where finer is smaller): a filter converges in it exactly
when it converges in `C^{k,β}` for every `β < α`. Prove, for compact `M` with boundary and corners
allowed:

1. `HolderDiff I M k α` with the lower Hölder topology is a topological group
   (`isTopologicalGroup_lowerHolderTopology`). Joint continuity of multiplication: if `f_n → f`
   and `g_n → g`, then for `β < β' < α` both converge in `C^{k,β'}`, and §1.1 item 3 (second part)
   gives `f_n ∘ g_n → f ∘ g` in `C^{k,β}`. Continuity of inversion:
   `f_n⁻¹ → f⁻¹` in the weak Whitney `C^k` topology by Tau Ceti's `Diffeomorph.continuous_symm`,
   the `f_n⁻¹` are bounded in `C^{k,β'}` by §1.3 item 2, and §1.2 gives convergence in `C^{k,β}`;
2. the inclusion into `TauCeti.Diff I M k` with the weak Whitney topology is continuous, and the
   `C^{k,α}` topology of §4.3 is finer than the lower Hölder topology;
3. the inclusion `TauCeti.Diff I M ∞ → HolderDiff I M k α` is continuous for the weak Whitney
   topology on the source.

**Checks.**

- *The circle.* On `AddCircle 1`, take `f = x + εφ(x)` from the Checks of §3.4 and the rotations
  `R_t`. Then `D(f ∘ R_t) − Df = ε(φ'(· + t) − φ')`, whose `α`-seminorm is at least `2ε` and whose
  `β`-seminorm is at most `C t^{α−β}` (§1.2). So `f * R_t → f` in the lower Hölder topology and not
  in the `C^{1,α}` topology, while `R_t * f → f` in both.
- *Dimension zero.* For `M` a point or empty, `HolderDiff I M k α` is trivial and both topologies
  agree, so the non-group statement of §4.3 needs a nonempty `M` of positive dimension.

*Needs:* Layers 1–3; Tau Ceti `ContMDiffMap.manifoldWeakWhitneyTopology`,
`ContMDiffMap.tendsto_manifoldWeakWhitney_iff`, `Diffeomorph.weakWhitneyTopology`,
`Diffeomorph.continuous_symm`, `Diffeomorph.isTopologicalGroup`.

## Layer 5: function spaces on a compact manifold (H5)

`M` is compact; `A` is a compact chart atlas and `C^k_A(M, F)`, `C^{k,α}_A(M, F)` are the
finite-atlas spaces of §2.2; `F` is a complete normed space over `ℝ` or `ℂ`.

### 5.1 Inclusions and the real-index scale

1. For `k' ≤ k`, `α' ≤ 1` and `k' + α' ≤ k + α`, the inclusion
   `C^{k,α}_A(M, F) → C^{k',α'}_A(M, F)` is a continuous linear map (with `C^{k',0}_A` meaning
   `C^{k'}_A`), and so is `C^{k,α}_A(M, F) → C^k_A(M, F)`. For `α' < α` and `k' = k` the inclusion
   is compact: by Arzelà–Ascoli on the pieces a bounded sequence has a subsequence converging in
   `C^k_A(M, F)`, and §1.2 upgrades the convergence to `C^{k,α'}`.
2. `C^{k+1}_A(M, F) → C^{k,1}_A(M, F)` is continuous, and the Check of §2.5 shows it is not onto.
3. For real `r ≥ 0`, define `C^r_A(M, F)` as `C^k_A(M, F)` when `r = k` is a natural number and as
   `C^{⌊r⌋, r − ⌊r⌋}_A(M, F)` otherwise. The inclusions `C^r_A(M, F) → C^{r'}_A(M, F)` for
   `r' ≤ r` are continuous.

### 5.2 Hölder continuity for a Riemannian distance

For connected `M` with a smooth Riemannian metric and its distance
(`TauCeti.MetricSpace.ofRiemannianMetric`), prove that `u ∈ C^{0,α}_A(M, F)` exactly when `u` is
`α`-Hölder for the Riemannian distance, and that `‖u‖_∞ + [u]_α` for that distance is a norm
equivalent to the atlas norm, so `C^{0,α}_A(M, F)` and Tau Ceti's `TauCeti.HolderSpace α M F` are
isomorphic Banach spaces. The proof: on each compact piece the Riemannian distance and the chart
distance are comparable at small scales, because on a compact subset of a chart the matrix of the
metric is bounded above and below, so the chart segment between two nearby points and a short
curve between them have comparable lengths for the metric and for the chart's norm; a
Lebesgue-number argument handles large distances.

### 5.3 Pullback

For `f : C^{k,α}⟮I, M; J, N⟯` with `M` and `N` compact and `1 ≤ k`, and compact chart atlases `A`
of `M` and `B` of `N`, pullback `u ↦ u ∘ f` is a continuous linear map
`C^{k,α}_B(N, F) → C^{k,α}_A(M, F)`; for `k = 0` this holds when `f` is `C^1`. For a `C^k` map `f`
with `k ≥ 1` it is a continuous linear map `C^k_B(N, F) → C^k_A(M, F)`. Prove the operator norm
bound in terms of the `C^{k,α}` norms of the representatives of `f` on the pieces (§1.1 item 2).
Applied to `f ∈ HolderDiff I M k α` this is the Koopman operator on `C^{k,α}_A(M, F)`; it satisfies
`(f * g)^* = g^* ∘ f^*`.

### 5.4 Smoothing

For boundaryless `M` and `0 < s ≤ 1` there are continuous linear maps
`S_ε : C^s_A(M, F) → C^∞⟮I, M; 𝓘(ℝ, F), F⟯`, `ε ∈ (0, 1]`, and for every natural `r ≥ 1` a
constant `C`, independent of `u` and `ε`, with `‖S_ε u‖_{C^r} ≤ C ε^{s−r} ‖u‖_{C^s}` (finite-atlas
`C^r` norm) and `sup ‖u − S_ε u‖ ≤ C ε^s ‖u‖_{C^s}`. Since `ε ≤ 1` the first bound gives
`C ε^{−r} ‖u‖_{C^s}`, the form used by DKRH. Construct `S_ε` by a smooth partition of unity
subordinate to the pieces' chart domains, convolution in each chart with `ε^{−n} ρ(·/ε)` for a
fixed mollifier `ρ`, and cutoffs; this is the construction in the proof of DKRH Lemma B.1. The
derivative bound uses `∫ D^r ρ_ε = 0` to write `D^r(v ∗ ρ_ε)(x) = ∫ (v(y) − v(x)) D^r ρ_ε(x − y) dy`.
Convolution in a chart needs each piece on a full neighbourhood in `E`, which is why `M` is
boundaryless here.

**Checks.**

- *Smoothing rate.* On `ℝ`, for `u(x) = ψ(x)|x|^s` with `ψ` a smooth cutoff equal to `1` near `0`
  and an even mollifier `ρ`, `(u ∗ ρ_ε)(0) = ε^s ∫ |z|^s ρ(z) dz` for small `ε`, while `u(0) = 0`:
  the exponent `s` in the uniform bound of §5.4 is attained.
- *Integer index.* `C^2_A(M, F)` is `C^2`, not `C^{1,1}`: the function of the first Check of §2.5
  lies in the second and not the first.

*Needs:* Layers 1–2, with the finite-atlas spaces of §2.2; Tau Ceti `TauCeti.HolderSpace`,
`TauCeti.MetricSpace.ofRiemannianMetric`; Mathlib smooth partitions of unity
(`SmoothPartitionOfUnity`), convolution (`MeasureTheory.convolution`) and the Arzelà–Ascoli theorem
(`BoundedContinuousFunction.arzela_ascoli₂`).

## Downstream consumers

- Dolgopyat, Kanigowski and Rodriguez Hertz (DKRH, Theorem 1.1) consider a `C^{1+α}`
  diffeomorphism of a compact manifold preserving a smooth measure and exponentially mixing in the
  sense of DKRH (1.1), stated with the `C^r(M)` norm for `r ∈ ℕ`. The diffeomorphism is
  `HolderDiffeomorph I I M M 1 α` (§3.1), the norm is the finite-atlas `C^r` norm, and the Pesin
  theory of the proof uses §3.4. Smooth measures, exponential mixing and the Bernoulli property are
  not supplied here.
- HyperbolicDynamicsAndThermodynamicFormalism leaves the classes `C^{k,α}` out of its scope; its
  §8.7 assumes only that the chart representatives of the derivative are `α`-Hölder near a
  hyperbolic set, which every `C^{1,α}` map of §2.1 satisfies, so it could consume Layers 2 and 3
  for that hypothesis.
- Statements with test functions in `C^β(M)` for real `β > 0`, such as exponential mixing of
  three-dimensional Anosov flows, use `C^β_A(M, ℂ)` (§5.1).

## Scope and ownership

This roadmap owns: the Euclidean composition estimates in Hölder spaces of positive order with
`C^{k,α}` inner maps and the continuity of composition with loss of exponent (§1.1), convergence in
lower Hölder exponents of sequences bounded in a higher one (§1.2), the Hölder estimate for operator
inversion and the within-set and quantitative Hölder inverse estimates (§1.3); `C^{k,α}` maps
between finite-dimensional manifolds with corners, their chart independence, composition and
tangent maps (Layer 2); Hölder diffeomorphisms, their inverse function theorems, the group
`Diff^{k,α}(M)` and uniform estimates in exponential charts (Layer 3); the `C^{k,α}` and
lower Hölder topologies and openness of diffeomorphisms (Layer 4); and on compact manifolds with
corners the inclusions, the real-index scale, the Riemannian description of `C^{0,α}`, pullback and
smoothing (Layer 5), together with the finite-atlas spaces `C^k_A(M, F)` and `C^{k,α}_A(M, F)` of
maps into a Banach space on compact manifolds with corners, their completeness and their atlas
independence (§2.2).

Not owned here: the finite-chart `C^{k,α}` norms of finite-rank bundles, their completeness and
atlas independence on compact boundaryless manifolds, Zygmund spaces and little Hölder spaces
(PseudodifferentialOperators §5.4); the Banach spaces of real `C^k` functions on compact manifolds
used for generic Morse functions (HeegaardFloer §2.3); the `C^n` and `C^∞` diffeomorphism groups with
the weak Whitney topology, isotopy extension and their homotopy theory (GeometricTopology Layer 3);
the uniform normal radius on compact sets (SmoothBundlesConnections B6.0); Euclidean Hölder spaces
of real functions on open sets and Schauder theory (PDE). Already in the library: the order-zero
composition estimate and the interpolation of Hölder constants (Mathlib's `HolderOnWith.comp` and
`HolderOnWith.interpolate`), and the compact chart `C^k` seminorms (Tau Ceti's
`ContMDiffMap.chartCkSeminorm`). The Banach manifold structure of `C^{k,α}(M, N)`,
little Hölder diffeomorphism groups and differentiability of composition in Hölder scales are not
part of this roadmap.

## Exact supplier contracts

### From Mathlib

`ModelWithCorners`, `IsManifold`, `BoundarylessManifold`, `ModelWithCorners.IsInteriorPoint`,
`ModelWithCorners.uniqueDiffOn`, `extChartAt`, `writtenInExtChartAt`, `maximalAtlas`
(`Mathlib/Geometry/Manifold/`); `ContMDiff`, `mfderiv`, `tangentMap`,
`ContMDiff.contMDiff_tangentMap` (`ContMDiffMFDeriv.lean`); `Diffeomorph`, `PartialDiffeomorph`;
`ContDiffOn`, `iteratedFDerivWithin`, `iteratedFDerivWithin_comp`, `UniqueDiffOn.inter`;
`HolderWith`, `HolderOnWith`, `HolderOnWith.comp`, `HolderOnWith.interpolate`, `HolderOnWith.of_le`
(`Topology/MetricSpace/Holder.lean`); `eHolderNorm` (`Topology/MetricSpace/HolderNorm.lean`);
`norm_iteratedFDerivWithin_mul_le`, `norm_image_sub_le_of_norm_fderivWithin_le`,
`ContinuousLinearMap.inverse`, `LinearMap.continuous_of_isClosed_graph`; `Subgroup.closure`,
`TopologicalSpace.generateFrom`, `IsTopologicalGroup`; `Bundle.RiemannianBundle`,
`IsContMDiffRiemannianBundle`; `SmoothPartitionOfUnity`, `MeasureTheory.convolution`,
`BoundedContinuousFunction.arzela_ascoli₂`.

### From PDE and Tau Ceti's Hölder spaces

`TauCeti.HolderSpace` (`Analysis/Holder/Normed.lean`): the Banach space of bounded globally
`α`-Hölder functions on a metric space with the norm `‖u‖_∞ + [u]_α`, used in §5.2. PDE §1.7's
Banach space `C^{k,α}(Ω)` of real functions on an open `Ω ⊆ ℝⁿ`, which on a bounded convex open set
is the space `C^{k,α}(U, ℝ)` of §1.1 with an equivalent norm.

### From Tau Ceti's compact chart seminorms

`ContMDiffMap.chartCkSeminorm` (`Geometry/Manifold/ContMDiffMap/Chart/Seminorm.lean`): for `x : M`,
a compact `K ⊆ (extChartAt I x).target` and `k ≤ n`, the seminorm on `C^n⟮I, M; 𝓘(ℝ, F), F⟯` given
by the maximum over `m ≤ k` of the supremum on `K` of the `m`th derivative of the representative
within the chart target, with boundary and corners allowed. §2.2 builds the finite-atlas norms from
it.

### From GeometricTopology Layer 3 and Tau Ceti's diffeomorphism groups

`TauCeti.Diff I M n` and its `Group` instance (`Geometry/Diffeomorphism/Group.lean`); the weak
Whitney topology `ContMDiffMap.manifoldWeakWhitneyTopology` with
`ContMDiffMap.tendsto_manifoldWeakWhitney_iff`, `Diffeomorph.weakWhitneyTopology`,
`Diffeomorph.continuous_trans`, `Diffeomorph.continuous_symm` and `Diffeomorph.isTopologicalGroup`,
valid for every finite order `n` on compact manifolds with corners and locally compact model
(`Geometry/Diffeomorphism/{Topology,Composition,Inversion}.lean`); the manifold inverse function
theorem `TauCeti.isLocalDiffeomorphAt_of_mfderiv_eq`
(`Geometry/Manifold/LocalDiffeomorph/Basic.lean`).

### From SmoothBundlesConnections B6.0 and Tau Ceti's Riemannian library

`TauCeti.Manifold.riemannianExp`, `TauCeti.Manifold.riemannianLog` and
`TauCeti.Manifold.IsNormalDomain` (`Geometry/Manifold/Riemannian/Geodesic/`);
`TauCeti.MetricSpace.ofRiemannianMetric` (`Geometry/Manifold/Riemannian/Distance.lean`).
SmoothBundlesConnections B6.0: on a Hausdorff second-countable boundaryless manifold with a smooth
Riemannian metric, a positive uniform normal radius on each compact set, with `IsNormalDomain` on
every tangent ball of that radius; §3.4 uses it on the compact `M`.

## References

- **dLO** R. de la Llave and R. Obaya, *Regularity of the composition operator in spaces of Hölder
  functions*, Discrete Contin. Dynam. Systems 5 (1999), no. 1, 157–184,
  https://doi.org/10.3934/dcds.1999.5.157; preprint mp_arc 98-11,
  https://web.ma.utexas.edu/mp_arc-bin/mpa?yn=98-11. Section locators follow the preprint: §2
  (the Hölder spaces `C^r` of bounded maps on open subsets of Banach spaces, with the Lipschitz
  endpoint `C^{k+1^-}`), §3 (compensated domains and interpolation), §4 (the theorem on the range
  of composition and the examples `|x|^α` showing it is sharp), §6 (continuity of composition in
  each factor, the set of exponents of continuity, examples of discontinuity outside it, and the
  theorem on joint continuity and differentiability of composition).
- **DKRH** D. Dolgopyat, A. Kanigowski and F. Rodriguez Hertz, *Exponential mixing implies
  Bernoulli*, Ann. of Math. 199 (2024), no. 3, https://doi.org/10.4007/annals.2024.199.3.5;
  arXiv:2106.03147v1. §1.1, (1.1) and Theorem 1.1 (setting and exponential mixing for the `C^r`
  norm); §2.1, (2.2) (Hölder estimate in exponential charts); Appendix B, Lemma B.1 and its proof
  (smoothing in charts).
