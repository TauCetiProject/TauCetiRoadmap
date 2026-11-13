# Exact lifting and matched finite outer approximations

Auxiliary variables can preserve a nonlinear feasible set while changing the strength of its finite linear approximations. This roadmap builds the exact projection and optimization API for monotone composition lifts, their concrete finite mixed-integer formulations, and the comparison between direct and shared-height outer approximations at matched anchors. Its applications include separable convex constraints and disciplined convex modeling. The output is a reusable formulation library, with the hypotheses that make a lift exact and the distinctions between exact lifting, finite relaxation, and attained optimization visible in its interfaces.

[Suggested.lean](Suggested.lean) gives suggested headline interfaces in `TauCetiRoadmap.ConvexLifting`. This README is definitive. The thirteen theorem declarations there represent thirteen selected interface roles, including specializations and adapters; they are not thirteen independent new mathematical results, nor an exhaustive list of this roadmap's basic API and checks. The definitions and the finite model structure are supporting objects, not additional theorem headlines.

## Scope and conventions

The exact order layer has an arbitrary type `X`, a preordered type `Y`, domains `D : Set X` and `E : Set Y`, an inner map `g : X → Y`, an outer function `h : Y → ℝ`, and a real budget `b`. Write

\[
S=\{x\in D:h(g(x))\le b\},\qquad
L=\{(x,y):x\in D,\ y\in E,\ g(x)\le y,\ h(y)\le b\}.
\]

These are `originalSet` and `liftedSet`. All set projections are exact images or existential witnesses. Epigraph pairs are ordered `(x,t)`, with `x∈D` and `f(x)≤t`. Weak inequalities include the boundary. `MapsTo g D E` preserves the canonical graph point. Monotonicity restricted to `E` compares two points of `E`; no argument may be taken outside that declared domain without an explicit hypothesis.

A feasible minimum is membership together with Mathlib's `IsMinOn`. The predicate `IsMinOn f S x` by itself does not assert `x∈S`. A statement about transferring attained minima does not assert that every nonempty feasible set has a minimum. Objectives in a lift are pulled back from the original variables and have no height dependence.

For finite models, original continuous variables come first, followed by original integer variables. Added affine-argument variables and epigraph heights are continuous and are appended to the continuous block. They have zero objective coefficients and no additional bounds. Mixed-integer feasibility and the continuous relaxation are separate sets. Nonlinear constraints are residuals bounded above by zero. Arbitrary finite nonnegative weights in the epigraph-height construction are an algebraic generalization of the adopted unweighted sums. Affine normalization is exact equality substitution and permits arbitrary weights.

The analytic layer uses real normed spaces and `Fin p → ℝ` with the coordinatewise order. Derivatives are actual continuous linear maps witnessed by `HasFDerivAt`, not unrelated slope data. The same finite family of anchors, their inner derivatives, and the corresponding outer derivatives is used throughout a comparison. One height vector is shared by all anchors. Finite nonempty maxima use `Finset.sup'`; the empty support case is stated separately.

The selected all-height monotone comparison is a sufficient-assumption specialization of the classical composition construction. Tawarmalani–Sahinidis treats affine inner coordinates by equalities and needs monotonicity only on the remaining coordinates. This roadmap does not claim that the all-height monotone theorem is the full mixed-sign affine-coordinate theorem. Its concrete affine-normalization layer retains the exact equality bookkeeping needed by the source-facing finite models.

Algorithm iteration policies, convergence rates, conic duality and solver oracles, universal strict improvement, cut-count asymptotics and runtime gains are outside this roadmap. It also excludes PSC/KKT completion and the separate strictness qualifications for the separable-function literature.

## Existing material and dependency order

Use existing Mathlib vocabulary and operations directly:

- `Set.MapsTo`, `MonotoneOn`, images and preimages for graph and projection maps.
- `IsMinOn`, `isMinOn_iff` and `IsMinOn.comp_of_mapsTo` from `Mathlib/Order/Filter/Extr.lean`. Retain feasibility separately; do not introduce a replacement minimizer predicate or generic transport wrappers.
- `ConvexOn`, `ConvexOn.convex_epigraph`, `convexOn_iff_convex_epigraph` and affine pullbacks from `Mathlib/Analysis/Convex/Function.lean`. These use the explicit epigraph set above.
- `HasFDerivAt`, continuous-linear-map composition and the chain rule. The convex tangent argument can restrict to the affine line through the anchor and query point and use `ConvexOn.le_slope_of_hasDerivAt` from `Mathlib/Analysis/Convex/Deriv.lean`.
- `Finset.sup'`, `Finset.sup'_le_iff`, `Finset.le_sup'` and `Finset.exists_mem_eq_sup'` from `Mathlib/Data/Finset/Lattice/Fold.lean`, together with finite sums. Finite maximum attainment is existing infrastructure, not a new generic target.

