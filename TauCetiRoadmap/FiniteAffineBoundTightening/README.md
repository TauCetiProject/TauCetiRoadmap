# Roadmap: finite simultaneous affine feasibility-based bound tightening

## Summary

Build finite real-interval feasibility-based bound tightening (FBBT) for an affine system `Ax ∈ B₀` in a variable box `X₀`. Retain both variable and row intervals, construct the simultaneous operator and its actual iterates, and identify their conditional endpoint limit with the greatest ordered fixed box and the unique maximizer of an independent scalar linear program's total variable-and-row width. Apply this theory to bounded original-coordinate optimization models while retaining their objective and additional nonlinear and integer restrictions.

The adopted mathematics is the qualified simultaneous `(X,B)` construction of Belotti, Cafieri, Lee and Liberti (2010), pp. 71–73, equations (9)–(34). This is a formalization of established mathematics. The thesis and coauthored review cited below supply preprocessing context; they do not state the joint-width LP theorem.

## Scope

Coefficients and endpoints are finite reals; variables have index type `Fin n`, rows `Fin m`, with either dimension allowed to be zero. The development owns the concrete affine endpoint arithmetic, joint state and raw/public bridge, simultaneous iteration, scalar LP correspondence, conditional greatest limit and full-assignment uniqueness, and bounded source application. Supply a reusable basic API for every introduced object: constructors and projections, membership, extensionality, inclusion, simplification, and the compatibility lemmas consumed by later layers.

Excluded are sequential row visits and fairness, the 2012 variable-only objective theorem, infinite endpoints, general abstract-lattice iteration, nonlinear expression propagation, integer rounding, numerical tolerances, finite termination, rational complexity, solver implementation and performance claims, and unbounded-source equivalence. A nonempty fixed box need not contain a point of the affine graph.

## Conventions

Use `Matrix (Fin m) (Fin n) ℝ`, finite sums, `Set.Icc`, `Continuous`, `Filter.Tendsto`, `Function.IsFixedPt`, `IsGreatest`, `IsMaxOn` and `IsMinOn`. Extrema assertions include membership: `IsMaxOn` and `IsMinOn` alone do not assert it.

A raw tuple `q=(l,u)` has endpoints on `C = Fin n ⊕ Fin m`; variable coordinates are `Sum.inl`, row coordinates `Sum.inr`. It is ordered when `l ≤ u` pointwise, its members are `Set.Icc l u`, and its total width is `∑ c, (u c - l c)`. Endpoint containment of `q` in `r` is `r.l ≤ q.l ∧ q.u ≤ r.u`, including for raw invalid tuples. For ordered tuples this agrees with Cartesian inclusion. Singleton boxes are permitted.

The public state is Mathlib's `Interval (C → ℝ)`, namely `WithBot (NonemptyInterval (C → ℝ))`. It has one global empty state, distinct from the unique nonempty zero-coordinate box when `n=m=0`. Raw-to-public conversion sends ordered tuples to their nonempty interval and invalid tuples to bottom. Do not replace this state by coordinatewise bottoms. `BoxIntegral.Box` uses strict side lengths and half-open membership, so it is not this state.

For each coefficient `a=A i j`, use signed products

```
zL i j = if 0 ≤ a then a * xL j else a * xU j
zU i j = if 0 ≤ a then a * xU j else a * xL j.
```

Both are zero when `a=0`. The row image endpoints sum these products; the rest endpoints omit `j`. Every maximum/minimum over rows is seeded with the incoming variable endpoint. Division occurs only in positive or negative coefficient branches; a zero coefficient imposes no inverse restriction.

`clip(q,q₀)` intersects both components with their initial endpoints. `U` leaves X unchanged and intersects each row B with its affine image. `D` leaves B unchanged and intersects each variable interval with all row inverse intervals, computing them from the **same incoming state**. For positive `a`, its inverse lower/upper endpoints are `(bL-restU)/a`, `(bU-restL)/a`; for negative `a` they are `(bU-restL)/a`, `(bL-restU)/a`. Define

```
F(q) = D(U(clip(q,q₀))),    q_k = F^[k](q₀).
```

Define these raw formulas after invalid intersections too. Public iteration starts at the conversion of `q₀`, applies this formula to nonempty states, and makes global empty absorbing. Do not assume ordered intermediate states as a shortcut.

## Exact supplier contracts

