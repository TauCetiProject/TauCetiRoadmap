# Roadmap: exact lifting and matched finite outer approximations

**Summary.** Build a reusable library for exact monotone-composition lifts, their finite mixed-integer formulations, and finite outer approximations that use the same anchors. Auxiliary heights preserve feasible points and feasible attained minima under explicit domain hypotheses, while a shared height vector can strengthen finite linear approximations. Applications include separable convex constraints and disciplined convex modeling.

## Scope and ownership

This roadmap owns the order, finite-formulation and finite-support interfaces below. It consumes Mathlib and has no supplier roadmap. The finite nonlinear-row model is built here; no general solver or optimization-problem framework is assumed.

Algorithm iteration policies, convergence rates, conic duality and solver oracles, universal strict improvement, cut-count asymptotics and runtime gains are outside this roadmap. General multiplier and optimality-condition theories and the separate strictness qualifications for separable functions are also outside it.

## Conventions

For an arbitrary type `X`, a preordered type `Y`, domains `D : Set X`, `E : Set Y`, inner map `g : X → Y`, outer function `h : Y → ℝ` and budget `b : ℝ`, write

    S = {x ∈ D | h(g(x)) ≤ b}
    L = {(x,y) | x ∈ D, y ∈ E, g(x) ≤ y, h(y) ≤ b}.

Projections are exact set images or existential witnesses. Epigraph pairs are `(x,t)` with `x ∈ D` and `f(x) ≤ t`. Inequalities include the boundary. `MapsTo g D E` preserves the canonical graph point; `MonotoneOn h E` compares two points of `E`.

A feasible minimum is membership together with Mathlib's `IsMinOn`: the latter alone does not assert membership. Objectives on lifts are pulled back from original variables and have no height dependence. Transferring attainment does not assert that every nonempty feasible set attains its infimum.

Finite models have an original continuous block and an original integer block. Added argument variables and heights are continuous, appended to the continuous block, carry zero objective coefficients and have no extra bounds. Nonlinear residuals are bounded above by zero. Mixed feasibility and the continuous relaxation retain the same integer-coordinate bounds. Arbitrary nonnegative weights and zero residual budgets in separable lifting are algebraic generalizations of the adopted unweighted sums; affine normalization permits arbitrary weights.

The analytic layer uses real normed spaces and `Fin p → ℝ` with coordinatewise order. Derivatives are continuous linear maps witnessed by `HasFDerivAt`. A comparison uses the same finite anchors and the corresponding inner and outer derivatives throughout, with one common vector of heights. Finite nonempty maxima use `Finset.sup'`; empty supports have a separate statement.

The composition comparison here assumes monotonicity in every height coordinate. TS05 §2 instead retains affine inner coordinates by equalities and requires monotonicity only in the other coordinates. The general mixed-sign affine-coordinate theorem is outside the selected comparison; the finite affine-normalization layer retains the equalities needed by its own models.

## Exact supplier contracts

### From Mathlib

- Use `Set.MapsTo`, `MonotoneOn`, images and preimages for graph and projection maps.
- Use `IsMinOn`, `isMinOn_iff` and `IsMinOn.comp_of_mapsTo` from `Mathlib/Order/Filter/Extr.lean`. Retain feasibility separately, without a replacement minimizer predicate or generic transport wrapper.
- Use `ConvexOn`, `ConvexOn.convex_epigraph`, `convexOn_iff_convex_epigraph` and affine pullbacks from `Mathlib/Analysis/Convex/Function.lean`.
- Use `HasFDerivAt`, continuous-linear-map composition and the chain rule. For tangent support, restrict to the affine line through two domain points and use `ConvexOn.le_slope_of_hasDerivAt` from `Mathlib/Analysis/Convex/Deriv.lean`.
- Use `Finset.sup'`, `Finset.sup'_le_iff`, `Finset.le_sup'` and `Finset.exists_mem_eq_sup'` from `Mathlib/Data/Finset/Lattice/Fold.lean`, together with finite sums. Finite maximum attainment is existing infrastructure.

## How to read the build

The README specifies the full mathematical API. [Suggested.lean](Suggested.lean) gives suggested target signatures, with actual definition bodies and admitted theorem targets; it is not an exhaustive checklist. Layer 1 establishes exact order lifting. Layer 2 builds its finite data and coordinate API before the concrete adapters. Layer 3 uses Layer 1's set conventions and convex calculus. Layer 4 uses finite maxima and sums, then identifies its rows with the sum-outer-function instance of Layer 3. No earlier layer assumes a later construction.

## Layer 1: exact composition lifts

### 1.1 Sets and exact projection

