# Roadmap: compact quantum metric spaces

**Summary.** This roadmap builds the metric geometry of states on Archimedean order-unit
spaces and on the self-adjoint parts of unital C*-algebras. From Mathlib's weak duals, positive
continuous linear maps, seminorms, quotients and Hausdorff distances, from Tau Ceti's
Kantorovich–Rubinstein duality, and from the order-unit, C*-, compact-group and transport
foundations of earlier roadmaps, it develops Lipschitz seminorms as usable analytic objects:
their domains, quotients, closed extensions, morphisms and state metrics. It proves the
compactness criterion under which the state metric induces the weak-star topology
(`tendsto_stateEDist_iff`), full-state recovery of a closed seminorm
(`closedLipNorm_recovery`), the identification of the classical state metric of `C(X, ℝ)`
with the `1`-Wasserstein distance (`stateEDist_integrationState`), the closed Lip-norm
theorem for ergodic actions of compact groups (`exists_closedLipNorm_actionLip`), and the
order-unit quantum Gromov–Hausdorff distance with its triangle inequality
(`quantumGHEDist_triangle`), zero-distance rigidity (`quantumGHEDist_eq_zero_iff`),
completeness and compactness theorems. The end example is the continuity of the quantum tori
`Θ ↦ (A_Θ, L_Θ)` in that distance, in every dimension and for every real skew-symmetric
parameter, built on a twisted group C*-algebra of `ℤᵈ` owned here.

## Scope and ownership

This roadmap owns: real Archimedean order-unit duality (the order-unit norm, states, Kadison's
affine representation and the dual-ball identity); extended-valued Lipschitz seminorms with
dense finite domain, their state metrics, the radius identity and the Lip-norm criterion; closed
Lip-norms, closed completions, full-state recovery, Lipschitz maps and quotients by compact
convex subsets of the state space; the classical adapters between `C(X, ℝ)`, probability
measures and the `1`-Wasserstein distance, and the commutator seminorm of a spectral triple
with its metric criterion; the action seminorm of a compact group acting on a C*-algebra, its
closed Lip-norm theorem for ergodic actions, the existence of a faithful finite-dimensional
unitary representation of a compact Lie group, central finite-character approximation and the
comparison with derivative seminorms; the order-unit quantum Gromov–Hausdorff distance, its
bridges, metric laws, rigidity, completeness and compactness; the scalar-twisted group
C*-algebra `A_Θ` of `ℤᵈ` for every `d` (regular model, universal property, gauge action,
faithful coefficient trace), the continuous-field norm estimates and the metric continuity of
quantum tori.

It does not own, and does not restate:

- Hahn–Banach separation, annihilator and quotient duality, and the Jordan decomposition of
  signed regular measures on a compact Hausdorff space, which
  [BanachSpaceTheory](../BanachSpaceTheory/README.md) owns (its B1 and B5). Layer 0 owns only
  their order-unit consequences.
- C*-positive functionals, GNS, norm and state separation and faithful representations, which
  [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) owns (its Layer 0); ideals, the Gelfand
  representation and state extension, which [CStarAlgebras](../CStarAlgebras/README.md) owns
  (its C1 and C2). Layer 0's order-unit Hahn–Banach argument does not consume the C*-pure-state
  theorem or any von Neumann decomposition, and no pure-state hypothesis enters the compactness
  criterion.
- Haar probability, averaging, unitarizability, matrix coefficients, Schur orthogonality and
  Peter–Weyl, including point separation by matrix coefficients, which
  [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) owns
  (its Layers 0–5); the closed-subgroup theorem, which
  [RepresentationTheory/LieGroups](../RepresentationTheory/LieGroups/README.md) owns (its
  Layer 2). The faithful finite-dimensional unitary representation of a compact Lie group is
  built here, in §4.4, from those two inputs: neither roadmap states it.
- The Haar conditional expectation, isotypic and matrix-coefficient projections, the dense
  finite-orbit star algebra, the unique faithful invariant trace and the finite-multiplicity
  theorem for ergodic actions of compact groups, which VonNeumannAlgebras owns in its
  V8.CompactErgodicActions, the early C*-sublayer of its Layer 8. Its later W* continuity and
  predual bridge and its SU(2) and factor-classification applications are not inputs here.
  Finite multiplicity is a theorem about ergodic actions on C*-algebras and is not asserted for
  an arbitrary Banach representation.
- Smooth vectors, derivatives of actions and the smooth complete Fréchet star algebra of a
  compact Lie action, which
  [SmoothBanachRepresentations](../RepresentationTheory/SmoothBanachRepresentations/README.md)
  owns (its SB2 and SB8). Layer 4 owns the metric comparison with length functions only.
- Couplings, `W₁` and Kantorovich–Rubinstein duality, which
  [OptimalTransport](../OptimalTransport/README.md) owns (its Layers 0–3) and Tau Ceti
  implements. Layer 3 owns the state and probability-measure adapters, not transport duality.
- Spectral triples, and for the two-dimensional rotation algebra `A_θ` its faithful canonical
  trace, the smooth algebra `𝒜_θ` with its derivations, the trace-GNS space identified with
  `ℓ²(ℤ²)` by the ordered Fourier basis and the Fourier triple, which
  [NoncommutativeGeometry](../NoncommutativeGeometry/README.md) owns (its N5–N7). These are
  two-dimensional objects: Layer 6 consumes them only at `d = 2`, through the identification
  `Φ_θ` of §6.1, and plans no `d`-dimensional Dirac operator.
- Smooth bounded Lipschitz approximation, intrinsic-distance duality and the Clifford-module
  commutator-norm theorem, which [RiemannianGeometry](../RiemannianGeometry/README.md) owns
  (its R7.8) with the Clifford module of [SpinGeometry](../SpinGeometry/README.md) (its G6).
  Layer 3 consumes those formulas to identify a state metric. Spinor bundles, Dirac domains,
  compact resolvents, index pairings and Connes' reconstruction axioms have their own
  geometric and analytic owners; none is inferred from a Lip-norm.
- The discrete `ℓ²` almost-invariant-vector criterion, weak containment of the trivial
  representation in the regular one for amenable groups and the tensoring and absorption norm
  transfer, which [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) owns (its D2);
  the amenability and Følner sets of `ℤᵈ`, which [AmenableGroups](../AmenableGroups/README.md)
  owns (its Layers 5–6).
- A metric that detects the full C*-multiplication. The distance of Layer 5 is an order-unit
  (Jordan) distance: opposite algebras with the transported Lip-norm are at distance zero
  (§5.4).

**The twisted group C*-algebra of `ℤᵈ`.** No roadmap on the main branch builds the twisted
group C*-algebra `C*(ℤᵈ, σ)` of a scalar `2`-cocycle, so §6.0 builds its regular model `A_Θ`
and proves its universal property, gauge action and faithful coefficient trace, which the
finite-Fourier estimates of §§6.3–6.5 use directly. §6.0 also proves the identification
theorem: any unital C*-algebra generated by unitaries satisfying the `σ_Θ`-twisted relations
and carrying a faithful state that kills every nonzero Fourier mode is isomorphic to `A_Θ`
over the generators. That theorem identifies `A_Θ` with every other model of `C*(ℤᵈ, σ_Θ)`
with a faithful coefficient trace, in particular with a reduced central twisted product built
by a group-algebra roadmap; nothing in Layer 6 depends on such a model.

## Conventions

An **order-unit space** is a real partially ordered vector space `E` whose order is compatible
with addition and with multiplication by nonnegative real scalars (Mathlib
`IsOrderedAddMonoid E`, `PosSMulMono ℝ E`), with a distinguished `e ≠ 0` satisfying the
order-unit condition `∀ a, ∃ r > 0, −r e ≤ a ≤ r e` and the Archimedean condition
`(∀ ε > 0, a ≤ ε e) → a ≤ 0`. Its **order-unit norm** is

`‖a‖ = inf {r ≥ 0 : −r e ≤ a ≤ r e}`.

Completeness is an additional hypothesis. The layer titles carry the labels Q0–Q6 by which
other roadmaps cite the layers; §k.n is also written Qk.n.

A **compact quantum metric space** is an order-unit space with a dense-domain Lip-norm; its
state space is compact, not its normed vector space. The **complete closed presentation** is a
complete order-unit space with a lower semicontinuous extended Lip-norm. Layer 2 compares this
presentation with an incomplete dense finite-seminorm domain and constructs its canonical closed
completion. Nontriviality belongs to the order-unit convention: zero algebras and `C(∅)` are
separate degenerate classical objects and are assigned no normalized state.

Carriers are native: `Submodule`, normed quotients, `ContinuousLinearMap`, `WeakDual`,
`PositiveLinearMap` and
[`PositiveContinuousLinearMap`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Positive.html)
(`E →P[ℝ] ℝ`). A **state** is a positive real-linear functional `φ` with `φ(e) = 1`; its
continuity and norm one are theorems. The **state space** `S(E)` is the subset `stateSpace e`
of `WeakDual ℝ E` with its **weak-star subspace topology**; the operator-norm topology on the
dual is never substituted. For a nonzero unital complex C*-algebra `A` the states of the
order-unit space `selfAdjoint A` are compared with the native positive complex-linear
functionals `A →P[ℂ] ℂ` normalized at `1` by restriction and unique complex-linear extension.
No algebra structure is imposed on a general `E`.

An **extended seminorm** is `L : E → ℝ≥0∞`, subadditive and absolutely homogeneous with
`L(0) = 0`, with dense finite domain `dom L = {a : L(a) < ∞}` and scalar kernel
`L(a) = 0 ↔ a ∈ ℝ e`; this is the structure `ExtendedLipschitzSeminorm`. The `ℝ≥0∞`
conventions `0 · ∞ = 0`, `x / 0 = ∞` for `x ≠ 0`, `0 / 0 = 0` and `x / ∞ = 0` are used, and
zero scalars are checked explicitly. On `dom L` the finite seminorm is a native
`Seminorm ℝ (dom L)`. The **Lip-norm condition** (§1.4) means that the state metric below is
finite and induces the weak-star topology; it **does not include** lower semicontinuity or a
Leibniz law, which are named separately. A **closed Lip-norm** is a Lip-norm whose sublevel
sets are norm closed in the stated complete ambient order-unit space. Whenever a lower
semicontinuous seminorm on an incomplete space is used, relative closedness is distinguished
from closedness in the completion.

The **state distance** is the extended metric

`ρ_L(φ, ψ) = sup {|φ(a) − ψ(a)| : a ∈ E, L(a) ≤ 1}`,

with every supremum taken in `ℝ≥0∞`; an ordinary metric is constructed only after finiteness
is proved. The **radius** is half the diameter, not the least radius of a ball containing the
state space. `q : E → E ⧸ ℝ e` is the native quotient map onto the quotient by the scalar line
`scalarLine e`.

In Layer 4, `G` is a compact Hausdorff topological group, `A` a nonzero unital complex
C*-algebra, `α : G → Aut(A)` an action by star automorphisms with every orbit `g ↦ α_g(a)` norm
continuous, and `ℓ` a continuous native `GroupNorm` on `G`: `ℓ(1) = 0`, `ℓ(g⁻¹) = ℓ(g)`,
`ℓ(gh) ≤ ℓ(g) + ℓ(h)` and `ℓ(g) > 0` for `g ≠ 1`. Existence of such an `ℓ` is part of the
input; it makes `G` metrizable, and no nonmetrizable compact group is asserted to admit one.

In Layer 6, `d ∈ ℕ`, `Θ` is a real skew-symmetric `d × d` matrix and
`σ_Θ(p, q) = exp(πi pᵀΘq)` on `ℤᵈ`. For `d = 2` and real `θ`, `Θ(θ)` has `Θ₁₂ = −θ`, so that
the generators of `A_Θ(θ)` satisfy the relation `U₂U₁ = exp(2πiθ)U₁U₂` of
NoncommutativeGeometry N6.

Sources are cited by the numbering of the arXiv versions listed under References: Rieffel 1998
is *Metrics on states from actions of compact groups*, Rieffel 1999 is *Metrics on state
spaces*, Rieffel 2000 is *Gromov–Hausdorff distance for quantum metric spaces*.

## Exact supplier contracts

### From Mathlib

- `WeakDual ℝ E` with its weak-star topology and `WeakDual.isCompact_closedBall`
  (Banach–Alaoglu; `Mathlib/Analysis/Normed/Module/WeakDual.lean`).
- `PositiveLinearMap`, `PositiveContinuousLinearMap` (`E →P[ℝ] ℝ`, `A →P[ℂ] ℂ`) and, for a
  C*-algebra with its `StarOrderedRing` order,
  `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`, the norm of a positive functional
  as its value at `1` (`Mathlib/Analysis/CStarAlgebra/PositiveLinearFunctional.lean`).
- `exists_extension_norm_eq` (norm-preserving Hahn–Banach extension;
  `Mathlib/Analysis/Normed/Module/HahnBanach.lean`) and
  `geometric_hahn_banach_closed_point` (separation of a closed convex set from a point;
  `Mathlib/Analysis/LocallyConvex/Separation.lean`).
- `Seminorm`, `Submodule.span`, `Submodule.Quotient.mk` and the quotient norm on
  `E ⧸ scalarLine e`; `TotallyBounded`, `Dense`, `IsClosed`.
- `BoundedContinuousFunction.arzela_ascoli`
  (`Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`).
- `LipschitzWith`, `edist`, `Metric.hausdorffEDist`, `Metric.hausdorffDist`
  (`Mathlib/Topology/MetricSpace/HausdorffDistance.lean`) and `GromovHausdorff.ghDist`
  (`Mathlib/Topology/MetricSpace/GromovHausdorff.lean`).
- `MeasureTheory.ProbabilityMeasure`, `MeasureTheory.Measure.IsProbabilityMeasure`, the
  Riesz measure `RealRMK.rieszMeasure` of a positive functional on `C(X, ℝ)`
  (`Mathlib/MeasureTheory/Integral/RieszMarkovKakutani/Basic.lean`), `ContinuousMap.toLp`
  (`Mathlib/MeasureTheory/Function/LpSpace/ContinuousFunctions.lean`) and
  `MeasureTheory.L1.integralCLM` (`Mathlib/MeasureTheory/Integral/Bochner/L1.lean`), whose
  composite is the integration functional of §3.3.
- `GroupNorm` (`Mathlib/Analysis/Normed/Group/Seminorm.lean`), `IsCompactOperator`, `selfAdjoint`
  with its normed-space structure, `CStarAlgebra`, `StarAlgEquiv` (`A ≃⋆ₐ[ℂ] A`).
- `LieGroup` (`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean`), `ModelWithCorners` and
  `Matrix.unitaryGroup` (`Mathlib/LinearAlgebra/UnitaryGroup.lean`) for the statement of §4.4.
- `LinearIsometryEquiv` (`E ≃ₗᵢ[ℝ] F`) for the statement of §5.4.

### From Tau Ceti

- `TauCeti.wassersteinEDist` (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean`)
  and Kantorovich–Rubinstein duality on a compact pseudometric space,
  `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`, with its basepoint-normalized form
  `TauCeti.wassersteinEDist_one_eq_iSup_apply_eq_zero`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/KantorovichRubinstein.lean`). The compact
  form assumes probability measures and `OpensMeasurableSpace`; no moment hypothesis.

### From other roadmaps

- [BanachSpaceTheory](../BanachSpaceTheory/README.md) B1 and B5: annihilator and quotient
  duality, and the Jordan decomposition `μ = μ⁺ − μ⁻` of a signed regular Borel measure on a
  compact Hausdorff space with `‖μ‖ = μ⁺(S) + μ⁻(S)`.
