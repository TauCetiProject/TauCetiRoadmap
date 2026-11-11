# Roadmap: finite simultaneous affine bound tightening

**Summary.** Build the finite-real simultaneous affine bound-tightening operator on joint variable-and-row boxes. Prove graph-point preservation, correspondence with an independent scalar linear program, and, conditional on nonempty actual iterates, convergence to the greatest ordered fixed box and the unique maximizer of total variable-and-row width. Apply this theory to bounded original-coordinate models while retaining their objective and additional nonlinear and integer restrictions. [Suggested.lean](Suggested.lean) states the headline theorems; this README is the roadmap.

The adopted mathematics is the qualified simultaneous `(X,B)` construction of Belotti, Cafieri, Lee and Liberti (2010), §4, pp. 71–73, (9)–(34). This is established mathematics. The thesis and coauthored review supply preprocessing context; they do not state the joint-width LP theorem.

## Scope and ownership

Coefficients and endpoints are finite reals; variables have index type `Fin n`, rows `Fin m`, with either dimension allowed to be zero. This roadmap owns concrete affine endpoint arithmetic, the joint raw/public state bridge, simultaneous iteration, scalar LP correspondence, the conditional greatest limit and full-assignment uniqueness, and the bounded source application. Each object includes constructors, projections, membership, extensionality, inclusion, simplification and compatibility lemmas consumed downstream.

Excluded are sequential row visits and fairness, the 2012 variable-only objective theorem, infinite endpoints, general abstract-lattice iteration, nonlinear expression propagation, integer rounding, numerical tolerances, finite termination, rational complexity, solver implementation and performance claims, and unbounded-source equivalence. A nonempty fixed box need not contain a point of the affine graph.

[GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md) (network flows), [OptimalTransport](../OptimalTransport/README.md) and [VariationalMethods](../VariationalMethods/README.md) own other feasibility and minimization problems; none supplies this roadmap. `TauCeti.IsConvexPolyhedron` in `TauCeti/Analysis/Convex/Polyhedron/Basic.lean` describes finite intersections of closed affine halfspaces. It is not consumed here: the explicit constraints in Layer 3 suffice without a second general polyhedron theory.

## Conventions

Use `Matrix (Fin m) (Fin n) ℝ`, finite sums, `Set.Icc`, `Continuous`, `Filter.Tendsto`, `Function.IsFixedPt`, `IsGreatest`, `IsMaxOn` and `IsMinOn`. Extrema assertions include membership: `IsMaxOn` and `IsMinOn` alone do not assert it.

A raw tuple `q=(l,u)` has endpoints on `C = Fin n ⊕ Fin m`; variable coordinates are `Sum.inl`, row coordinates `Sum.inr`. It is ordered when `l ≤ u` pointwise, its members are `Set.Icc l u`, and its total width is `∑ c, (u c - l c)`. Endpoint containment of `q` in `r` means `r.l ≤ q.l ∧ q.u ≤ r.u`, including for invalid tuples. For ordered tuples this agrees with Cartesian inclusion. Singleton boxes are permitted.

The public state is Mathlib's `Interval (C → ℝ)`, namely `WithBot (NonemptyInterval (C → ℝ))`. It has one global empty state, distinct from the unique nonempty zero-coordinate box when `n=m=0`. Conversion sends ordered tuples to their nonempty interval and invalid tuples to bottom. Do not replace this by coordinatewise bottoms. `BoxIntegral.Box` has strict side lengths and half-open membership and is not this state.

For `a=A i j`, the signed product endpoints are

```
zL i j = if 0 ≤ a then a * xL j else a * xU j
zU i j = if 0 ≤ a then a * xU j else a * xL j.
```

Both are zero at `a=0`. Row image endpoints sum these products; rest endpoints omit `j`. Every maximum/minimum over rows is seeded with the incoming variable endpoint. Division occurs only in positive or negative coefficient branches; a zero coefficient imposes no inverse restriction.