Build `originalSet` and `liftedSet` with the conventions above. Prove `projection_eq` under `MapsTo g D E` and `MonotoneOn h E`:

    Prod.fst '' L = S.

This is the order form of the monotone-outer epigraph argument in LYBV16, arXiv:1511.06710v3 §4, p. 9; TS05 §2, Proposition 1, pp. 226–227, gives the convex composition setting. Convexity, differentiability and compactness are unnecessary for this order identity.

**API.**

- Simplify membership in `originalSet` and `liftedSet`; retain both domains.
- Given `x ∈ S`, insert `(x,g(x)) ∈ L`; given a point of `L`, project into `S` using monotonicity.
- Derive the pointwise existential criterion and empty/nonempty equivalence from these two maps.
- For each real `t`, specialize the projection identity to the epigraph criterion: `x ∈ D ∧ h(g(x)) ≤ t` iff `∃ y ∈ E, g(x) ≤ y ∧ h(y) ≤ t ∧ x ∈ D`. Use existing convex-epigraph APIs for convexity applications.

*Needs:* native sets, preorder, `MapsTo` and `MonotoneOn`.

### 1.2 Feasible minima and attainment

Prove `feasible_minimum_iff` at every specified pair: a feasible minimum of `f ∘ Prod.fst` on `L` is equivalent to membership in `L` and a feasible minimum of `f` at the projected point in `S`. Prove `attainment_iff` for existence of such a feasible minimum in both directions. These are objective-preserving consequences of §1.1, rather than additional optimization assumptions on the source epigraph identity.

**API.**

- Transport comparison inequalities through graph insertion and projection using `IsMinOn.comp_of_mapsTo`.
- Retain membership at the specified point in every feasible-minimum statement.
- Transfer lower bounds and feasible objective-value witnesses through the same maps.

*Needs:* §1.1 and native `IsMinOn` transport.

### Examples

- For `g(x)=|x|`, `h(y)=y`, `D=E=ℝ`, budget zero, the original set is `{0}` and `(0,0)` belongs to the lift; differentiability is unnecessary.
- For `g(x)=x²`, decreasing `h(y)=1−y`, budget zero, `(0,1)` lies in the lift although `0` is not originally feasible. This checks the monotonicity requirement.
- On `D=[−1,1]`, `g(x)=x²`, `h(y)=y`, budget one, minimizing `−x` attains `−1` in both models. Adding `y≤1/4` changes the attained minimum to `−1/2`, so graph membership matters.
- With `D=∅`, both sets are empty and neither has a feasible minimum. With `D=(0,1)`, `g=0`, `h=0`, budget zero and objective `x`, both feasible problems have infimum zero and no attained minimum.

### Dependencies

Mathlib supplies this layer's order and minimization vocabulary. No supplier roadmap or convex-calculus result is required.

## Layer 2: finite model formulations

### 2.1 Data and coordinate API

Build `Point n m`, `FiniteModel n m l r`, `FiniteModel.objective`, `FiniteModel.feasibleOn` and `FiniteModel.relaxationOn` as in the suggested interfaces. The data consists of nonlinear residuals `g`, affine row coefficients `A,B`, right sides `rhs`, objective coefficients `c1,c2`, and finite real bounds `lo,hi` for the integer block. This finite packaging implements the formulation in HBO13 pp. 1–2, retaining its original linear constraints, bounds and integer coordinates.

Build `project`, `height` and graph insertion for a continuous block enlarged from `n` to `n+q`. Define `affineArgument` by the actual expression

    u_j(x,z) = Σ_i a_ji x_i + Σ_i b_ji z_i + o_j.

**API.**

- For `Point` and `FiniteModel`, give coordinate/field evaluation and the nonlinear, affine and bounded-integer membership descriptions. Both coordinate blocks are ambient real vectors; integrality is a feasible-set condition.
- For `objective`, prove its two finite-sum evaluation and zero-extension pullback identities.
- For `feasibleOn` and `relaxationOn`, retain the chosen domain and rows and prove mixed feasibility is contained in the relaxation.
- For `project` and `height`, prove evaluation, graph-insertion and reconstruction identities. Establish the corresponding affine-row identities.
- For `affineArgument`, prove its sum/offset evaluation and actual derivative transport when each univariate component derivative is supplied at that argument. An aggregate derivative does not supply every component derivative.

*Needs:* finite sums, finite index embeddings, integer coercions and Layer 1's objective transport method.

### 2.2 Affine-argument normalization