Layer 1 uses only order, sets and native minima. Layer 2 first constructs its finite problem data and basic API, then proves its normalization and separable-height adapters using explicit graph insertion and projection; it can consume Layer 1's transport method. Layer 3 uses Layer 1's original-set convention and existing convex calculus. Layer 4 independently uses native finite maxima and sums; its row systems connect to the sum-outer-function specialization of Layer 3. No result in an earlier layer assumes a construction that a later layer is supposed to supply.

The finite nonlinear-row model is built here. There is no hidden prerequisite for a general optimization-problem object or solver implementation. The measure/coupling and transport-cost structures of [OptimalTransport](../OptimalTransport/README.md), the weak-compactness and spectral-energy program of [VariationalMethods](../VariationalMethods/README.md), and the PL chart and finite-cell structures of [GeometricTopology](../GeometricTopology/README.md) have different contracts. This development does not require implementing those programs or claim their targets through a shared word such as projection or minimization.

## Layer 1: exact composition lifts

Build the basic theory of `originalSet` and `liftedSet`: membership simplification, canonical graph inclusion, projection inclusion, the pointwise existential criterion, and empty/nonempty equivalence. Under `MapsTo g D E` and `MonotoneOn h E`, prove `projection_eq`:

\[
\operatorname{fst}(L)=S.
\]

The reverse direction chooses `y=g(x)`; the forward direction uses `h(g(x))≤h(y)≤b`. Convexity, differentiability, continuity and compactness are unnecessary for this order identity. An extra height restriction is safe only when the graph witness still belongs to the declared height domain.

Prove `feasible_minimum_iff` at every specified pair: a feasible minimum of `f∘Prod.fst` on `L` is equivalent to membership in `L` and a feasible minimum of `f` at the projected point in `S`. Prove `attainment_iff`, transferring the existence of such a point in both directions. Also prove the corresponding lower-bound and feasible objective-value witness equivalences using native sets of values or direct quantified inequalities. These are consequences of the graph/projection construction, not additional assumptions on the lift.

Prove `epigraph_composition_iff` with the retained domain:

\[
x\in D\ \land\ h(g(x))\le t
\iff
\exists y\in E,\ g(x)\le y\ \land\ h(y)\le t\ \land\ x\in D.
\]

For convex-function applications, consume existing epigraph and convex-composition APIs rather than redeclaring them. In particular, the absence of convexity in the exact identity must not be confused with an assertion that an arbitrary such lift is convex.

**Checks.** Include an inhabited nonsmooth absolute-value epigraph with budget zero. Show that inner `x²` and decreasing outer `1−y` admit a spurious lifted point if the monotonicity hypothesis is removed. On `x∈[−1,1]`, lifting `x²≤1` preserves minimization of `−x`, whereas imposing the unjustified height bound `y≤1/4` changes its attained minimum from `−1` to `−1/2`. Include an empty original domain and a nonempty example with an unattained objective infimum, demonstrating that attainment is transferred rather than manufactured.

## Layer 2: finite model formulations

### 2.1 Original data and usable coordinate API

Build `Point n m` and `FiniteModel n m l r` as in the suggested interfaces. The data consists of finitely many nonlinear residuals `g`, affine row coefficients `A,B` with right sides `rhs`, linear objective coefficients `c1,c2`, and finite real lower/upper bounds `lo,hi` for the integer block. `feasibleOn D` retains `D`, the nonlinear and affine rows, and an integer vector whose real coercion is the second coordinate block. `relaxationOn D` replaces that integrality requirement by the same real bounds. Define `objective` by the two finite scalar-product sums.

Provide membership descriptions, objective evaluation, and the inclusion of mixed feasibility in the continuous relaxation. Build `project`, `height` and graph insertion into the appended continuous block, with their evaluation and reconstruction identities. Establish the affine-row and objective identities needed below. These constructions must work for zero-size blocks and empty row families. Finite bounds do not assert feasibility, and no compactness of a free-height epigraph is assumed.

### 2.2 Affine-argument normalization

For actual affine arguments

\[
u_j(x)=\sum_i a_{ji}x_i+\sum_i b_{ji}z_i+o_j
\]

and an identity `d.g i x = Σj weight i j * phi j (u_j(x))`, build `FiniteModel.normalizedLift`. Append one continuous coordinate per argument. Retain all original affine rows and add the two opposite affine inequalities imposing its equality to `u_j(x)`. Evaluate the nonlinear sums at these new argument coordinates; keep the original integer bounds and objective, with zero coefficients for every added coordinate.