`clip(q,q₀)` intersects both components with their initial endpoints. `U` leaves X unchanged and intersects B with its affine image. `D` leaves B unchanged and intersects each variable with all row inverse intervals computed from the **same incoming state**. For positive `a`, inverse lower/upper endpoints are `(bL-restU)/a`, `(bU-restL)/a`; for negative `a` they are `(bU-restL)/a`, `(bL-restU)/a`. Define

```
F(q) = D(U(clip(q,q₀))),    q_k = F^[k](q₀).
```

These raw formulas remain defined after invalid intersections. Public iteration applies the formula on nonempty states and makes global empty absorbing. Ordered intermediate states must be derived, not assumed.

## Exact supplier contracts

### From Mathlib

- `NonemptyInterval`, `Interval`, `Interval.recBotCoe` (`Mathlib/Order/Interval/Basic.lean`) supply ordered endpoint pairs, one global bottom and elimination into the two cases. `Set.Icc` supplies Cartesian membership; Layer 1 supplies the conversion and inclusion lemmas.
- `Finset.fold`, `Finset.le_fold_max`, `Finset.fold_min_le` (`Mathlib/Data/Finset/Fold.lean`) supply finite seeded extrema; `Finset.sum` supplies finite row and width sums. Layers 1–2 supply their concrete endpoint identities.
- `Matrix.mulVec` (`Mathlib/Data/Matrix/Mul.lean`) supplies affine row evaluation; signed endpoint images and inverse candidates are built here.
- `Continuous.max`, `Continuous.min` (`Mathlib/Topology/Order/OrderClosed.lean`) and ordinary continuous finite arithmetic supply the fixed-coefficient continuity ingredients. Layer 2 proves continuity of the concrete formulas, including the zero branches.
- `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf` (`Mathlib/Topology/Order/MonotoneConvergence.lean`) supply bounded monotone real convergence; `tendsto_pi_nhds` (`Mathlib/Topology/Constructions.lean`) supplies coordinatewise product convergence. Layer 4 establishes the required bounds and endpoint order for actual iterates.
- `Function.IsFixedPt` (`Mathlib/Logic/Function/Defs.lean`), `IsGreatest` (`Mathlib/Order/Bounds/Defs.lean`), `IsMaxOn`, `IsMinOn` (`Mathlib/Order/Filter/Extr.lean`) supply fixed-point and extrema vocabulary, not FBBT results or LP oracles.

`OrderHom.gfp` and `fixedPoints.gfp_eq_sInf_iterate` (`Mathlib/Order/FixedPoints.lean`) need a complete lattice, the latter also an order-continuity hypothesis, and give no `Tendsto`; Layer 4 proves the concrete limit directly. They are comparisons, not suppliers for the finite consistent-box type.

### From Tau Ceti

No existing Tau Ceti declaration or other roadmap target is consumed. Build the missing concrete lemmas here; no generic LP solver, LP duality or research axiom is a prerequisite.

## How to read the build

The dependency order is 1 → 2 → 3 → 4 → 5, with unconditional infeasibility in 5 using 1–3 directly. Each numbered target includes its basic API and proved checks. Suggested signatures are aids, never an exhaustive checklist. Their intentional `sorry` proofs check expressibility and do not certify the targets; implementations use proved lemmas and the native interfaces above.

## Layer 1: endpoints, interval operations and affine images

### 1.1 Joint endpoints and public intervals

Define `Coord`, `Raw` and `State` with the conventions above, and `pack` as conversion to the ordered interval or global bottom.

*Needs:* Mathlib `NonemptyInterval`, `Interval`, `Interval.recBotCoe`, `Set.Icc`.

**API.**

- Constructors, endpoint projections, extensionality and singleton identities for raw and ordered tuples.
- Membership in `pack q` is exactly membership in `Set.Icc q.1 q.2`; `pack q = ⊥` exactly when `¬ q.1 ≤ q.2`.
- Ordered raw tuples correspond to nonempty public states; inclusion agrees with endpoint containment. Distinguish the empty coordinate function from global bottom.

**Checks.**