Under `d.g i x = Σ_j weight i j * phi j (u_j(x))`, build `FiniteModel.normalizedLift`. Append one continuous coordinate per argument; retain the original affine rows and add two opposite affine inequalities imposing each argument equality. Evaluate the nonlinear sums at the new argument coordinates. Keep the original integer bounds and objective, with zero coefficients on the added block. This follows HBO13 §3 opening, p. 4, which normalizes affine arguments by additional equality variables.

**API.**

- Characterize the added affine rows by `height z j = u_j(project z)` and retain every original row.
- Establish the objective pullback and canonical insertion of the actual affine argument values.
- Prove `FiniteModel.normalization_projection`, `FiniteModel.normalization_relaxation_projection` and `FiniteModel.normalization_minimum_iff` for mixed feasibility, continuous relaxation and feasible minima respectively. No positivity, convexity or smoothness is required for exact substitution.

*Needs:* §2.1, exact decomposition and equality substitution; §1.2 for minima.

### 2.3 Separable-height lifting

Under `d.g i x = Σ_j weight i j * component j x` and `0 ≤ weight i j`, build `FiniteModel.separableLift`. Its nonlinear rows are `component j (project z) − height z j ≤ 0`; its added affine budget rows are `Σ_j weight i j * height z j ≤ 0`. Retain the original domain by preimage, all original affine rows, integer coordinates and bounds, and the original objective with zero height coefficients. HBO13 §3.1, p. 4, gives the unweighted separable formulation; the nonnegative weights here are an algebraic generalization.

**API.**

- Characterize component-height, budget, original-row and integer conditions and prove objective pullback.
- Insert actual component values to obtain graph feasibility; use nonnegative weights for forward projection.
- Prove `FiniteModel.separable_projection`, `FiniteModel.separable_relaxation_projection` and `FiniteModel.separable_minimum_iff`. This bookkeeping is an obligation of the concrete model, beyond the abstract projection identity.

*Needs:* §2.1, nonnegative finite sums, explicit decomposition and §1.2.

### Examples

- With `m=0`, `feasibleOn` equals `relaxationOn`; with no coordinates the objective is zero. All coordinate identities must cover empty blocks and empty row families.
- Use `−1≤x≤1`, `z∈{0,1}`, `(x+z)²≤1`, objective `x+z`. Normalize with `u=x+z`, then use `u²−1≤v`, `v≤0`; the unshifted epigraph height is `v+1`. All three models attain `−1` at the lifts of `(−1,0)`.
- The same model admits `(x,z)=(1/2,0)` with new argument `u=1/2`; normalization must keep that auxiliary coordinate continuous. The original point `(0,1/2)` belongs to the continuous relaxation and fails mixed feasibility.
- Check both signs of the normalization equality and zero added objective coefficients. Finite bounds on the original integer block do not assert feasibility or compactness of the free-height set.

### Dependencies

§2.1 precedes both adapters. Normalization does not require positive weights; separable-height projection does. Each adapter keeps a separate continuous-relaxation projection statement.

## Layer 3: matched actual-derivative approximations

### 3.1 Rows and finite sets

For a common family `a : Fin k → X`, build `componentRow`, `outerRow`, `directRow`, `directOA` and `sharedOA` by

    G_i(x) = g(a_i) + Dg_i(x−a_i)
    H_i(y) = h(g(a_i)) + Dh_i(y−g(a_i))
    C_i(x) = h(g(a_i)) + (Dh_i ∘ Dg_i)(x−a_i).

`directOA` retains `x∈D` and every `C_i(x)≤b`. `sharedOA` retains `x∈D`, `y∈E` and every `G_i(x)≤y`, `H_i(y)≤b`, for one common `y`. These are the matched linearization constructions of TS05 §2, Theorem 1, pp. 227–228, in the specialization monotone in every height coordinate.

**API.**

- For the three rows, give anchor evaluation and `H_i(G_i(x))=C_i(x)`.
- For `componentRow`, derive componentwise support from component convexity on `D`, anchor and query membership, and the actual inner derivative.
- For `outerRow`, derive support on `E` from outer convexity, anchor-image and query membership, and the actual outer derivative. For `directRow`, consume the actual chain-rule derivative via `HasFDerivAt.comp`.
- For `directOA` and `sharedOA`, give membership descriptions and graph witnesses under the support hypotheses. Keep the common anchor family and retained `E` visible.

*Needs:* Layer 1's set conventions, continuous linear maps, convex support and chain rule.

### 3.2 Restricted and full-space comparisons