- [VonNeumannAlgebras](../VonNeumannAlgebras/README.md) Layer 0: C*-positive functionals and
  states, GNS, norm detection by states and faithful representations.
  VonNeumannAlgebras V8.CompactErgodicActions: for an arbitrary compact Hausdorff `G` acting
  on a nonzero unital C*-algebra with norm-continuous orbits, the Haar conditional expectation
  `E` onto `A^G` (positive, unital, contractive, bimodular); the isotypic Haar projections and
  their matrix-coefficient versions, spectral subspaces with their multiplication and star
  relations, the norm-dense finite-orbit star algebra; and under ergodicity the unique
  `G`-invariant state `η`, its faithfulness and traciality, the multiplicity bound
  `mult(π) ≤ dim π` and hence `dim A_π ≤ (dim π)²`, with the normalized Haar probability and
  the CompactGroups coefficient conventions. Its theorem has no length-function hypothesis.
- [CStarAlgebras](../CStarAlgebras/README.md) C1 and C2: closed ideals, the Gelfand
  representation of a commutative unital C*-algebra, and extension of states from unital
  C*-subalgebras.
- [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md)
  Layers 0–5: the normalized Haar probability and averaging operator, unitarizability, Schur
  orthogonality of matrix coefficients, the Peter–Weyl theorem and its corollary that the
  matrix coefficients of finite-dimensional unitary representations separate the points of
  `G` (Layer 5, `representativeStarSubalgebra_separatesPoints`).
- [RepresentationTheory/LieGroups](../RepresentationTheory/LieGroups/README.md) Layer 2: the
  closed-subgroup theorem for finite-dimensional real Lie groups (a closed subgroup is an
  embedded Lie subgroup with Lie algebra `{X : exp(tX) ∈ H ∀ t}`) and Cartan's automatic
  smoothness of continuous homomorphisms.
- [SmoothBanachRepresentations](../RepresentationTheory/SmoothBanachRepresentations/README.md)
  SB2 and SB8: differentiable and smooth vectors of a strongly continuous action of a Lie
  group, their derivatives `dα(X)`, and the smooth complete Fréchet star algebra for compact
  Lie actions on C*-algebras.
- [OptimalTransport](../OptimalTransport/README.md) Layers 0–3: couplings, transport cost,
  pushforward of plans, `W₁` and its topology on probability measures.
- [NoncommutativeGeometry](../NoncommutativeGeometry/README.md) N5 (spectral triples and their
  densely defined self-adjoint `D`), N6 (the rotation algebra `A_θ` with
  `U₂U₁ = exp(2πiθ)U₁U₂`, its gauge action `β`, Fourier coefficients, faithful trace `τ` and
  smooth algebra `𝒜_θ`) and N7 (the trace-GNS space identified with `ℓ²(ℤ²)` by the ordered
  Fourier basis `e_(m,n) = [U₁^mU₂^n]`, the derivations `δ₁, δ₂` and the Fourier–Dirac operator
  `D = −i(σ₁δ₁ − σ₂δ₂)` on `ℓ²(ℤ²) ⊗ ℂ²`).
- [RiemannianGeometry](../RiemannianGeometry/README.md) R7.8: quantitative smooth bounded
  Lipschitz approximation, intrinsic-distance duality
  `d(x, y) = sup {|f(x) − f(y)| : ‖∇f‖ ≤ 1}` and the Clifford-module commutator-norm theorem
  `‖[D, f]‖ = ‖∇f‖_∞` for the Dirac operator of the Hermitian Clifford module of
  [SpinGeometry](../SpinGeometry/README.md) G6.
- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) D2: almost-invariant vectors
  in `ℓ²(Γ)`, weak containment of the trivial representation in the regular representation of
  an amenable discrete group, and the tensoring and absorption norm transfer
  `‖Σ c_γ V_γ‖ ≤ ‖Σ c_γ λ_γ‖` for a unitary representation `V` and finitely supported `c`.
- [AmenableGroups](../AmenableGroups/README.md) Layers 5–6: amenability of `ℤᵈ` and its
  explicit Følner boxes.

## How to read the build

Layer 0 constructs the order-unit norm, states, the compact state space and Kadison's affine
representation, and proves the dual-ball identity on which every later metric estimate rests.
Layer 1 introduces extended Lipschitz seminorms, the state distance, the radius identity and
the Lip-norm criterion with its three equivalent conditions, and derives the metric,
uniformity and separability. Layer 2 closes a Lip-norm, proves full-state recovery for lower
semicontinuous seminorms, characterizes the metrics on compact convex sets that arise from
closed Lip-norms, and treats Lipschitz maps and quotients by compact convex subsets. Layer 3
is the classical calibration: `C(X, ℝ)` with its Lipschitz constant, probability measures and
`W₁`, pushforward, and the commutator seminorm of a spectral triple with the Riemannian
identification. Layer 4 builds Leibniz Lip-norms from actions of compact groups: the action
seminorm, the ergodic closed Lip-norm theorem, central finite-character approximation on
compact Lie groups and the comparison with derivative seminorms. Layer 5 defines the quantum
Gromov–Hausdorff distance through bridges and proves its metric laws, rigidity, completeness
and compactness. Layer 6 builds the twisted group C*-algebra of `ℤᵈ`, its Lip-norms, the
continuous-field norm estimates and the metric continuity of quantum tori; it uses Layers 4–5
and consumes NoncommutativeGeometry only at `d = 2`.

## Layer 0: Order units, states and affine representation (Q0)

### 0.1 The order-unit norm

Define the order-unit norm `‖a‖ = inf {r ≥ 0 : −r e ≤ a ≤ r e}` of an Archimedean order-unit
space and prove that it is a norm: finiteness from the order-unit condition, positivity,
absolute homogeneity, the triangle inequality, definiteness from the Archimedean condition,
the exact closed-interval formula `‖a‖ ≤ r ↔ −r e ≤ a ≤ r e` for `r ≥ 0`, and `‖e‖ = 1`
(Rieffel 1999, §2; Rieffel 1998, §1). Define `IsOrderUnitNorm e` as the predicate on a space
already carrying a norm and a partial order that records `‖e‖ = 1` and this interval formula;
it is the hypothesis under which every later theorem is stated, and the constructed norm
satisfies it. *Needs:* Mathlib `IsOrderedAddMonoid`, `PosSMulMono`, `NormedSpace ℝ E`.

- The positive cone is norm closed, `e` is an interior point of it, and the order is recovered
  from the norm and `e`: `a ≥ 0 ↔ ‖‖a‖ e − a‖ ≤ ‖a‖`.
- The interval formula excludes a non-Archimedean cone: with `‖a‖ ≤ r ↔ −r e ≤ a ≤ r e` for
  all `r ≥ 0`, `a ≤ ε e` for all `ε > 0` gives `‖a + ‖a‖ e‖ ≤ ‖a‖`, hence `a ≤ 0`.
- Restriction to a unital real subspace, finite products with the coordinatewise order and the
  maximum norm, transport along a unital order isomorphism (automatically isometric) and the
  norm completion with the closed positive cone and the same order unit are order-unit spaces
  with the inherited norm.
- `ℝ`, finite-dimensional function systems, `C(K, ℝ)` for nonempty compact Hausdorff `K` and
  `selfAdjoint A` for every nonzero unital complex C*-algebra `A` are order-unit spaces whose
  order-unit norm is the given norm.

**Checks.**

- `E = ℝ²` with the coordinatewise order and `e = (1, 1)`: `‖(a₁, a₂)‖ = max(|a₁|, |a₂|)`; the
  Euclidean norm fails the interval formula at `(1, 1)`, whose Euclidean norm is `√2` while
  `−e ≤ (1, 1) ≤ e`.
- `ℝ²` with the cone `{x > |y|} ∪ {(t, −t) : t ≥ 0}` and `e = (1, 0)`: `(0, 1) ≤ ε e` for every
  `ε > 0` but `(0, 1) ≰ 0`, so the cone is not Archimedean; the formula
  `inf {r : −r e ≤ a ≤ r e}` gives `‖(0, 1)‖ = 1`, and the interval formula fails at `r = 1`
  because `(1, 1)` is not in the cone.
- `selfAdjoint A` for a unital C*-algebra: `−r·1 ≤ a ≤ r·1` exactly when the spectrum of `a`
  lies in `[−r, r]`, which is `‖a‖ ≤ r`; a definition using the C*-norm of `a²` would give the
  same value, while one using `‖a⁺‖` alone would give `0` on `a = −1`.
- Completion: the order-unit completion of the polynomials on `[0, 1]` with the pointwise order
  is `C([0, 1], ℝ)`; the closed cone of the completion is the closure of the polynomial cone and
  not the cone of pointwise-positive polynomials.

### 0.2 Positive maps and states