- `q=([1],[0])` packs to bottom; `[0,1]` contains `1/2`.
- A singleton interval contains exactly its endpoint.
- At `n=m=0`, the unique raw tuple packs to a nonbottom state containing the unique empty function; allow `n=0,m>0` and `m=0,n>0` separately.

### 1.2 Containment and total width

Define `Within q r` by the endpoint inequalities above and `width q` by the total joint-coordinate sum.

*Needs:* 1.1, finite real sums and pointwise order.

**API.**

- Reflexivity, transitivity, antisymmetry and ordered membership/inclusion correspondence for `Within`.
- Nonnegativity of `width` on ordered tuples, its variable-plus-row sum decomposition, and monotonicity under containment of ordered tuples.
- Containment plus equal width implies equality of ordered finite endpoint tuples; equal width alone does not.

**Checks.**

- `[0,1]` and `[1,2]` both have width 1 but are unequal and incomparable.
- `[0,1]` is contained in `[0,2]` with strictly smaller width.
- Singleton tuples and the empty coordinate tuple have width zero.

### 1.3 Signed products, row images and omitted sums

Define `zLo`, `zHi`, `imageLo`, `imageHi`, `restLo` and `restHi` by the signed formulas and finite sums above. These are the affine arithmetic behind Belotti et al. 2010, (9)–(10), pp. 71–72.

*Needs:* 1.1, finite sums and real ordered-field arithmetic.

**API.**

- Positive, negative and zero coefficient simplifications; signed products enclose `A i j * x j` for every point in an ordered variable box and have ordered endpoints.
- Exact attained extrema over an ordered variable box for each product and row image, including zero coefficients.
- Image decomposition into one product plus its omitted sum, membership bounds, and omitted-sum identities.

**Checks.**

- `a=-2`, `X=[1,3]` gives product `[-6,-2]` and encloses `-4` at `x=2`.
- A zero coefficient gives `[0,0]` even when its variable has positive width; a zero row has image `[0,0]`.
- A zero column contributes zero to every row; with zero variables every row image is `[0,0]` and with one variable the omitted sum is zero.

### Examples

Prove all Layer 1 checks, including negative and zero coefficients, singleton boxes and both zero-dimensional cases.

### Dependencies

Mathlib intervals, finite products, sums and real ordered-field arithmetic; no later layer.

## Layer 2: simultaneous operator and actual iteration

### 2.1 Clipping and the maps U, D, F

Define `clip`, `inverseLo`, `inverseHi`, `up` (U), `down` (D) and `step` (F) as in Conventions. All inverse candidates in D use the same incoming tuple. This is the qualified joint construction of Belotti et al. 2010, (9)–(11), pp. 71–72.

*Needs:* Layer 1 and `Finset.fold`, `Finset.le_fold_max`, `Finset.fold_min_le`.

**API.**

- Endpoint and membership formulas for clipping, U, D and F, including empty intersections.
- Positive and negative inverse formulas; zero coefficients impose no inverse restriction. Seeded-extrema identities include the empty row set.
- U preserves variable endpoints, D preserves row endpoints; compatibility with the signed images and omitted sums.

**Checks.**

- With no rows, an ordered initial tuple is fixed by F.
- For `a=-1`, `B=[0,0]` and rest interval `[-2,2]`, inverse bounds are `[-2,2]`; the sign swaps both bounds.
- For `a=2`, initial variable box `[0,1]²` and equality rows `2*x₁-x₂=0`, `x₁-2*x₂=0`, one simultaneous step has uppers `(1/2,1/2)`; visiting rows in order with immediate updates gives `(1/2,1/4)` instead.

### 2.2 Contraction, monotonicity and continuity of F

Prove raw contraction into both the incoming tuple and `q₀`, monotonicity for `Within`, and continuity of `step A q₀` in the finite product topology for fixed A and `q₀`. Derive persistence of invalidity from contraction. Compare Belotti et al. 2010, Lemma 2.1, p. 70: its inflationary convention uses reverse inclusion.

*Needs:* 2.1, finite arithmetic, `Continuous.max`, `Continuous.min`.

**API.**