Prove `analytic_comparison`: assume `MapsTo g D E`, each component of `g` convex on `D`, `h` convex on `E`, every anchor in `D`, actual `HasFDerivAt g (Dg i) (a i)` and `HasFDerivAt h (Dh i) (g(a_i))`, and `Monotone (Dh i)` for every `i`. Anchor-image membership follows from `MapsTo` and anchor membership. Retain `y∈E` and prove

    S ⊆ Prod.fst '' sharedOA D E g h a Dg Dh b
      ⊆ directOA D g h a Dg Dh b.

This combines the graph witness and component/outer supports with the row comparison in TS05 Theorem 1, pp. 227–228. The first inclusion does not require monotonicity of `h` itself. When using exact-lift projection from Layer 1, retain its `MonotoneOn h E` premise.

Prove `fullspace_analytic_comparison` under component convexity on `D`, convexity and monotonicity of `h` on the full outer space, anchors in `D` and the same actual derivatives. Derive monotonicity of every `Dh i` from positive directional difference quotients, then specialize the preceding comparison to `E=univ`. Monotonicity only on an arbitrary restricted `E` does not imply that linear-derivative condition.

**API.**

- Follow component support, outer support, derivative monotonicity and the identity `H_i(G_i(x))=C_i(x)`; no desired-inclusion premise or cut-validity oracle is allowed.
- Use the existing chain rule for the derivative of `h ∘ g`; it is part of the analytic interpretation of the direct rows.
- Derive weak objective-value order at actual feasible minimizers of these nested sets, keeping memberships and `IsMinOn`. Do not infer attainment or strict improvement from containment.

*Needs:* §3.1 and native order/calculus; full-space specialization also needs the directional difference-quotient argument.

### Examples

- Give equality examples with one anchor, affine components, and repeated anchors. With no anchors and `E=univ`, both finite projections are `D`; with a retained `E`, height existence must still be checked.
- For `g(x)=(x₁²,x₂²)`, outer sum, box `[−1,1]²`, anchors `(1,1)` and `(−1,−1)`, and budget `1/2`, direct rows give `|x₁+x₂|≤5/4`; shared heights give `|x₁|+|x₂|≤5/4`. Objective `−x₁+x₂` attains `−2`, `−5/4` and `−1` in direct, shared and original models; exact lifting retains `−1`.
- Give an example where both approximations contain the original set but use different anchor families and their proposed comparison fails. This checks the common-anchor premise independently of validity of each relaxation.
- Include a nonzero exponential outer derivative and an inhabited matched lift. Check a restricted outer domain without dropping its height constraint or the component-convexity and anchor-membership premises.

### Dependencies

The restricted theorem supplies both containments with explicit derivative monotonicity. The full-space theorem derives that condition. Finite model adapters are unnecessary for the abstract analytic comparison; §2 supplies concrete formulations when required.

## Layer 4: finite support elimination

### 4.1 Shared component supports

Build `sharedRows` with `x∈D`, one free height `y_j` per component, every `r_ji(x)≤y_j` for `i∈H_j`, and `Σ_j y_j≤b`. Prove `shared_rows_projection` when every finite `H_j` is nonempty:

    (∃ y, (x,y) ∈ sharedRows) ↔ x ∈ D ∧ Σ_j max (r_ji(x) : i∈H_j) ≤ b
    (∃ y, (x,y) ∈ sharedRows) ↔ x ∈ D ∧ ∀ (i_j∈H_j)_j, Σ_j r_j(i_j)(x) ≤ b.

TS05 §2, Proposition 5 and its elimination proof, p. 231, supplies the separable support-recombination interpretation. KLW18 §3, Eqs. (4)–(7) and Proposition 1, p. 574, gives the max-of-sums versus sum-of-maxima comparison, with component convexity for its analytic application. These finite-row identities themselves are algebraic and require no convexity or derivatives; no strictness or cut-count claim is made here.

**API.**

- Give membership and per-component row bounds for `sharedRows`.
- Use native maximum attainment and take each height equal to its component maximum for the reverse projection.
- Identify the component rows and matched supports in the sum-outer-function case of §3. This connection must not assume arbitrary rows came from a convex function.

*Needs:* native nonempty finite maxima, finite sums and choices; §3 only for the tangent-row application.

### 4.2 Independent anchor heights

Build `independentRows` with a free height vector for each anchor and its own budget. Prove `independent_rows_projection`: its projection is precisely `x∈D` and each same-anchor sum inequality. This is direct elimination in the row systems of §4.1; the witness sets each anchor's heights equal to its own row values.

**API.**

- Give membership, per-anchor row and budget descriptions.
- Construct the own-row witness and prove both projection directions.
- Relate independent heights to the diagonal sums of §3 and distinguish them from all mixed choices in §4.1. These are free-height statements; retained outer domains cannot be discarded.

