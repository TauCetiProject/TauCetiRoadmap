# Roadmap: Variational analysis and metric regularity

**Summary.** This roadmap builds the nonconvex half of variational analysis: convergence of sets
and functions, generalized derivatives of nonsmooth functions, and the stability of solutions of
equations and inclusions under perturbation.

- Set convergence: the inner and outer limits of a sequence of sets in the sense of Painlevé and
  Kuratowski, their sequential description, compactness of the convergence in second-countable
  spaces, its description through distance functions in proper metric spaces, and, for closed
  convex sets in a Euclidean space, through nearest points.
- Epi-convergence of functions, defined by set convergence of epigraphs: its characterization
  by the liminf inequality and recovery sequences, compactness, the limits of monotone
  sequences, pointwise convergence on a dense set for convex functions, Wijsman's theorem that
  conjugation is continuous for epi-convergence, and Attouch's theorem that epi-convergence of
  closed convex functions is graphical convergence of their subdifferentials.
- Clarke's generalized gradient of a function Lipschitz near a point in a normed space: the
  generalized directional derivative as its support function, agreement with the derivative for
  strictly differentiable functions and with the subdifferential for convex ones, Fermat's rule,
  the sum rule, Lebourg's mean value theorem, the chain and max rules, and, in finite dimension,
  Clarke's formula through limits of derivatives at points of differentiability.
- Metric regularity of set-valued maps: its equivalence with the Aubin property of the inverse,
  the Lyusternik–Graves theorem that metric regularity survives Lipschitz perturbations of small
  constant, its classical form for strictly differentiable maps with surjective derivative, the
  Robinson–Ursescu theorem for maps with closed convex graph, and Hoffman's error bound for
  linear inequalities.
- Limiting normals and subgradients in finite dimension: regular and limiting normal cones and
  subdifferentials, the horizon subdifferential and its characterization of Lipschitz
  continuity, Clarke's gradient as the convex hull of the limiting subdifferential, the sum,
  chain and intersection rules under qualification conditions, the extremal principle, and the
  Mordukhovich criterion: a map with locally closed graph is metrically regular exactly when its
  coderivative has trivial kernel.