- Each lower endpoint increases and upper endpoint decreases under F, even for invalid raw tuples.
- Contained input tuples give contained outputs; all coefficient sign branches are fixed with respect to q.
- Finite maxima/minima and fixed nonzero division give concrete continuity; once invalid, every subsequent raw tuple remains invalid.

**Checks.**

- With no rows, `q=[1,0]` and `q₀=[0,2]` remain invalid after clipping and F.
- In the two-row `a=2` example, `[0,1/2]²` maps to `[0,1/4]²` and is contained in the image of `[0,1]²`.
- With A zero, no division by zero is used and row images remain continuously constant zero.

### 2.3 Raw and public iterates

Define `publicStep`, `rawRun` and `publicRun`: the raw iterate is `(step A q₀)^[k] q₀`; the public iterate starts at `pack q₀` and makes bottom absorbing.

*Needs:* 1.1, 2.1–2.2, `Interval.recBotCoe` and function iteration.

**API.**

- Initial and successor identities, absorbing-bottom identity and every-iterate bridge `publicRun A q₀ k = pack (rawRun A q₀ k)`.
- Monotone lower and antitone upper endpoint sequences, derived from contraction.
- Public nonemptiness is equivalent to raw endpoint ordering at that iterate.

**Checks.**

- A zero-coefficient row with B=`[1,1]` becomes invalid in U and stays public bottom after the first step.
- With zero variables and a conflicting row `[1,1]`, the row sum is zero and the same empty absorption holds.
- With no rows, ordered `q₀` stays fixed; at `n=m=0` every iterate is nonbottom.

### 2.4 Graph points survive every iterate

Define `graph A x=(x,A.mulVec x)`. Prove `graph_survives`: every graph point initially in `Set.Icc q₀.1 q₀.2` belongs to every public iterate. This is the point-retention content of the up/down construction, Belotti et al. 2010, §2 and (9)–(11).

*Needs:* Layer 1, 2.1–2.3, `Matrix.mulVec`.

**API.**

- Variable/row projections, extensionality and initial membership characterization for `graph`.
- One-step retention through clipping, U and D, followed by induction for every actual iterate.
- Retention yields nonemptiness when a graph point is supplied, without identifying every fixed box with an affine feasible hull.

**Checks.**

- `(0,0)` survives every iterate of the two-row `a=2` example.
- With `A=(-2)` and `x=1`, the graph has row value `-2` and survives its singleton box.
- The zero row and B=`[1,1]` admit no graph point, as the row value is always zero.

### 2.5 Fixed tuples lie in every iterate

Prove every ordered raw fixed tuple lies within `q₀` and within every raw iterate, by contraction, monotonicity and induction. Fixedness and order are hypotheses here, not assumptions about the limit later constructed in 4.2.

*Needs:* 2.2–2.3 and `Function.IsFixedPt`.

**API.**

- Initial containment follows from fixedness; induction gives containment in each actual iterate.
- Ordered fixed tuples give nonempty public iterates by 1.1.
- Endpoint inequalities are available coordinatewise for the supremum/infimum comparison in 4.2.

**Checks.**

- With no rows and initial `[0,2]`, both `[0,1]` and `[1,2]` lie in every iterate.
- `[0,3]` fails fixedness for the same initial tuple, since clipping reduces its upper bound to 2.
- With no coordinates the sole raw tuple is fixed and all containment statements hold.

### Examples

For `a>1`, variable bounds `[0,1]²` and equality rows `a*x₁-x₂=0`, `x₁-a*x₂=0`, prove both simultaneous upper endpoints are `1/a^k`, lower endpoints are zero, and row endpoints stay zero. Width is positive at every finite k and tends to zero, so there is no finite stabilization. This adapts Belotti et al. 2012, Example 2.4, p. 8, whose row-by-row iteration is sequential; its intermediate states are not identified with this simultaneous run.

### Dependencies

Layer 1 and Mathlib finite continuous arithmetic and iteration; no later layer.

## Layer 3: independent scalar LP and fixed-state correspondence

### 3.1 The assignment LP