| Supplier | Exact material consumed | Work supplied here |
| --- | --- | --- |
| Mathlib `Order/Interval/Basic` | `NonemptyInterval`, `Interval`, membership, inclusion order and bottom | Raw joint endpoint conversion, ordered membership/order equivalences, zero-coordinate distinction |
| Mathlib finite real products and `Data/Finset/Fold` | Pointwise order/topology, finite sums, seeded `fold max`/`fold min` | Signed affine image/rest arithmetic, concrete U and D, their contraction, monotonicity and continuity |
| Mathlib order/topological convergence | Supremum/infimum and monotone bounded real convergence, finite product convergence | Bounds for actual iterates, their ordered endpoint limit and fixedness |
| Mathlib fixed-point and extrema vocabulary | `Function.IsFixedPt`, `IsGreatest`, `IsMaxOn`, `IsMinOn` | Fixed-state/scalar-LP equivalence, total-width uniqueness and source minimizer preservation |

These suppliers provide no FBBT or LP oracle. Build all missing concrete lemmas in Tau Ceti; no generic LP solver, LP duality or additional research axiom is a prerequisite. Tau Ceti's `IsConvexPolyhedron` describes finite intersections of closed affine halfspaces and can describe the scalar feasible set; the concrete constraints below suffice without requiring a second general polyhedron theory. The network-flow and optimal-transport roadmaps own different feasibility problems, and VariationalMethods owns weak/energy minimization; none supplies or is required for the concrete FBBT theorem.

## How to read and build

This README is definitive. [Suggested.lean](Suggested.lean) gives actual definitions and suggested headline signatures, never an exhaustive checklist. Its intentional `sorry` proofs express targets; elaboration checks their expression and does not certify them. Implementations use ordinary proved lemmas and the native interfaces above, rather than importing admitted prototypes.

The dependency order is 1 → 2 → 3 → 4 → 5, with the unconditional infeasibility part of 5 using 1–3 directly. Each layer's examples are required proved checks of the definitions and theorems. Build the module in the roadmap checkout with `lake build TauCetiRoadmap.FiniteAffineBoundTightening.Suggested`; validate metadata with `python3 .github/scripts/check_roadmap_topics.py`.

## Layer 1: endpoints, interval operations and affine images

Develop raw ordered tuples and their conversion to nonempty/public intervals. Prove membership and extensionality, exact inclusion correspondence, clipping membership and bounds, singleton and empty-coordinate identities, width nonnegativity and monotonicity, and equality from containment with equal total width. The last implication uses ordered finite endpoints; equal width alone does not imply equal boxes.

Develop signed product bounds and exact extrema over an ordered variable box, sign/zero simplifications, row image and omitted-variable sum formulas, and finite seeded-extrema properties. Prove the auxiliary product intervals are ordered. Reuse existing interval/order/sum APIs; do not build a general multiplication-of-intervals hierarchy.

**Examples.** Negative and zero coefficients, a zero row, a zero column, singleton boxes and both zero-dimensional cases. For zero rows, show their image is `[0,0]`. For no rows, show seeded variable extrema return the incoming endpoints. For zero variables and zero rows, prove the nonempty interval on the empty coordinate function is distinct from public bottom.

**Dependencies.** Mathlib intervals, finite products and finite sums/extrema only.

## Layer 2: simultaneous operator and actual iteration

Define `clip`, U, D and F with the conventions above. Prove their projection and membership formulas, raw contraction and endpoint monotonicity, and continuity for fixed A and `q₀`. Prove persistence of raw invalidity and agreement of every actual raw/public iterate, including empty absorption. Prove each initially enclosed graph point `(x,Ax)` survives every iterate. Prove every ordered fixed tuple lies inside `q₀` and every iterate. Derive monotone endpoint sequences from contraction; these properties must be conclusions of the formulas.

**Examples.** A one-variable zero-coefficient row B=`[1,1]` becomes empty in U and remains empty. With zero variables and a conflicting row `[1,1]`, verify the same behavior. With no rows, ordered `q₀` is fixed. For the nonterminating positive example take two variables, rows `a*x₁-x₂=0` and `x₁-a*x₂=0`, `a>1`, row bounds `[0,0]` and variable bounds `[0,1]`. Prove simultaneous variable upper endpoints are both `1/a^k` at step k, lower endpoints remain zero, and widths are positive for every finite k and tend to zero. This is convergence without finite stabilization.

**Dependencies.** Layer 1 and Mathlib continuity of finite arithmetic, maxima and minima. Division is by fixed nonzero coefficients in the corresponding branches.