Prove the exact row/equality characterization and objective pullback. Prove `FiniteModel.normalization_projection`, `FiniteModel.normalization_relaxation_projection` and `FiniteModel.normalization_minimum_iff`. These are respectively mixed feasible projection, continuous-relaxation projection, and feasible-minimum transport. No positivity of weights, convexity or smoothness is required for this exact substitution. If component differentiability is subsequently needed, it must be supplied at the actual affine argument and transported by the existing chain rule; differentiability of an aggregate sum does not supply every component derivative.

### 2.3 Separable-height lifting

Under `d.g i x = Σj weight i j * component j x` and `0≤weight i j`, build `FiniteModel.separableLift`. Its nonlinear rows are `component j (project z) − height z j ≤0`. Its added affine budget rows are `Σj weight i j * height z j ≤0`. Retain every original affine row, the original domain through a preimage, all original integer coordinates and bounds, and the original objective with zero height coefficients.

Prove the row characterization, objective pullback and the graph feasibility obtained by inserting actual component values. Derive `FiniteModel.separable_projection`, `FiniteModel.separable_relaxation_projection` and `FiniteModel.separable_minimum_iff`. Nonnegative weights are needed for replacing component values by upper heights in the forward projection. They are not a premise of the normalization identities in 2.2. Both stages are actual obligations; the abstract theorem of Layer 1 does not discharge their affine/integer/objective bookkeeping.

**Checks.** Use the mixed model `−1≤x≤1`, `z∈{0,1}`, `(x+z)²≤1`, objective `x+z`. Normalize with continuous `u=x+z`, then lift using the residual `u²−1≤v`, `v≤0`. The physical height is `v+1`; its shift carries no objective coefficient. Exhibit an attained feasible minimum in the original, normalized and lifted models, and the feasible point `x=1/2,z=0` with fractional new argument `u=1/2`. The latter must not accidentally become integral. Verify the separate relaxation projections and zero-block cases.

## Layer 3: matched actual-derivative approximations

For a common finite anchor family `a : Fin k → X`, define

\[
G_i(x)=g(a_i)+Dg_i(x-a_i),\quad
H_i(y)=h(g(a_i))+Dh_i(y-g(a_i)),\quad
C_i(x)=h(g(a_i))+(Dh_i\circ Dg_i)(x-a_i).
\]

These are `componentRow`, `outerRow` and `directRow`. Define `directOA` by `x∈D` and every `C_i(x)≤b`, and `sharedOA` by `x∈D`, `y∈E`, and every `G_i(x)≤y`, `H_i(y)≤b`. Supply their membership API and graph witnesses.

For `fullspace_analytic_comparison`, require each component of `g` convex on `D`, `h` convex and monotone on the full outer space, every anchor in `D`, actual `HasFDerivAt g (Dg i) (a i)`, and actual `HasFDerivAt h (Dh i) (g(a i))`. Establish the chain-rule derivative and

\[
S\subseteq\operatorname{fst}(\texttt{sharedOA})
\subseteq\texttt{directOA}.
\]

Follow the composition proof: component supporting inequalities, outer supporting inequalities, monotonicity of the outer derivative, and the affine identity `H_i(G_i(x))=C_i(x)`. Derive derivative positivity from full-space monotonicity by positive directional difference quotients; do not assume the desired inclusion or an unrelated cut-validity oracle.

Also establish the domain-restricted comparison with `MapsTo g D E`, outer convexity on `E`, anchor-image membership, actual derivatives, and explicit monotonicity of every linear `Dh i`. Retain `y∈E`. Monotonicity of `h` only on an arbitrary `E` does not imply this linear-map condition. Under these conditions, prove the same two containments; when exact-lift projection from Layer 1 is used, keep its `MonotoneOn h E` hypothesis as well. For any fixed objective, derive the weak ordering of values at actual feasible minimizers of the nested sets, using `IsMinOn` and their memberships. No unconditional attainment follows.

**Checks.** Give equality examples with one anchor, affine components, and repeated anchors. For strict separation use `g(x)=(x₁²,x₂²)`, outer sum, the box `[−1,1]²`, and anchors `(1,1)` and `(−1,−1)`: direct rows bound `|x₁+x₂|`, shared heights bound `|x₁|+|x₂|`. At budget `1/2`, objective `−x₁+x₂` has attained values `−2`, `−5/4`, `−1` in the direct, shared, and original models, while exact lifting retains `−1`. Include a mismatched-history example where both approximations contain the original set but the proposed comparison between those different histories fails. Include a nonzero exponential outer derivative and an inhabited matched lifted approximation. These checks distinguish possible strictness from a universal strictness claim.