Define `Assignment` with independent `endpoints`, `zL` and `zU`, `canonical` with the signed products of its endpoints, `lpFeasible` by the scalar constraints below, and `objective` as `width` of the endpoints. These formalize the qualified LP of Belotti et al. 2010, (14)–(34), p. 73.

Require endpoint ordering and initial containment in both X and B; require every signed product equality, including zero coefficients. Impose

```
∑ j, zL i j ≤ bL i,       bU i ≤ ∑ j, zU i j;
```

for `a=A i j>0`, impose

```
(bL i - ∑ k≠j, zU i k)/a ≤ xL j,
xU j ≤ (bU i - ∑ k≠j, zL i k)/a;
```

and for `a<0`, impose

```
(bU i - ∑ k≠j, zL i k)/a ≤ xL j,
xU j ≤ (bL i - ∑ k≠j, zU i k)/a.
```

The objective is `∑ j, (xU j-xL j) + ∑ i, (bU i-bL i)`. All constraints are affine for fixed A, without a fixedness condition or optimization oracle in the definition.

The LP (14)–(34) is read with four corrections: the row index in (17)–(18) is i; (28) ranges over S−; products with `a_ij = 0` are fixed to 0; the prose after (34) means containment in `(X⁰,B⁰)`. The resulting qualified LP is distinct from the literal printed displays.

*Needs:* Layer 1, scalar ordered-field arithmetic and finite sums.

**API.**

- Assignment constructor/projection/extensionality identities; canonical endpoints and product projections.
- Feasibility introduction/elimination for each displayed constraint, ordered auxiliary product intervals and canonical-product equality.
- Objective equals the variable-plus-row width sum and depends only on endpoints; define the scalar feasible set by these constraints.

**Checks.**

- `a=-2`, singleton `x=1,b=-2` has `zL=zU=-2` and both inverse endpoints 1.
- `a=0` forces both products to zero, rather than leaving free variables in row sums.
- With no rows and initial `[0,2]`, `[0,1]` and `[1,2]` are feasible with width 1, while `[0,2]` has width 2; equal smaller widths do not establish optimality.

### 3.2 LP feasibility equals ordered fixedness

Prove `lp_iff_fixed`: a full assignment is feasible exactly when it is the canonical assignment of ordered endpoints fixed by `step A q₀`. Derive fixedness from the scalar constraints, including initial containment. This is the explicit endpoint correspondence behind Belotti et al. 2010, Theorem 4.2 and (14)–(34), p. 73.

*Needs:* 3.1 and Layer 2.

**API.**

- Both directions of the correspondence, independent of LP nonemptiness or a graph point.
- A feasible endpoint tuple determines all product coordinates uniquely.
- Canonical ordered fixed tuples satisfy each positive, negative and zero coefficient constraint.

**Checks.**

- With no rows, `[0,1]` inside initial `[0,2]` is feasible and fixed; `[0,3]` is neither.
- A zero row with B=`[1,1]` has no ordered fixed tuple and no feasible assignment.
- Three variables in `[-1,1]` with equality rows `(1,1,1)`, `(1,1,-1)`, `(1,-1,1)`, `(-1,1,1)` and row values `0,0,0,1` form an ordered fixed tuple and feasible canonical assignment. Each inverse interval contains `[-1,1]`, but the first three equalities force zero and contradict the fourth. Thus LP feasibility does not imply an affine graph point.

### 3.3 Singleton graph assignment and infeasibility

Construct the canonical singleton assignment for every initially enclosed graph point and prove its LP feasibility. Deduce unconditionally that LP infeasibility excludes every such graph point. These are point-retention consequences of the same 2010 up/down and scalar constraints, not a converse feasibility test.

*Needs:* 2.4 and 3.1–3.2.

**API.**

- Singleton signed-product and image identities and each scalar constraint on graph singletons.
- LP infeasibility implies the initially enclosed affine graph is empty, without assuming nonempty iterates.
- No converse identifying LP feasibility with original affine feasibility.

**Checks.**