## Layer 3: independent scalar LP and fixed-state correspondence

An assignment contains independently chosen `xL,xU,bL,bU,zL,zU`. Define its feasible set by scalar constraints, not by fixedness or an optimization oracle. Require endpoint ordering, endpoint inclusion within initial X and B, and each signed product equality above, including zero entries. Impose

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

All are affine constraints for fixed A. The objective is

```
∑ j, (xU j-xL j) + ∑ i, (bU i-bL i).
```

Prove feasible assignments have ordered auxiliary intervals and are exactly the canonical signed-product assignments of ordered raw fixed tuples. Establish the singleton graph assignment. Deduce unconditionally that LP infeasibility excludes every initially enclosed graph point.

This transcription normalizes the row subscript in source (17)–(18), the negative branch label in (28), the missing zero-entry product equalities, and both-component initial clipping in the prose after (34). It adopts the qualified construction and does not certify the literal displays unchanged. Both inspected 2010 versions print S+ in (28).

**Examples.** Prove the negative/zero entries satisfy precisely their intended equalities and inverse rows. With no rows and initial variable interval `[0,2]`, the boxes `[0,1]` and `[1,2]` give incomparable LP-feasible fixed states, each width 1, strictly below the greatest box `[0,2]`, width 2. Neither smaller state is maximal: arbitrary fixedness or equal smaller widths cannot establish optimality.

Also exhibit an ordered fixed box with no graph point: three variables each in `[-1,1]`; four equality rows with coefficients `(1,1,1)`, `(1,1,-1)`, `(1,-1,1)`, `(-1,1,1)` and row values `0,0,0,1`. Each inverse interval contains the incoming variable box, but the first three equations force all variables to zero, contradicting the fourth. Thus scalar-LP feasibility is not original affine feasibility.

**Dependencies.** Layers 1–2 and scalar ordered-field arithmetic. The LP-to-fixed proof derives all fixedness properties from these displayed constraints.

## Layer 4: conditional limit and unique full-width optimum

For ordered finite `q₀`, prove equivalence of (a) every public iterate has a Cartesian member, (b) an ordered raw fixed tuple exists, and (c) the scalar LP has a feasible assignment. Under (a), construct lower endpoint suprema and upper endpoint infima of the **actual** iterates and prove their convergence in the finite product topology. Prove the limiting tuple is ordered, inside `q₀`, fixed, and greatest among all ordered fixed tuples in interval inclusion order. Establish graph preservation at this limit.

Prove its canonical assignment is feasible, attains `IsMaxOn` of the total-width objective, and is the unique maximizing **entire assignment**, including B and all product coordinates. Use endpoint containment, total-width equality and canonical products for uniqueness. Do not replace the conditional construction by an assumed fixed point, graph point or optimal assignment.

**Examples.** Identify the positive recurrence's singleton limit and unique LP optimum. Recheck the no-row incomparable smaller fixed boxes against the greatest optimum; the objective uses both components even when one index set is empty. The `n=m=0` problem has its unique empty-coordinate assignment and a nonempty public state.

**Dependencies.** Layers 1–3, bounded monotone real convergence, finite product topology and concrete continuity. This layer proves the required limit machinery for this operator; a general lattice fixed-point theorem is not a missing supplier.

## Layer 5: bounded original-coordinate application

For `Ax≤r` and ordered finite variable endpoints `l,u`, initialize row i by

```
[min(imageLo i ([l,u]), r i), r i].
```

Prove this joint initialization is ordered and graph membership is exactly `x∈Set.Icc l u ∧ Ax≤r`. For an original restriction set T and designated integer coordinates I, retain the original feasible set

```
S = {x | Ax≤r ∧ x∈T ∧ ∀ j∈I, ∃ z:ℤ, x j=(z:ℝ)}.
```

Without a run-nonemptiness assumption prove LP infeasibility implies `S∩X₀=∅`. Under every-public-iterate-nonempty prove ordered, initial-contained limiting variable bounds and `S∩X_limit=S∩X₀`. For exactly the original objective f and every x prove equivalence of membership together with native `IsMinOn` on these two feasible sets. Do not assume or conclude attainment of an arbitrary objective, nor replace f, T or integrality by relaxations.