The material is a synthesis of Rockafellar–Wets, Clarke, Dontchev–Rockafellar, Mordukhovich and
Ioffe (see [References](#references)), organized by the subject, not by any one of them: set
convergence comes first because epi-convergence, graphical convergence and limiting normals are
all outer limits; Clarke's gradient comes before limiting subgradients because it is defined
without any limiting construction and is recovered from them at the end; metric regularity comes
before the limiting calculus because the Mordukhovich criterion characterizes it. Headlines that
restate a source result carry a theorem, definition or section locator with its printed page;
corollaries and adaptations carry a proof route.

The roadmap sits between convex analysis and its nonsmooth extensions. ConvexAnalysisAndDuality
supplies the convex calculus that every nonconvex notion here reduces to on convex functions,
through its directional derivative and max formula (its 3.1–3.2). FirstOrderOptimization supplies
the proximal map of a convex function (its 3.2), through which Attouch's theorem is proved. Tau
Ceti supplies the convex conjugate and subdifferential, Ekeland's variational principle, on which
the regularity theorems rest, and a theory of Γ-convergence, of which epi-convergence is the
epigraphical form, with the stability of Moreau–Yosida resolvents under it.
[VariationalMethods](../VariationalMethods/README.md) §2.1 supplies the normal cone of convex
analysis. The roadmap owns no multiplier rule: the optimality conditions of smooth nonlinear
programs under constraint qualifications are NonlinearProgrammingOptimality's, and the continuity
of set-valued maps with Berge's maximum theorem is KakutaniFixedPointAndContinuousGames'.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the bullets without a bold name are
targets of the same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Topology/SetConvergence/` for Layers 1–2, next to Tau Ceti's
`TauCeti/Topology/Semicontinuity/GammaConvergence.lean`; `TauCeti/Analysis/Calculus/Clarke/` for
Layer 3; `TauCeti/Analysis/VariationalAnalysis/` for Layers 4–5.

## How to read the build

Each layer opens with a short orientation, then numbered subsections. In a subsection a **bold
name** with a Lean name in parentheses is a headline stated in `Suggested.lean`; a bold name
without one is a target of the same standing stated in prose. Locators follow the headline; an
adaptation carries a *Proof route.* Every subsection ends with a *Needs:* line naming what it
uses. **Checks.** are small cases computed by hand and recomputed numerically, one fact per
bullet; a key definition with an evident wrong variant has a negative control that tells the two
apart. Each layer closes with Examples and Dependencies.

Layer 1 needs only Mathlib's topology. Layer 2 needs Layer 1, and for 2.4 the Tau Ceti conjugate,
subdifferential and Moreau–Yosida resolvents with FirstOrderOptimization 3.2. Layer 3 needs
Mathlib's calculus and, for 3.2, ConvexAnalysisAndDuality 3.1–3.2; it can be built in parallel
with Layers 1–2. Layer 4 needs Tau Ceti's Ekeland principle and Mathlib's Graves theorem, and can
also be built in parallel. Layer 5 needs Layers 1, 3 and 4.

## Conventions

These are fixed for every target. A statement that departs from them is a different target.

- **Namespace.** The implementation is in the namespace `TauCeti`. `Suggested.lean` states the
  prototypes in the namespace `TauCetiRoadmap.VariationalAnalysisAndMetricRegularity`.
- **Sequences of sets.** A sequence of sets is `C : ℕ → Set X`. Its outer and inner limits,
  `outerLimit C` and `innerLimit C`, are defined through neighbourhoods, so that they make sense in
  any topological space; in a first-countable space they are the sequential limits of
  Rockafellar–Wets (1.1). `TendstoPK C D` asserts that both limits are `D`.
- **Extended-real functions.** A function is `f : E → EReal`, its epigraph is the real epigraph
  `{p : E × ℝ | f p.1 ≤ p.2}`, and it is *convex* when that set is convex, *proper* when
  `∀ x, f x ≠ ⊥` and `∃ x, f x ≠ ⊤`, and *closed* when it is `LowerSemicontinuous`. These are the
  hypotheses of Tau Ceti's convex conjugate and subdifferential, `TauCeti.fenchelConjugate` and
  `TauCeti.subdifferential`. In Mathlib's `EReal`, `⊥ + ⊤ = ⊥`; every target adds extended values
  only under hypotheses that exclude `⊥`.
- **Dual vectors.** Generalized gradients, normals, subgradients and coderivatives are elements
  of `StrongDual ℝ E`, also in finite dimension, so that the product `E × E'` with its sup norm
  serves for graphs. The convex subdifferential they are compared with is
  `TauCeti.subdifferential` for the evaluation pairing `(topDualPairing ℝ E).flip`, and the
  normal cone of convex analysis is `normalCone`, a local copy of that of
  [VariationalMethods](../VariationalMethods/README.md) §2.1, used only at points of the set.
- **Lipschitz near a point.** "`f` is Lipschitz near `x`" is
  `∃ K : ℝ≥0, ∃ U ∈ 𝓝 x, LipschitzOnWith K f U`, stated with Mathlib's vocabulary and no extra
  predicate.
- **Distances to sets.** Distances that may involve the empty set are the extended distances
  `Metric.infEDist` in `ℝ≥0∞`, with distance `⊤` to `∅`, the convention `d(x, ∅) = ∞` of every
  source cited here. The real distance `Metric.infDist` is `0` to the empty set, so it is used
  only for nonempty sets.
- **Set-valued maps.** A set-valued map is `F : X → Set Y`, its graph is
  `{p : X × Y | p.2 ∈ F p.1}` and its inverse is `fun y => {x | y ∈ F x}`. Its graph is *locally
  closed* at a point of the graph when its intersection with some closed ball about that point is
  closed. Upper and lower hemicontinuity of set-valued maps are not used here.
- **Moduli.** Moduli of metric regularity and of the Aubin property are `κ : ℝ≥0`, and the
  inequalities are in `ℝ≥0∞`. There `0 * ⊤ = 0`, so modulus `0` is degenerate (a Check of 4.1);
  a theorem whose conclusion depends on a positive modulus says `0 < κ`.
- **Locators** are `(Author, Theorem, printed page)` in the editions listed under
  [References](#references).

## Layer 1: set convergence

Painlevé–Kuratowski convergence of sets: the limits and their closedness, the sequential
description, compactness, distance functions and nearest points. Every subsequent layer takes its
limits in this sense: epigraphs in Layer 2, graphs of subdifferentials in 2.4 and of normal-cone
maps in Layer 5.

### 1.1 Inner and outer limits

- **Definitions** (`outerLimit`, `innerLimit`, `TendstoPK`). The outer limit of `C` is the set of
  points every neighbourhood of which meets `C n` for infinitely many `n`; the inner limit is the
  set of points every neighbourhood of which meets `C n` for all large `n`; and `C` converges to
  `D`, `TendstoPK C D`, when the outer limit lies in `D` and `D` in the inner limit
  (Rockafellar–Wets, Def 4.1, p. 109, in `ℝⁿ`, where the neighbourhood form is the second
  description given there).
- **Closedness** (`isClosed_outerLimit_and_innerLimit`). Both limits are closed, the inner limit
  lies in the outer limit, and neither changes when each `C n` is replaced by its closure
  (Rockafellar–Wets, Prop 4.4, p. 111).
- **Sequential description** (`mem_outerLimit_iff_and_mem_innerLimit_iff`). In a
  first-countable space, `x` is in the outer limit exactly when it is the limit of points
  `u k ∈ C (φ k)` along a strictly increasing `φ`, and in the inner limit exactly when it is the
  limit of points `u n ∈ C n` for all large `n` (Rockafellar–Wets, Def 4.1, p. 109, first
  description).
- Since the inner limit lies in the outer limit, `TendstoPK C D` forces both limits to equal
  `D`; in particular a limit is closed and unique. This is a target in prose.

*Proof route.* Closedness: the complement of the outer limit is the set of points having a
neighbourhood that eventually misses `C n`, which is open; likewise for the inner limit. Closures:
an open set meets `closure (C n)` exactly when it meets `C n`. For the sequential description,
choose a decreasing countable neighbourhood basis `Uₖ` of `x` and pick points of `C n ∩ Uₖ`.

*Needs:* Mathlib `Filter.Frequently`, `Filter.Eventually`, `FirstCountableTopology`.

### 1.2 Compactness

- **Extraction of convergent subsequences** (`exists_strictMono_tendstoPK`). In a
  second-countable space every sequence of sets has a subsequence that converges in the
  Painlevé–Kuratowski sense, possibly to the empty set (Rockafellar–Wets, Thm 4.18, p. 120, in
  `ℝⁿ`, where a sequence that escapes to the horizon is the case of the empty limit).

*Proof route.* Enumerate a countable basis `Bₖ`. By a diagonal argument choose a subsequence
along which, for every `k`, either `C n` meets `Bₖ` for all large `n` or `C n` misses `Bₖ` for
all large `n`. Along it a point of the outer limit has every basic neighbourhood met frequently,
hence eventually, so it is in the inner limit.

*Needs:* 1.1; Mathlib `SecondCountableTopology`, `TopologicalSpace.exists_countable_basis`.

### 1.3 Distance functions and nearest points

- **Distance functions** (`tendstoPK_iff_tendsto_infEDist`). In a proper metric space, a sequence
  of sets converges to a closed set `D` exactly when `Metric.infEDist x (C n)` tends to
  `Metric.infEDist x D` for every `x` (Rockafellar–Wets, Cor 4.7, p. 113, in `ℝⁿ`).
- **Nearest points** (`tendstoPK_iff_tendsto_nearestPoint`). In a finite-dimensional inner
  product space, nonempty closed convex sets `C n` converge to a nonempty closed convex set `D`
  exactly when, for every `x`, the nearest points of `C n` to `x` converge to the nearest point
  of `D` to `x` (Rockafellar–Wets, Prop 4.9, p. 114).
- **Pompeiu–Hausdorff distance.** In a proper metric space, if `⋃ n, C n` is bounded and `D` is
  closed, `TendstoPK C D` holds exactly when `Metric.hausdorffEDist (C n) D` tends to `0`; without
  boundedness, convergence in Pompeiu–Hausdorff distance still implies set convergence, but not
  conversely (Rockafellar–Wets, Ex 4.13, p. 117).
- **Convex sets.** In a real topological vector space the inner limit of convex sets is convex,
  and so is the limit when it exists; the outer limit need not be convex (Rockafellar–Wets,
  Prop 4.15, p. 119).

*Proof route.* For distances, `infEDist x (C n) < r` exactly when `C n` meets the open ball of
radius `r` about `x`; the inner limit gives the upper estimate in any metric space, and for the
lower estimate a sequence of points of `C n` in a closed ball has a cluster point by properness,
which lies in the outer limit. The convention `infEDist x ∅ = ⊤` makes the case `D = ∅` the
statement that the sets leave every ball. Rockafellar–Wets' proof uses only compactness of closed
balls. Nearest points: the necessity is Rockafellar–Wets' argument, with uniqueness of nearest
points to closed convex sets (Mathlib `norm_eq_iInf_iff_real_inner_le_zero`); for sufficiency,
`dist x (p n) = infDist x (C n)` converges for every `x`, and the first headline applies. Convex
sets: for `z = (1 - t) x + t y` and a neighbourhood `W` of `z`, continuity of the vector
operations gives neighbourhoods `U ∋ x`, `V ∋ y` with `(1 - t) U + t V ⊆ W`.

*Needs:* 1.1; Mathlib `Metric.infEDist`, `Metric.infDist`, `Metric.hausdorffEDist`, `ProperSpace`,
`norm_eq_iInf_iff_real_inner_le_zero`.

**Checks.**

- `C n = {(-1)ⁿ}` in `ℝ` has outer limit `{-1, 1}` and inner limit `∅`, so it converges to no set.
- `C n = {1/n}` converges to `{0}`, and `C n = [0, n]` to `[0, ∞)`.
- `C n = {n}` in `ℝ` converges to `∅`, and `infEDist x (C n) = n - x` tends to `⊤` for every `x`,
  as 1.3 requires.
- Negative control for closedness of `D` in 1.3: the constant sequence `C n = (0, 1)` has limit
  `[0, 1]`, not `(0, 1)`, although the distance functions of `(0, 1)` and `[0, 1]` agree.
- Negative control for the outer limit in the convex headline: each `{(-1)ⁿ}` is convex, but the
  outer limit `{-1, 1}` is not.
- Negative control for convexity in the nearest-point headline: `C n = {-1, 1 + (-1)ⁿ/n}`
  converges to `{-1, 1}`, but the nearest point of `C n` to `0` is `-1` for even `n` and
  `1 - 1/n` for odd `n` (`-1` at `n = 1000`, `0.999` at `n = 1001`).
- Pompeiu–Hausdorff without boundedness: `C n = {0, n}` converges to `{0}`, while
  `hausdorffEDist (C n) {0} = n` tends to `⊤`.

### Examples

- Monotone sequences: an increasing sequence of sets converges to the closure of its union, and
  a decreasing one to the intersection of the closures (Rockafellar–Wets, Ex 4.3, p. 111); this
  is how 2.2 computes the limits of monotone sequences of functions.
- The graphs of `x ↦ n x` on `ℝ` converge to the vertical axis `{0} × ℝ`, the graph of the normal
  cone of `{0}`; this is the first Check of 2.4.

### Dependencies

Mathlib topology and metric spaces.

## Layer 2: epi-convergence

Epi-convergence is set convergence of epigraphs. It is the convergence under which minimization
passes to the limit; on first-countable spaces it coincides with Γ-convergence, which Tau Ceti
has together with the fundamental theorem on convergence of infima and minimizers, so this
layer builds the epigraphical side and the convex theory that Γ-convergence does not see.

### 2.1 Epi-limits

- **Definition** (`EpiTendsto`). `EpiTendsto f g` asserts `TendstoPK` of the real epigraphs of
  `f n` to that of `g` (Rockafellar–Wets, Def 7.1, p. 240).
- **Characterization** (`epiTendsto_iff`). In a first-countable space, `EpiTendsto f g` holds
  exactly when `g x ≤ liminf f n (u n)` along every sequence `u n → x` and every `x` has a
  sequence `u n → x` with `limsup f n (u n) ≤ g x` (Rockafellar–Wets, Prop 7.2, p. 241). These two
  conditions are the fields of Tau Ceti's sequential Γ-convergence `TauCeti.TendstoGamma`, and the
  Lean statement is the identification `EpiTendsto f g ↔ TauCeti.TendstoGamma f g`.
- **Compactness** (`exists_strictMono_epiTendsto`). In a second-countable space every sequence
  of functions has an epi-convergent subsequence; the limit may take the values `⊥` and `⊤`
  (Rockafellar–Wets, Thm 7.6, p. 245, in `ℝⁿ`, where escape to the horizon is the case of the
  limit `⊤`).
- An epi-limit is lower semicontinuous, and epi-limits of convex functions are convex
  (Rockafellar–Wets, Prop 7.4(a), p. 244, and Thm 7.17, p. 252). This is a target in prose: the
  first is 1.1 for epigraphs, the second the convex headline of 1.3 for epigraphs.

*Proof route.* For the characterization, apply 1.1 in `X × ℝ`: a point `(x, α)` of the outer limit
of the epigraphs with `α < g x` would give a sequence `u k → x` with `f (φ k) (u k) ≤ α + 1/k`,
contradicting the liminf inequality, and points `(x, g x + 1/k)` of the inner limit give the
recovery sequence by a diagonal choice; the case `g x = ⊥` uses the points `(x, -k)`. For
compactness, apply 1.2 in `X × ℝ`; a limit of epigraphs is closed by 1.1 and upward closed in the
second variable, so it is the epigraph of `x ↦ sInf {α | (x, α) ∈ D}` in `EReal`.

*Needs:* 1.1, 1.2.

### 2.2 Monotone sequences

- **Monotone limits** (`epiTendsto_of_antitone_and_of_monotone`). A nonincreasing sequence
  epi-converges to the lower semicontinuous hull of its infimum, and a nondecreasing one to the
  supremum of the lower semicontinuous hulls of its terms, which can be strictly below the hull of
  the supremum; the hull of `h` at `x` is `liminf h (𝓝 x)` (Rockafellar–Wets, Prop 7.4(c)–(d),
  p. 244).

*Proof route.* The epigraphs increase, respectively decrease, and the first Example of Layer 1
computes their limits. The closure of the epigraph of `h` is the epigraph of
`x ↦ liminf h (𝓝 x)`, in any topological space.

*Needs:* 1.1.

### 2.3 Convex functions

- **Dense pointwise convergence** (`epiTendsto_iff_exists_dense_tendsto`). On a
  finite-dimensional real normed space, let `f n` be convex and let `g` be convex and lower
  semicontinuous with domain of nonempty interior. Then `f n` epi-converges to `g` exactly when
  `f n x → g x` in `EReal` for every `x` of some dense set (Rockafellar–Wets, Thm 7.17, pp.
  252–253).
- Under the same hypotheses, epi-convergence is uniform convergence on every compact set that
  contains no boundary point of the domain of `g`, in the extended sense of Rockafellar–Wets,
  Def 7.12, p. 251 (Rockafellar–Wets, Thm 7.17(c), p. 253). This is a target in prose.

*Proof route.* Rockafellar–Wets' proof: on the interior of the domain, the convex functions
`f n` are eventually bounded above on a neighbourhood of each point of the dense set, hence
equi-Lipschitz on compact subsets (Mathlib `ConvexOn.locallyLipschitzOn_interior`), and pointwise
convergence on a dense set becomes uniform; outside the closure of the domain, convexity forces
`f n → ⊤`.

*Needs:* 2.1; Mathlib `ConvexOn.locallyLipschitzOn_interior`.

### 2.4 Conjugates and subdifferentials

- **Wijsman's theorem** (`epiTendsto_fenchelConjugate_iff`). For proper closed convex functions
  `f n`, `g` on a finite-dimensional inner product space, `f n` epi-converges to `g` exactly when
  the conjugates `fenchelConjugate (innerₗ H) (f n)` epi-converge to that of `g`
  (Rockafellar–Wets, Thm 11.34, p. 500).
- **Attouch's theorem** (`epiTendsto_iff_tendstoPK_graph_subdifferential`). For proper closed
  convex functions `f n`, `g` on a finite-dimensional inner product space, `f n` epi-converges to
  `g` exactly when the graphs of the subdifferentials `subdifferential (innerₗ H) (f n)` converge
  to that of `g` and some convergent sequence of graph points `(u n, w n) → (x, v)`, with
  `v ∈ subdifferential (innerₗ H) g x`, has `f n (u n) → g x` (Rockafellar–Wets, Thm 12.35,
  p. 552, items (a) and (b)).
- **Envelopes and proximal points.** For a proper closed convex `f` on a finite-dimensional inner
  product space and `λ > 0`, the Moreau envelope `e_λ f z = inf_y (f y + ‖y - z‖² / (2λ))` is
  real-valued, convex and differentiable with gradient `(z - P_λ f z) / λ`, where `P_λ f` is the
  proximal map of FirstOrderOptimization 3.2; hence two proper closed convex functions with the
  same proximal map for some `λ` differ by a constant (Rockafellar–Wets, Thm 2.26(b), p. 52, and
  Cor 3.37, p. 95). This is a target in prose.
- **Epi-convergence through proximal maps.** For proper closed convex `f n`, `g` on a
  finite-dimensional inner product space and `λ > 0`, `f n` epi-converges to `g` exactly when
  `P_λ (f n) z → P_λ g z` for every `z` and `e_λ (f n) (z n) → e_λ g z` for some convergent
  sequence `z n → z`; then `e_λ (f n)` converges to `e_λ g` at every point (Rockafellar–Wets,
  Thm 12.35(c), p. 552, and Thm 7.37, pp. 267–268). This is a target in prose.

*Proof route.* Wijsman: Rockafellar–Wets' proof through the inequalities
`e-liminf f n ≥ g ⟺ e-limsup (f n)* ≤ g*` under a boundedness condition that proper closed convex
limits supply, with Tau Ceti's Fenchel–Moreau theorem `f** = f` closing the argument.

Write (a) for epi-convergence, (b) for the condition of Attouch's theorem and (c) for that of the
proximal headline, as in Rockafellar–Wets' Thm 12.35. Proximal maps: for `(a) ⇒ (c)`, 2.1 makes
`f n` Γ-converge to `g` in Tau Ceti's sense, and the theorems of
`TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean` on the convergence of
Moreau–Yosida approximations and of resolvent steps under Γ-convergence, with moving base points
`z n → z`, give the convergence of envelopes and of proximal points (the resolvent steps, which
are unique by FirstOrderOptimization 3.2, so that convergence of subsequences is convergence).
Their equicoercivity hypothesis holds for all large `n` by Rockafellar–Wets, Ex 7.32(c), p. 265,
since the penalized functions are convex and epi-converge to a level-bounded limit, and the
finitely many remaining terms are each coercive. For `(c) ⇒ (a)`, Rockafellar–Wets' argument
(Thm 7.37, pp. 268–269): by the compactness of 2.1 every subsequence has an epi-convergent
subsequence, whose limit `h` is closed and convex by 2.1 and proper because its envelopes are the
finite limits of those of `f n`; `(a) ⇒ (c)` along it gives `P_λ h = P_λ g`, so `h - g` is a
constant by the envelope target, and the convergence of envelopes along `z n` makes it `0`. Since
every subsequence has a further subsequence epi-converging to `g`, so does the sequence.

Attouch: Rockafellar–Wets' reduction of (b) to (c) (p. 552), with `λ = 1`. By
FirstOrderOptimization 3.2, `p = P_1 f z` exactly when `z - p` is a subgradient of `f` at `p`, and
`P_1 f` is `1`-Lipschitz and defined everywhere; so the linear homeomorphism
`(z, p) ↦ (p, z - p)` of `H × H` maps the graph of `P_1 (f n)` onto that of the subdifferential of
`f n`, and likewise for `g`. For `1`-Lipschitz maps defined everywhere, graphical convergence is
pointwise convergence: if `(z n, P_1 (f n) (z n)) → (z, P_1 g z)`, then `P_1 (f n) z` is within
`‖z - z n‖` of `P_1 (f n) (z n)`, and conversely a graph point `(z k, P_1 (f (φ k)) (z k))`
tending to `(z, q)` forces `q = P_1 g z`. The value condition of (b) at graph points
`(u n, w n) → (x, v)` is the envelope condition of (c) at `z n = u n + w n`, since
`e_1 (f n) (z n) = f n (u n) + ‖w n‖² / 2`. The maximal monotonicity of limits of maximal monotone
maps (Rockafellar–Wets, Thm 12.32, p. 551) is not needed, since the limit is the given `g`.

*Needs:* 2.1, 2.3; Tau Ceti `TauCeti.fenchelConjugate`, `TauCeti.subdifferential`, and the
stability of Moreau–Yosida resolvents under Γ-convergence
(`TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean`); FirstOrderOptimization 3.2
(the proximal map: existence, uniqueness, nonexpansiveness and its subgradient description).

**Checks.**

- `f n x = sin (n x)` on `ℝ` epi-converges to the constant `-1` and has no pointwise limit; a
  recovery sequence at `x = 0.3` for `n = 1000` reaches `sin = -0.99999…` within `0.01` of `0.3`.
- Epi-limit and pointwise limit differ: `f n x = min 1 (n |x - 1/n|)` tends to `1` at every `x`,
  but its epi-limit is `0` at `0` and `1` elsewhere, with recovery sequence `u n = 1/n`
  (`f n (1/n) = 0`).
- `f n x = n x²` epi-converges to the indicator of `{0}`, here also the pointwise limit.
- Antitone: `f n x = x² + 1/n` epi-converges to `x²`.
- Negative control for the hulls in 2.2: the nondecreasing indicators of `(0, 1/n)` (value `0`
  there, `⊤` elsewhere) have supremum `⊤` everywhere, whose hull is `⊤`, while their epi-limit is
  the supremum of the indicators of `[0, 1/n]`, the indicator of `{0}`.
- Negative control for the interior hypothesis in 2.3: `f n x = n |x|` converges pointwise to `⊤`
  on the dense set `x ≠ 0`, and `⊤` is convex and lower semicontinuous with empty domain, but the
  epi-limit is the indicator of `{0}`.
- Wijsman: `f n x = (x - 1/n)²/2` epi-converges to `x²/2`, and the conjugates `y²/2 + y/n`
  converge to `y²/2` (at `y = 0.7`: `0.945` for `n = 1`, `0.315` for `n = 10`).
- Negative control for convexity in Wijsman's theorem: the constant sequence `f n` the indicator
  of `{-1, 1}` has conjugate `|y|`, the conjugate of the indicator of `[-1, 1]`, so the conjugates
  converge to that of `g` the indicator of `[-1, 1]`, while `f n` does not epi-converge to `g`.
- Attouch: `f n x = n x²/2` epi-converges to the indicator of `{0}`; the graphs `{(x, n x)}`
  converge to `{0} × ℝ`, the graph of its subdifferential (the distance from `(0, 2)` to the
  `n`-th graph is `0.199`, `0.020`, `0.002` for `n = 10, 100, 1000`), and the graph points
  `(0, 0)` have values `0`.
- Negative control for the normalization in Attouch's theorem: `f n = g + n` has the same
  subdifferential as `g` for every `n` but epi-converges to `⊤`.

### Examples

- Penalty methods: `f + n · dist(·, C)²` epi-converges to `f + δ_C` for `f` continuous and `C`
  closed, by 2.2 (the sequence is nondecreasing); with Tau Ceti's fundamental theorem of
  Γ-convergence this is the convergence of penalty methods.
- Moreau–Yosida regularizations of a proper closed convex function increase to it, so they
  epi-converge to it by 2.2, and their subdifferentials converge graphically by Attouch's theorem.

### Dependencies

Layer 1; Tau Ceti conjugate, subdifferential, Fenchel–Moreau and Moreau–Yosida resolvents;
FirstOrderOptimization 3.2.

## Layer 3: Clarke's generalized gradient

Clarke's theory on a real normed space: the generalized directional derivative of a function
Lipschitz near a point, the generalized gradient as the set it supports, and the calculus rules,
all proved by estimating upper limits of difference quotients. Clarke works in a Banach space;
except for the equality case of the chain rule, the proofs use no completeness.

### 3.1 The generalized directional derivative and gradient

- **Definitions** (`clarkeDirDeriv`, `clarkeSubdiff`). `clarkeDirDeriv f x v` is the upper limit
  in `EReal` of `(f (y + t • v) - f y) / t` as `y → x` and `t ↓ 0`, the filter
  `𝓝 x ×ˢ 𝓝[>] 0`; `clarkeSubdiff f x` is the set of `ζ : StrongDual ℝ E` with `ζ v ≤ f°(x; v)`
  for all `v` (Clarke, §10.1, p. 194, and Def 10.3, p. 196).
- **Properties of `f°`** (`clarkeDirDeriv_spec`). For `f` Lipschitz of rank `K` near `x`,
  `f°(x; ·)` is finite, `|f°(x; v)| ≤ K ‖v‖`, positively homogeneous, subadditive and
  `K`-Lipschitz; `(-f)°(x; v) = f°(x; -v)`; and `(u, w) ↦ f°(u; w)` is upper semicontinuous at
  every `(x, v)` (Clarke, Prop 10.2, p. 195).
- **The generalized gradient** (`clarkeSubdiff_spec`). For `f` Lipschitz of rank `K` near `x`,
  `clarkeSubdiff f x` is nonempty, convex, contained in the closed ball of radius `K`, and
  compact in the weak-star topology, and `f°(x; v)` is the largest value of `ζ v` over it
  (Clarke, Def 10.3 and Prop 10.5, p. 196).
- The graph of `clarkeSubdiff f` is closed for the norm topology on the dual, and weak-star limit
  points of generalized gradients at `xᵢ → x` are generalized gradients at `x` (Clarke,
  Prop 10.10, p. 199). This is a target in prose.

*Proof route.* For 3.1 follow Clarke's proof, which uses only the Lipschitz bound on the
quotients. For the gradient, `f°(x; ·)` is a real sublinear function bounded on the unit ball;
Hahn–Banach (Mathlib `exists_extension_of_le_sublinear`) gives for each `v` an element attaining
`f°(x; v)`, and Banach–Alaoglu (Mathlib `WeakDual.isCompact_polar`) gives weak-star compactness of
the closed subset of the ball.

*Needs:* Mathlib `Filter.limsup`, `LipschitzOnWith`, `StrongDual.toWeakDual`,
`exists_extension_of_le_sublinear`, `WeakDual.isCompact_polar`.

### 3.2 Smooth and convex functions

- **Derivatives** (`mem_clarkeSubdiff_of_hasFDerivAt_and_eq_of_hasStrictFDerivAt`). If `f` has
  Fréchet derivative `f'` at `x`, then `f' ∈ clarkeSubdiff f x`; no Lipschitz hypothesis is
  needed, as for Fermat's rule in 3.3. If `f` is strictly differentiable at `x`, then
  `clarkeSubdiff f x = {f'}` (Clarke, Ex 10.4, p. 196, for Gâteaux derivatives of `f` Lipschitz
  near `x`, and Thm 10.8, p. 197, for continuously differentiable `f`; Rockafellar–Wets,
  Thm 9.18, p. 362, for strict differentiability in `ℝⁿ`).
- **Convex functions** (`clarkeSubdiff_eq_subdifferential_of_convexOn`). For a real convex `f`
  on a normed space continuous at `x`, `clarkeSubdiff f x` is the convex subdifferential
  `subdifferential (topDualPairing ℝ E).flip (fun y => (f y : EReal)) x`, and `f°(x; v)` is the
  one-sided directional derivative of ConvexAnalysisAndDuality 3.1 (Clarke, Thm 10.8, p. 197).
- A function is *regular* at `x` when it is Lipschitz near `x` and its one-sided directional
  derivatives exist and equal `f°(x; ·)`; continuously differentiable functions and convex
  functions continuous at `x` are regular, and `-|·|` is not regular at `0` (Clarke, Def 10.12,
  p. 199). The definition and these facts are targets in prose.

*Proof route.* For the derivative: along `y = x` the quotient tends to `f' v`, and the filter
`pure x ×ˢ 𝓝[>] 0` of these quotients is finer than `𝓝 x ×ˢ 𝓝[>] 0`, so `f' v ≤ f°(x; v)`;
under strict differentiability `(f (y + t • v) - f y) / t → f' v` as `(y, t) → (x, 0⁺)`, so
`f°(x; v) = f' v` and 3.1 leaves only `f'`. For the convex case, Clarke's proof: by monotonicity
of the convex quotient in `t`, the upper limit is attained along `y = x`, so `f°(x; v)` is the
directional derivative; then the max formula of ConvexAnalysisAndDuality 3.2 shows that the two
sets have the same support function.

*Needs:* 3.1; Mathlib `HasStrictFDerivAt`, `HasStrictFDerivAt.exists_lipschitzOnWith`; Tau Ceti
`TauCeti.subdifferential`; ConvexAnalysisAndDuality 3.1 (the directional derivative, of which
`dirDeriv` is a local copy) and 3.2 (the max formula).

### 3.3 Fermat's rule, the sum rule and the mean value theorem

- **Fermat's rule** (`zero_mem_clarkeSubdiff`). At a local minimum or a local maximum of `f`,
  `0 ∈ clarkeSubdiff f x`; no Lipschitz hypothesis is needed (Clarke, Ex 10.7(a), p. 197, for
  locally Lipschitz `f`).
- **Sum rule** (`clarkeSubdiff_add_subset`). For `f`, `g` Lipschitz near `x`,
  `clarkeSubdiff (f + g) x ⊆ clarkeSubdiff f x + clarkeSubdiff g x` (Clarke, Thm 10.13, p. 200).
- Equality holds in the sum rule when `f` and `g` are regular at `x` (Clarke, Thm 10.13, p. 200),
  and `clarkeSubdiff (c • f) x = c • clarkeSubdiff f x` for every real `c`, in particular
  `clarkeSubdiff (-f) x = -clarkeSubdiff f x` (Clarke, Prop 10.11, p. 199). These are targets in
  prose.
- **Lebourg's mean value theorem** (`exists_mem_clarkeSubdiff_eq_sub`). If `f` is Lipschitz on an
  open set containing the segment `[x, y]`, there are `z` in the open segment and
  `ζ ∈ clarkeSubdiff f z` with `f y - f x = ζ (y - x)` (Clarke, Thm 10.17, p. 201).

*Proof route.* Fermat: at a local minimum the quotients along `y = x` are eventually
nonnegative, and at a local maximum so are those along `y = x - t • v`; both are restrictions of
the filter `𝓝 x ×ˢ 𝓝[>] 0`, along which the upper limit can only decrease. Sum rule: the upper
limit of a sum is at most the sum of the upper limits, and two weak-star compact convex sets are
ordered by their support functions. Lebourg: Clarke's proof, applying Fermat's rule to
`t ↦ f (x + t • (y - x)) + t (f x - f y)` on `[0, 1]`, which has an interior extremum, with the
one-variable chain rule.

*Needs:* 3.1.

### 3.4 Chain and max rules

- **Chain rule** (`clarkeSubdiff_comp_subset_and_eq`). On Banach spaces, for `F` strictly
  differentiable at `x` with derivative `A` and `g` Lipschitz near `F x`, every generalized
  gradient of `g ∘ F` at `x` is `ζ.comp A` for a generalized gradient `ζ` of `g` at `F x`, and
  equality holds when `A` is surjective (Clarke, Thm 10.19, p. 202, for `F` continuously
  differentiable near `x`).
- **Max rule** (`clarkeSubdiff_iSup_eq_convexHull`). For finitely many functions `f i` strictly
  differentiable at `x` with derivatives `f' i`, the generalized gradient of `y ↦ ⨆ i, f i y` at
  `x` is the convex hull of the `f' i` over the indices active at `x` (Clarke, Cor 10.23, p. 206,
  for continuously differentiable `f i`).

*Proof route.* Chain rule: Clarke's proof uses `F` only through
`(F (y + t • v) - F y) / t → A v` as `(y, t) → (x, 0⁺)`, which is strict differentiability; the
equality case uses the open mapping theorem for `A`. Max rule: for `y` near `x` only indices
active at `x` attain the maximum at `y` (continuity at `x` of the `f i`), so
`f (y + t • v) - f y ≤ f k (y + t • v) - f k y` for an index `k` active at `x` attaining the
maximum at `y + t • v`, and strict differentiability gives
`f°(x; v) ≤ max {f' i v | i active}`; the reverse inequality holds along `y = x`. The convex
hull of a finite set is compact, and 3.1 identifies the two sets.

*Needs:* 3.1–3.3; Mathlib `HasStrictFDerivAt`, `convexHull`, the open mapping theorem
`ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective`.

### 3.5 Clarke's gradient formula

- **Gradient formula** (`clarkeSubdiff_eq_convexHull_limits`). On a finite-dimensional real
  normed space with an additive Haar measure `μ`, for `f` Lipschitz near `x` and any set `S` with
  `μ S = 0`, `clarkeSubdiff f x` is the convex hull of the limits of `fderiv ℝ f (u n)` along
  sequences `u n → x` of points of differentiability of `f` outside `S` (Clarke, Thm 10.27,
  p. 208; Rockafellar–Wets, Thm 9.61, pp. 403–404, with `S = ∅`).

*Proof route.* By Rademacher's theorem (Mathlib `LipschitzOnWith.ae_differentiableWithinAt`, or
`LipschitzWith.ae_differentiableAt` after a Lipschitz extension) the points of differentiability
outside `S` have full measure near `x`. The set of limits is compact by the Lipschitz bound, so
its convex hull is compact and convex. Its support function is at most `f°(x; ·)` by 3.2, and at
least by Clarke's argument: for `v` fixed, integrate the directional derivatives along almost
every segment `y + [0, t] v`, Fubini choosing segments that meet the bad set in a null set.

*Needs:* 3.1, 3.2; Mathlib `LipschitzWith.ae_differentiableAt`,
`LipschitzOnWith.ae_differentiableWithinAt`, `MeasureTheory.Measure.IsAddHaarMeasure`.

**Checks.**

- `f = |·|` on `ℝ`: `f°(0; v) = |v|` and `clarkeSubdiff f 0 = [-1, 1]` (numerically `1.0` at
  `v = ±1`).
- `f = -|·|`: `f°(0; v) = |v|` again (numerically `1.0` at `v = ±1`) and `clarkeSubdiff f 0` is
  `[-1, 1]`, by `(-f)°(x; v) = f°(x; -v)`; the one-sided derivative at `0` in direction `1` is
  `-1 < 1`, so `-|·|` is not regular at `0`.
- Negative control for the base point: the variant that freezes `y = x`, the upper one-sided
  derivative, gives `-|v|` for `-|·|` at `0`, which is not sublinear and supports no set.
- `f x = x²` at `1`: `clarkeSubdiff f 1 = {2}`.
- Fermat at a maximum: `0 ∈ [-1, 1] = clarkeSubdiff (-|·|) 0`.
- Strict sum rule: `|·| + (-|·|) = 0` has `clarkeSubdiff = {0}`, while the sum of the gradients is
  `[-2, 2]`.
- Lebourg: for `|·|` on `[-1, 2]`, `f 2 - f (-1) = 1 = (1/3) · 3`, attained only at `z = 0` with
  `ζ = 1/3 ∈ [-1, 1]`; no point has derivative `1/3`, so the classical mean value theorem fails.
- Max rule: `max (y₁, y₂)` on `ℝ²` at `0` has gradient the segment from `e₁*` to `e₂*`, and
  `f°(0; v) = max (v₁, v₂)` (numerically at `v = (1, 0)`, `(-1, -2)`, `(1, -3)`: `1`, `-1`, `1`).
- Negative control for surjectivity in the chain rule: for `F t = (t, t)` and
  `g y = |y₁| - |y₂|`, `g ∘ F = 0` has gradient `{0}`, while the image of
  `clarkeSubdiff g 0 = [-1, 1]²` under `ζ ↦ ζ.comp A` is `[-2, 2]`.
- Gradient formula: for `|·|` at `0` the limits of derivatives are `±1`, with hull `[-1, 1]`.

### Examples

- The distance function to a closed set `S` is `1`-Lipschitz, and Clarke's tangent cone to `S` at
  `x` is `{v | f°(x; v) = 0}` for `f = Metric.infDist · S`; it is a closed convex cone. The cone
  and its polar are listed under
  [Beyond](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).
- The largest eigenvalue of a symmetric matrix is a maximum of linear functions of the matrix;
  the max rule in its compact-index form is Danskin's theorem, ConvexAnalysisAndDuality 3.4.

### Dependencies

Mathlib calculus, Hahn–Banach, Banach–Alaoglu and Rademacher; Tau Ceti subdifferential;
ConvexAnalysisAndDuality 3.1–3.2.

## Layer 4: metric regularity

Metric regularity measures how far a point is from solving an inclusion `y ∈ F x` by the
residual `d(y, F x)`. Its theory is metric: Ekeland's principle drives the perturbation theorem,
and Graves' iteration its classical case.

### 4.1 Metric regularity and the Aubin property

- **Definitions** (`MetricallyRegularAt`, `HasAubinPropertyAt`). `MetricallyRegularAt F x₀ y₀ κ`
  holds when `y₀ ∈ F x₀` and, for `(x, y)` near `(x₀, y₀)`,
  `infEDist x (F⁻¹ y) ≤ κ * infEDist y (F x)`; `HasAubinPropertyAt S y₀ x₀ κ` holds when
  `x₀ ∈ S y₀` and there are neighbourhoods `U` of `x₀` and `V` of `y₀` such that every point of
  `S y' ∩ U` is within `κ * edist y' y` of `S y`, for `y, y' ∈ V` (Dontchev–Rockafellar, §3E,
  p. 164 for metric regularity and p. 159 for the Aubin property; Rockafellar–Wets, Def 9.36,
  pp. 376–377).
- **Equivalence** (`metricallyRegularAt_iff_hasAubinPropertyAt`). On metric spaces, for
  `0 < κ`, `F` is metrically regular at `x₀` for `y₀` with modulus `κ` exactly when its inverse
  has the Aubin property at `y₀` for `x₀` with modulus `κ` (Dontchev–Rockafellar, Thm 3E.6,
  p. 165, in finite dimension, and Thm 5A.3, p. 255, on Banach spaces; Ioffe, Prop 2.10, p. 43,
  on metric spaces).
- Both are equivalent to linear openness, `ball (y, ε / κ) ∩ V ⊆ F (ball (x, ε))` for `x` near
  `x₀` and `y ∈ F x` near `y₀` and small `ε` (Dontchev–Rockafellar, Thm 5A.3, p. 255;
  Rockafellar–Wets, Thm 9.43(c), p. 386). This is a target in prose.

*Proof route.* Metric regularity gives the Aubin property directly, since `y' ∈ F x` bounds
`d(y, F x)` by `d(y, y')`. Conversely, for `x` and `y` in small enough balls, a near-optimal
`y' ∈ F x` either lies in `V`, and the Aubin property applies, or is far from `y`, and then
`d(x, F⁻¹ y) ≤ d(x, x₀) + κ d(y₀, y)` is below `κ d(y, F x)`; this last step needs `κ > 0`.

*Needs:* Mathlib `Metric.infEDist`.

### 4.2 The Lyusternik–Graves theorem

- **Perturbation** (`MetricallyRegularAt.add_lipschitzOnWith`). Let `X` be a complete metric
  space and `G` a normed group, `F : X → Set G` metrically regular at `x₀` for `y₀` with modulus
  `κ` and with graph locally closed at `(x₀, y₀)`, and `g` Lipschitz with constant `μ` near `x₀`,
  with `κ μ < 1`. Then `x ↦ g x + F x` is metrically regular at `x₀` for `g x₀ + y₀` with every
  modulus `κ' > κ / (1 - κ μ)` (Dontchev–Rockafellar, Thm 5E.1, p. 280).
- **Strictly differentiable maps** (`metricallyRegularAt_of_hasStrictFDerivAt`). If `f` from a
  Banach space to a normed space is strictly differentiable at `x₀` with derivative `A`, and `A`
  has a right inverse with bound `c` in the sense of Mathlib's
  `ContinuousLinearMap.NonlinearRightInverse`, then `f` is metrically regular at `x₀` for `f x₀`
  with every modulus `κ > c` (Dontchev–Rockafellar, Thm 5D.2, p. 276, and Thm 5D.5, p. 279;
  Ioffe, Thm 1.20, p. 11).
- The regularity modulus of a strictly differentiable `f` equals that of its derivative, and a
  surjective bounded linear map between Banach spaces always has such a right inverse
  (Dontchev–Rockafellar, Thm 5D.5, p. 279). This is a target in prose.

*Proof route.* Perturbation: Dontchev–Rockafellar's first proof, an iteration in the complete
space `X` controlled by the Aubin property of the inverse; alternatively, Ekeland's principle (Tau
Ceti `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`) applied to
`x ↦ d(y, g x + F x)` on a closed ball. Strictly differentiable maps: the linear map `A` is
metrically regular with modulus `c` everywhere, since `d(x, A⁻¹ y) ≤ c ‖y - A x‖` through the right
inverse; apply the perturbation theorem with `F = A` and `g = f - A`, whose Lipschitz constant
near `x₀` tends to `0` by strict differentiability (Mathlib
`HasStrictFDerivAt.approximates_deriv_on_nhds`). Mathlib's Graves theorem
`ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse` is the openness half of this
statement.

*Needs:* 4.1; Tau Ceti `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`; Mathlib
`ContinuousLinearMap.NonlinearRightInverse`,
`ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`,
`HasStrictFDerivAt.approximates_deriv_on_nhds`.

### 4.3 The Robinson–Ursescu theorem

- **Robinson–Ursescu** (`mem_interior_range_iff_exists_metricallyRegularAt`). For a set-valued
  map `T` between Banach spaces with closed convex graph and `y₀ ∈ T x₀`, `T` is metrically
  regular at `x₀` for `y₀` with some modulus exactly when `y₀` is an interior point of the range
  of `T` (Dontchev–Rockafellar, Thm 5B.4, p. 263; Ioffe, Thm 6.23, p. 260; Rockafellar–Wets,
  Thm 9.48, p. 390, in finite dimension).
- The Banach open mapping theorem is the case of a bounded linear map, whose graph is a closed
  subspace (Dontchev–Rockafellar, p. 264, derivation of Thm 5A.1 from Thm 5B.4); Mathlib has the
  open mapping theorem, which is not restated.

*Proof route.* Dontchev–Rockafellar's proof: Baire's theorem makes `cl T (ball (x₀, 1))` a
neighbourhood of `y₀`, convexity and completeness remove the closure (the Robinson–Ursescu lemma),
and the resulting openness at a linear rate around every nearby graph point is metric regularity
by 4.1. The converse: metric regularity makes `T⁻¹ y` nonempty for `y` near `y₀`.

*Needs:* 4.1; Mathlib `BaireSpace`, `Convex`.

### 4.4 Hoffman's error bound

- **Hoffman's bound** (`exists_infDist_le_mul_norm_posPart`). For a real `m × n` matrix `A` there
  is a constant `L` such that for every `b` with `{x | A x ≤ b}` nonempty and every `x`,
  `infDist x {x' | A x' ≤ b} ≤ L ‖(A x - b)₊‖` (Dontchev–Rockafellar, Lemma 3C.4, p. 150; Hoffman,
  1952). The constant does not depend on `b`.
- The homogeneous case, with a cone in place of the polyhedron and arbitrary test functionals in
  place of a norm, is proved in Tau Ceti `TauCeti/Geometry/Convex/Cone/ErrorBound.lean` and is
  not restated.

*Proof route.* Dontchev–Rockafellar's proof: for `x` outside the solution set, the nearest point
`u` satisfies `x - u = Aᵀ λ` with `λ ≥ 0` supported on the active rows at `u`; choosing
`λ` on a linearly independent subfamily of active rows (Carathéodory's theorem for cones) bounds
`|λ|` by a constant of that subfamily, and there are finitely many subfamilies.

*Needs:* Mathlib `Metric.infDist`, `Matrix.mulVec`, `convexHull_eq_union`.

**Checks.**

- `F x = {x}` on `ℝ` is metrically regular at `0` with modulus `1`, and its inverse has the Aubin
  property with modulus `1`.
- Negative control for the residual: `F x = {x²}` is not metrically regular at `0`: at `x = 0`,
  `d(0, F⁻¹ y) = √y` while `d(y, F 0) = y`, with ratio `10`, `100`, `1000` at
  `y = 10⁻², 10⁻⁴, 10⁻⁶`.
- Negative control for `0 < κ` in 4.1: for `F 0 = ℝ` and `F x = ∅` otherwise, the inverse
  `F⁻¹ y = {0}` has the Aubin property with modulus `0`, but `F` is not metrically regular with
  modulus `0`, since at `x ≠ 0` the inequality reads `|x| ≤ 0 * ⊤ = 0`; with every `κ > 0` it is.
- Lyusternik–Graves: `f x = x + x²/2` at `0` with `A = id`, `c = 1`: the ratio
  `d(x, f⁻¹ y) / |y - f x|` over `|x|, |y| ≤ 10⁻³` is at most `1.0011` (its largest value,
  `1.0010013`, is at `x = y = -10⁻³`), so every `κ > 1` works, and no `κ < 1` does.
- Robinson–Ursescu: `T x = [x, ∞)` on `ℝ` has closed convex graph and range `ℝ`, so it is
  metrically regular at every graph point.
- Negative control for interiority: `T x = [|x|, ∞)` has closed convex graph and range
  `[0, ∞)`; at `(0, 0)` it is not metrically regular, since for `y < 0` the set `T⁻¹ y` is empty
  while `d(y, T 0) = |y|`.
- Hoffman: for `A = (1, -1)ᵀ` the solution set of `A x ≤ b` is `[-b₂, b₁]`, and
  `d(x, [-b₂, b₁]) = ‖(A x - b)₊‖` with the sup norm, so `L = 1`; random sampling of `b` and `x`
  gives largest ratio exactly `1`.
- Negative control for linearity in Hoffman's bound: `x² ≤ 0` has solution set `{0}`, and
  `d(x, {0}) / (x²)₊ = 1/|x|` is unbounded (`1000` at `x = 10⁻³`).

### Examples

- Feasible sets of smooth constraints: `{x | g x ∈ K}` for `g` strictly differentiable and a
  closed convex cone `K`, under Robinson's constraint qualification, is the zero set of a map
  `x ↦ g x - K` that is metrically regular by 4.2 and 4.3; the distance to the feasible set is
  then bounded by the constraint violation.
- The inverse of a metrically regular map is a set-valued Lipschitz object even where it has no
  single-valued localization: `F x = {x₁ + x₂}` from `ℝ²` to `ℝ` is metrically regular, and
  `F⁻¹ y` is a line.

### Dependencies

Tau Ceti Ekeland principle; Mathlib Graves theorem, open mapping theorem and Baire category.

## Layer 5: limiting normals, subgradients and coderivatives

The limiting calculus of Mordukhovich and Rockafellar–Wets in finite dimension: normals and
subgradients defined by outer limits of their regular (Fréchet) versions, calculus rules under
qualification conditions stated with the same limiting objects, the extremal principle, and the
coderivative criterion for metric regularity.

### 5.1 Normal cones

- **Definitions** (`regularNormalCone`, `limitingNormalCone`). For `x ∈ C`, `v` is a regular
  normal when `v (y - x) ≤ ε ‖y - x‖` for `y ∈ C` near `x`, for every `ε > 0`; it is a limiting
  normal when it is a limit of regular normals at points of `C` tending to `x`
  (Rockafellar–Wets, Def 6.3, p. 199; Mordukhovich, Def 1.1, p. 4). Both are empty at points
  outside `C`.
- **Polarity and closedness** (`regularNormalCone_eq_polar_and_isClosed_limitingNormalCone`).
  The regular normal cone is the polar of Mathlib's one-sided tangent cone `posTangentConeAt C x`,
  hence a closed convex cone; the limiting normal cone is closed and contains it
  (Rockafellar–Wets, Prop 6.5, p. 200).
- **Convex sets** (`regularNormalCone_and_limitingNormalCone_eq_normalCone`). For a convex set,
  both cones are the normal cone of convex analysis, `normalCone C x` (Rockafellar–Wets, Thm 6.9,
  p. 203).

*Proof route.* Polarity: a direction `w = lim tₙ (yₙ - x)` with `yₙ ∈ C` pairs with a regular
normal to at most `ε ‖w‖` for every `ε`; conversely, if `v` is not a regular normal, a sequence
`yₙ → x` in `C` with `v (yₙ - x) > ε ‖yₙ - x‖` has normalized differences converging, in finite
dimension, to a tangent direction `w` with `v w ≥ ε`. Closedness of the limiting cone is a
diagonal argument. Convex sets: on a convex set the regular normal inequality at `x` scales from
`y` near `x` to every `y ∈ C`, and normals at nearby points converge to normals at `x`.

*Needs:* 1.1; Mathlib `posTangentConeAt`; `normalCone`, the local copy of
[VariationalMethods](../VariationalMethods/README.md) §2.1.

### 5.2 Subgradients

- **Definitions** (`regularSubdiff`, `limitingSubdiff`, `horizonSubdiff`). At a point where `f`
  is finite, `v` is a regular subgradient when `f y ≥ f x + v (y - x) - ε ‖y - x‖` near `x` for
  every `ε > 0`; a limiting subgradient when it is a limit of regular subgradients `w n` at points
  `u n → x` with `f (u n) → f x`; and a horizon subgradient when it is a limit of `c n • w n` for
  such `w n` and `c n ↓ 0` (Rockafellar–Wets, Def 8.3, p. 301; Mordukhovich, Def 1.77, p. 82).
- **Smooth functions**
  (`regularSubdiff_eq_of_hasFDerivAt_and_limitingSubdiff_eq_of_hasStrictFDerivAt`).
  If `f` has derivative `f'` at `x`, its regular subdifferential at `x` is `{f'}`; if `f` is
  strictly differentiable at `x`, its limiting subdifferential at `x` is `{f'}`
  (Rockafellar–Wets, Ex 8.8(a), p. 304, and Thm 9.18, p. 362).
- **Convex functions** (`regularSubdiff_and_limitingSubdiff_eq_subdifferential`). For a convex
  `f` that never takes `⊥`, at a point where it is finite, the regular and the limiting
  subdifferential are the convex subdifferential
  `subdifferential (topDualPairing ℝ E).flip f x` (Rockafellar–Wets, Prop 8.12, p. 308).
- **Fermat's rule** (`zero_mem_regularSubdiff_and_limitingSubdiff`). At a local minimum where `f`
  is finite, `0` is a regular, hence a limiting, subgradient (Rockafellar–Wets, Thm 10.1, p. 422).
- **Clarke's gradient** (`clarkeSubdiff_eq_convexHull_limitingSubdiff`). For `f` Lipschitz near
  `x`, `clarkeSubdiff f x` is the convex hull of the limiting subdifferential of `f` at `x`
  (Rockafellar–Wets, Thm 9.61, pp. 403–404; Clarke, Prop 11.23, p. 238).
- **Epigraphical normals.** If `f` is finite at `x`, then `v` is a limiting subgradient of `f` at
  `x` exactly when `(v, -1)` is a limiting normal to the real epigraph of `f` at `(x, f x)`, and
  every horizon subgradient `v` gives a limiting normal `(v, 0)` there; if `f` is moreover lower
  semicontinuous at the points near `x`, the horizon subgradients are exactly the `v` with
  `(v, 0)` a limiting normal (Rockafellar–Wets, Thm 8.9, pp. 304–305). This is a target in prose.
- **Indicators.** For `x ∈ C`, the regular subdifferential of the indicator of `C` (`0` on `C`,
  `⊤` elsewhere) at `x` is the regular normal cone, and its limiting and its horizon
  subdifferential are both the limiting normal cone (Rockafellar–Wets, Ex 8.14, p. 310). This is a
  target in prose; it follows from the definitions, the horizon case because the regular normal
  cones are cones, so that `c n • w n` runs through the regular normals as `w n` does.

*Proof route.* Smooth functions: differentiability gives the regular subgradient inequality with
`f'`, and two regular subgradients at a point of differentiability coincide; under strict
differentiability, regular subgradients at nearby points are within any `ε` of `f'`. Convex
functions: the regular inequality at `x` scales to the global subgradient inequality by
convexity along segments, and limits of subgradients at nearby points with converging values are
subgradients. Clarke's gradient: the limits of derivatives
in 3.5 are limiting subgradients, which gives `⊆` from 3.5; limiting subgradients are Clarke
gradients by the closedness of 3.1 and `regularSubdiff ⊆ clarkeSubdiff`, which gives `⊇`.

*Needs:* 3.1, 3.5, 5.1; Tau Ceti `TauCeti.subdifferential`.

### 5.3 Calculus under qualification conditions

- **Sum rule** (`limitingSubdiff_add_subset`). For lower semicontinuous `f₁`, `f₂` that never take
  `⊥` and are finite at `x`, if `v ∈ ∂^∞f₁(x)` and `-v ∈ ∂^∞f₂(x)` force `v = 0`, then the
  limiting subdifferential of `f₁ + f₂` at `x` is contained in the sum of those of `f₁` and `f₂`,
  and the same holds for horizon subdifferentials (Rockafellar–Wets, Cor 10.9, p. 430).
- Without any qualification, a sum of regular subgradients of `f₁` and `f₂` at `x` is a regular
  subgradient of `f₁ + f₂` (Rockafellar–Wets, Cor 10.9, p. 430). This is a target in prose. For
  convex functions the qualification holds when the domains cannot be separated, and the rule
  becomes the sum rule of ConvexAnalysisAndDuality 3.6.
- **Chain rule** (`limitingSubdiff_comp_subset`). For `g` lower semicontinuous, never `⊥` and
  finite at `F x`, and `F` continuously differentiable near `x`, if the only horizon subgradient
  `y` of `g` at `F x` with `y.comp (fderiv ℝ F x) = 0` is `0`, then the limiting and the horizon
  subdifferentials of `g ∘ F` at `x` are contained in the images of those of `g` at `F x` under
  `y ↦ y.comp (fderiv ℝ F x)` (Rockafellar–Wets, Thm 10.6, p. 427, for `F` smooth on the whole
  space).
- **Intersections** (`limitingNormalCone_inter_subset`). For closed `C`, `D` with
  `x ∈ C ∩ D`, if `v ∈ N_C(x)` and `-v ∈ N_D(x)` force `v = 0`, then
  `N_{C ∩ D}(x) ⊆ N_C(x) + N_D(x)` for the limiting normal cones (Rockafellar–Wets, Thm 6.42,
  p. 228; Mordukhovich, Thm 3.4, pp. 266–267, in Asplund spaces).

*Proof route.* Rockafellar–Wets derive the sum rule from the chain rule with
`F x = (x, x)` and `g (y₁, y₂) = f₁ y₁ + f₂ y₂`. The chain rule: a regular subgradient of `g ∘ F`
at `u` is, by a penalization argument and Fermat's rule 5.2, approximately
`y.comp (fderiv ℝ F u)` for a regular subgradient `y` of `g` near `F u`; the qualification keeps
these `y` bounded as `u → x`, and the limit gives the inclusion. Only the behaviour of `F` near
`x` enters, which is why `ContDiffAt ℝ 1 F x` suffices. Intersections: the indicator of `C ∩ D`
is the sum of the indicators of `C` and `D`, which are lower semicontinuous, never `⊥` and `0` at
`x`; by the indicator target of 5.2 the qualification of the sum rule is the hypothesis on
normals, and its conclusion is the inclusion. This is an adaptation: Rockafellar–Wets derive the
rule from their normal cone formula for inverse images under smooth maps (Thm 6.14, pp. 208–210)
applied to `x ↦ (x, x)` and `C × D` (Prop 6.41, p. 227), and Mordukhovich from the extremal
principle (Lemma 3.1, p. 262).

*Needs:* 5.1, 5.2; Mathlib `ContDiffAt`, `fderiv`.

### 5.4 The extremal principle, the Mordukhovich criterion and Lipschitz continuity

- **Definition** (`coderivative`). For a set-valued map `F` between finite-dimensional spaces and
  `(x, y)` in its graph, `v ∈ coderivative F x y w` when `v.coprod (-w)` is a limiting normal to
  the graph at `(x, y)` (Rockafellar–Wets, Def 8.33, p. 324).
- **Extremal principle** (`exists_ne_zero_mem_limitingNormalCone_of_extremal`). If closed sets
  `C`, `D` meet at `x` and there are translations `a k → 0` with `(C - a k) ∩ D ∩ U = ∅` for a
  neighbourhood `U` of `x` and all large `k`, then some `v ≠ 0` has `v ∈ N_C(x)` and
  `-v ∈ N_D(x)` (Mordukhovich, Def 2.1, p. 172, Def 2.5, pp. 174–175, and Thm 2.8, p. 178;
  Rockafellar–Wets, Prop 9.69(c), p. 414).
- **Mordukhovich criterion** (`exists_metricallyRegularAt_iff_coderivative`). A set-valued map
  between finite-dimensional spaces with graph locally closed at `(x₀, y₀)` is metrically regular
  at `x₀` for `y₀` with some modulus exactly when `0 ∈ coderivative F x₀ y₀ w` forces `w = 0`
  (Rockafellar–Wets, Thm 9.43, pp. 386–387; Dontchev–Rockafellar, Thm 4H.1, p. 246; Mordukhovich,
  Thm 4.18, p. 394).
- The regularity modulus is the outer norm of the inverse coderivative, and the Aubin property of
  `S` at `y₀` for `x₀` holds exactly when `coderivative S y₀ x₀ 0 = {0}` (Rockafellar–Wets,
  Thm 9.40, pp. 379–380, and Thm 9.43, p. 387; Dontchev–Rockafellar, Thm 4H.1, p. 246). These are
  targets in prose; the second is the criterion applied to `S⁻¹` through 4.1.
- **Lipschitz continuity** (`lipschitz_near_iff_horizonSubdiff_eq_zero`). If `f` is lower
  semicontinuous at the points near `x` and finite at `x`, then `f` is Lipschitz near `x` exactly
  when its horizon subdifferential at `x` is `{0}`, and then its limiting subdifferential at `x`
  is nonempty and compact (Rockafellar–Wets, Thm 9.13, pp. 358–359, where local lower
  semicontinuity is the weaker local closedness of the epigraph).

*Proof route.* Extremal principle: Mordukhovich's proof minimizes
`z ↦ (d(z + a k, C)² + d(z, D)²)^(1/2) + ‖z - x‖²` (Mordukhovich, display (2.10), p. 178), whose
minimizers tend to `x`; Fermat's rule 5.2 and the subdifferential of the distance function give
regular normals of norm about `1`, whose limits are the required `v`. Mordukhovich criterion:
for necessity, a nonzero `w` with `(0, -w)` a limiting normal to the graph contradicts the
linear openness of 4.1 through the extremal principle; for sufficiency, Rockafellar–Wets argue
through Ekeland's principle and the variational description of normals.

Lipschitz continuity: an adaptation; Rockafellar–Wets argue through regular subderivatives
(p. 359). A Lipschitz constant `K` of `f` near `x` bounds every regular subgradient near `x`
by `K`, so horizon limits vanish. Conversely, apply the Aubin form of the criterion to the
epigraphical map `S y = {α : ℝ | f y ≤ α}` at `x` for `f x`: its graph is the real epigraph,
locally closed at `(x, f x)` by the lower semicontinuity, and by the epigraphical-normal target
of 5.2 the coderivative `coderivative S x (f x) 0` is the horizon subdifferential, so `S` has the
Aubin property. With `y' = x` and `α = f x` the Aubin inequality bounds `f y` above by
`f x + κ ‖y - x‖` near `x`, which with lower semicontinuity at `x` makes `f` continuous at `x`;
then `α = f y'` gives `f y ≤ f y' + κ ‖y - y'‖` for `y, y'` near `x`. The limiting subdifferential
is closed and bounded by `K`, and nonempty because its convex hull is, by 5.2, the generalized
gradient of a Lipschitz extension of `f` from a ball about `x` (Mathlib
`LipschitzOnWith.extend_real`; both subdifferentials depend only on `f` near `x`), which is
nonempty by 3.1.

*Needs:* 3.1, 4.1, 5.1, 5.2; Tau Ceti
`LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`; Mathlib
`LipschitzOnWith.extend_real`.

**Checks.**

- The set `C = {(x, y) | y ≥ -|x|}` in `ℝ²`: at `0` the tangent cone is `C`, whose polar is
  `{0}`, so the regular normal cone is `{0}`; the limiting normal cone is the union of the rays
  through `(-1, -1)` and `(1, -1)`, which is not convex.
- Negative control for the limiting cone: the convex hull of the limiting normals in the previous
  Check is the cone between the two rays, which contains `(0, -1)`; `(0, -1)` is not a limit of
  regular normals at points of `C`.
- Regular normal cone of `[0, 1]` at `0`: `(-∞, 0]`, the polar of the tangent cone
  `[0, ∞)` given by `posTangentConeAt`, equal to the normal cone of convex analysis.
- `-|·|` at `0`: regular subdifferential `∅`, limiting subdifferential `{-1, 1}`, Clarke gradient
  `[-1, 1]`, the convex hull of the limiting one.
- `|·|` at `0`: regular and limiting subdifferential `[-1, 1]`, the convex subdifferential.
- Horizon subdifferential of `√|·|` at `0` is `ℝ`: regular subgradients `±1/(2√|x|)` at `x ≠ 0`
  scaled by `c n → 0` reach every real; `√|·|` is not Lipschitz near `0`.
- Horizon subdifferential of a function Lipschitz near `x` is `{0}`, for example `|·|` at `0`.
- Negative control for the qualification in the sum rule: `f₁ = -√x` on `[0, ∞)` and `⊤` elsewhere,
  `f₂ = -√(-x)` on `(-∞, 0]` and `⊤` elsewhere; `f₁ + f₂` is the indicator of `{0}`, whose
  limiting subdifferential at `0` is `ℝ`, while `f₁` and `f₂` have empty limiting
  subdifferentials at `0` (`f₁' x = -1/(2√x)` is `-5`, `-50`, `-500` at `x = 10⁻², 10⁻⁴, 10⁻⁶`),
  and their horizon subdifferentials `(-∞, 0]` and `[0, ∞)` violate the qualification.
- Extremal principle: `C = (-∞, 0]` and `D = [0, ∞)` in `ℝ` at `0`, translated by `a k = 1/k`, are
  pulled apart; `v = 1` has `v ∈ N_C(0) = [0, ∞)` and `-v ∈ N_D(0) = (-∞, 0]`.
- Mordukhovich criterion: for `F x = {x}` the normals to the graph at `(0, 0)` are the line
  through `(1, -1)`, so `(0, -w)` is normal only for `w = 0`, and `F` is regular; for
  `F x = {x²}` they are the line through `(0, 1)`, every `w` qualifies, and `F` is not regular,
  matching the second Check of Layer 4.

### Examples

- For `F x = {y | g x + y ∈ K}`-type constraint maps the Mordukhovich criterion becomes a dual
  constraint qualification; for smooth equality constraints `F x = {f x}` it is surjectivity of
  the derivative, and the criterion recovers 4.2 in finite dimension.
- Near a matrix `X` of rank exactly `r`, the set of `n × n` matrices of rank at most `r` is the
  zero set of a submersion, the Schur complement `D - C A⁻¹ B` of an invertible `r × r` block `A`
  of `X`; it is a smooth manifold of dimension `2 n r - r²` there, and its regular and limiting
  normal cones at `X` are the orthogonal complement of the tangent space, the matrices `Y` with
  `Uᵀ Y = 0` and `Y V = 0` for `U`, `V` bases of the column and row spaces of `X`, of dimension
  `(n - r)²` (Rockafellar–Wets, Ex 6.8, p. 203, for zero sets of submersions).

### Dependencies

Layers 1, 3 and 4; Tau Ceti subdifferential and Ekeland principle;
[VariationalMethods](../VariationalMethods/README.md) §2.1.

## Downstream consumers

- **OptimalTransport** §10.6 states Γ-convergence of energies and the stability of resolvents and
  flows; 2.1 identifies Γ-convergence with epi-convergence on first-countable spaces, and 2.3 and
  2.4 are the convex criteria for it.
- **VariationalMethods** §2.1 states first-order conditions on closed convex constraints with
  normal cones; 5.1–5.3 extend them to closed nonconvex constraints and lower semicontinuous
  energies in finite dimension.
- Nonsmooth multiplier rules, sensitivity of optimal values and solutions, and stability of
  variational inequalities rest on 4.1–4.3 and 5.3; they are listed under
  [Beyond](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Set convergence.** Outer and inner limits and Painlevé–Kuratowski convergence, their
   closedness and sequential description, compactness in second-countable spaces, the distance
   function criterion in proper metric spaces, the nearest-point criterion for closed convex sets
   in a Euclidean space, the Pompeiu–Hausdorff criterion under boundedness, and convexity of inner
   limits of convex sets.
2. **Epi-convergence.** Epi-convergence and its characterization by the liminf inequality and
   recovery sequences, with the identification with Tau Ceti's Γ-convergence; compactness; lower
   semicontinuity and convexity of epi-limits; monotone sequences; dense pointwise convergence and
   uniform convergence for convex functions; Wijsman's theorem; the gradient of the Moreau
   envelope, epi-convergence through proximal maps, and Attouch's theorem.
3. **Clarke's generalized gradient.** The generalized directional derivative and gradient with
   their basic properties and closed graph; agreement with strict derivatives and with convex
   subdifferentials; regularity; Fermat's rule; the sum rule with equality for regular functions
   and the scalar rule; Lebourg's mean value theorem; the chain rule and the max rule; Clarke's
   gradient formula.
4. **Metric regularity.** Metric regularity and the Aubin property, their equivalence and linear
   openness; the Lyusternik–Graves perturbation theorem and its form for strictly differentiable
   maps with the equality of moduli; the Robinson–Ursescu theorem; Hoffman's error bound.
5. **Limiting calculus.** Regular and limiting normal cones, their polarity, closedness and convex
   case; regular, limiting and horizon subgradients, their smooth and convex cases, Fermat's
   rule, Clarke's gradient as the convex hull of limiting subgradients, epigraphical normals and
   indicators; the sum rule, the chain rule and the intersection rule under qualification
   conditions, with the unconditional regular inclusion; coderivatives, the extremal principle
   and the Mordukhovich criterion, with the modulus formula and the Aubin property form, and the
   horizon characterization of Lipschitz continuity.

The numbers are those of the layers, and `k.n` names subsection `n` of Layer `k`.

**Not owned here.** The following are used, not built:

- separation, Hahn–Banach, Banach–Alaoglu, the open mapping theorem, Baire category, Rademacher's
  theorem, Mathlib's tangent cone `posTangentConeAt`, Graves' surjectivity theorem
  `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`, upper and lower
  hemicontinuity of set-valued maps, and the Pompeiu–Hausdorff distance: Mathlib;
- the convex conjugate and subdifferential, the Fenchel–Moreau theorem and Ekeland's variational
  principle: Tau Ceti;
- Γ-convergence, its neighbourhood form, lower semicontinuity of Γ-limits and the fundamental
  theorem of Γ-convergence (convergence of infima and of minimizers under equicoercivity): Tau
  Ceti `TauCeti/Topology/Semicontinuity/GammaConvergence.lean`, the implementation of
  OptimalTransport §10.6; stability of Moreau–Yosida resolvents under Γ-convergence: Tau Ceti
  `TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean`, used in 2.4. 2.1 builds the
  bridge, not these theorems;
- the homogeneous Hoffman bound: Tau Ceti `TauCeti/Geometry/Convex/Cone/ErrorBound.lean`; 4.4 is
  the inhomogeneous bound with a constant independent of the right-hand side;
- the normal cone of convex analysis: [VariationalMethods](../VariationalMethods/README.md) §2.1;
- convex calculus: the directional derivative and the max formula (ConvexAnalysisAndDuality
  3.1–3.2), the convex sum rules (its 3.5–3.6), Danskin's theorem (its 3.4), tangent and normal
  cones of convex sets with their polarity (its 3.7) and maximal monotonicity of subdifferentials
  (its 4.4). 5.1 and 5.2 prove that the nonconvex objects reduce to the convex ones, and do not
  re-derive convex calculus;
- the optimality conditions of smooth nonlinear programs (the Fritz John and Karush–Kuhn–Tucker
  theorems under constraint qualifications, Gauvin's theorem, second-order conditions):
  NonlinearProgrammingOptimality, which works with Mathlib's tangent cone and has no
  subdifferentials;
- the closed graph theorem for correspondences, Berge's maximum theorem and Kakutani's theorem:
  KakutaniFixedPointAndContinuousGames;
- the proximal map of a convex function (its existence, uniqueness, nonexpansiveness and
  subgradient description) and the convergence of first-order methods: FirstOrderOptimization,
  whose 3.2 is used in 2.4; 2.4 adds the envelope gradient and the behaviour of proximal maps
  under epi-convergence.

Every result that is not listed in a layer belongs to the
[boundary list](#beyond-this-roadmap-a-roadmap-for-a-roadmap-do-not-implement).

## Exact supplier contracts

### From Mathlib

- **Topology and filters:** `Filter.Frequently`, `Filter.Eventually`, `Filter.limsup`,
  `Filter.liminf`, `FirstCountableTopology`, `SecondCountableTopology`,
  `TopologicalSpace.exists_countable_basis`, `LowerSemicontinuous`, `UpperSemicontinuousAt`.
- **Metric spaces:** `Metric.infEDist`, `Metric.infDist`, `Metric.hausdorffEDist`
  (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean`), `ProperSpace`, `LipschitzOnWith`,
  `LipschitzWith`, `LipschitzOnWith.extend_real`.
- **Calculus:** `HasFDerivAt`, `HasStrictFDerivAt`, `HasStrictFDerivAt.exists_lipschitzOnWith`,
  `HasStrictFDerivAt.approximates_deriv_on_nhds`, `ContDiffAt`, `fderiv`,
  `posTangentConeAt` (`Mathlib/Analysis/Calculus/TangentCone/Defs.lean`),
  `IsLocalMin.hasFDerivAt_eq_zero`.
- **Graves and open mapping:** `ContinuousLinearMap.NonlinearRightInverse`,
  `ContinuousLinearMap.exists_nonlinearRightInverse_of_surjective`
  (`Mathlib/Analysis/Normed/Operator/Banach.lean`),
  `ApproximatesLinearOn.surjOn_closedBall_of_nonlinearRightInverse`
  (`Mathlib/Analysis/Calculus/InverseFunctionTheorem/ApproximatesLinearOn.lean`).
- **Duality:** `StrongDual`, `StrongDual.toWeakDual`, `topDualPairing`,
  `exists_extension_of_le_sublinear`, `WeakDual.isCompact_polar`.
- **Convexity:** `Convex`, `ConvexOn`, `convexHull`, `convexHull_eq_union`,
  `ConvexOn.locallyLipschitzOn_interior`, `norm_eq_iInf_iff_real_inner_le_zero`.
- **Measure:** `LipschitzWith.ae_differentiableAt` and
  `LipschitzOnWith.ae_differentiableWithinAt` (Rademacher,
  `Mathlib/Analysis/Calculus/Rademacher.lean`), `MeasureTheory.Measure.IsAddHaarMeasure`.
- **Matrices:** `Matrix.mulVec`.

### From Tau Ceti

- **Conjugate** (`TauCeti/Analysis/Convex/Conjugate.lean`): `TauCeti.fenchelConjugate`.
- **Subdifferential** (`TauCeti/Analysis/Convex/Subdifferential.lean`): `TauCeti.subdifferential`.
- **Ekeland** (`TauCeti/Topology/MetricSpace/Ekeland.lean`):
  `LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist`.
- **Γ-convergence** (`TauCeti/Topology/Semicontinuity/GammaConvergence.lean`): the sequential
  Γ-convergence structure `TauCeti.TendstoGamma`, in the statement of 2.1, and the fundamental
  theorem, named under Scope.
- **Moreau–Yosida resolvents under Γ-convergence**
  (`TauCeti/Analysis/GradientFlow/MoreauYosida/GammaConvergence.lean`): convergence of the
  Moreau–Yosida approximations and compactness of resolvent steps for Γ-convergent, equicoercive
  energies with convergent base points, and equicoercivity on a proper space from a uniform lower
  bound on the approximations, used in the proof route of 2.4; named by file path, since no
  statement uses it.
- **Homogeneous Hoffman bound** (`TauCeti/Geometry/Convex/Cone/ErrorBound.lean`), named in 4.4 by
  file path, since no statement uses it.

### From other roadmaps

- **[VariationalMethods](../VariationalMethods/README.md) §2.1:** the normal cone of convex
  analysis `N_C(u) = {f : StrongDual ℝ V | ∀ v ∈ C, f (v − u) ≤ 0}`, of which `normalCone` is a
  local copy, used in 5.1.
- **ConvexAnalysisAndDuality**: its 3.1, the one-sided directional derivative
  `f'(x; d) = ⨅ t > 0, t⁻¹ (f (x + t d) - f x)` in `EReal`, of which `Suggested.lean` has a local
  copy, used in the statement of 3.2; its 3.2, the max formula for convex `f` that never takes
  `⊥`, finite and continuous at `x`, used in the proof route of 3.2.
- **FirstOrderOptimization** 3.2: for a closed proper convex `g` (real epigraph convex, lower
  semicontinuous, never `⊥`, somewhere finite) on a real Hilbert space and a step `η > 0`, the
  proximal map, the unique minimizer of `u ↦ g u + ‖u - x‖² / (2η)`, equal to Tau Ceti's
  Moreau–Yosida resolvent step, `1`-Lipschitz, and characterized by `η⁻¹ • (x - p)` being a
  subgradient of `g` at `p`; used in the proof routes of 2.4 and named there `P_η g`.

This roadmap consumes nothing else from other roadmaps.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

The following material is recorded only to fix the boundary. Contributors should not attempt it
under this roadmap.

- **Clarke's tangent and normal cones and Clarke regularity of sets** in Banach spaces (Clarke,
  §10.3, pp. 210–221): the cone `{v | d_S°(x; v) = 0}`, its polar, their agreement with the convex
  cones for closed convex sets and with the convexified limiting normals in finite dimension. They
  add a third family of normals beside the regular and limiting ones of 5.1, which carry the
  calculus here.
- **Nonsmooth multiplier rules**: Clarke's multiplier rule for Lipschitz data (Clarke, Thm 10.47,
  p. 221) and the limiting multiplier rule (Rockafellar–Wets, Ex 10.52, p. 464). They combine
  Layer 5 with constraint qualifications of the kind NonlinearProgrammingOptimality treats for
  smooth data, and belong to a roadmap on nonsmooth optimization.
- **Infinite-dimensional limiting calculus**: Fréchet normals and the extremal principle in
  Asplund spaces, sequential normal compactness and the Mordukhovich criterion there
  (Mordukhovich, Thm 2.20, p. 199, Thm 2.22, p. 201, and Thm 4.18, p. 394, in general form). They
  need the separable reduction
  and the theory of Asplund spaces.
- **Variational convergence in infinite dimension**: Mosco convergence, Attouch's theorem in
  Hilbert space, Kuratowski convergence in hyperspaces and the Fell topology. They need weak
  topologies on epigraphs.
- **Moreau envelopes and proximal maps of nonconvex functions under epi-convergence**: thresholds
  of prox-boundedness and graphical convergence of set-valued proximal maps (Rockafellar–Wets,
  Thm 7.37, pp. 267–268, for prox-bounded functions, and Ex 7.38, p. 269). 2.4 treats the convex
  case only.
- **Generalized equations and implicit mapping theorems**: strong metric regularity, Robinson's
  implicit function theorem for variational inequalities, metric subregularity and calmness
  (Dontchev–Rockafellar, Chs. 2–4), and the theory of second-order epi-derivatives
  (Rockafellar–Wets, Ch. 13).
- **Nonsmooth mean value theorems and Kurdyka–Łojasiewicz theory**: the mean value inequality
  for lower semicontinuous functions (Clarke, Thm 11.2, p. 228), the limiting mean value theorem
  for Lipschitz functions (Rockafellar–Wets, Thm 10.48, p. 461), and the Kurdyka–Łojasiewicz
  inequality, which feed descent methods.

## Prior formalization

Clarke's generalized directional derivative and gradient are formalized in
`CKMA/Analysis/Convex/Clarke.lean` of [lean-CKMA](https://github.com/bjbraams/lean-CKMA), the Core
Knowledge of Mathematical Analysis project, with no `sorry`: the support-function identity of
3.1 on a real normed space, and, in finite dimension, the representation of the gradient as the
closed convex hull of the limits of derivatives, the case `S = ∅` of 3.5. Its definition of
`f°` uses the filter `𝓝[univ ×ˢ Ioi 0] (x, 0)`, which is `𝓝 x ×ˢ 𝓝[>] 0`. The file is a cited
source, not the specification.

## References

The locators refer to these editions; page numbers are printed page numbers.

- F. Clarke, *Functional Analysis, Calculus of Variations and Optimal Control*, Graduate Texts in
  Mathematics 264, Springer, 2013, Chs. 10–11.
- A. L. Dontchev and R. T. Rockafellar, *Implicit Functions and Solution Mappings: A View from
  Variational Analysis*, Springer Monographs in Mathematics, Springer, 2009, Chs. 3–5.
- A. J. Hoffman, *On approximate solutions of systems of linear inequalities*, Journal of
  Research of the National Bureau of Standards 49 (1952), 263–265.
- A. D. Ioffe, *Variational Analysis of Regular Mappings: Theory and Applications*, Springer
  Monographs in Mathematics, Springer, 2017, Chs. 1, 2, 6.
- B. S. Mordukhovich, *Variational Analysis and Generalized Differentiation I: Basic Theory*,
  Grundlehren 330, Springer, 2006, Chs. 1, 2, 4.
- R. T. Rockafellar and R. J.-B. Wets, *Variational Analysis*, Grundlehren 317, Springer, 1998,
  Chs. 4, 6–12.