- The graph of `x=1,A=(-2)` gives the feasible singleton assignment above.
- With zero variables and row B=`[1,1]`, the singleton graph fails membership and the LP is infeasible.
- The four-row fixed-box example in 3.2 remains LP-feasible despite having no graph point.

### Examples

Prove the signed/zero product checks and both no-row incomparable smaller fixed boxes; prove the four-row counterexample exactly, including every inverse containment and the contradiction among its equations.

### Dependencies

Layers 1–2 and scalar ordered-field arithmetic; no limit or optimizer assumption.

## Layer 4: conditional limit and unique full-width optimum

### 4.1 Nonemptiness criteria

For ordered finite `q₀`, prove equivalence of (a) every public iterate has a Cartesian member, (b) an ordered raw fixed tuple exists, and (c) the scalar LP has a feasible assignment. `run_nonempty_iff_lp` states (a) ↔ (c). This makes explicit the nonemptiness qualification for the greatest-box/LP construction of Belotti et al. 2010, §4.1, pp. 72–73.

*Needs:* Layers 1–3, bounded monotone real convergence and finite product topology. Construct ordered limiting endpoints from the nonempty actual iterates, obtain fixedness by 2.2 continuity, and then apply 3.2; retain this construction for 4.2.

**API.**

- Fixed-tuple existence implies every-iterate nonemptiness by 2.5.
- Every-iterate nonemptiness gives ordered endpoint limits and hence a fixed tuple; use 3.2 for LP equivalence.
- Separate these conditions from original graph feasibility and from finite termination.

**Checks.**

- The positive two-row recurrence has nonempty iterates, a singleton fixed tuple and a feasible LP.
- A zero row with B=`[1,1]` fails all three conditions.
- The four-row example in 3.2 satisfies all three conditions without any graph point.

### 4.2 The limit is the greatest fixed tuple

Define `endpointLimit` by lower endpoint suprema and upper endpoint infima of **actual** `rawRun` iterates. Under (a) of 4.1, prove `actual_limit`: ordered limiting endpoints, containment in `q₀`, convergence in the finite product topology, concrete fixedness, and greatestness among all ordered fixed tuples in interval inclusion order. Establish graph preservation at this limit.

Belotti et al. 2010, §2.3, Theorem 2.2, p. 70 and §4.1, pp. 72–73 discuss convergence and the greatest fixed point. Here the concrete finite-real endpoint proof establishes the displayed `Tendsto` for this raw/public model; the abstract complete-lattice statement is not imported as a convergence certificate.

*Needs:* Layers 1–3, `tendsto_atTop_ciSup`, `tendsto_atTop_ciInf`, `tendsto_pi_nhds` and 2.2 continuity. Prove from nonempty iterates that all lower/upper sequences are bounded by the finite initial endpoints and bound each other, then obtain ordered limits, fixedness by continuity and greatestness by 2.5. Reuse the endpoint construction established in 4.1.

**API.**

- Coordinate supremum/infimum identities and bounds, orderedness and full product `Tendsto`.
- Fixedness and greatestness are conclusions of the actual iteration; neither a graph point nor a chosen fixed tuple substitutes for the construction.
- Every initially enclosed graph point belongs to the limiting interval by closed endpoint inequalities.

**Checks.**

- The positive recurrence has the all-zero variable and row singleton limit, reached at no finite k.
- With no rows, the limit is the initial box; each smaller fixed box lies inside it.
- At `n=m=0`, the limit is the unique raw tuple and its public state is nonempty.

### 4.3 Unique full-width optimum

Prove `unique_full_width_optimum`: the canonical limit assignment is feasible, attains `IsMaxOn objective` on the scalar feasible set, and is the unique maximizing **entire assignment**, including B and all product coordinates. Use endpoint containment, total-width equality and canonical products. This is the qualified joint-width conclusion of Belotti et al. 2010, Proposition 4.1, p. 72 and Theorem 4.2, p. 73.

*Needs:* 1.2, 3.2, the limit construction and greatestness of 4.2 under every-iterate nonemptiness.

**API.**