Prove that a positive linear map between order-unit spaces is bounded with `‖T‖ = ‖T(e)‖`, and
that a unital positive map is contractive. For real functionals prove that positivity with
normalization is equivalent to `φ(e) = 1 = ‖φ‖`. Define `stateSpace e` as the set of monotone
functionals in `WeakDual ℝ E` with `φ(e) = 1`, and prove `stateSpace_nonempty`: extend the
functional `r e ↦ r` from `ℝ e` with norm one by Hahn–Banach and prove positivity from the
norm and the value at `e` (Rieffel 1999, §2; the argument is Kadison's). Prove restriction and
extension of states along unital subspaces (extension is a construction, not an assumed
surjectivity), preservation under composition with unital positive maps, and unique extension
to the completion. *Needs:* 0.1; Mathlib `exists_extension_norm_eq`,
`PositiveContinuousLinearMap`, `WeakDual`.

- A positive functional on an order-unit space is continuous; `‖φ‖ = φ(e)`.
- Every positive normalized `E →P[ℝ] ℝ` is a point of `stateSpace e`, and conversely every
  point of `stateSpace e` is positive, continuous and of norm one.
- For a unital C*-algebra, restriction to `selfAdjoint A` and complex-linear extension are
  inverse bijections between `A →P[ℂ] ℂ` normalized at `1` and `stateSpace 1` of
  `selfAdjoint A`, compatible with the weak-star topologies.

**Checks.**

- `E = ℝ²`, `e = (1, 1)`: the states are `φ_t(a) = t a₁ + (1 − t) a₂` for `t ∈ [0, 1]`; the
  functional `(a₁, a₂) ↦ 2a₁ − a₂` has value `1` at `e` and norm `3`, so normalization without
  positivity is not a state.
- A positive map that is not unital: `T(a) = 2a` on `ℝ` has `‖T‖ = ‖T(1)‖ = 2`; the bound
  `‖T‖ ≤ 1` for unital positive maps is not available without unitality.
- Extension: on the unital subspace `ℝ e ⊕ ℝ a` of `C([0, 1], ℝ)` with `a(t) = t`, the state
  `e ↦ 1, a ↦ 1/2` extends to Lebesgue integration and also to evaluation at `1/2`; extension
  is not unique, and the construction only produces one extension.
- A unital map which is not positive is not contractive on `C([0, 1], ℝ)`: `f ↦ f(0) − f(1) + f(1/2)`
  is unital and has norm `3`.

### 0.3 The state space and Kadison duality

Prove `isCompact_stateSpace`: the state space is weak-star closed in the closed unit ball of
the dual, hence compact by Banach–Alaoglu; it is nonempty, convex and Hausdorff, and every
evaluation `â(φ) = φ(a)` is continuous and affine. Prove that states separate points and
order: `a ≥ 0 ↔ ∀ φ ∈ S(E), φ(a) ≥ 0`, by separating the closed cone from a point, and
`norm_eq_iSup_states`: `‖a‖ = sup_φ |φ(a)|` (Rieffel 1999, §2; Rieffel 1998, §1). Construct the
isometric unital order embedding `E → C(S(E), ℝ)`, prove that its image is dense in the
continuous affine functions `Aff_c(S(E), ℝ)` and is onto for complete `E`, and prove the dual
statement `K ≅ S(Aff_c(K, ℝ))` for a nonempty compact convex subset `K` of a Hausdorff
locally convex real space, using continuous affine separation and barycentres. Build the
barycentre of a regular Borel probability on `K` from compact regular probabilities and
separation, not by assuming that every continuous affine function is a coordinate evaluation.
*Needs:* 0.2; Mathlib `WeakDual.isCompact_closedBall`,
`geometric_hahn_banach_closed_point`; BanachSpaceTheory B1.

**Checks.**

- `E = ℝ²`, `e = (1, 1)`: `S(E)` is the segment `{φ_t}`, `a = (1, −1)` has `‖a‖ = 1 = sup_t |2t − 1|`,
  attained at `t ∈ {0, 1}`; the embedding sends `a` to the affine function `t ↦ 2t − 1`.
- Order detection: `a = (1, −1)` has `φ_(1/2)(a) = 0 ≥ 0` but `φ_0(a) = −1 < 0`, so a single
  state does not detect positivity.
- `C([0, 1], ℝ)`: `S(E)` is the set of regular Borel probabilities and `Aff_c(S(E), ℝ)`
  consists of the integrations against continuous functions, so the embedding is onto; for the
  incomplete subspace of polynomials it is not onto, since `t ↦ |t − 1/2|` is a limit of
  polynomials but not a polynomial.
- `K` a single point: `Aff_c(K, ℝ) = ℝ`, whose state space is a point.

### 0.4 The quotient by the scalar line and the dual-ball identity

For `a ∈ E` define `max(a)` and `min(a)` as the extrema of `φ ↦ φ(a)` over `S(E)`. Prove the
quotient-norm formula `‖q(a)‖ = (max(a) − min(a)) / 2`, attained by subtracting
`((max(a) + min(a)) / 2) e`, prove that the scalar line `scalarLine e` is closed, and identify
`(E ⧸ ℝ e)'` isometrically with the annihilator `{λ ∈ E' : λ(e) = 0}`. Prove the **dual-ball
identity**

`{λ ∈ E' : λ(e) = 0, ‖λ‖ ≤ 2} = {φ − ψ : φ, ψ ∈ S(E)}`

(Rieffel 1999, Lemma 2.1): extend `λ` to `C(S(E), ℝ)` with the same norm, take the Jordan
decomposition `μ = μ⁺ − μ⁻` of the representing signed regular measure from BanachSpaceTheory
B5; `λ(e) = 0` gives equal masses `μ⁺(S) = μ⁻(S) = t` and `‖λ‖ ≤ 2` gives `t ≤ 1`; for `t > 0`
let `φ′, ψ′` be the states `μ⁺/t, μ⁻/t`, fix a state `ω` and set `φ = tφ′ + (1 − t)ω`,
`ψ = tψ′ + (1 − t)ω`, so that `λ = φ − ψ` exactly; for `t = 0` take `φ = ψ = ω`. Normalizing
alone yields only `λ = t(φ′ − ψ′)`. Export the evaluation, norm and functoriality lemmas of
these identifications. *Needs:* 0.3; BanachSpaceTheory B1 and B5; Mathlib
`Submodule.Quotient.mk`.

**Checks.**

- `E = ℝ²`, `e = (1, 1)`, `λ = (1, −1)`: `λ(e) = 0`, `‖λ‖ = sup_{‖a‖_∞ ≤ 1} |a₁ − a₂| = 2`, the
  Jordan masses are `t = 1`, and `λ = ev₁ − ev₂` exactly.
- `λ = (1/2, −1/2)`: `‖λ‖ = 1`, `t = 1/2`, `φ′ = ev₁`, `ψ′ = ev₂`; with `ω = φ_(1/2) = (1/2, 1/2)`
  the construction gives `φ = (3/4, 1/4)`, `ψ = (1/4, 3/4)` and `φ − ψ = (1/2, −1/2) = λ`, while
  `φ′ − ψ′ = (1, −1) ≠ λ`.
- `λ = (2, −2)` has norm `4 > 2` and is no difference of states, since `|φ(a) − ψ(a)| ≤ 2‖a‖`.
- `a = (3, 1)`: `max(a) = 3`, `min(a) = 1`, `‖q(a)‖ = 1`, attained by `a − 2e = (1, −1)`.
- The quotient-norm formula with `max(a) − min(a)` instead of its half would give `‖q(e)‖ = 0`
  correctly but `‖q((1, −1))‖ = 2`, while `(1, −1)` has norm `1` and no scalar translate of
  smaller norm.

### 0.5 Functoriality of states and order quotients

Prove that the pullback of states along a unital positive map is affine and weak-star
continuous; that a unital order-isometric embedding induces a surjection on states, and that a
surjective order quotient induces an affine embedding of state spaces onto a compact convex
subset. Construct the order quotient of `E` by a compact convex subset `K ⊆ S(E)` explicitly
as the restriction of the affine functions `â` to `K`. An arbitrary algebraic quotient cone is
not automatically Archimedean: include its Archimedeanization and the norm comparison before
calling it an order-unit quotient. Prove restrictions, compositions, inverse maps and
completion comparisons, and that the C*-state dictionary of 0.2 commutes with these maps and
preserves evaluations and the weak-star topology. *Needs:* 0.3, 0.4.

**Checks.**

- The inclusion `ℝ e → E` induces the map `S(E) → S(ℝ e) = {pt}`, a surjection; the quotient
  `E → ℝ` by evaluation at a fixed state `φ` induces the embedding `{pt} → S(E)` with image
  `{φ}`.
- `E = ℝ³`, `e = (1, 1, 1)`, `K` the segment from `φ_1 = ev₁` to `φ_2 = ev₂`: the restriction
  quotient is `ℝ²` with `(a₁, a₂, a₃) ↦ (a₁, a₂)`, and `S(ℝ²) = K`.
- The algebraic quotient of `C([0, 1], ℝ)` by the functions vanishing at `0` to first order is
  not Archimedean before Archimedeanization: the class of `t ↦ t` is below every `ε e` without
  being `≤ 0`.

### Examples

`ℝ` (singleton state space), `ℝⁿ` with the coordinatewise order (the simplex), `C(K, ℝ)` for
compact Hausdorff `K` (regular Borel probabilities) and `selfAdjoint M_n(ℂ)` (density
matrices) run through every section of this layer.

### Dependencies

Mathlib `WeakDual`, `PositiveContinuousLinearMap`, Hahn–Banach and Banach–Alaoglu;
BanachSpaceTheory B1 and B5. No earlier layer.

## Layer 1: Lipschitz seminorms and the compactness criterion (Q1)

### 1.1 Extended seminorms and finite domains

Define `ExtendedLipschitzSeminorm e` as an extended seminorm `L : E → ℝ≥0∞` with `L(0) = 0`,
subadditivity, absolute homogeneity `L(r a) = |r| L(a)` (with `0 · ∞ = 0`), dense finite domain
and scalar kernel `L(a) = 0 ↔ a ∈ ℝ e` (Rieffel 1998, Definition 2.1 for the finite case;
Rieffel 2000, Definition 2.1). Prove the API: the finite domain is a real submodule containing
`e`, on which `L` is a native `Seminorm`; scalar translation `L(a + r e) = L(a)`; invariance
under negation; convexity and balance of sublevel sets; rescaling, maximum of two seminorms,
pullback and transport along unital order isomorphisms. Prove the inverse dictionary between a
finite seminorm on a specified dense submodule containing `e` and its extension by `∞` outside
that domain, keeping domains in every equality of seminorms. *Needs:* 0.1; Mathlib `Seminorm`,
`Dense`, `ENNReal`.

- A restriction of `L` to a unital subspace `F` is an extended Lipschitz seminorm of `F` only
  when `F` is an order-unit subspace and `dom L ∩ F` is dense in `F`; this condition is a
  theorem to prove, not norm density of `F` in `E`.
- `L(r a) = |r| L(a)` at `r = 0` and `L(a) = ∞` reads `L(0) = 0 = 0 · ∞`.

**Checks.**

- `E = ℝ²`, `e = (1, 1)`, `L(a) = |a₁ − a₂|`: finite everywhere, kernel `ℝ e`, and
  `L(a + r e) = L(a)`; the seminorm `|a₁|` has kernel `{a₁ = 0} ≠ ℝ e` and is excluded.
- `C([0, 1], ℝ)` with `L(f) = ‖f′‖_∞` on `C¹` and `∞` elsewhere: the finite domain `C¹` is a
  dense submodule containing `1`; the restriction of `L` to the unital subspace of functions
  with `f(0) = f(1)` has dense finite domain there, while its restriction to the span of `1` and
  `t ↦ |t − 1/2|` has finite domain `ℝ·1`, not dense, so it is not an extended Lipschitz
  seminorm of that subspace.
- `L ≡ ∞` off `ℝ e` and `0` on it satisfies every axiom except density when `E ≠ ℝ e`.

### 1.2 The state distance

Define `stateEDist L φ ψ = sup {|φ(a) − ψ(a)| : L(a) ≤ 1}` in `ℝ≥0∞` for functionals
`φ, ψ`, and prove on `stateSpace e` that it is an extended metric: `stateEDist_self`,
`stateEDist_comm`, `stateEDist_triangle` and `stateEDist_eq_zero_iff` (zero separation, from
density of the finite domain and the common norm bound of states); package it as
`stateEMetricSpace`, an `EMetricSpace` structure on `stateSpace e` which does not replace the
inherited weak-star topology (Rieffel 1998, §1; Rieffel 1999, §2). Prove the evaluation
estimate `|φ(a) − ψ(a)| ≤ L(a) ρ_L(φ, ψ)` for `a` of finite `L`, handling `L(a) = 0` by scalar
translation rather than division. Prove that the `ρ_L`-topology is finer than weak-star, and
monotonicity `L ≤ M → ρ_M ≤ ρ_L`, positive rescaling `ρ_(tL) = ρ_L / t` and transport along
unital order isometries. *Needs:* 1.1, 0.3; Mathlib `EMetricSpace`.

**Checks.**

- `E = ℝ²`, `L(a) = |a₁ − a₂|`: `ρ_L(φ_s, φ_t) = |s − t|`, attained at `a = (1, 0)`.
- `E = ℝ`, `e = 1`: `L ≡ 0` is forced by the kernel axiom, `S(E) = {id}` and
  `stateEDist = 0`; the extended metric on a singleton is `0`.
- Monotonicity direction: with `M = 2L` on `ℝ²`, `ρ_M = ρ_L / 2`, not `2ρ_L`.
- `C¹([0, 1], ℝ)` dense in `C([0, 1], ℝ)` with `L(f) = ‖f′‖_∞`: `ρ_L(δ_x, δ_y) = |x − y|`, and
  `ρ_L(δ_x, μ)` for Lebesgue measure `μ` is `∫|t − x| dt = x² − x + 1/2`, which is `1/4` at
  `x = 1/2`.

### 1.3 The radius identity

Prove the radius identity and its equivalent finite bounds: for `r ≥ 0`,
`diam(S(E), ρ_L) ≤ 2r ↔ ∀ a ∈ dom L, ‖q(a)‖ ≤ r L(a)` (Rieffel 1999, Proposition 2.2), and
equivalently that the radius `diam / 2` is `sup {‖q(a)‖ : L(a) ≤ 1}`; both directions use the
dual-ball identity of 0.4. Define `centeredUnitBall L φ = {a : L(a) ≤ 1, φ(a) = 0}` for a
state `φ` and prove that its norm is bounded by the diameter; its norm supremum need not equal
the radius. Treat radius zero, equivalent to `E = ℝ e`, and singleton state spaces.
*Needs:* 1.2, 0.4.

**Checks.**

- `E = ℝ²`, `L(a) = |a₁ − a₂|`: `diam = 1`, `‖q(a)‖ = |a₁ − a₂| / 2 = L(a) / 2`, so `r = 1/2`
  and `2r = 1`: the identity holds with equality.
- The same example with `L′ = L / 2`: `diam = 2`, `‖q(a)‖ = L′(a)`, `r = 1`.
- Centered ball at `φ_0 = ev₂`: `{a : |a₁ − a₂| ≤ 1, a₂ = 0} = [−1, 1] × {0}` has norm
  supremum `1 = diam`, strictly larger than the radius `1/2`.
- Radius `0`: on `E = ℝ e` every `a` has `q(a) = 0`; on `ℝ²` no extended Lipschitz seminorm has
  radius `0`, since `q((1, 0)) ≠ 0` while `L((1, 0)) < ∞` for some finite-domain element off
  `ℝ e` by density.

### 1.4 The Lip-norm criterion

Prove the **Lip-norm criterion**, the equivalence of (a) `ρ_L` is finite and induces the
weak-star topology on `S(E)`; (b) `q({a : L(a) ≤ 1})` is norm totally bounded in `E ⧸ ℝ e`;
(c) `centeredUnitBall L φ` is norm totally bounded for one, hence every, state `φ`
(Rieffel 1998, Theorems 1.8 and 1.9; Rieffel 1999, §2). Define `IsLipNorm L` as condition (b);
`isLipNorm_iff_centered` is (b) ⟺ (c) and `tendsto_stateEDist_iff` with `stateEDist_ne_top` is
(b) ⟹ (a) together with its converse. For (b) ⟺ (c) the centered linear section
`q(a) ↦ a − φ(a) e` has norm at most two relative to the quotient norm; prove its continuity and
both total-boundedness implications. For (b) ⟹ (a) use a finite net with an explicit error
margin strictly below the desired ball radius and finitely many weak-star evaluation
neighbourhoods: a pointwise strict bound for every test alone does not give a strict bound on
their supremum. For (a) ⟹ (c) embed the centered ball into `C(S(E), ℝ)`: it is bounded by 1.3
and its elements are `1`-Lipschitz for `ρ_L`, so Arzelà–Ascoli gives total boundedness.
*Needs:* 1.3, 0.3; Mathlib `TotallyBounded`, `BoundedContinuousFunction.arzela_ascoli`.

**Checks.**

- Section bound: `‖a − φ(a) e‖ ≤ ‖a − t e‖ + |φ(a − t e)| ≤ 2‖a − t e‖` for every `t`, so the
  constant `2` is sharp on `ℝ²` with `a = (1, −1)`, `φ = ev₁`: `‖q(a)‖ = 1` and
  `‖a − φ(a)e‖ = ‖(0, −2)‖ = 2`.
- Finite-dimensional `E`: every bounded set is totally bounded, so every extended Lipschitz
  seminorm is a Lip-norm; the criterion is then (a) for free.
- `E = C([0, 1], ℝ)`, `L(f) = ‖f′‖_∞` on `C¹`: the centered ball at `δ_0` is the set of
  `1`-Lipschitz `C¹` functions vanishing at `0`, totally bounded by Arzelà–Ascoli, and `ρ_L` is
  `W₁`, which metrizes the weak-star topology.
- The non-example of 1.6: `L(a) = ‖q(a)‖` on an infinite-dimensional complete `E` has (a)
  false though the radius is finite.

### 1.5 The metric, uniformity and separability

Under `IsLipNorm L` construct the finite ordinary metric on `S(E)` from `stateEDist`, prove that
its uniformity is the compact weak-star uniformity, that `(S(E), ρ_L)` is complete and compact
with finite diameter, and that convergence of states for `ρ_L` is weak-star convergence for
**arbitrary filters**, which is `tendsto_stateEDist_iff`. Prove that `E` is then separable:
finite norm nets of the centered sublevel sets, rational scalar translates and the dense finite
domain give a countable norm-dense set (Rieffel 1998, §1). A general order-unit space need not
be separable. *Needs:* 1.4; Mathlib `Filter.Tendsto`, `UniformSpace`.

**Checks.**

- `ℓ^∞` as `C(βℕ, ℝ)` is a complete nonseparable order-unit space; by the separability
  theorem no extended Lipschitz seminorm on it is a Lip-norm.
- `E = ℝ²`, `L(a) = |a₁ − a₂|`: the metric on the segment `S(E)` is `|s − t|`, complete and
  compact, diameter `1`.
- On `C([0, 1], ℝ)` with `L(f) = ‖f′‖_∞` on `C¹`, the states `δ_(1/n)` converge to `δ_0`
  weak-star and `ρ_L(δ_(1/n), δ_0) = 1/n → 0`; the net `(δ_x)_{x → 0}` indexed by the
  neighbourhood filter of `0` converges likewise, which is the filter form of the theorem.

### 1.6 Counterexamples

Record the examples which separate the hypotheses (Rieffel 1999, §2 and Example 3.5). On an
infinite-dimensional complete order-unit space `L(a) = ‖q(a)‖` is an extended Lipschitz
seminorm with radius `1` whose quotient unit ball is the whole unit ball of `E ⧸ ℝ e`, not
totally bounded, so it is not a Lip-norm. On `C¹([−1, 1], ℝ)`, dense in `C([−1, 1], ℝ)`,
`L(f) = ‖f′‖_∞ + |f′(0)|` is a Lip-norm which is not lower semicontinuous for the uniform norm:
the functions `G_n(t) = 1 + ∫₀ᵗ min(n|s|, 1) ds` have `L(G_n) = 1 + 0 = 1`, converge uniformly to
`t + 1` with `‖G_n − (t + 1)‖_∞ = 1/(2n)`, and `L(t + 1) = 1 + 1 = 2`, so the sublevel set
`{L ≤ 1}` is not closed. Record the comparison between the smooth dense domain and the
Lipschitz domain on a compact metric space without pretending that the finite-domain seminorm
is finite on all continuous functions. *Needs:* 1.4, 1.5.

**Checks.**

- `L(a) = ‖q(a)‖` on `ℓ^∞`: the unit vectors `e_n − e_m` have `‖q(e_n − e_m)‖ = 1` for `n ≠ m`,
  an infinite `1`-separated set in the quotient ball.
- `G_n` as above: `G_n′(t) = min(n|t|, 1)`, `G_n′(0) = 0`, `‖G_n′‖_∞ = 1`; `(t + 1)′ = 1`,
  `|1| + |1| = 2`.
- The same `L` without the `|f′(0)|` term is `‖f′‖_∞`, which is lower semicontinuous on
  `C¹([−1, 1], ℝ)`: its sublevel set `{‖f′‖_∞ ≤ 1}` is the set of `1`-Lipschitz `C¹` functions,
  closed in `C¹` for the uniform norm (relative closedness), though not closed in the completion
  `C([−1, 1], ℝ)`, whose closure of that set is all `1`-Lipschitz functions.

### Examples

`ℝ²` with `L(a) = |a₁ − a₂|` (radius `1/2`), `C¹([0, 1], ℝ)` with `‖f′‖_∞` (the unit interval
with `W₁`), the non-lower-semicontinuous Lip-norm of 1.6 and the non-Lip-norm `‖q(a)‖` on
`ℓ^∞`.

### Dependencies

Layer 0 (states, the dual-ball identity, compactness of `S(E)`); Mathlib `Seminorm`,
`TotallyBounded`, Arzelà–Ascoli.

## Layer 2: Closed Lip-norms, recovery, maps and quotients (Q2)

### 2.1 Closure and complete closed presentations

For an extended Lipschitz seminorm `L` form the norm closure of its absolutely convex unit
ball and the Minkowski gauge of that closure, with the scalar direction handled through
`E ⧸ ℝ e`. Prove that this closure `L̄` is the greatest lower semicontinuous extended seminorm
below `L`, that it has the same state metric, and that a Lip-norm stays a Lip-norm
(Rieffel 1999, Theorem 4.2). Identify its finite domain. When `L` has finite radius, in
particular when it is a Lip-norm, prove that `L̄` still has kernel `ℝ e`, using the
finite-radius estimate `‖q(a)‖ ≤ r L(a)`; without finite radius the closure can have a larger
kernel (Rieffel 1999, after Proposition 4.4), and the closure and state-metric recovery
constructions are retained in that case. Extend the construction to the norm completion `Ē`
and prove uniqueness of the complete closed presentation up to unital order isometry. Define
`IsClosedLipNorm L` as `IsLipNorm L` with norm-closed sublevel sets. Equip the finite domain of
a closed Lip-norm with the graph norm `‖a‖ + L(a)` (or the equivalent maximum norm) and prove
completeness; this is a Banach graph norm, not the order-unit norm. *Needs:* 1.1–1.5.

**Checks.**

- The non-lower-semicontinuous Lip-norm of 1.6 has closure `L̄(f) = ‖f′‖_∞` on the Lipschitz
  functions of `[−1, 1]`: the sublevel `{L ≤ 1}` is dense in the `1`-Lipschitz functions and
  the `|f′(0)|` term disappears, while `ρ_L = ρ_L̄ = W₁` is unchanged.
- `C¹([0, 1], ℝ)` with `‖f′‖_∞`: the closed completion is `C([0, 1], ℝ)` with the Lipschitz
  constant on the Lipschitz functions; the finite domain of the closure is strictly larger than
  `C¹`.
- Kernel loss without finite radius (Rieffel 1999, after Proposition 4.4): on the real
  polynomials viewed in `C([0, 2], ℝ)` let `L(p)` be the Lipschitz constant of `p` on `[0, 1]`
  only. Its kernel is `ℝ·1`. For `g = 0` on `[0, 1]` and `g(s) = (s − 1)²` on `[1, 2]`, integrate
  polynomial approximants `q_n` of `g′` from `0`: the polynomials `p_n` converge uniformly to `g`
  with `L(p_n) ≤ ‖q_n − g′‖_∞ → 0`, so `g` lies in the kernel of the closure although `g ∉ ℝ·1`;
  the radius is infinite because `‖q(p_n)‖ ≥ 1/2 − ‖p_n − g‖_∞` while `L(p_n) → 0`.
- Graph norm: on `C¹([0, 1], ℝ)` the sequence `f_n(t) = √((t − 1/2)² + 1/n)` converges uniformly
  to `|t − 1/2| ∉ C¹`, so `C¹` with the uniform norm is incomplete; for the graph norm the
  sequence is not Cauchy, since `f_n′ → sign(t − 1/2)` pointwise but not uniformly.

### 2.2 Full-state recovery

Prove `closedLipNorm_recovery`: for an extended Lipschitz seminorm with norm-closed sublevel
sets,

`L(a) = sup_{φ, ψ ∈ S(E)} |φ(a) − ψ(a)| / ρ_L(φ, ψ)`

exactly, with `0 / 0 = 0` for `φ = ψ` and `x / ∞ = 0` (Rieffel 1999, Theorem 4.1). The
inequality `≤ L(a)` is the evaluation estimate of 1.2; the reverse is the bipolar theorem for
the closed balanced unit ball in the dual pair `(E ⧸ ℝ e, (E ⧸ ℝ e)')`, through the
annihilator and dual-ball identities of 0.4 (Rieffel 1999, Theorem 4.2). No total boundedness
is used; for an `L` which is not lower semicontinuous the right side recovers `L̄`. Prove that
every denominator for `φ ≠ ψ` is positive, by `stateEDist_eq_zero_iff`, and that for `a ∉ dom L`
the supremum is `∞`. Do not recover `L` merely from the distances of pure states: 2.3 gives a
finite-dimensional commutative counterexample. *Needs:* 2.1, 1.2, 0.4; Mathlib
`geometric_hahn_banach_closed_point`.

**Checks.**

- `E = ℝ²`, `L(a) = |a₁ − a₂|`: `|φ_s(a) − φ_t(a)| / |s − t| = |a₁ − a₂|` for every `s ≠ t`, so
  the supremum is `L(a)`.
- `a = r e`: every numerator is `0`, the supremum is `0 = L(r e)`.
- The non-lower-semicontinuous `L` of 1.6 at `a = t + 1`: the right side is
  `sup |∫(t + 1) d(φ − ψ)| / W₁(φ, ψ) = 1 = L̄(a) < 2 = L(a)`.
- `a ∉ dom L` for a closed `L`: on `C([0, 1], ℝ)` with `L` the Lipschitz constant on the
  Lipschitz functions and `a(t) = √t`, the pairs `φ = δ_h`, `ψ = δ_0` give ratios
  `√h / h = h^(−1/2) → ∞`, so the supremum is `∞ = L(a)`.

### 2.3 Metrics on compact convex sets from closed Lip-norms

On a nonempty compact convex `K` in a Hausdorff locally convex real space, characterize the
finite metrics `ρ` inducing its topology which arise from a closed Lip-norm on `Aff_c(K, ℝ)`:
exactly those which extend to a norm on the real span of `K − K` and are its restriction
(Rieffel 1999, Theorem 9.11; the theorem's statement there misprints "midpoint convex" for
the midpoint-concavity condition of its Definition 9.5). Equivalently prove the conjunction of
the three explicit conditions (Rieffel 1999, 9.1, 9.2, 9.5 and Theorem 9.7):
`ρ(x, ty + (1 − t)z) ≤ tρ(x, y) + (1 − t)ρ(x, z)` for `0 ≤ t ≤ 1`;
`x − y = x′ − y′ → ρ(x, y) = ρ(x′, y′)`; and
`ρ((x + x′)/2, (y + y′)/2) ≤ (ρ(x, y) + ρ(x′, y′))/2`. Derive exact homogeneity along segments
and the unique norm extension from these conditions; mere convexity is insufficient. Construct
`L` as the Lipschitz constant of continuous affine functions and prove metric recovery by
separation. *Needs:* 2.1, 2.2, 0.3.

**Checks.**

- The three-point simplex `K ⊆ ℝ³`: `span(K − K) = {x : Σx_i = 0}` with the Euclidean norm,
  and `K − K = {x : Σx_i = 0, Σ|x_i| ≤ 2}` by the positive and negative part decomposition, a
  bounded hexagon. The pairwise vertex distances are `√2`, the norm of `(1/2, 1/2, −1)` is
  `√(3/2) < √2 = W₁` for the equilateral three-point metric; so the full state metric carries
  information not determined by its restriction to extreme points, and pure-state distances do
  not recover `L`.
- `ρ(x, y) = √|x − y|` on `K = [0, 1]` is a translation-invariant metric which fails convexity:
  `ρ(0, 1/2) = √(1/2) > (1/2)ρ(0, 1) + (1/2)ρ(0, 0) = 1/2`; it extends to no norm. The function
  `|x − y|²` satisfies all three conditions but is not a metric (`1 > 1/4 + 1/4`), so the
  hypothesis that `ρ` is a metric is not redundant.
- The `W₁` metric on the probabilities of a compact metric space satisfies all three conditions
  and is the restriction of the dual Lipschitz norm on the signed measures of total mass `0`.

### 2.4 Lipschitz maps

Define a unital positive `C`-Lipschitz map `T : E → F` between spaces with extended Lipschitz
seminorms by `L_F(Ta) ≤ C L_E(a)` for `C ≥ 0`, taking extended values and domains seriously.
Prove that its state pullback satisfies `ρ_E(T*φ, T*ψ) ≤ C ρ_F(φ, ψ)`, checking the direction
by scaling the test ball; for closed Lip-norms prove the converse using 2.2. Include
composition, identity, positive real rescaling, inverse isometries, restriction and
completion, and record separately when a unital star homomorphism of C*-algebras yields such a
map on self-adjoint parts. *Needs:* 2.2, 0.5.

**Checks.**

- `T = id` with `L_F = L_E / 2`: `T` is `1/2`-Lipschitz and `ρ_F = 2ρ_E`, so
  `ρ_E(T*φ, T*ψ) = ρ_E(φ, ψ) = (1/2)ρ_F(φ, ψ)`; the reversed inequality `ρ_F ≤ Cρ_E` would be
  false.
- The quotient `C([0, 1], ℝ) → ℝ²`, `f ↦ (f(0), f(1))`, with `L = ‖f′‖_∞` and
  `L_F(a) = |a₁ − a₂|`: it is `1`-Lipschitz, and the pullback of `φ_t` is `tδ_0 + (1 − t)δ_1`,
  with `W₁(tδ_0 + (1 − t)δ_1, sδ_0 + (1 − s)δ_1) = |t − s|`.
- A unital positive map which is `C`-Lipschitz for no `C`: `f ↦ f ∘ √` on `C([0, 1], ℝ)` with
  `L` the Lipschitz constant sends `h(t) = t`, with `L(h) = 1`, to `√`, with `L(√) = ∞`.

### 2.5 Quotients by compact convex subsets

For a nonempty compact convex `K ⊆ S(E)` let `F` be the order-unit quotient of 0.5, the
restrictions of the affine functions `â` to `K`, and define the quotient seminorm
`L_F(b) = inf {L_E(a) : a|K = b}` (Rieffel 2000, Proposition 3.1). Prove density of its finite
domain, the scalar kernel, the Lip-norm criterion, and the exact isometric affine
identification `S(F) = K` with the restricted state metric (Rieffel 2000, Proposition 3.5).
The definition is an infimum, not a minimum. For complete closed `E` form the norm completion
`F̄` of the image and define its quotient seminorm by the same infimum, with value `∞` when
there is no lift; prove that it is closed on `F̄` and that finite lifts attain the infimum after
scalar normalization, by compactness of centered balls. The image norm is its inherited
order-unit norm, which can be strictly smaller than the Banach quotient norm of `E`; the two
are not identified without a theorem. Include singleton `K`, successive quotients and the
inclusion–quotient duality, and distinguish this quotient seminorm from the restriction to an
order-unit subspace: the two operations differ in general. *Needs:* 2.1, 1.4, 0.5.

**Checks.**

- `K = {φ}` a single state: `F = ℝ`, `L_F = 0`, `S(F) = {pt} = K`.
- `E = ℝ³`, `L(a) = max |a_i − a_j|`, `K` the edge from `ev₁` to `ev₂`: `F = ℝ²`,
  `L_F(b) = inf_{a₃} max(|b₁ − b₂|, |b₁ − a₃|, |b₂ − a₃|) = |b₁ − b₂|`, attained at
  `a₃ = (b₁ + b₂)/2`.
- Restriction versus quotient: on `ℝ³` with `L(a) = |a₁ − a₂| + 2|a₂ − a₃|`, the quotient by
  the edge from `ev₁` to `ev₃` is `L_F(b) = inf_t (|b₁ − t| + 2|t − b₃|) = |b₁ − b₃|`, attained at
  `t = b₃`, while the restriction to the order-unit subspace `{a₁ = a₂}`, which has the same
  state space, is `2|a₁ − a₃|`.
- Image norm versus Banach quotient norm: `E = C([0, 1], ℝ)` and `K` the segment from `δ_0` to
  `(δ_0 + δ_1)/2`, so the image of `a` is `(a(0), (a(0) + a(1))/2)`. For `b = (0, 1)` the image
  norm is `max(0, 1) = 1`, while every lift has `a(0) = 0`, `a(1) = 2`, so the Banach quotient
  norm is `2`.

### Examples

The closure of the 1.6 seminorm, the three-point simplex of 2.3, the edge quotients of `ℝ³`
and the endpoint quotient `C([0, 1], ℝ) → ℝ²`.

### Dependencies

Layers 0–1; Mathlib geometric Hahn–Banach and the quotient norm; BanachSpaceTheory B1.

## Layer 3: Classical metrics, probabilities and commutators (Q3)

### 3.1 The classical Lipschitz constant

For every metric space `X` define `classicalLip f = sup_{x ≠ y} |f(x) − f(y)| / d(x, y)` in
`ℝ≥0∞` on `C(X, ℝ)`, with the empty supremum equal to `0`. Prove the exact comparison with
the native `LipschitzWith`: `classicalLip f ≤ r ↔ LipschitzWith r f` for `r ∈ ℝ≥0`; the scalar,
additive and star laws; and the Leibniz estimate
`classicalLip (fg) ≤ ‖f‖_∞ classicalLip g + ‖g‖_∞ classicalLip f` on bounded functions. For
arbitrary `X` prove the distance formula
`d(x, y) = sup {|f(x) − f(y)| : f ∈ C_b(X, ℝ), classicalLip f ≤ 1}` with the witness
`f(z) = min(d(z, x), d(x, y))`; this avoids a fictitious finite uniform norm on all of `C(X)`
when `X` is noncompact. Treat the empty and singleton cases and the zero-dimensional compact
examples explicitly. *Needs:* Mathlib `LipschitzWith`, `edist`, `BoundedContinuousFunction`.

**Checks.**

- `X = [0, 1]`, `f(t) = t²`: `classicalLip f = 2`, attained in the limit `x, y → 1`; the
  Leibniz estimate for `f = g = id` reads `2 ≤ 1·1 + 1·1`, with equality.
- `X = ℝ`, `x = 0`, `y = 3`: the witness `f(z) = min(|z|, 3)` is bounded, `1`-Lipschitz, with
  `f(3) − f(0) = 3 = d(0, 3)`; the unbounded function `z ↦ z` is not admitted.
- `X = ∅` or a singleton: every supremum is empty, `classicalLip f = 0` for every `f`, and the
  distance formula is vacuous.
- `X = {0, 1}` with `d = 1`: `classicalLip f = |f(0) − f(1)|`, and the space `C(X, ℝ) = ℝ²` with
  this seminorm is the Layer 1 example `|a₁ − a₂|`.

### 3.2 Compact metric spaces

For a nonempty compact metric space `X` prove `exists_closedLipNorm_classicalLip`: the
extended seminorm `classicalLip` on `C(X, ℝ)` has dense finite domain (the real Lipschitz
functions), kernel `ℝ·1`, lower semicontinuity for the uniform norm, and a totally bounded
centered ball, by Arzelà–Ascoli; hence it is a closed Lip-norm with order unit `1`
(Rieffel 1998, §1; Rieffel 1999, §2). Build the density by the infimal and supremal Lipschitz
approximations `f_r(x) = inf_y (f(y) + r d(x, y))` of a uniformly continuous function, with
their uniform error bounds, or by the lattice Stone–Weierstrass theorem. Extend to `C(X, ℂ)`
and prove the complex Leibniz, star and strong-inverse laws
`classicalLip (f⁻¹) ≤ ‖f⁻¹‖_∞² classicalLip f` on its Lipschitz subalgebra. *Needs:* 3.1,
1.4, 2.1; Mathlib `BoundedContinuousFunction.arzela_ascoli`.

**Checks.**

- `X = [0, 1]`, `f(x) = √x`: `f_r(x) = min(rx, √x)` is `r`-Lipschitz and
  `‖f − f_r‖_∞ = 1/(4r)`, attained at `x = 1/(4r²)`, where `√x − rx = 1/(2r) − 1/(4r)`.
- Lower semicontinuity: `f_n(t) = √(t² + 1/n) → |t|` uniformly on `[−1, 1]` with
  `classicalLip f_n ≤ 1`, and `classicalLip |t| = 1 ≤ liminf`; the extended seminorm `‖f′‖_∞`
  with domain `C¹` is not lower semicontinuous on `C([−1, 1], ℝ)` along the same sequence, since
  its value at the limit `|t| ∉ C¹` is `∞`.
- Strong inverse law on `C([1, 2], ℝ)`: `f(t) = t`, `f⁻¹(t) = 1/t`, `classicalLip (1/t) = 1`
  (at `t = 1`) and `‖1/t‖_∞² · classicalLip f = 1·1 = 1`: equality, so the square is sharp.
- Empty `X` is excluded by the nonemptiness hypothesis: `C(∅, ℝ) = 0` has `1 = 0`, which is no
  order unit.

### 3.3 States as probability measures and the Wasserstein distance

Identify `S(C(X, ℝ))` affinely and homeomorphically with the native
`MeasureTheory.ProbabilityMeasure X` under the integration pairing, using compact regular
Borel probabilities and the Riesz–Markov–Kakutani theorem. Define `integrationState μ`, the
state `f ↦ ∫ f dμ` of `C(X, ℝ)` for a probability measure `μ` on a compact metric space, as
the composite of `ContinuousMap.toLp` and `MeasureTheory.L1.integralCLM`, with its
monotonicity and normalization. Prove the required Borel, regularity and moment properties
of probability measures on a compact metric space inside the adapter. Prove
`stateEDist_integrationState`: for `L = classicalLip` on `C(X, ℝ)`,
`ρ_L(integrationState μ, integrationState ν) = W₁(μ, ν)`, by Tau Ceti's
Kantorovich–Rubinstein duality `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`, in its
absolute-value and basepoint-normalized formulations. Prove that `x ↦ integrationState δ_x` is
isometric, that its image is exactly the set of extreme states, and
`diam(S(C(X, ℝ)), ρ_L) = diam X`. Extend integration and the state dictionary to compact
Hausdorff `X` independently of a metric, using the subtype of regular (equivalently here,
Radon) Borel probability measures: in that generality arbitrary Borel probabilities need not
be regular or determined by continuous integrals. In the compact metric case keep the native
`ProbabilityMeasure X`, where the adapter proves regularity; the `W₁` theorem uses the metric
hypotheses. *Needs:* 3.2, 1.5, 0.3; Tau Ceti `TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`;
Mathlib `RealRMK.rieszMeasure`, `ContinuousMap.toLp`, `MeasureTheory.L1.integralCLM`;
OptimalTransport Layers 0–3.

**Checks.**

- `X = {0, 1}` with `d = 1`: `W₁(tδ_0 + (1 − t)δ_1, sδ_0 + (1 − s)δ_1) = |t − s|`, which is the
  Layer 1 state metric `|s − t|` of `ℝ²` with `|a₁ − a₂|`.
- `X = [0, 1]`, `μ = δ_(1/2)`, `ν` Lebesgue: `W₁ = ∫|t − 1/2| dt = 1/4`, as computed in 1.2.
- The Dirac map: `W₁(δ_x, δ_y) = d(x, y)`, and a non-extreme probability such as
  `(δ_0 + δ_1)/2` is at distance `1/2` from both `δ_0` and `δ_1` in `[0, 1]`, so it is not a
  Dirac measure.
- Normalization of `integrationState`: `∫ 1 dμ = μ(X) = 1`; for a finite measure of mass `2`
  the functional is positive but not a state.

### 3.4 Lipschitz maps and pushforward

Prove that a continuous map `f : X → Y` between compact metric spaces is `C`-Lipschitz exactly
when its pullback satisfies `classicalLip (h ∘ f) ≤ C classicalLip h` for every
`h ∈ C(Y, ℝ)`. Prove that the pushforward of probability measures is `C`-Lipschitz for `W₁`,
through 2.4 and the native transport pushforward. Identify surjective isometries `X → Y` with
the unital real order isometries `C(Y, ℝ) → C(X, ℝ)` preserving `classicalLip`. Preserve the
contravariant direction and check point evaluations, pushforwards of probabilities and
composition. *Needs:* 3.3, 2.4; OptimalTransport Layer 0 (pushforward of plans).

**Checks.**

- `f(t) = 2t : [0, 1] → [0, 2]`: `classicalLip (h ∘ f) = 2 classicalLip h` for `h(s) = s`, so
  `C = 2` is sharp; the pushforward of `δ_t` is `δ_(2t)`, at `W₁`-distance `2|t − t′|`.
- The constant map `X → {pt}`: `C = 0`, every pullback is constant with `classicalLip = 0`, and
  every pushforward is the point mass.
- `f(t) = √t` on `[0, 1]` is continuous but not Lipschitz, and `h(s) = s` has
  `classicalLip (h ∘ f) = ∞`.

### 3.5 Commutator seminorms of spectral triples

For a faithful unital representation `π` of a unital C*-algebra `A` on `H` and a densely
defined self-adjoint `D` supplied by NoncommutativeGeometry N5, take the elements `a` with
`π(a)(dom D) ⊆ dom D` whose algebraic commutator `[D, π(a)]` has a bounded extension. Prove
that they form a unital star subalgebra, the commutator derivation rules, the commutator
seminorm `L_D(a) = ‖[D, π(a)]‖` with its star and Leibniz laws, and lower semicontinuity of
its extended maximal-domain seminorm (Rieffel 1998, §4). Use the form identity on `dom D` and
closedness of `D` to show that norm limits with uniformly bounded commutators still preserve
`dom D` and have a bounded commutator. Prove the strong inverse law when the inverse preserves
`dom D`, and establish that domain invariance for the maximal commutator algebra by the
closed-derivation argument: for invertible `a` use the positive invertible `a*a`, a
norm-convergent Neumann series for its inverse with summable derivative bounds, and multiply
by `a*`; prove graph convergence at every step, since invariance of the inverse does not follow
from `a(dom D) ⊆ dom D` alone. *Needs:* 1.1, 2.1; NoncommutativeGeometry N5.

**Checks.**

- `A = C(S¹)` on `L²(S¹)` with `D = −i d/dθ`: `[D, f] = −i f′` for smooth `f`, `L_D(f) = ‖f′‖_∞`,
  and the maximal domain is the Lipschitz functions with `L_D = classicalLip`.
- `A = M₂(ℂ)` on `ℂ²` with `D = diag(1, −1)`: `[D, a]` has entries `2a₁₂`, `−2a₂₁` off the
  diagonal, so `L_D(a) = 2 max(|a₁₂|, |a₂₁|)`; the kernel is the diagonal algebra `ℂ²`, not
  `ℂ·1`, so this `L_D` is not an extended Lipschitz seminorm of `selfAdjoint M₂(ℂ)`.
- Leibniz: for `f = g = e^(iθ)` on `S¹`, `L_D(fg) = 2 = ‖f‖L_D(g) + ‖g‖L_D(f)`, with equality.

### 3.6 The spectral-triple metric criterion and Riemannian manifolds

Prove the spectral-triple metric criterion: if the finite domain of `L_D` restricted to
`selfAdjoint A` is dense, the kernel is `ℝ·1` and one centered ball is norm totally bounded,
then `L_D` is a closed Lip-norm and its state metric metrizes the weak-star topology
(Rieffel 1998, §4, with the criterion of 1.4). These conditions do not follow from compact
resolvent alone. On a closed connected Riemannian manifold `M` with the nonzero-fibre
Hermitian Clifford module of RiemannianGeometry R7.8 and SpinGeometry G6, identify the
**closed extension** of the smooth real commutator seminorm with `classicalLip` for the
geodesic distance on all Lipschitz real functions: R7.8's quantitative smooth approximation
gives one inequality, pointwise gradient bounds and path integration the other; then identify
its state metric with `W₁` and its point metric with the geodesic distance. For a connected
open Euclidean domain `O` use R7.8's bounded-function distance formula of 3.1 type, not a
compact state-space conclusion for `C(O)`. This section owns the metric consequence; the
analytic Dirac operator and the gradient approximation remain with their suppliers.
*Needs:* 3.5, 3.3, 1.4; RiemannianGeometry R7.8; SpinGeometry G6.

**Checks.**

- `M = S¹` with the Dirac operator `−i d/dθ`: the closed extension of `‖f′‖_∞` on smooth
  functions is the Lipschitz constant for the arc-length distance, and the state metric is
  `W₁` on the circle.
- Compact resolvent without the kernel condition: `D = diag(1, −1)` on `ℂ²` for `M₂(ℂ)` (3.5)
  has compact resolvent and kernel `ℂ²`; the criterion fails and the "metric" is not a metric
  on the states of `M₂(ℂ)`.
- A disconnected `M = S¹ ⊔ S¹`: the kernel of the commutator seminorm is the locally constant
  functions, of dimension two, so the identification with `classicalLip` requires the geodesic
  distance to be `∞` between components, or the hypothesis that `M` is connected.

### Examples

`[0, 1]` and the two-point space with `W₁`, the circle with its Dirac operator, `M₂(ℂ)` with
`diag(1, −1)` as the non-example.

### Dependencies

Layers 0–2; OptimalTransport Layers 0–3 and Tau Ceti Kantorovich–Rubinstein duality (3.3);
NoncommutativeGeometry N5 (3.5); RiemannianGeometry R7.8 and SpinGeometry G6 (3.6).

## Layer 4: Leibniz C*-metrics from compact actions (Q4)

### 4.1 The action seminorm

Define `actionLip ℓ α a = sup_{g ≠ 1} ‖α_g(a) − a‖ / ℓ(g)` in `ℝ≥0∞` on `A` for a native
`GroupNorm` `ℓ` and an action `α : G →* (A ≃⋆ₐ[ℂ] A)`. Prove that it is a seminorm on the
whole algebra, complex homogeneity, star invariance, the Leibniz inequality
`L(ab) ≤ L(a)‖b‖ + ‖a‖L(b)` and the inverse estimate `L(a⁻¹) ≤ ‖a⁻¹‖² L(a)` for invertible
`a` (Rieffel 1998, §2, "easily verified"). Prove that every sublevel set is norm closed. Prove
that the finite domain is a dense unital star subalgebra (Rieffel 1998, Proposition 2.2):
convolve with `L¹(G)` functions Lipschitz under left translation; the continuous `ℓ` and its
right translates separate points, their Lipschitz lattice algebra is dense in `C(G)`, and the
`L¹` approximate-identity argument gives density in `A`. Prove that the zero set is exactly
`A^G`. Use the same formula on `selfAdjoint A` for order-unit metrics; product estimates on
all of `A` are additional structure, not determined by the self-adjoint restriction alone.
*Needs:* 1.1; Mathlib `GroupNorm`, `StarAlgEquiv`; CompactGroups Layer 0.

**Checks.**

- `G = ℤ/2` acting on `C({0, 1}) = ℂ²` by swapping, `ℓ(−1) = 1`: `L(a) = |a₁ − a₂|`, zero set
  the constants, and the Leibniz inequality for `a = b = (1, 0)` reads `1 ≤ 1·1 + 1·1`.
- Trivial action on `A ≠ ℂ`: `L ≡ 0`, the zero set is `A ≠ ℂ·1`, so `L` is no extended Lipschitz
  seminorm; the kernel axiom detects non-ergodicity.
- Inverse law on `C(T)` with rotation by `ℓ(z) = |arg z|`: `f(z) = 2 + z` has `L(f) = 1`,
  `‖f⁻¹‖_∞ = 1`, and `L(f⁻¹) = sup |f′|/|f|² = 1`, below `‖f⁻¹‖² L(f) = 1`, with equality.
- Sublevel closedness: `a_n → a` in norm with `L(a_n) ≤ 1` gives `‖α_g(a) − a‖ ≤ ℓ(g)` for each
  `g`, so `L(a) ≤ 1`; without closedness in `A` the Layer 1 seminorm with the `|f′(0)|` term is
  the contrast.

### 4.2 The compact ergodic supplier

Under ergodicity `A^G = ℂ·1`, consume VonNeumannAlgebras V8.CompactErgodicActions: the Haar
expectation `E(a) = η(a)·1`; uniqueness, positivity, faithfulness and traciality of `η`; the
isotypic and matrix-coefficient projections; the spectral multiplication and star identities;
the norm-dense finite-orbit star algebra and the multiplicity inner products; and
`mult(π) ≤ dim π`, hence isotypic dimension at most `(dim π)²`. Give the adapter with exactly
the same normalized Haar probability, point-norm continuous star action and CompactGroups
coefficient and projection conventions. The supplier's theorem is for an arbitrary compact
Hausdorff `G` and has no length-function hypothesis; the length `ℓ` is additional metric input
here. Neither the later W* normal-action bridge nor the SU(2) classification is a prerequisite
of this sublayer or of Layer 4's metric consequences. *Needs:* 4.1; VonNeumannAlgebras
V8.CompactErgodicActions; CompactGroups Layers 0–5.

**Checks.**

- `G = T` acting on `C(T)` by rotation: `η` is Haar integration, the isotypic spaces are the
  lines `ℂ zⁿ`, each of multiplicity `1 = dim π`.
- `G = SU(2)` acting on `M₂(ℂ)` by conjugation: `η = tr/2`, the isotypic decomposition is
  `ℂ·1 ⊕ 𝔰𝔩₂`, the adjoint representation has multiplicity `1 ≤ 3`, and the fixed algebra is
  `ℂ·1` by Schur.
- `G = T` acting on `C(T) ⊗ ℂ²` by rotation on the first factor: not ergodic, `A^G = ℂ²`, and
  the Haar expectation onto `ℂ²` is not a state.

### 4.3 The closed Lip-norm theorem for ergodic actions

For any `L¹(G)` kernel `f` prove that `α_f(a) = ∫ f(g) α_g(a) dg` is a compact operator on `A`
when every isotypic space is finite dimensional: coefficient kernels give finite-rank maps,
and `L¹` approximation gives operator-norm approximation. Prove
`‖a − η(a)·1‖ ≤ L(a) ∫ ℓ dμ_G` and `diam(S(A), ρ_L) ≤ 2 ∫ ℓ dμ_G` (Rieffel 1998, Lemma 2.4).
Positive unit-mass kernels with arbitrarily small `∫ f ℓ` uniformly approximate the Lip-unit
ball by compact images. Conclude `exists_closedLipNorm_actionLip`: for a compact Hausdorff
`G` with a continuous length `ℓ`, acting ergodically with norm-continuous orbits on a nonzero
unital C*-algebra, the restriction of `actionLip ℓ α` to `selfAdjoint A` is a closed Lip-norm
with order unit `1` (Rieffel 1998, Theorem 2.3; closedness is Rieffel 2000,
Proposition 8.1). *Needs:* 4.2, 1.4, 2.1; Mathlib `IsCompactOperator`.

**Checks.**

- `G = T` on `C(T)` with `ℓ(e^(iθ)) = |θ|`, `θ ∈ (−π, π]`: `∫ ℓ dμ = π/2`, so `diam ≤ π`;
  the actual diameter of the circle with `W₁` for arc length is `π`, so the bound is sharp.
- `G = ℤ/2` on `ℂ²` with `ℓ(−1) = 1`: `∫ ℓ = 1/2`, `diam ≤ 1`, and the state metric of
  `|a₁ − a₂|` has diameter `1`.
- The trivial group: `A = ℂ`, `L ≡ 0` on `ℝ·1`, `S = {pt}`, `∫ ℓ = 0`, diameter `0`.
- Dropping ergodicity: the non-ergodic action of 4.2 has `actionLip` vanishing on `ℂ²`, which is
  not `ℝ·1`, so no `L` with `L a = actionLip ℓ α a` exists on `selfAdjoint A`.

### 4.4 Faithful representations, central kernels and finite approximation

If `ℓ` is conjugation invariant, prove that every `α_g` preserves `L`. Independently of any
invariance of `ℓ`, prove that convolution with a central positive `L¹` kernel of mass one is an
`α`-equivariant unital positive contraction `P` with `L(Pa) ≤ L(a)`: centrality of the kernel
gives `α_g(Pa) − Pa = P(α_g(a) − a)` and `‖P‖ ≤ 1` (Rieffel 2000, Lemma 8.4).

Prove `exists_faithful_unitary_representation`: every compact Lie group `K` admits a faithful
finite-dimensional unitary representation, a continuous injective homomorphism into some
`Matrix.unitaryGroup (Fin n) ℂ`. Route: by CompactGroups Layer 5 the matrix coefficients of
finite-dimensional unitary representations separate points, so for each `g ≠ 1` some
representation `π_g` has `π_g(g) ≠ 1`; by LieGroups Layer 2 the common kernel of finitely many
representations is a closed, hence embedded Lie, subgroup, with Lie algebra the common kernel
of their differentials; finitely many representations have differentials with trivial common
kernel on the finite-dimensional Lie algebra, so that common kernel is a discrete compact,
hence finite, subgroup; finitely many more representations kill it, and the direct sum is
faithful. Let `π₀` be a faithful representation containing the trivial representation
(adjoin a trivial summand) and set `χ = |χ_π₀|²`, the character of `π₀ ⊗ π̄₀`, a nonnegative
central continuous function with its unique maximum `dim(π₀)²` at `1`, by faithfulness
(Rieffel 2000, §8, discussion before Proposition 8.1 and Theorem 8.2). Define
`k_n = χⁿ / ∫ χⁿ` and prove that `k_n` concentrates at `1`: `∫_{ℓ > ε} k_n → 0` for every
`ε > 0`. Its coefficient support is finite; let `B_n` be the self-adjoint part of the sum of
the corresponding isotypic spaces, containing `1`, with the restriction of `L`. Prove that `L`
is finite on `B_n`: on the compact Lie group the continuous `ℓ` locally dominates a fixed
Lie-coordinate length, using powers which leave a fixed small neighbourhood and the positive
minimum of `ℓ` away from `1`, so smooth coefficient functions have finite `L`. Prove that
`P_n = α_(k_n)` has range in `B_n`, `L(P_n a) ≤ L(a)` and `‖a − P_n a‖ ≤ δ_n L(a)` with
`δ_n = ∫ k_n ℓ → 0` (Rieffel 2000, Lemma 8.3 and Lemma 8.4). `P_n` need not be idempotent; it
is neither a conditional expectation nor an orthogonal projection. The trivial group gives
`E = ℝ` with zero error and is handled directly. *Needs:* 4.3, 4.2; CompactGroups Layer 5
(point separation); LieGroups Layer 2 (closed-subgroup theorem); Mathlib `LieGroup`,
`Matrix.unitaryGroup`.

- The theorem is stated for a compact Lie group modelled on a finite-dimensional real normed
  space; disconnected and finite groups are included, and for a finite group the regular
  representation is a witness.
- `L(P_n a) ≤ L(a)` uses only centrality of `k_n`; conjugation invariance of `ℓ` is used only
  for `L(α_g a) = L(a)`.

**Checks.**

- `K = T`, `π₀ = 1 ⊕ z`: `χ = |1 + z|² = 2 + 2cos θ`, maximum `4` at `θ = 0`, `k_n` is the
  normalized Fejér-type kernel `(2 + 2cos θ)ⁿ / ∫`, with Fourier support `{−n, …, n}`, so
  `B_n` is the trigonometric polynomials of degree `≤ n`.
- `K = ℤ/2` with the regular representation `π₀ = 1 ⊕ sgn`: `χ(1) = 4`, `χ(−1) = 0`, `k_n = 2δ_1`
  for every `n ≥ 1`, `P_n = id`, `δ_n = 0`.
- A non-faithful `π₀`: for `K = T` and `π₀ = 1 ⊕ z²`, `χ = |1 + z²|²` has maxima at `θ = 0` and
  `θ = π`, `k_n` does not concentrate at `1`, and `δ_n → π/2`, not `0`.
- The faithful-representation theorem fails for the compact group `T^ℕ`: it is not a Lie
  group, and every finite-dimensional unitary representation factors through finitely many
  coordinates.

### 4.5 Derivative seminorms on compact connected Lie groups

For a compact connected Lie group `G` with a fixed norm on its real Lie algebra, use
SmoothBanachRepresentations SB2's differentiable vectors and define
`L_der(a) = ‖X ↦ dα(X)a‖`, the operator norm of the differential on the unit ball of the Lie
algebra. For the left-invariant length metric defined by that norm prove `actionLip = L_der`
on differentiable vectors (Rieffel 1998, Theorem 3.1): integrate orbit derivatives along
piecewise smooth paths for one inequality, and use small one-parameter subgroups for the
other. Ad-invariance of the norm is needed only for conjugation invariance and equivariance,
not for the Lip-norm theorem. Compare smooth vectors, the `C¹` domain and the maximal closed
Lipschitz domain. For disconnected `G` the derivative seminorm alone has kernel `A^(G⁰)`, so
the group-length construction of 4.1 is retained. *Needs:* 4.3; SmoothBanachRepresentations
SB2 and SB8.

**Checks.**

- `G = T` on `C(T)` with the Lie algebra norm `|x|` and `ℓ = |θ|`: `L_der(f) = ‖f′‖_∞ =
  actionLip` on `C¹(T)`.
- `G = T²` with the Euclidean norm on `ℝ²` acting on `C(T²)`: `L_der(f) = ‖∇f‖_∞`, and the
  left-invariant length is the flat distance.
- `G = O(2)` on `C(O(2))`: `L_der` vanishes on functions constant on each of the two
  components, which is a two-dimensional kernel; `actionLip` with a length `ℓ` positive on the
  reflections has kernel `ℂ·1`.

### 4.6 Examples and Jordan estimates

Give complete examples and their morphisms: translation on `C(G/H)` for a closed subgroup `H`,
with the quotient metric `d(gH, kH) = inf_{h ∈ H} ℓ(g⁻¹kh)` for conjugation-invariant `ℓ`, and
the equality of the action seminorm with `classicalLip` for this metric; conjugation on
`End(V_π)` for an irreducible finite-dimensional unitary `π`, with scalar fixed algebra by
Schur and hence a noncommutative matrix Lip-norm; and the failure of the scalar kernel for
reducible `π` and for the trivial action on a non-scalar algebra. Layer 6 supplies the
quantum tori in every dimension. Build the Jordan and Lie Leibniz estimates on `selfAdjoint A`
with their explicit factors for `a ∘ b = (ab + ba)/2` and `{a, b} = (ab − ba)/(2i)`; arbitrary
self-adjoint elements are not multiplied as though `selfAdjoint A` were an algebra.
*Needs:* 4.3, 4.4, 3.4.

**Checks.**

- `G = SO(3)`, `H = SO(2)`: `C(S²)` with the round metric, and `actionLip = classicalLip` for
  the geodesic distance when `ℓ` is the rotation angle.
- `π` the two-dimensional representation of `SU(2)` on `M₂(ℂ)`: the fixed algebra is `ℂ·1`
  and `actionLip` is a Lip-norm on `selfAdjoint M₂(ℂ)`, the Bloch ball; for the reducible
  `π ⊕ π` on `M₄(ℂ)` the fixed algebra is `M₂(ℂ)`, and the kernel axiom fails.
- Jordan estimate: for `a, b` self-adjoint, `L(a ∘ b) ≤ L(a)‖b‖ + ‖a‖L(b)` with the factor
  `1`, since `(ab + ba)/2` is a convex combination of two products.

### Examples

Rotation on `C(T)`, the two-point swap, conjugation of `SU(2)` on `M₂(ℂ)`, homogeneous spaces
`C(G/H)`, and the kernels `k_n` of `T` and `ℤ/2`.

### Dependencies

Layers 1–3; CompactGroups Layers 0–5; LieGroups Layer 2; VonNeumannAlgebras Layer 0 and
V8.CompactErgodicActions; SmoothBanachRepresentations SB2 and SB8; Mathlib `GroupNorm`,
`IsCompactOperator`, `LieGroup`, `Matrix.unitaryGroup`.

## Layer 5: Order-unit quantum Gromov–Hausdorff distance (Q5)

### 5.1 Bridges and the distance

Work with complete closed presentations from Layer 2, or their identified dense finite
domains. Define `QuotientAdmissibleLipNorm LE LF`: a Lip-norm `M` on `E × F` with order unit
`(e, f)` whose coordinate quotient seminorms are exactly `L_E` and `L_F`,
`inf_b M(a, b) = L_E(a)` and `inf_a M(a, b) = L_F(b)` (Rieffel 2000, Definition 4.1 for the
finite case). Define `AdmissibleLipNorm LE LF`, a **bridge**, as a quotient-admissible `M`
with the full product finite domain `dom M = dom L_E × dom L_F`: a finite seminorm on that
direct sum, extended by `∞` outside it. Quotient equality forces the reverse domain inclusion;
the forward finiteness is proved explicitly. Quotient equalities are infima over lifts, not
equality with `M(a, 0)`. Define `leftState` and `rightState`, the coordinate pullbacks of
states to `E × F`, and `bridgeEDist M`, the Hausdorff distance of their images for the state
metric of `M`, through the native `Metric.hausdorffEDist` and the `EMetricSpace` structure
`stateEMetricSpace`; `quotientBridgeEDist` is the same for a quotient-admissible `M`. Define
`quantumGHEDist LE LF` as the infimum of `bridgeEDist` over bridges (Rieffel 2000,
Definition 4.2) and `quotientQuantumGHEDist` as the infimum over the broader class. Prove
existence and finiteness of bridges using centered scalar-coordinate bridges and the radius
bounds of 1.3. *Needs:* 2.1, 1.3, 1.5, 0.5; Mathlib `Metric.hausdorffEDist`.

Prove `quantumGHEDist_eq_quotientQuantumGHEDist`: the two infima agree. For `ε > 0` and a
quotient-admissible `M`, with the maximum order-unit norm on `E × F`, construct the finite
continuous seminorm `N_ε(v) = inf_w (M(w) + ε⁻¹‖v − w‖)` and set
`M_ε(a, b) = max(L_E(a), L_F(b), N_ε(a, b))`. Prove homogeneity, subadditivity, `N_ε ≤ M`,
`N_ε(v) ≤ ε⁻¹‖v‖` and its norm-Lipschitz estimate. If `‖q(v)‖ ≤ R M(v)` on `dom M` with
`R > 0`, prove `N_ε(v) ≥ ‖q(v)‖ / max(R, ε)`. Deduce the diagonal scalar kernel, the full
product domain and both exact coordinate quotients of `M_ε`. Prove its Lip-norm property using
the two centered endpoint balls and the scalar-difference bound from `N_ε`; if `L_E, L_F` are
closed, `M_ε` is closed. On the common state space prove `ρ_M ≤ ρ_(M_ε) ≤ ρ_M + 2ε`, using
approximate `w`-lifts and that a difference of states has norm at most `2`; deduce the same
bound for the Hausdorff distances and the equality of the two infima. Prove that closing a
full-domain bridge between complete closed endpoints preserves coordinate quotients, the
product domain and the state metrics, and that the distance is invariant under Layer 2's
closed-completion comparison with incomplete finite-domain presentations.

**Checks.**

- `E = F = ℝ`, `e = f = 1`: the only extended Lipschitz seminorms are `0`, the bridge
  `M(a, b) = |a − b|` has `M(a, b) = 0 ↔ a = b` as kernel `ℝ(1, 1)`, state metric `0` on the
  single state of each side, and `quantumGHEDist = 0`.
- `E = ℝ²` with `|a₁ − a₂|`, `F = ℝ` with `0`, and for `δ > 0` the bridge
  `M_δ(a, b) = max(|a₁ − a₂|, δ⁻¹|(a₁ + a₂)/2 − b|)`: `inf_b M_δ(a, b) = |a₁ − a₂|` at
  `b = (a₁ + a₂)/2`, `inf_a M_δ(a, b) = 0` at `a = (b, b)`, kernel `ℝ(1, 1, 1)`. For the pulled-back
  states `φ_t(a, b) = ta₁ + (1 − t)a₂` and `ψ(a, b) = b`,
  `φ_t(a, b) − ψ(a, b) = (t − 1/2)(a₁ − a₂) + ((a₁ + a₂)/2 − b)`, so `ρ_M(φ_t, ψ) = |t − 1/2| + δ`,
  the Hausdorff distance is `1/2 + δ`, and `quantumGHEDist ≤ 1/2`; it equals `1/2` by the
  diameter estimate of 5.3.
- Quotient equality is not `M(a, 0)`: for `M(a, b) = max(L_E(a), L_F(b), |a₁ − b|)` on
  `ℝ² × ℝ` one has `M(a, 0) = max(|a₁ − a₂|, |a₁|) ≠ L_E(a)` in general, while
  `inf_b M(a, b) = L_E(a)` at `b = a₁`.
- `N_ε` for `M` the bridge above and `ε → 0` recovers `M` on `dom M`, and `N_ε(v) ≤ ε⁻¹‖v‖`
  shows `M_ε` is finite everywhere on the product.

The coupled-domain example shows why quotient equalities alone do not permit maximum gluing.
On the real `L²` space of the circle let `T` be the compact injective Fourier multiplier with
multipliers `exp(−n²)` and `U` the orthogonal map multiplying by the sign of the semicircle;
prove `ran T ∩ U(ran T) = {0}` by analyticity and that `x ↦ (Tx, TUx)` has dense range by its
adjoint kernel. On the Lorentz order-unit space `ℝ ⊕ L²` take `L(t, Tx) = ‖x‖` (and `∞` off
`ℝ ⊕ ran T`) and on its square `M((t, Tx), (s, TUx)) = max(‖x‖, |t − s|)`, extended by `∞`.
Verify closed Lip-norms, compact centered balls and attained coordinate quotients. Gluing `M`
with its reverse forces equal endpoint Hilbert components, so neither the maximum nor its
endpoint quotient has dense finite domain. This example belongs to the broader class, and the
regularized bridges above provide the required reduction; no class of compact quantum metric
spaces or quotient-admissible example is discarded.

### 5.2 The bridge lemma

Prove the bridge lemma (Rieffel 2000, Definition 5.1 and Theorem 5.2): for a continuous
seminorm `N` on `E × F` with `N(e, f) = 0`, `N(e, 0) > 0`, and approximate lift estimates
which make `max(L_E, L_F, N)` induce both quotient seminorms, that maximum is a bridge. State
approximate lifts with every `ε > 0`; exact lifts are required only in the closed compact
sublevel case where Layer 2 gives attainment. Include the concrete common-ambient-norm bridge
`N(a, b) = δ⁻¹‖a − b‖` for `δ > 0`, an order-unit subspace `F ⊆ E`, compatible seminorms
`L_E(b) ≤ L_F(b)` for every `b ∈ F`, and a map `P : E → F` with `L_F(Pa) ≤ L_E(a)` and
`‖a − Pa‖ ≤ δ L_E(a)` (Rieffel 2000, Proposition 8.5, for nonlinear `P`). State all
inequalities for the extended seminorms with their domains; `L_F` equal to the restriction of
`L_E` is the principal special case. Prove the `E`-coordinate quotient using `Pa` and the
`F`-coordinate quotient using `a = b`; the maximum has the full product finite domain. Prove
`quantumGHEDist LE LF ≤ δ` by state restriction and positive extension. No linearity of `P` is
needed; linear positivity is available in the convolution examples of 4.4. Handle Layer 4's
zero-error scalar model directly rather than dividing by `δ = 0`. *Needs:* 5.1, 0.2, 2.5.

**Checks.**

- `E = F = ℝ²`, `P = id`, `L_F = L_E / 2` with `L_E(a) = |a₁ − a₂|`: both `P`-estimates hold
  (`L_F(Pa) = L_E(a)/2 ≤ L_E(a)`, `‖a − Pa‖ = 0`) but the compatibility `L_E(b) ≤ L_F(b)` fails,
  and indeed `diam E = 1`, `diam F = 2` give `quantumGHEDist LE LF ≥ 1/2 > 0`, so the two
  `P`-estimates alone do not give `quantumGHEDist ≤ δ` for every `δ > 0`.
- `E = C(T)` with `‖f′‖_∞`, `F = B_n` the trigonometric polynomials of degree `≤ n`,
  `P = P_n` the Fejér-type kernel of 4.4: `quantumGHEDist ≤ δ_n → 0`.
- `δ = 0` is the case `E = F = ℝ`, `P = id`, where the bridge is `|a − b|` and the distance is
  `0`, not `0⁻¹ · 0`.

### 5.3 Metric laws and the classical comparison

Prove symmetry, zero self-distance, the scaling law `dist_q(tE, tF) = t dist_q(E, F)` for
`t > 0`, invariance under unital order isometries preserving `L`, and the triangle inequality
`quantumGHEDist_triangle` (Rieffel 2000, Theorem 4.3, Lemmas 4.4 and 4.6): take bridges
`M_EF`, `M_FH` within `ε` of the infima, glue them by
`G(a, b, c) = max(M_EF(a, b), M_FH(b, c))` and take the endpoint quotient
`K(a, c) = inf_b G(a, b, c)`. Prove that `dom G` is the full triple product and `dom K` the
full endpoint product (for the latter use a finite middle scalar element, and the original
quotient lower bounds for the converse), the coordinate quotient equalities by successive
`ε`-lifts, the Lip-norm criterion and the state-space estimates; an arbitrary Gromov–Hausdorff
gluing of the underlying state sets need not respect the affine structure. Prove
`|diam E − diam F| ≤ 2 dist_q(E, F)` and the classical comparison
`dist_q(C(X, ℝ), C(Y, ℝ)) ≤ ghDist X Y` for nonempty compact metric spaces, by restricting
Lipschitz functions on a metric gluing of `X` and `Y` and extending them with their exact
Lipschitz constant (Rieffel 2000, §4). Equality with the classical Gromov–Hausdorff distance
is not asserted. *Needs:* 5.1, 5.2, 3.2, 3.3; Mathlib `GromovHausdorff.ghDist`.

**Checks.**

- `E = ℝ²` with `|a₁ − a₂|` and `F = ℝ`: `diam E = 1`, `diam F = 0`, so `dist_q ≥ 1/2`, and the
  bridge of 5.1 gives `≤ 1/2`: `dist_q = 1/2`.
- Scaling: `L ↦ 2L` halves every state metric, and `dist_q(2L_E, 2L_F) = dist_q(L_E, L_F)/2`.
- Two-point spaces `X = {0, 1}` with `d = 1` and `Y = {0, 1}` with `d = 2`: `ghDist = 1/2`, and
  `dist_q(C(X), C(Y)) ≤ 1/2` while the diameter estimate gives `dist_q ≥ 1/2`: equality here.

### 5.4 Zero-distance rigidity

Prove `quantumGHEDist_eq_zero_iff` for complete closed presentations: `dist_q(E, F) = 0`
exactly when there is a unital surjective real order isometry `T : E ≃ F` with
`L_F(Ta) = L_E(a)` for every `a` (Rieffel 2000, Theorem 7.8, with the notion of isometry of
its §6). Construct an affine isometry of the compact state spaces by compactness of
approximate affine correspondences, then use Layer 0's Kadison duality and Layer 2's
recovery theorem. For incomplete finite-domain presentations compare their closed completions,
not merely a selected dense subspace. In the C*-case this is an order-unit (Jordan)
conclusion: **multiplication is not detected by this distance**, opposite algebras with the
transported `L` have zero distance, and a metric distinguishing the full C*-multiplication is
not the order-unit distance specified here. *Needs:* 5.3, 2.2, 2.1, 0.3; Mathlib
`LinearIsometryEquiv`.

**Checks.**

- `M₂(ℂ)` and its opposite algebra with the conjugation Lip-norm of 4.6 transported along the
  identity of `selfAdjoint M₂(ℂ)`: distance `0`, though the algebras are anti-isomorphic and not
  isomorphic through that map.
- `C(X)` and `C(Y)` for compact metric spaces at distance `0`: the theorem gives a unital order
  isometry preserving `classicalLip`, which by 3.4 is pullback along an isometry `X ≅ Y`.
- Without completeness: `C¹([0, 1])` with `‖f′‖_∞` and `C([0, 1])` with the Lipschitz constant are
  at distance `0` and are not order isomorphic, since one is complete and the other not; the
  theorem is about their common closed completion.

### 5.5 Completeness

Construct the metric space of isometry classes of complete closed presentations, controlling
universes through the separability of 1.5 and a fixed universal real Banach-space model.
Prove completeness (Rieffel 2000, Theorem 12.11): pass to a summable-distance subsequence,
choose full-domain bridges between adjacent terms, using 5.1's reduction with summable
additional errors when starting from quotient-only bridges, and prove that every finite-prefix
maximum and endpoint quotient has the full finite-domain product before passing to infinite
sequences. Construct the subspace of product sequences `a` with
`sup_j M_j(a_j, a_(j+1)) < ∞`; prove that summable adjacent state-space distances make every
such sequence norm bounded, using the uniform diameter bounds and compatible scalar
centering. Equip this subspace with the maximum norm and the supremum bridge seminorm. Prove
that its state space is the compact metric completion of the increasing union of the
finite-coordinate convex state hulls; take the Hausdorff limit `K` of the coordinate state
spaces inside it, restrict affine functions to `K`, and use 2.5 for the quotient Lip-norm.
Prove that the quotient retains a nonzero order unit and finite radius, has dense finite
domain, and that the coordinate spaces converge to it; pass to its complete closed
presentation. Completeness of ordinary Gromov–Hausdorff space is not a substitute for these
affine and quotient constructions. *Needs:* 5.1–5.4, 2.5, 1.5.

**Checks.**

- The constant sequence `E_j = E` with `M_j` the diagonal bridge `max(L_E(a), L_E(b), δ⁻¹‖a − b‖)`,
  `δ_j = 2^(−j)`: the limit is `E` itself.
- The spaces `B_n` of 5.2 for `C(T)` with `δ_n → 0` summable along a subsequence: the limit is
  `C(T)` with the Lipschitz constant, by 5.4.
- `E_j = ℝ^(j)` with the simplex metrics of diameter `2^(−j)` converging to `ℝ`: the quotient
  retains the order unit `1` and has radius `0`.

### 5.6 Finite-dimensional approximation and compactness

Prove finite-dimensional quotient approximation (Rieffel 2000, Theorem 13.1): take a finite
`ε′`-net of `S(E)` with `ε′ < ε`, restrict affine functions to its convex hull, and use 2.5 to
get a quotient `F` with `dim F ≤ card(net)` and `dist_q(E, F) < ε`. Such an `F` is an
order-unit function system, not in general a finite-dimensional C*-algebra. Define `Fin_E(ε)`
as the minimum dimension of a finite-dimensional compact quantum metric space within `ε` of `E`
and `Scv_E(ε)` as the minimum cardinality of an `ε`-net of `S(E)` (Rieffel 2000,
Definition 13.4). Prove the quantum compactness theorem (Rieffel 2000, Theorem 13.5): a family
has compact closure for `dist_q` exactly when its state diameters and `Scv_E(ε)` are uniformly
bounded for every `ε > 0`, equivalently when the diameters and `Fin_E(ε)` are. Include the
finite-dimensional comparison, bounded-dimension and bounded-radius precompactness, and the
covering-number inequalities needed in each implication. Deduce from 4.4's `δ_n` and the
multiplicity bounds of 4.2 that all ergodic actions of a fixed compact Lie group `G` with one
conjugation-invariant `ℓ` form a precompact family; this is a metric precompactness theorem,
not an equivariant classification. *Needs:* 5.5, 2.5, 4.4, 4.2.

**Checks.**

- `E = C([0, 1])` with the Lipschitz constant and the net `{δ_(k/n)}`: the quotient is `ℝ^(n+1)`
  with the quotient Lip-norm, at distance `≤ 1/(2n)`, so `Fin_E(ε) ≤ 1/ε + 2`.
- `Scv` for the two-point simplex `S(ℝ²) = [0, 1]` with `|s − t|`: `Scv(ε) = ⌈1/(2ε)⌉`.
- A family with unbounded diameters, `(ℝ², t|a₁ − a₂|)` for `t → 0`, has diameters `1/t → ∞` and
  is not precompact; a family with bounded diameters but `Scv_E(ε) → ∞`, the simplices
  `(ℝ^(d), max_(i,j) |a_i − a_j|)` of diameter `1` whose `d` vertex states are pairwise at
  distance `1`, has `Scv(ε) ≥ d` for `ε < 1/2` and is not precompact either.

### Examples

`ℝ²` against `ℝ` (distance `1/2`), the two-point spaces of 5.3, the Fejér approximations
`B_n` of `C(T)`, and `M₂(ℂ)` against its opposite algebra.

### Dependencies

Layers 0–4; Mathlib `Metric.hausdorffEDist`, `GromovHausdorff.ghDist`, `LinearIsometryEquiv`.
No input from Layer 6 or from spectral triples.

## Layer 6: Quantum tori and metric continuity (Q6)

### 6.0 The twisted group C*-algebra of ℤᵈ

For `d ∈ ℕ` and a real skew-symmetric `d × d` matrix `Θ` define the twisted left regular
representation `λ_Θ(p)δ_q = σ_Θ(p, q)δ_(p+q)` on `ℓ²(ℤᵈ)`, with `σ_Θ(p, q) = exp(πi pᵀΘq)`,
and `A_Θ` as the C*-subalgebra of `B(ℓ²(ℤᵈ))` generated by the unitaries `W_p = λ_Θ(p)`, so
that `W_pW_q = σ_Θ(p, q)W_(p+q)` and `W_p* = W_(−p)` (Rieffel 2000, §9, equation (9.1)).
Prove the universal property: for unitaries `V_p` in a unital C*-algebra `B` with
`V_pV_q = σ_Θ(p, q)V_(p+q)` there is a unique unital star homomorphism `A_Θ → B` with
`W_p ↦ V_p`. Route: represent `B` faithfully on `H` (VonNeumannAlgebras Layer 0); the unitary
`ξ ⊗ δ_q ↦ V_qξ ⊗ δ_q` of `H ⊗ ℓ²(ℤᵈ)` conjugates `1 ⊗ λ_Θ(p)` to `V_p ⊗ λ_0(p)`, and
OperatorAlgebraDynamics D2's almost-invariant vectors for `ℤᵈ`, from the Følner boxes of
AmenableGroups Layer 6, give `‖Σ c_pV_p‖ ≤ ‖Σ c_pW_p‖` for finitely supported `c`. Define the
gauge action of `z ∈ Tᵈ` by `α_z(W_p) = z^p W_p`, implemented spatially by the unitary
`δ_q ↦ z^q δ_q`, and the coefficient trace `τ_Θ(a) = ⟨aδ₀, δ₀⟩`. Prove the identification
theorem: if a unital C*-algebra `B` is generated by unitaries `V_p` satisfying the
`σ_Θ`-twisted relations and carries a faithful state `τ_B` with `τ_B(V_p) = δ_(p,0)`, the
universal homomorphism `A_Θ → B` is an isomorphism, since `τ_B ∘ Φ = τ_Θ` on the dense span
and `τ_Θ` is faithful (6.1). *Needs:* VonNeumannAlgebras Layer 0; OperatorAlgebraDynamics D2;
AmenableGroups Layers 5–6.

- `A_Θ` for `d = 0` is `ℂ`; for `Θ = 0` it is `C*(ℤᵈ) ≅ C(Tᵈ)` through the Fourier transform;
  for `Θ` with integer entries `σ_Θ` is `±1`-valued and `A_Θ ≅ C(Tᵈ)` as well, by the
  periodicity transport of 6.5.
- The universal property transports every model of `C*(ℤᵈ, σ_Θ)` with a faithful coefficient
  trace onto `A_Θ`; nothing in Layer 6 depends on another model.

**Checks.**

- `d = 1`: `σ_Θ = 1`, `λ_Θ` is the bilateral shift, `A_Θ = C*(shift) ≅ C(T)`, `τ_Θ(W_p) = δ_(p,0)`
  is Haar integration of `z^p`.
- `d = 2`, `Θ₁₂ = −θ`: `W_(1,0)W_(0,1) = σ_Θ((1,0),(0,1))W_(1,1) = exp(−πiθ)W_(1,1)` and
  `W_(0,1)W_(1,0) = exp(πiθ)W_(1,1)`, so `W_(1,0)W_(0,1) = exp(−2πiθ)W_(0,1)W_(1,0)`, which is
  `U₂U₁ = exp(2πiθ)U₁U₂` for `U₁ = W_(1,0)`, `U₂ = W_(0,1)`.
- The relation computed on `δ_q`: `λ_Θ(p)λ_Θ(p′)δ_q = σ_Θ(p′, q)σ_Θ(p, p′ + q)δ_(p+p′+q)` and
  `σ_Θ(p, p′ + q)σ_Θ(p′, q) = σ_Θ(p, p′)σ_Θ(p + p′, q)` by bilinearity of `pᵀΘq`, so
  `W_pW_p′ = σ_Θ(p, p′)W_(p+p′)`; the reversed convention `σ(q, p)` would give
  `exp(−πi pᵀΘq)`, the inverse phase.
- Faithfulness of the coefficient trace: `τ_Θ(a*a) = ‖aδ₀‖²`, and `δ₀` is separating for `A_Θ`
  because it is cyclic for the twisted right regular representation, which commutes with
  `A_Θ`; the state `a ↦ ⟨aδ_q, δ_q⟩` at another `q` is the same functional.

### 6.1 Gauge action, trace and the identification Φ_θ

Construct coefficient extraction and gauge averaging in `A_Θ`; prove strong continuity of the
gauge action, that `τ_Θ` is a faithful trace with `τ_Θ(W_p) = δ_(p,0)`, and that the fixed
algebra is `ℂ·1` for every `Θ`, including rational and degenerate `Θ` and `Θ = 0`. Prove that
the gauge-finite subalgebra is exactly the finite Fourier polynomials; for `d = 0` it is `ℂ`.
This C*-level Fourier foundation is owned here for every `d`; NoncommutativeGeometry N6 owns
the smooth two-torus theory on the rotation algebra `A_θ`, and Layer 6 does not rebuild it.
For `d = 2` construct the isometric star isomorphism `Φ_θ : A_Θ(θ) → A_θ`,
`Φ_θ(W_(m,n)) = exp(πiθmn)U₁^mU₂^n`. Route: the trace-GNS representation `π_τ` of `A_θ` on
`L²(A_θ, τ)`, identified with `ℓ²(ℤ²)` by N7's ordered basis `e_(m,n) = [U₁^mU₂^n]`, is
injective because N6's `τ` is faithful; with the diagonal unitary
`Vδ_(m,n) = exp(πiθmn)e_(m,n)` prove `V*π_τ(U₁)V = W_(1,0)` and `V*π_τ(U₂)V = W_(0,1)` (both
sides send `δ_(m,n)` to `exp(−πiθn)δ_(m+1,n)`, respectively `exp(πiθm)δ_(m,n+1)`), so
`a ↦ V*π_τ(a)V` maps `A_θ` onto `A_Θ(θ)` and `Φ_θ` is its inverse. Prove
`Φ_θ ∘ α_z = β_z ∘ Φ_θ` for N6's gauge action `β`, `τ ∘ Φ_θ = τ_Θ(θ)`, the coefficient rule
that the `(m, n)` coefficient of `Φ_θ(x)` is `exp(πiθmn)` times the `W_(m,n)` coefficient of
`x`, and that `Φ_θ` maps finite Fourier polynomials onto finite Fourier polynomials and the
rapidly decreasing series of `A_Θ(θ)` onto `𝒜_θ`, the phases having modulus one. `V`
intertwines `λ_Θ(θ)` with `π_τ` and commutes with every operator diagonal in the two Fourier
bases with the same eigenvalues, in particular with the derivations `δ_j` and with N7's
Fourier–Dirac operator `D` on `ℓ²(ℤ²) ⊗ ℂ²`. No irrationality hypothesis enters any metric
theorem. *Needs:* 6.0; NoncommutativeGeometry N6 and N7; CompactGroups Layer 0 (Haar
averaging on `Tᵈ`).

**Checks.**

- `V*π_τ(U₁)Vδ_(m,n)`: `Vδ_(m,n) = exp(πiθmn)e_(m,n)`, `π_τ(U₁)e_(m,n) = [U₁^(m+1)U₂^n] = e_(m+1,n)`,
  and `V*e_(m+1,n) = exp(−πiθ(m+1)n)δ_(m+1,n)`, total phase `exp(−πiθn)`; and
  `W_(1,0)δ_(m,n) = σ_Θ((1,0),(m,n))δ_(m+1,n) = exp(πi·(−θ)·n)δ_(m+1,n)`: equal.
- `V*π_τ(U₂)Vδ_(m,n)`: `π_τ(U₂)e_(m,n) = [U₂U₁^mU₂^n] = exp(2πiθm)[U₁^mU₂^(n+1)]`
  (from `U₂U₁ = exp(2πiθ)U₁U₂` applied `m` times), phase after `V*`:
  `exp(πiθmn + 2πiθm − πiθm(n+1)) = exp(πiθm)`; and
  `W_(0,1)δ_(m,n) = exp(πi·θ·m)δ_(m,n+1)`: equal.
- `Θ = 0`, `d = 2`: `Φ_0` is the Fourier identification `C(T²) → C(T²)`, the identity on
  coefficients; the gauge-fixed algebra is `ℂ·1` since the only gauge-invariant Fourier mode is
  `p = 0`.
- Rational `θ = 1/2`: `A_Θ` is not simple, yet the gauge action is ergodic and `τ_Θ` faithful;
  no simplicity is used.

### 6.2 Lip-norms on quantum tori

Fix a continuous length `ℓ` on `Tᵈ` and use 4.3 to construct the closed Lip-norm `L_Θ` on
`selfAdjoint A_Θ` from the gauge action (Rieffel 2000, §9). For a fixed norm on `ℝᵈ` compare
the gauge derivative formula `dα(X)W_p = 2πi(p·X)W_p` with the corresponding invariant
length through 4.5: on smooth vectors these yield equal seminorms, with the closed
maximal-domain extension. For `d = 2` compare N7's Fourier–Dirac seminorm, transported along
`Φ_θ` and `V`, by explicit Clifford coefficient estimates: for self-adjoint smooth `a` with
`x = δ₁a`, `y = δ₂a` self-adjoint, `[D, a ⊗ 1] = −i(σ₁ ⊗ x − σ₂ ⊗ y)` has norm `‖x + iy‖`
(the two block norms coincide, since `(x + iy)* = x − iy`), which lies between
`max(‖x‖, ‖y‖)` and `‖x‖ + ‖y‖`; prove total boundedness of its centered ball from this
comparison. Equality with the derivative seminorm is not asserted for arbitrary noncommuting
derivative coefficients. For `d ≠ 2` no Dirac seminorm is compared: N7's triple is
two-dimensional, and `L_Θ` with its derivative formula is the `d`-dimensional statement.
*Needs:* 6.1, 4.3, 4.5; NoncommutativeGeometry N7.

**Checks.**

- `Θ = 0`, `d = 1`: `L_0` on `C(T)` with `ℓ = |θ|` is the Lipschitz constant for arc length, and
  the derivative formula gives `‖f′‖_∞`.
- `d = 2`, `a = W_(1,0) + W_(−1,0)` (self-adjoint): `x = δ₁a = 2πi(W_(1,0) − W_(−1,0))`, `y = 0`,
  `‖x + iy‖ = ‖x‖ = 4π`, and `max(‖x‖, ‖y‖) = ‖x‖ + ‖y‖ = 4π`: both bounds are attained.
- `x, y` commuting self-adjoint (the case `Θ = 0`): `‖x + iy‖ = ‖√(x² + y²)‖ = ‖∇a‖_∞`, the
  Riemannian gradient norm of 3.6; for noncommuting `x, y` the identity `‖x + iy‖² = ‖x² + y²‖`
  fails, which is why no equality is claimed.

### 6.3 Continuity of the norms in Θ

Own the continuous-field estimates used in the metric limit (Rieffel 2000, §9, Lemma 9.3
and §11). For every finite Fourier polynomial `f`, prove that `Θ ↦ ‖λ_Θ(f)‖` is continuous.
Lower semicontinuity follows by testing finitely supported vectors in the common `ℓ²(ℤᵈ)`
regular model. Prove upper semicontinuity by Følner localization for finite-propagation
twisted convolution: for each finite `S` and `ε > 0` construct a finite `K ⊆ ℤᵈ` such that for
every `f` supported on `S` and every `Θ`, `‖λ_Θ(f)‖ ≤ ‖λ_Θ(f)P_K‖ + ε‖f‖₁`, by a slowly
varying translated partition of unity and its commutator error estimate; commuting twisted
right translations make the localized operator norms independent of the translated box. The
finite-rank operator `λ_Θ(f)P_K` has range in the span of `δ_q` for `q ∈ K + S`, so its matrix
norm is continuous in `Θ`. Extend by the common `ℓ¹` bound `‖λ_Θ(f)‖ ≤ ‖f‖₁` to all `ℓ¹`
Fourier coefficients. Strong-operator continuity alone is insufficient for norm continuity
(Rieffel 2000, §9, remark after Theorem 9.2). *Needs:* 6.0; AmenableGroups Layer 6.

**Checks.**

- `f = δ_(1,0) + δ_(0,1)` in `d = 2`: `‖W_(1,0) + W_(0,1)‖ = ‖1 + W_(1,0)*W_(0,1)‖ = 2` for every
  `Θ`, since `W_(1,0)*W_(0,1)` is a phase times `W_(−1,1)`, whose spectrum is invariant under the
  gauge rotations `z ↦ z^(−1,1)` and is therefore the full circle; a constant function of `Θ`.
- `f = δ_(1,0) + δ_(0,1) + δ_(−1,0) + δ_(0,−1)` (the Harper operator `H`): `‖λ_Θ(f)‖ = 4` at
  `Θ = 0`, while at `θ = 1/2` the generators anticommute, the cross terms of `H²` cancel,
  `H² = (U₁ + U₁*)² + (U₂ + U₂*)²` and `‖H‖ = 2√2`; the norm is continuous in `θ` but not
  constant.
- Strong continuity is not norm continuity: for a fixed `ξ`, `Θ ↦ λ_Θ(f)ξ` is continuous, while
  the lower bound `‖λ_Θ(f)‖ ≥ sup_ξ` gives only lower semicontinuity.

### 6.4 Finite-dimensional continuity

For each finite symmetric support `S ∋ 0` identify the real self-adjoint coefficient space
`V_S = {f : supp f ⊆ S, f(−p) = conj f(p)}` independently of `Θ`, with distinguished `δ₀`.
Prove joint continuity of `(Θ, f) ↦ ‖f‖_Θ` and `(Θ, f) ↦ L_Θ(f)` (Rieffel 2000, Lemma 10.1).
For `L`, normalized gauge differences form a bounded subset of the fixed finite-dimensional
coefficient space; use its compact closure and uniform `ℓ¹` control to pass continuity
through the supremum over `z ≠ 1`; for the derivative formula use the compact Lie-algebra unit
ball. Give uniform norm equivalence on compact parameter sets. Prove continuity of the dual
state bodies and centered Lip-unit bodies and construct the resulting bridges between the
finite-dimensional order-unit spaces `(V_S, ‖·‖_Θ, L_Θ)` and `(V_S, ‖·‖_Ψ, L_Ψ)` (Rieffel 2000,
Theorem 11.2). For state bodies use their support functions `max_Θ(a) = ‖a + Re‖_Θ − R` with a
common `R` bounding `‖a‖_Θ`; prove the support-function and Hausdorff comparison in finite
dimensions. This finite-dimensional order-unit and Lip-norm comparison lemma is reusable and
is owned here; it allows the positive cones to vary with `Θ`. *Needs:* 6.3, 6.2, 5.2, 1.5.

**Checks.**

- `S = {0}`: `V_S = ℝδ₀`, every norm is `|·|`, `L_Θ = 0`, and the bridges are trivial.
- `d = 1`, `S = {−1, 0, 1}`: `V_S` is the real span of `1, cos, sin`, the norm is the uniform norm
  on `T` for every (trivial) `Θ`, and `L` is `‖f′‖_∞`; continuity is the identity.
- Support functions: for `a = (−1, −3)` in `ℝ²` with `e = (1, 1)`, `max(a) = −1`, and
  `‖a + Re‖_∞ − R = max(|R − 1|, |R − 3|) − R` equals `−1` for `R ≥ 2` but `1` for `R = 1`; so the
  common bound `R ≥ ‖a‖_Θ` is needed for the support-function formula.

### 6.5 Metric continuity of quantum tori

Use 4.4's central finite-character kernels on `Tᵈ` to obtain finite Fourier systems
`B_(Θ,n) = (V_(S_n), ‖·‖_Θ, L_Θ)` with a **uniform-in-Θ** error `δ_n → 0`, and prove
`dist_q(A_Θ, B_(Θ,n)) ≤ δ_n` by 5.2 (Rieffel 2000, Theorem 9.2 and §11). Use 6.4 to prove
`dist_q(B_(Θ,n), B_(Ψ,n)) → 0` as `Ψ → Θ`. The triangle inequality then gives the theorem
`Ψ → Θ ⇒ dist_q((A_Ψ, L_Ψ), (A_Θ, L_Θ)) → 0`, including rational-to-irrational and
noncommutative-to-classical limits, in every dimension and for `d = 0`, with local uniformity
on compact parameter sets. For an integer skew matrix `N` prove `σ_(Θ+N) = (δb_N)σ_Θ` with
`b_N(p) = exp(πi Σ_(j<k) N_jk p_jp_k)`; transport by `W_p^(Θ+N) ↦ b_N(p)W_p^Θ`, prove gauge
equivariance and preservation of `L`, and obtain the consistent periodic presentation.
C*-algebra isomorphism classes, primitive ideal spaces and K-theory do not vary continuously in
this topology, and no such claim is made. *Needs:* 6.4, 6.3, 6.2, 5.3, 5.2, 4.4.

**Checks.**

- `d = 0`: every `A_Θ = ℂ`, the family is constant, and the distance is `0`.
- `d = 2`, `θ_n = 1/n → 0`: `dist_q(A_θ_n, C(T²)) → 0` although `A_(1/n)` is noncommutative and
  `C(T²)` commutative, and the `K₀`-groups' order units jump.
- `δ_n` uniform in `Θ`: the kernel `k_n` lives on `Tᵈ` and the estimate `‖a − P_n a‖ ≤ δ_n L(a)`
  of 4.4 depends on `Θ` only through the norm of `A_Θ`, which `P_n` contracts for every `Θ`.
- Periodicity: `d = 2`, `N₁₂ = −N₂₁ = 1`: `σ_(Θ+N)(p, q)/σ_Θ(p, q) = exp(πi(p₁q₂ − p₂q₁))`, and
  `b_N(p) = exp(πi p₁p₂)` satisfies `b_N(p + q)/(b_N(p)b_N(q)) = exp(πi(p₁q₂ + p₂q₁))`, which
  agrees with the ratio since `exp(2πi p₂q₁) = 1`.

### Examples

`C(T)` (`d = 1`), the rotation algebras `A_θ` through `Φ_θ`, the Harper operator norm as a
function of `θ`, and the limits `θ → 0` and `θ → p/q`.

### Dependencies

Layers 4–5 (the gauge-action Lip-norm, bridges and the triangle inequality);
VonNeumannAlgebras Layer 0, OperatorAlgebraDynamics D2 and AmenableGroups Layers 5–6 (6.0);
NoncommutativeGeometry N6–N7 (6.1–6.2 at `d = 2` only); CompactGroups Layer 0.

## Downstream consumers

- [SpectralManifolds](../SpectralManifolds/README.md) consumes §3.1 (the extended Lipschitz
  constant, its `LipschitzWith` comparison, the algebraic laws and the bounded-witness distance
  formula) for its finite models and acceptance examples.
- Roadmaps on noncommutative geometry and operator-algebra dynamics may consume the closed
  Lip-norm theorem of §4.3, the quantum Gromov–Hausdorff distance of Layer 5 and the twisted
  group C*-algebra of §6.0 with its identification theorem.

## References

- M. A. Rieffel, *Metrics on states from actions of compact groups*, Doc. Math. 3 (1998),
  215–229; [arXiv math/9807084](https://arxiv.org/abs/math/9807084) (cited as Rieffel 1998;
  theorem numbers follow the arXiv version): §1 for the Lip-norm criterion (Theorems 1.8 and
  1.9), §2 for ergodic actions (Proposition 2.2, Theorem 2.3, Lemma 2.4), §3 for derivative
  seminorms (Theorem 3.1), §4 for commutator seminorms.
- M. A. Rieffel, *Metrics on state spaces*, Doc. Math. 4 (1999), 559–600;
  [arXiv math/9906151](https://arxiv.org/abs/math/9906151) (cited as Rieffel 1999): §2 for
  order-unit spaces, the dual-ball identity (Lemma 2.1) and the radius (Proposition 2.2); §3
  for lower semicontinuity (Example 3.5); §4 for closure and recovery (Theorems 4.1 and 4.2,
  Proposition 4.4); §9 for metrics from norms (Definitions 9.1, 9.3, 9.5, Theorems 9.7
  and 9.11).
- M. A. Rieffel, *Gromov–Hausdorff distance for quantum metric spaces*, Mem. Amer. Math.
  Soc. 168 (2004), no. 796; [arXiv math/0011063](https://arxiv.org/abs/math/0011063) (cited as
  Rieffel 2000; theorem numbers follow the arXiv version): §§2–3 for Lip-norms and quotients
  (Definition 2.1, Propositions 3.1 and 3.5), §§4–5 for the distance, the triangle inequality
  and bridges (Definitions 4.1 and 4.2, Theorem 4.3, Definition 5.1, Theorem 5.2), §§6–7 for
  isometries and rigidity (Theorem 7.8), §8 for compact-action approximation
  (Proposition 8.1, Theorem 8.2, Lemmas 8.3 and 8.4, Proposition 8.5), §§9–11 for quantum tori
  and finite-dimensional continuity (Theorem 9.2, Lemma 9.3, Lemma 10.1, Theorem 11.2),
  §§12–13 for completeness and compactness (Theorem 12.11, Theorem 13.1, Definition 13.4,
  Theorem 13.5).
- R. Høegh-Krohn, M. B. Landstad and E. Størmer, *Compact ergodic groups of automorphisms*,
  [Ann. of Math. 114 (1981), 75–86](https://doi.org/10.2307/1971377): the finite-multiplicity
  and invariant-trace theorem for ergodic actions of compact groups, consumed through
  VonNeumannAlgebras V8.CompactErgodicActions in §4.2.
- Mathlib's `PositiveContinuousLinearMap`
  (`Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Positive.lean`) and
  `PositiveContinuousLinearMap.ofReal_opNorm_eq_map_one`
  (`Mathlib/Analysis/CStarAlgebra/PositiveLinearFunctional.lean`) fix the state vocabulary;
  `WeakDual.isCompact_closedBall`, `Seminorm`, `GroupNorm`, `LipschitzWith`, `selfAdjoint`,
  `MeasureTheory.ProbabilityMeasure`, `GromovHausdorff.ghDist` and the Hausdorff-distance API
  fix the rest. New order-unit and quantum-metric interfaces are built in Tau Ceti on these
  carriers, adopting Mathlib's design whenever it supplies such an interface.
- Independent Lean work: Physlib's
  [Archimedean order-unit elements](https://github.com/leanprover-community/physlib/blob/4533668544ba952833048805c7fc43048c1ad6e9/PhyslibAlpha/AlgebraicFramework/OrderUnit/Basic.lean)
  and [order-unit norm](https://github.com/leanprover-community/physlib/blob/4533668544ba952833048805c7fc43048c1ad6e9/PhyslibAlpha/AlgebraicFramework/OrderUnit/Norm.lean),
  with states as normalized native positive maps. Their unbundled distinguished-unit and
  infimum-of-order-bounds interfaces are the point of comparison when integrating existing
  work under the project's coordination rules; this specification is intrinsic mathematics on
  the pinned Mathlib and Tau Ceti carriers and does not assume Physlib as a dependency.