**Examples.** Take X₀=`[0,2]²`, affine row `x+y≤2`, nonlinear restriction `1≤x²+y²`, integer restriction `x∈ℤ`, and objective `(x-1)²+y²`. Prove `(1,0)` is an attained minimizer and the source theorem preserves it. Show `(0,0)` is removed by the nonlinear restriction and `(1/2,1)` by integrality, even though each passes the other relevant restrictions. Both restrictions therefore remain effective. The initialized row is `[0,2]` and the original objective is unchanged.

**Dependencies.** Layers 1–3 for unconditional infeasibility; Layer 4 for preservation at the limit. Original restrictions enter by intersection, without a nonlinear propagation or integer-rounding API.

## Downstream consumers

Bounded finite-dimensional model presolve consumes graph preservation, unconditional infeasibility and exact original-feasible-set/minimizer preservation. Interval propagation clients consume the raw/public bridge and concrete simultaneous operator lemmas. Scalar polyhedral descriptions consume the explicit affine feasible set and full-width optimum; they do not need a generic optimization solver. These are interfaces supplied by this roadmap, not commitments to additional solver or nonlinear-expression roadmaps.

## References and secondary provenance

- Belotti, Cafieri, Lee and Liberti, *Feasibility-Based Bounds Tightening via Fixed Points*, COCOA 2010, LNCS 6508, 65–76, [DOI 10.1007/978-3-642-17458-2_7](https://doi.org/10.1007/978-3-642-17458-2_7). Adopted simultaneous construction: §4, pp. 71–73, (9)–(34), Proposition 4.1 and Theorem 4.2. The held publisher-formatted final and [author manuscript](https://www.lix.polytechnique.fr/~liberti/fbbt-cocoa10.pdf), internal pp. 7–9, are distinct versions agreeing on the inspected construction and the disclosed display normalizations.
- Bernal Neira, *Modern Computational Approaches to Nonlinear Discrete Optimization and Applications in Process Systems Engineering*, Carnegie Mellon PhD thesis, May 2021, original §2.3.7.1, pp. 35–36: preprocessing survey and citation context.
- Kronqvist, Bernal, Lundell and Grossmann, *A review and comparison of solvers for convex MINLP*, Optimization and Engineering 20 (2019), 397–455, §3.7.1 p. 406, [DOI 10.1007/s11081-018-9411-8](https://doi.org/10.1007/s11081-018-9411-8). Its sequential preprocessing description does not state the simultaneous joint-width theorem; the earlier June 2018 author manuscript is a separate version.
- Belotti et al., *On feasibility based bounds tightening*, [Optimization Online, 24 January 2012](https://optimization-online.org/2012/01/3325/), §2.5 Algorithm 1 and §4 (30)–(43). This extension's sequential algorithm and variable-only width objective are distinct from the adopted simultaneous full-width theorem.
- Bordeaux, Katsirelos, Narodytska and Vardi, *The Complexity of Integer Bound Propagation*, JAIR 40 (2011), 657–676, §3.4.1 p. 668, [DOI 10.1613/jair.3248](https://doi.org/10.1613/jair.3248): independently reports LP decidability for continuous-linear-propagator fixed points and acknowledges related Belotti 2010 work; it is not an identification of the full joint objective.
- Gleixner, Berthold, Müller and Weltge, *Three enhancements for optimization-based bound tightening*, March 2016 ZIB Report 15-16, §1.2; journal version JGO 67 (2017), 731–757, [DOI 10.1007/s10898-016-0450-4](https://doi.org/10.1007/s10898-016-0450-4). The inspected passage is in the report, not an asserted full reading of the journal version.
- Gemander et al., *Two-row and two-column mixed-integer presolve using hashing-based pairing methods*, EJCO 8 (2020), 205–240, §2 p. 209, [DOI 10.1007/s13675-020-00129-6](https://doi.org/10.1007/s13675-020-00129-6): later presolve context; no integer-rounding result is imported.

Existing project-owned Apache-2.0 proof software supplies secondary formalization provenance. Its retained twelve-interface presolve development selects `qualified_simultaneous_fbbt` and `qualified_source_fbbt` as **one adopted family and its bounded application**; ten affine/coordinate/cutoff/redundancy interfaces are unselected support, not ten additional roadmap targets. Copied Chapter names, `palomar_*` aliases, bundled theorem records and package harnesses do not prescribe this API. Historical proof/kernel checks apply to their exact Lean 4.35.0 sources and pins; they establish neither proofs of these admitted prototypes nor current Tau Ceti acceptance. Bibliographic attribution does not imply source authors' endorsement or responsibility for the formalization.