- Explicit feasible-set membership along with `IsMaxOn` for the canonical limit.
- Every feasible assignment has no larger joint width; equal optimal width implies equal endpoints and products.
- Keep the joint objective when an index set is empty; no assumed optimal assignment or arbitrary fixed tuple replaces this limit.

**Checks.**

- The positive recurrence has unique zero-width singleton optimum.
- With no rows and initial `[0,2]`, width 2 at `[0,2]` strictly exceeds both width-1 smaller fixed boxes.
- At `n=m=0` the entire assignment is unique and its objective is zero, while the public state is nonempty.

### Examples

Prove the conditional limit and optimum checks, and graph preservation at the limit. Nonempty fixed boxes and LP assignments remain distinct from affine graph feasibility.

### Dependencies

Layers 1–3, bounded monotone real convergence, finite product topology and concrete continuity. The shared endpoint construction in 4.1–4.2 precedes the optimizer proof in 4.3.

## Layer 5: bounded original-coordinate application

### 5.1 Initialization

Define `sourceInitial` for `Ax≤r` and ordered finite variable endpoints `l,u` by the row interval

```
[min(imageLo i ([l,u]), r i), r i].
```

Define `sourceSet` as the original feasible set

```
S = {x | Ax≤r ∧ x∈T ∧ ∀ j∈I, ∃ z:ℤ, x j=(z:ℝ)},
```

and `variableBox` as the variable-coordinate `Set.Icc` of a joint raw tuple. This bounded application uses the point-retention principle of Belotti et al. 2010, §2 and §4, and adds the bounded feasible-set/minimizer corollaries here. The thesis §2.3.7.1, pp. 35–36 supplies preprocessing context, not this application theorem. This is not a nonlinear or integer propagation theorem.

*Needs:* Layer 1 and 2.4, `Matrix.mulVec` and `Set.Icc`.

**API.**

- Initialization endpoint projections, ordering from `l≤u`, and graph membership exactly `x∈Set.Icc l u ∧ Ax≤r`.
- Membership/projection, extensionality and intersection lemmas for `sourceSet` and `variableBox`.
- Additional set T and designated integer coordinates remain unchanged; no relaxation replaces either restriction.

**Checks.**

- For X₀=`[0,2]²` and `x+y≤2`, the row initialization is `[0,2]`.
- For `A=(1),l=u=1,r=0`, initialization is ordered with row `[0,0]`, but no graph point belongs to it.
- With no affine rows, graph membership in the initialization is just variable-box membership, retaining T and integer restrictions separately.

### 5.2 Infeasibility

Prove `source_infeasible`: LP infeasibility implies `S∩Set.Icc l u=∅`, without a run-nonemptiness assumption.

*Needs:* 5.1 and 3.3; no Layer 4 hypothesis.

**API.**

- Transfer an original feasible point to an initially enclosed graph point and its singleton LP assignment.
- Deduce emptiness by contradiction for arbitrary T and designated integer coordinates.
- Keep the implication one-way: affine inconsistency need not be detected by this LP.

**Checks.**

- `A=(1),l=u=1,r=0` has an infeasible LP and an empty original bounded feasible set.
- Empty T makes the original feasible set empty even if the LP is feasible.
- The four-row example in 3.2, represented by both directions of each equality, still shows that nonempty propagation need not imply original feasibility.

### 5.3 Preservation

Under every-public-iterate-nonempty, prove `source_preservation`: ordered, initial-contained limiting variable bounds and `S∩X_limit=S∩X₀`. For exactly the original objective f and every x, prove equivalence of membership together with native `IsMinOn` on these two feasible sets. Do not assume or conclude attainment of an arbitrary objective.

*Needs:* 5.1, 4.1–4.3 and graph preservation at the limit from 4.2.

**API.**

- Limiting variable endpoint order, initial containment and both inclusions of the original feasible-set equality.
- The original objective f, T and integer coordinates are identical on both sides.
- Transfer of membership plus `IsMinOn`, with attained examples proved separately rather than universal attainment asserted.

**Checks.**