*Needs:* finite sums and §4.1's row conventions.

### Examples

- For `sharedRows`, singleton support sets recover one sum row, while identical support rows give the same projection after repetitions. Components with rows `{1,3}` and `{2}` have maximum-sum five and mixed sums three and five, so projection is `x∈D ∧ 5≤b`.
- With zero components, `sharedRows` projects to `x∈D ∧ 0≤b`. If one component has empty support and its height is otherwise free, prove projection is `D` separately, without defining a maximum of an empty real family. Include an attained original-coordinate objective in that model.
- For `independentRows`, zero anchors give projection `D`; zero components give `x∈D ∧ ∀ a, 0≤b(a)`.
- The two-anchor example of §3 gives `|x₁+x₂|≤5/4` with independent heights, and `|x₁|+|x₂|≤5/4` with shared heights. It distinguishes diagonal rows from mixed choices.
- Before imposing any outer-domain restriction, check whether the maximum-height witness belongs to it; the free-height formula alone makes no such assertion.

### Dependencies

Finite maximum attainment is supplied by Mathlib. The sum-outer-function correspondence consumes the explicit row definitions of §3, without imposing analytic hypotheses on general algebraic rows.

## Downstream consumers

Separable convex formulations and disciplined convex models consume the exact projection, feasible-minimum and matched-support interfaces above. The measure/coupling and transport-cost structures of [OptimalTransport](../OptimalTransport/README.md), the weak-compactness and spectral-energy program of [VariationalMethods](../VariationalMethods/README.md), and the PL chart and finite-cell structures of [GeometricTopology](../GeometricTopology/README.md) have different contracts. This roadmap neither requires those programs nor supplies their targets through a shared word such as projection or minimization.

## References

- **TS05.** M. Tawarmalani and N. V. Sahinidis, [*A polyhedral branch-and-cut approach to global optimization*](https://doi.org/10.1007/s10107-005-0581-8), Mathematical Programming 103 (2005), 225–249, version of record. §2, Proposition 1, pp. 226–227; Theorem 1, pp. 227–228; Proposition 5 and its proof, p. 231. Affine coordinates are equalities in the source composition construction.
- **HBO13.** H. Hijazi, P. Bonami and A. Ouorou, [*An Outer-Inner Approximation for Separable Mixed-Integer Nonlinear Programs*](https://doi.org/10.1287/ijoc.1120.0545), INFORMS Journal on Computing, Articles in Advance, published online 4 October 2013, pp. 1–14. The chosen version's pp. 1–2 define the problem/domain and separability; §3 opening and §3.1, p. 4, give normalization and the univariate extended formulation. These page locators refer to the Articles in Advance version, not issue pp. 31–44 or the earlier preprint.
- **LYBV16.** M. Lubin, E. Yamangil, R. Bent and J. P. Vielma, *Extended Formulations in Mixed-integer Convex Programming*, IPCO 2016, proceedings pp. 102–113. The scalar monotone-outer epigraph locator used here is [arXiv:1511.06710v3](https://arxiv.org/abs/1511.06710v3), 15 March 2016, §4, p. 9, rather than proceedings pagination.
- **LYBV.** The same authors, [*Polyhedral approximation in mixed-integer convex optimization*](https://doi.org/10.1007/s10107-017-1191-y), [arXiv:1607.03566v2](https://arxiv.org/abs/1607.03566v2), 20 April 2017, §4, p. 12, Eqs. (8)–(10). Its square/exponential/max example illustrates the epigraph identity of §1; its conic algorithms are outside this roadmap.
- **KLW18.** J. Kronqvist, A. Lundell and T. Westerlund, [*Reformulations for utilizing separability when solving convex MINLP problems*](https://doi.org/10.1007/s10898-018-0616-3), Journal of Global Optimization 71 (2018), 571–592, version of record. §2, p. 573, permits overlapping variable subsets and explicitly requires convex components; §3, p. 574, Eqs. (4)–(7) and Proposition 1 give the weak finite-support comparison. Its strictness discussion is outside this roadmap.

### Secondary formalization reference

The [complete retained library at commit 59c355e](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8) contains related proof constructions and controls under its [Apache-2.0 license](https://github.com/bernalde/complete-retained-library/blob/59c355eb14ed1eff9664736428ca02b4543200b8/LICENSE). Its project-owned formalization is Copyright 2026 David E. Bernal Neira, licensed under the Apache License, Version 2.0; the destination [LICENSE](../../LICENSE) supplies the licence text. This is a secondary source, rather than a required module layout or private API to preserve. The mathematics above is adopted literature; no novelty or solver-performance claim follows from the formalization.