## Layer 4: finite support elimination

For finitely many components and finite support sets `H_j`, build `sharedRows` with one free vector of heights satisfying every `r_{ji}(x)≤y_j` and `Σj y_j≤b`, together with `x∈D`. Establish its membership API and, when each `H_j` is nonempty, `shared_rows_projection`:

\[
\exists y\ (x,y)\in\texttt{sharedRows}
\iff x\in D\ \land\ \sum_j\max_{i\in H_j}r_{ji}(x)\le b
\iff x\in D\ \land\ \forall(i_j\in H_j)_j,\ \sum_jr_{j i_j}(x)\le b.
\]

Use native finite maximum attainment. No convexity or derivative premise is needed for these algebraic rows. For the sum-outer-function case of Layer 3, identify the component rows and their matched supports explicitly. This gives the connection to disaggregated finite outer approximations without assuming arbitrary rows came from one convex function.

Build `independentRows` with a different free height vector for each anchor. Prove `independent_rows_projection`: its projection is exactly `x∈D` and each same-anchor sum inequality. The witness sets that anchor's heights to its own row values. It does not create the mixed-choice inequalities of the shared formulation.

**Checks.** A singleton support recovers one sum row. Identical rows and repeated anchors give equality cases. With zero components the budget condition is `0≤b`. If a component support is empty and its height is otherwise free, it can absorb the entire budget: projection is just `D`. Prove this separately, without assigning a maximum to an empty real family. Include an attained original-coordinate objective in such an empty-support model. These elimination statements concern free heights; imposing an outer domain or further height constraints requires retaining those constraints and checking the canonical maximum witness.

## Sources and relation to existing work

This is adopted optimization mathematics, organized as a reusable formalization program. The solver-review literature motivates the construction; its computational comparisons do not prove the universal set identities or runtime guarantees.

- **[TS05]** M. Tawarmalani and N. V. Sahinidis, [*A polyhedral branch-and-cut approach to global optimization*](https://doi.org/10.1007/s10107-005-0581-8), Mathematical Programming 103 (2005), 225–249, §2, Proposition 1, Theorem 1 and Proposition 5. The selected all-height monotone specialization and the separate affine-normalization bookkeeping are distinguished above.
- **[HBO]** H. Hijazi, P. Bonami and A. Ouorou, [*An outer-inner approximation for separable mixed-integer nonlinear programs*](https://doi.org/10.1287/ijoc.1120.0545), preprint and 2013 Articles in Advance, §3.1. The finite formulation preserves affine rows, integer bounds and the objective; its exact continuous relaxation is distinct from a finite outer approximation. These are distinct from the later paginated issue.
- **[LYBV16]** M. Lubin, E. Yamangil, R. Bent and J. P. Vielma, *Extended Formulations in Mixed-Integer Convex Programming*, IPCO 2016, 102–113; author manuscript §4. Its scalar epigraph-composition argument motivates Layer 1. General conic duality and termination hypotheses are separate from the present component.
- **[LYBV]** The same authors, [*Polyhedral approximation in mixed-integer convex optimization*](https://doi.org/10.1007/s10107-017-1191-y), author manuscript §4, equations (8)–(10), gives the explicit square/exponential/max composition example. The indicated equation locators refer to the author manuscript.
- **[KLW18]** J. Kronqvist, A. Lundell and T. Westerlund, [*Reformulations for utilizing separability when solving convex MINLP problems*](https://doi.org/10.1007/s10898-018-0616-3), Journal of Global Optimization 71 (2018), 571–592, Proposition 1 and §4. Components may depend on overlapping original coordinates, with consistency retained. The weak max-of-sums versus sum-of-maxima comparison is the relevant assertion; its stronger strictness discussion is outside this roadmap.
- **[KBLG]** J. Kronqvist, D. E. Bernal, A. Lundell and I. E. Grossmann, [*A review and comparison of solvers for convex MINLP*](https://doi.org/10.1007/s11081-018-9411-8), Optimization and Engineering 20 (2019), 397–455, §3.7.1, and the distinct June 3, 2018 author manuscript §3.8. The dissertation's Chapter 2 adopts this lifting literature. These surveys do not supply an independent new projection theorem.

Related project-owned formalization is available in the [complete retained library](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8). Its lifting modules provide reference proof constructions and controls. That repository is a secondary implementation source; its module layout, private naming conventions and broader chapter imports are not the specification of this roadmap. Reuse native APIs and improve the integration rather than preserving compatibility aliases.