- For X₀=`[0,2]²`, `x+y≤2`, `1≤x²+y²`, `x∈ℤ` and `f=(x-1)²+y²`, prove `(1,0)` is an attained minimizer with value zero and is preserved.
- `(0,0)` passes the affine, box and integer restrictions but fails the nonlinear restriction.
- `(1/2,1)` passes the affine, box and nonlinear restrictions but fails integrality; both original restrictions remain effective.

### Examples

Prove the initialization, unconditional infeasibility and attained-minimizer checks; retain the original objective and restrictions exactly.

### Dependencies

Layers 1–3 for infeasibility; Layer 4 for limit preservation. Original restrictions enter by intersection, without a nonlinear propagation or integer-rounding API.

## Downstream consumers

Bounded finite-dimensional model presolve consumes graph preservation, unconditional infeasibility and exact original-feasible-set/minimizer preservation. Interval propagation clients consume the raw/public bridge and simultaneous operator lemmas. Scalar polyhedral descriptions consume the explicit affine feasible set and full-width optimum, without a generic optimization solver. These are supplied interfaces, not additional solver or nonlinear-expression roadmaps.

## References

- Belotti, Cafieri, Lee and Liberti, *Feasibility-Based Bounds Tightening via Fixed Points*, COCOA 2010, LNCS 6508, 65–76, [DOI 10.1007/978-3-642-17458-2_7](https://doi.org/10.1007/978-3-642-17458-2_7); [author manuscript](https://www.lix.polytechnique.fr/~liberti/fbbt-cocoa10.pdf), internal pp. 7–9. Adopted simultaneous construction: §4, pp. 71–73, (9)–(34), Proposition 4.1 and Theorem 4.2, with the explicit display corrections in 3.1.
- Bernal Neira, *Modern Computational Approaches to Nonlinear Discrete Optimization and Applications in Process Systems Engineering*, Carnegie Mellon PhD thesis, May 2021, original §2.3.7.1, pp. 35–36: preprocessing survey and citation context.
- Kronqvist, Bernal, Lundell and Grossmann, *A review and comparison of solvers for convex MINLP*, Optimization and Engineering 20 (2019), 397–455, §3.7.1 p. 406, [DOI 10.1007/s11081-018-9411-8](https://doi.org/10.1007/s11081-018-9411-8). Its sequential preprocessing description does not state the simultaneous joint-width LP theorem; the June 3, 2018 author manuscript, §3.8, is a separate version.
- Belotti et al., *On feasibility based bounds tightening*, [Optimization Online, 24 January 2012](https://optimization-online.org/2012/01/3325/), §2.5 Algorithm 1, Example 2.4 p. 8 and §4 (30)–(43). Its sequential algorithm and variable-only width objective are distinct from the adopted joint-width theorem.
- Bordeaux, Katsirelos, Narodytska and Vardi, *The Complexity of Integer Bound Propagation*, JAIR 40 (2011), 657–676, §3.4.1 p. 668, [DOI 10.1613/jair.3248](https://doi.org/10.1613/jair.3248): continuous-linear-propagator fixed-point context, not an identification of the full joint objective.
- Gleixner, Berthold, Müller and Weltge, *Three enhancements for optimization-based bound tightening*, March 2016 ZIB Report 15-16, §1.2; journal version JGO 67 (2017), 731–757, [DOI 10.1007/s10898-016-0450-4](https://doi.org/10.1007/s10898-016-0450-4): OBBT context.
- Gemander et al., *Two-row and two-column mixed-integer presolve using hashing-based pairing methods*, EJCO 8 (2020), 205–240, §2 p. 209, [DOI 10.1007/s13675-020-00129-6](https://doi.org/10.1007/s13675-020-00129-6): later presolve context; no integer-rounding theorem is imported.
- [Complete Retained Library](https://github.com/bernalde/complete-retained-library/tree/59c355eb14ed1eff9664736428ca02b4543200b8), project-owned Apache-2.0 proof software: secondary formalization provenance for the qualified simultaneous family and bounded application, not a specification of the API or a proof of the admitted signatures here.
