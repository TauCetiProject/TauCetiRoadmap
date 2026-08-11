# Self-adjoint spectral theory: the Borel functional calculus, unbounded operators, and Stone's theorem

## Introduction

Self-adjoint spectral theory links unitary evolution, functional calculus, resolvents, and spectral
measures. A strongly continuous one-parameter unitary group determines a self-adjoint generator.
For bounded normal operators, bounded Borel functions act through a functional calculus and
indicator functions produce projection-valued measures. For unbounded self-adjoint operators, the
resolvent and Cayley transform provide bounded objects from which the spectral measure and generated
unitary group can be reconstructed.

The roadmap develops these connections in five layers. Part A builds one-parameter unitary groups
and Stone's forward theorem. Part B develops the bounded Borel functional calculus and
projection-valued measures. Part C supplies the domain, graph, perturbation, and transport calculus
for partial operators. Part D develops resolvents, spectral gaps, and the Cayley transform. Part E
constructs the spectral measure of an unbounded self-adjoint operator and completes Stone theory via
Yosida approximation.

Suggested homes:

```text
TauCeti/Analysis/InnerProductSpace/OneParameterUnitaryGroup/
TauCeti/Analysis/InnerProductSpace/BorelCalculus/
TauCeti/Analysis/InnerProductSpace/ProjValMeasure/
TauCeti/Analysis/InnerProductSpace/LinearPMap/
TauCeti/Analysis/CStarAlgebra/SelfAdjointGapInverse.lean
TauCeti/MeasureTheory/
```

## Notation and terminology

- **Scalars and Hilbert spaces.** `H` denotes a Hilbert space. Domain, graph, transport, relative
  bound, Sylvester, and elementary resolvent statements use `𝕜 = ℝ` or `ℂ` according to their
  formulas. The unitary-group and complex Borel-calculus layers use complex Hilbert spaces.
- **Partial operators and domains.** `A : H →ₗ.[𝕜] H` denotes a partial linear operator and
  `dom A` its domain. A bounded operator `T` is regarded as a total partial operator on `⊤` when it
  enters the partial-operator theory.
- **Symmetry and self-adjointness.** A partial operator is *symmetric* when it is formally
  self-adjoint on its domain. It is *self-adjoint* when its adjoint has the same domain and action,
  equivalently `A† = A` in the bundled partial-operator sense.
- **Shifted operators.** `A-z` denotes the partial operator `A-zI` on `dom A`. The shifts `A±i`
  are used in von Neumann's self-adjointness criterion.
- **Resolvent and spectrum.** `ρ(A)` denotes the resolvent set, `σ(A)` its complement in the scalar
  field, and `R_A(z)` or `R(z)` the bounded two-sided inverse of `A-z` for `z ∈ ρ(A)`.
- **One-parameter unitary groups.** `U(t)` denotes a strongly continuous unitary representation of
  `(ℝ,+)`. The generator convention is `U(t)=e^{itA}`, with generator difference quotient
  `(U(t)ψ-ψ)/(it)` at `t=0`.
- **Bounded Borel functional calculus.** For a normal bounded operator `a`, `f(a)` denotes the
  operator assigned to a bounded Borel symbol `f` on the spectrum. Indicator functions give the
  associated spectral projections.
- **Projection-valued measures.** `P(B)` denotes the orthogonal projection assigned to a measurable
  set `B`. For a vector `ξ`, the diagonal measure is
  `μ_ξ(B) := ⟪ξ,P(B)ξ⟫`; polarized matrix elements are recovered from these diagonal measures.
- **Semibounds.** A lower semibound `c` for `A` means `c‖x‖² ≤ Re⟪Ax,x⟫` on `dom A`; an upper
  semibound is defined with the reversed inequality.
- **Graph norm and cores.** The graph norm on `dom A` is
  `‖x‖_A := sqrt(‖x‖²+‖Ax‖²)`. A *core* is a subspace of the domain that is dense for this graph
  norm.
- **Relative boundedness.** A partial map `V` is relatively `A`-bounded with coefficients `(a,b)`
  when `‖Vx‖ ≤ a‖x‖+b‖Ax‖` on `dom A`.
- **Cayley transform.** For complex self-adjoint `A`,
  `U_A := 1-2iR_A(-i) = (A-i)(A+i)⁻¹` denotes the Cayley transform. The inverse Cayley coordinate is
  `w ↦ i(1+w)/(1-w)` away from the point `w=1`.
- **Spectral measure of an unbounded operator.** `P_A` denotes the real spectral PVM obtained from
  the Cayley spectral measure. The corresponding scalar spectral measure for `ξ` is denoted
  `μ^A_ξ`.
- **Yosida approximants.** For `n≥1`,
  `A_n^+ := n²R_A(in)-inI`, `A_n^- := n²R_A(-in)+inI`, and
  `S_n := ½(A_n^+ + A_n^-)`. The bounded self-adjoint operators `S_n` generate the approximating
  unitary groups.

## What Mathlib already has (consume)

- **`LinearPMap`** with `domain`, `graph`, `adjoint`, `IsFormalAdjoint`, `IsSelfAdjoint`,
  `IsSelfAdjoint.dense_domain`, `IsSelfAdjoint.isClosed`, and closure/core material — the
  canonical carrier of Parts C and D and the partial-operator carrier used by Part E.
- **`ContinuousLinearMap`** with operator norms, adjoints, `IsSelfAdjoint`, `unitary`, and
  the exponential `exp` with `hasDerivAt_exp_smul_const` — the bounded side of Parts A and B.
- **The continuous functional calculus**: `cfcHom` / `cfc` of an `IsStarNormal` element, its
  multiplicativity, positivity and norm control — the input Part B extends.
- **`spectrum` and `resolvent` for algebra elements**, including
  `spectrum.isOpen_resolventSet` — the bounded theory Part D's notions must bridge to, never
  duplicate.
- **Measure theory**: `Measure`, `IsFiniteMeasure`, regularity, Riesz–Markov–Kakutani for
  positive functionals, `StieltjesFunction`, dominated convergence, `Lp`.
- **Topology and analysis**: `Submodule.topologicalClosure`, orthogonal projections and
  `HasOrthogonalProjection`, Neumann series, `Tendsto` filters.

**Tau Ceti already ships the semigroup layer.** `TauCeti/Analysis/Semigroups/` contains
roughly 130 declarations: `StronglyContinuousSemigroup` and `ContractionSemigroup`,
`.generator` with its domain, `.resolvent` with the growth-bound API, `expShift`,
`ofBounded`, and the abstract Cauchy problem as `IsClassicalSolution` / `IsMildSolution`.
This implements Part A of the
[one-parameter semigroups roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md).

The rest below — the projection-valued and unbounded-spectral layer — is absent upstream.

---

## What is missing (build here)

* One-parameter unitary groups and Stone's theorem, with the generator as a `LinearPMap` and
  density of its domain derived.
* The bounded Borel functional calculus of a normal operator as a star-algebra homomorphism
  on bundled bounded Borel symbols, and intrinsic projection-valued measures with derived
  diagonal scalar measures.
* The closed-operator layer on `LinearPMap`: domain-aware perturbation, the rectangular
  Sylvester equation as a structure, and the quadratic-form bounds with their spectral
  bridges.
* A resolvent set and spectrum for a `LinearPMap` — Mathlib's `spectrum` is defined for an
  algebra element, which a partial map is not — with the Cayley transform and the bridge to
  Mathlib's notion in the bounded case.
* The spectral measure of an unbounded self-adjoint operator, its spectral projections,
  Stone uniqueness, and the Yosida approximants. This roadmap owns the self-adjoint
  `LinearPMap` resolvent *set* and the imaginary-shift Yosida approximants.

## The build, in layers

The labels in Parts A–E form the complete mathematical obligation set for this roadmap.
Each label names one definition or theorem. Milestones and acceptance examples cite these
labels. `Suggested.lean` cites the labels represented by its sample declarations.

### Part A — one-parameter unitary groups and Stone's theorem

Independently submittable.

**Objects.** A one-parameter unitary group is a strongly continuous homomorphism from
`(ℝ,+)` to the unitary operators on a complex Hilbert space. Its generator is the partial
operator whose domain consists of vectors with a convergent difference quotient
`(U(t)ψ-ψ)/(it)` at `t=0`, with value given by that limit.

#### Unitary groups and generators

Strong continuity and the unitary group law determine a partial generator through the difference
quotient at `0`. Domain invariance, symmetry, and commutant transport provide the generator
calculus used by Stone theory.

- **SA-A01 — One-parameter unitary group.** Define a family `U(t)` of bounded operators
  satisfying `U(0)=1`, `U(s+t)=U(s)U(t)`, preservation of the inner product, and strong
  continuity of `t ↦ U(t)ψ` for every `ψ`.
- **SA-A02 — Generator.** Define the generator `A` on the vectors `ψ` for which
  `(U(t)ψ-ψ)/(it)` converges as `t → 0`, with `Aψ` equal to the limit.
- **SA-A03 — Adjoint time reversal.** For every `t`, `U(-t)=U(t)†`.
- **SA-A04 — Norm preservation.** For every `t` and `ψ`, `‖U(t)ψ‖=‖ψ‖`.
- **SA-A05 — Operator norm of the group.** On a nontrivial Hilbert space,
  `‖U(t)‖=1` for every `t`.
- **SA-A06 — Time-reversed group.** The family `t ↦ U(-t)` is a one-parameter unitary
  group.
- **SA-A07 — Additivity of the generator difference quotient.** The difference quotient
  defining the generator is additive in the vector variable.
- **SA-A08 — Complex homogeneity of the generator difference quotient.** The difference
  quotient defining the generator is `ℂ`-homogeneous in the vector variable.
- **SA-A09 — Generator-domain characterization.** Membership in the generator domain is
  equivalent to convergence of the defining difference quotient.
- **SA-A10 — Invariance of the generator domain.** For every `s`, `U(s)` maps the generator
  domain into itself.
- **SA-A11 — Generator covariance.** For every generator-domain vector `ψ`,
  `A(U(s)ψ)=U(s)(Aψ)`.
- **SA-A12 — Formal self-adjointness of the generator.** The generator is symmetric on its
  domain.
- **SA-A13 — Commutant preserves the generator domain.** If a bounded operator `T` commutes
  with every `U(t)`, then `T` maps the generator domain into itself.
- **SA-A14 — Commutant preserves the generator action.** Under the hypotheses of `SA-A13`,
  `A(Tψ)=T(Aψ)` on the generator domain.

#### Semigroup and exponential bridges

The positive-time restriction connects unitary groups with the strongly continuous contraction
semigroup API. Bounded self-adjoint exponentials provide the model groups and the Duhamel
estimate used by Yosida approximation.

- **SA-A15 — Contraction-semigroup restriction.** Restricting `U(t)` to `t ≥ 0` and viewing
  the complex Hilbert space as a real Banach space gives a strongly continuous contraction
  semigroup.
- **SA-A16 — Generator relation for the semigroup restriction.** Under the convention
  `U(t)=exp(itA)`, the generator of the semigroup in `SA-A15` equals `iA` as a partial
  operator.
- **SA-A17 — Bounded self-adjoint exponential group.** For every bounded self-adjoint `S`,
  `t ↦ exp(t iS)` is a one-parameter unitary group.
- **SA-A18 — Norm preservation of bounded self-adjoint exponentials.** For every `t` and
  `ψ`, `‖exp(t iS)ψ‖=‖ψ‖`.
- **SA-A19 — Derivative of a bounded exponential.** For bounded `B`,
  `d/dt exp(tB)ψ = exp(tB)Bψ`.
- **SA-A20 — Commuting Duhamel estimate.** If bounded self-adjoint `Sₘ,Sₙ` commute, then
  `‖exp(itSₘ)ψ-exp(itSₙ)ψ‖ ≤ |t| ‖(iSₘ-iSₙ)ψ‖`.

#### Self-adjointness and Stone's theorem

Von Neumann's shifted-surjectivity criterion converts symmetry into self-adjointness. Stone's
forward theorem applies this criterion to the generator of a strongly continuous unitary
group.

- **SA-A21 — von Neumann criterion.** A symmetric partial operator for which `A+i` and
  `A-i` are surjective is self-adjoint.
- **SA-A22 — Stone forward theorem.** The generator of every one-parameter unitary group is
  self-adjoint.
- **SA-A23 — Generator of a bounded exponential group.** The generator of
  `t ↦ exp(itS)` for bounded self-adjoint `S` is `S` viewed as a total partial operator.
- **SA-A24 — Norm-continuity criterion.** A one-parameter unitary group is norm-continuous
  exactly when its generator domain is the whole Hilbert space.

**Milestone A1 — unitary groups and generator calculus.** `SA-A01`–`SA-A20`.

**Milestone A2 — von Neumann and Stone.** `SA-A21`–`SA-A24`.

### Part B — the Borel functional calculus and projection-valued measures

Independently submittable.

**Objects.** Bounded Borel symbols on the spectrum of a normal bounded operator form a
pointwise star algebra. Their Borel calculus is a star-algebra homomorphism. A
projection-valued measure on a measurable space assigns an orthogonal projection to each
measurable set and is strongly countably additive. Scalar diagonal measures are derived from
the projection-valued measure.

#### Bounded Borel calculus

Bounded measurable symbols on the spectrum form a pointwise star algebra, and the Borel calculus
extends the continuous calculus to this algebra. Matrix-element integration supplies the norm,
algebra, commutation, and almost-everywhere invariance properties.

- **SA-B01 — Bounded Borel symbols.** For a measurable space `X`, define the star algebra of
  measurable functions `f : X → ℂ` admitting a uniform norm bound.
- **SA-B02 — Simultaneous continuous approximation.** On a compact metric space, a bounded
  Borel symbol admits continuous approximants arbitrarily close in `L¹` for any prescribed
  finite sum of finite regular Borel measures.
- **SA-B03 — Diagonal measure from the continuous calculus.** For normal bounded `a` and
  vector `ξ`, the positive functional `f ↦ ⟪ξ,cfc(f)ξ⟫` on continuous symbols determines a
  finite regular Borel measure on `spectrum ℂ a`.
- **SA-B04 — Polarized pairing.** Define the matrix-element pairing for a bounded Borel
  symbol by the polarized quarter-sum of its integrals against the diagonal measures of
  `ξ+i^kψ`.
- **SA-B05 — Borel functional calculus.** For normal bounded `a`, define a star-algebra
  homomorphism from bounded Borel symbols on `spectrum ℂ a` to bounded operators.
- **SA-B06 — Agreement with the continuous calculus.** On continuous symbols, the Borel
  calculus equals the continuous functional calculus.
- **SA-B07 — Linearity of the Borel calculus.** The Borel calculus preserves addition and
  scalar multiplication.
- **SA-B08 — Multiplicativity of the Borel calculus.** For bounded Borel symbols `f,g`,
  `B(fg)=B(f)B(g)`.
- **SA-B09 — Star preservation.** For every bounded Borel symbol `f`, `B(f⋆)=B(f)†`.
- **SA-B10 — Commutation with the original operator.** Every value `B(f)` commutes with
  `a`.
- **SA-B11 — Pairwise commutation of calculus values.** For bounded Borel symbols `f,g`,
  `B(f)B(g)=B(g)B(f)`.
- **SA-B12 — Vector norm bound.** If `‖f(x)‖ ≤ M` on the spectrum, then
  `‖B(f)ξ‖ ≤ M‖ξ‖`.
- **SA-B13 — Almost-everywhere invariance.** If two bounded Borel symbols agree almost
  everywhere for every diagonal measure of `a`, their Borel-calculus operators are equal.

#### Projection-valued measures

Indicator symbols turn the Borel calculus into orthogonal projections. Strong countable
additivity packages these projections into a projection-valued measure, with diagonal scalar
measures recording vectorwise mass.

- **SA-B14 — Projection-valued measure.** For a measurable space `X`, define a map from
  measurable sets to orthogonal projections with `P(X)=1` and strong countable additivity on
  pairwise-disjoint measurable families.
- **SA-B15 — Idempotence of PVM values.** For every measurable `B`, `P(B)²=P(B)`.
- **SA-B16 — Positivity of PVM values.** For every measurable `B`, the projection `P(B)` is
  positive.
- **SA-B17 — Monotonicity of PVM values.** If `B ⊆ C`, then the range projection `P(B)` is
  below `P(C)`.
- **SA-B18 — Finite additivity of a PVM.** For disjoint measurable `B,C`,
  `P(B∪C)=P(B)+P(C)`.
- **SA-B19 — PVM contraction bound.** For every measurable `B` and vector `ξ`,
  `‖P(B)ξ‖ ≤ ‖ξ‖`.
- **SA-B20 — Extensionality from projection fields.** Two projection-valued measures with
  equal projection fields on all measurable sets are equal.
- **SA-B21 — Diagonal scalar measure.** For a projection-valued measure `P` and vector `ξ`,
  derive the finite scalar measure `μξ` with `μξ(B)=⟪ξ,P(B)ξ⟫` on measurable sets.
- **SA-B22 — Diagonal-mass identity.** For measurable `B`,
  `⟪ξ,P(B)ξ⟫ = μξ(B)` under the canonical real-to-complex embedding.
- **SA-B23 — Extensionality from diagonal measures.** Two projection-valued measures with
  equal diagonal scalar measures for every vector are equal.
- **SA-B24 — Orthogonal countable splitting.** For a measurable partition `(Bₖ)`,
  `∑'ₖ ‖P(Bₖ)ξ‖ₑ² = ‖ξ‖ₑ²`.
- **SA-B25 — Measurable reindexing.** A measurable map `κ : X → Y` transports a PVM on
  `X` to a PVM on `Y` by inverse images.

#### Spectral PVM of a bounded operator

For a normal bounded operator, indicator calculus supplies its spectral projection-valued
measure. Reindexing along the real coordinate gives the bounded self-adjoint real spectral
measure and its half-line form-bound projections.

- **SA-B26 — Indicator spectral projection.** For normal bounded `a`, the Borel calculus of
  an indicator symbol is an orthogonal projection.
- **SA-B27 — Indicator idempotence.** The indicator-calculus operator satisfies `P(B)²=P(B)`.
- **SA-B28 — Indicator self-adjointness.** The indicator-calculus operator satisfies
  `P(B)†=P(B)`.
- **SA-B29 — Intersection/composition law.** For measurable `B,C`,
  `P(B)P(C)=P(B∩C)`.
- **SA-B30 — Spectral PVM of a normal bounded operator.** The indicator calculus defines a
  projection-valued measure on `spectrum ℂ a`.
- **SA-B31 — Real spectral PVM of a bounded self-adjoint operator.** For bounded
  self-adjoint `T`, measurable reindexing by the real coordinate gives a PVM on `ℝ`.
- **SA-B32 — Lower half-line form criterion.** For bounded self-adjoint `T`, vanishing of
  the spectral projection on `(-∞,c)` is equivalent to the lower form bound
  `c‖x‖² ≤ Re⟪Tx,x⟫` for every `x`.
- **SA-B33 — Upper half-line form criterion.** For bounded self-adjoint `T`, vanishing of
  the spectral projection on `(c,∞)` is equivalent to the upper form bound
  `Re⟪Tx,x⟫ ≤ c‖x‖²` for every `x`.
- **SA-B34 — Uniqueness of the bounded Borel calculus.** The Borel calculus is the unique
  extension of the continuous calculus whose matrix elements are the integrals determined
  by the diagonal measures.
- **SA-B35 — Bounded spectral theorem.** A bounded self-adjoint operator is the integral of
  the identity function against its real spectral PVM.
- **SA-B36 — Multiplication-operator model.** For a multiplication operator, the bounded
  Borel calculus acts by multiplication by the symbol.

#### Generic measure-theoretic support

Compact-infimum measurability and Helly selection provide the measure-theoretic compactness
tools used by spectral constructions. These statements serve operator-valued applications
through their scalar measures.

- **SA-B37 — Measurability of compact infima.** The infimum over a compact parameter set of
  a Carathéodory function is measurable under the standard compactness and measurability
  hypotheses.
- **SA-B38 — Helly selection for Stieltjes measures.** A uniformly bounded sequence of
  monotone functions admits a pointwise-convergent subsequence at continuity points whose
  limit determines the corresponding Stieltjes measure with the expected weak convergence.

**Milestone B1 — bounded Borel homomorphism.** `SA-B01`–`SA-B13`.

**Milestone B2 — projection-valued measures.** `SA-B14`–`SA-B33`.

**Milestone B3 — uniqueness and bounded spectral theorem.** `SA-B34`–`SA-B38`.

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

Part C supplies the domain geometry and perturbation vocabulary for partial operators over
`[RCLike 𝕜]`. The bounded restriction/form-bound bridge consumes the reducing-subspace API
`OG-14`–`OG-18`.

**Objects.** Domain relations, reducing restrictions, transport constructions, graph norms
and graph cores, relative boundedness, perturbations, real spectral predicates, rectangular
Sylvester equations, bounded inverses, and quadratic-form bounds.

#### Domain relations and reducing restrictions

Domain relations make comparison and extension of partial operators explicit. Reducing
restrictions carry self-adjoint operators to invariant subspaces together with the density,
closedness, symmetry, and self-adjointness inherited there.

- **SA-C01 — Same-domain relation.** Define equality of domains for two partial operators.
- **SA-C02 — Reflexivity of same-domain.** Every partial operator has the same domain as
  itself.
- **SA-C03 — Symmetry of same-domain.** If `A` and `B` have the same domain, then `B` and
  `A` have the same domain.
- **SA-C04 — Transitivity of same-domain.** Same-domain relations compose transitively.
- **SA-C05 — Domain transport relation.** For partial operators `A,B` and bounded `X`, define
  the condition `X(dom B) ⊆ dom A`.
- **SA-C06 — Identity domain transport.** The identity operator transports the domain of a
  partial operator to itself.
- **SA-C07 — Composition of domain transports.** Compatible domain-transport relations
  compose with the bounded transport maps.
- **SA-C08 — Extension relation.** Define extension of `A` by `B` by the conditions
  `dom A ⊆ dom B` and `Bx=Ax` for every `x ∈ dom A`.
- **SA-C09 — Reflexivity of extension.** Every partial operator extends itself.
- **SA-C10 — Transitivity of extension.** Extensions of partial operators compose
  transitively.
- **SA-C11 — Invariant subspace for a partial operator.** Define invariance by
  `A(dom A ∩ U) ⊆ U`.
- **SA-C12 — Reducing subspace for a partial operator.** Define reduction by domain
  preservation under the two orthogonal projections together with invariance of `U` and
  `U⊥`.
- **SA-C13 — Reduced restriction.** For a reducing subspace `U`, define the partial
  operator obtained by restricting the domain and action of `A` to `U`.
- **SA-C14 — Domain of a reduced restriction.** A vector `x : U` lies in the reduced
  domain exactly when its ambient vector lies in `dom A`.
- **SA-C15 — Action of a reduced restriction.** On its reduced domain, the restricted
  operator acts by the ambient operator `A`.
- **SA-C16 — Density of a reduced restriction.** A densely defined partial operator has a
  densely defined reduced restriction.
- **SA-C17 — Closedness of a reduced restriction.** A closed partial operator has a closed
  reduced restriction.
- **SA-C18 — Symmetry of a reduced restriction.** A symmetric partial operator has a
  symmetric reduced restriction.
- **SA-C19 — Self-adjointness of a reduced restriction.** A self-adjoint partial operator
  has a self-adjoint reduced restriction.

#### Transport constructions

Pullback, unitary conjugation, and direct sum transport partial operators together with their
domains between Hilbert spaces. Density, closedness, symmetry, and self-adjointness pass through
these constructions.

- **SA-C20 — Pullback by a continuous linear equivalence.** For a continuous linear
  equivalence `e`, define the partial operator `e⁻¹Ae` with its pulled-back domain.
- **SA-C21 — Pullback-domain characterization.** A vector `x` lies in the pullback domain
  exactly when `ex ∈ dom A`.
- **SA-C22 — Pullback action.** On the pullback domain, the transported operator satisfies
  `(e⁻¹Ae)x = e⁻¹(A(ex))`.
- **SA-C23 — Density under pullback.** Pullback along a continuous linear equivalence
  preserves density of the domain.
- **SA-C24 — Closedness under pullback.** Pullback along a continuous linear equivalence
  preserves closedness.
- **SA-C25 — Unitary conjugation.** For a linear isometric equivalence `U`, define the
  partial operator `UAU⁻¹` with the transported domain.
- **SA-C26 — Unitary-conjugation domain.** A vector `x` lies in `dom(UAU⁻¹)` exactly when
  `U⁻¹x ∈ dom A`.
- **SA-C27 — Unitary-conjugation action.** On its domain,
  `(UAU⁻¹)x = U(A(U⁻¹x))`.
- **SA-C28 — Self-adjointness under unitary conjugation.** Unitary conjugation preserves
  self-adjointness.
- **SA-C29 — Direct sum of partial operators.** Define `A ⊕ B` on the product Hilbert
  space with the product of the two operator domains.
- **SA-C30 — Direct-sum domain.** A pair `(x,y)` lies in `dom(A⊕B)` exactly when
  `x ∈ dom A` and `y ∈ dom B`.
- **SA-C31 — Direct-sum action.** On the direct-sum domain,
  `(A⊕B)(x,y)=(Ax,By)`.
- **SA-C32 — Density of direct sums.** The direct sum of densely defined partial operators
  is densely defined.
- **SA-C33 — Closedness of direct sums.** The direct sum of closed partial operators is
  closed.

#### Graph norm and graph cores

The graph norm measures ambient and image size simultaneously on `dom A`. Sequential graph
cores package the two convergences used to extend identities through closedness.

- **SA-C34 — Graph norm.** On `dom A`, define
  `‖x‖_A = √(‖x‖²+‖Ax‖²)`.
- **SA-C35 — Nonnegativity of the graph norm.** For every domain vector,
  `0 ≤ ‖x‖_A`.
- **SA-C36 — Graph-norm square identity.** For every domain vector,
  `‖x‖_A² = ‖x‖²+‖Ax‖²`.
- **SA-C37 — Ambient norm controlled by graph norm.** For every domain vector,
  `‖x‖ ≤ ‖x‖_A`.
- **SA-C38 — Image norm controlled by graph norm.** For every domain vector,
  `‖Ax‖ ≤ ‖x‖_A`.
- **SA-C39 — Graph core.** Define a graph core `D ⊆ dom A` by sequential approximation of
  every domain vector both in ambient norm and after application of `A`.
- **SA-C40 — Full domain as graph core.** The full operator domain is a graph core.
- **SA-C41 — Closed-graph characterization.** For a partial operator `A`, closedness of `A`,
  closedness of its graph, and the sequential closed-graph condition are equivalent.
- **SA-C42 — Extension from a graph core.** For a closed target relation, an operator
  identity valid on a graph core extends to the whole domain through graph convergence.
- **SA-C43 — Bounded graph-norm equivalence.** For a bounded total operator, the graph norm
  and the ambient norm are equivalent on the whole space.

#### Relative boundedness and perturbations

Relative boundedness compares a domain-defined perturbation with the ambient and graph terms
of the base operator. The perturbation constructors keep the base domain explicit and support
bounded and Kato–Rellich self-adjointness theorems.

- **SA-C44 — Relative boundedness.** Define the estimate
  `‖Vx‖ ≤ a‖x‖ + b‖Ax‖` on `dom A`.
- **SA-C45 — Zero relative perturbation.** The zero perturbation is relatively bounded with
  zero constants.
- **SA-C46 — Monotonicity of relative bounds.** Increasing either admissible coefficient
  preserves relative boundedness.
- **SA-C47 — Addition of relatively bounded maps.** Relative bounds add under addition of
  perturbations.
- **SA-C48 — Scalar multiplication of relatively bounded maps.** Relative bounds scale by
  the scalar norm under scalar multiplication.
- **SA-C49 — Negation of relatively bounded maps.** Negation preserves the same relative
  bounds.
- **SA-C50 — Subtraction of relatively bounded maps.** Relative bounds combine under
  subtraction as under addition.
- **SA-C51 — Restriction of a bounded perturbation to the domain.** A bounded ambient
  operator `V` restricts to a relatively bounded map on `dom A` with coefficients
  `(‖V‖,0)`.
- **SA-C52 — Domain-defined perturbation.** For `V : dom A → E`, define the partial
  operator `A+V` on `dom A` by `(A+V)x=Ax+Vx`.
- **SA-C53 — Bounded perturbation as a domain map.** A bounded ambient operator restricts to
  the domain-defined perturbation in `SA-C52`.
- **SA-C54 — Bounded Kato–Rellich theorem.** A bounded self-adjoint perturbation of a
  self-adjoint partial operator is self-adjoint on the same domain.
- **SA-C55 — Kato–Rellich theorem.** If `A` is self-adjoint and a symmetric perturbation `V`
  is relatively `A`-bounded with relative coefficient `b<1`, then `A+V` is self-adjoint on
  `dom A`.
- **SA-C56 — Bounded self-adjoint operators as total partial operators.** A bounded
  self-adjoint operator, viewed as a partial operator on the full space, is self-adjoint.

#### Real spectral predicates and shifted inverse data

Real shifted-inverse data turns lower bounds for `A-c` into bounded inverse information. The
associated real resolvent and separation predicates provide the quantitative hypotheses used by
spectral perturbation statements.

- **SA-C57 — Left shifted-inverse bound.** Define the data of a bounded left inverse for a
  real shift `A-c` together with an explicit inverse-norm bound.
- **SA-C58 — Two-sided shifted-inverse bound.** Define the corresponding bounded two-sided
  inverse data, including transport of the inverse range into `dom A`.
- **SA-C59 — Two-sided data imply left-sided data.** Every two-sided shifted-inverse bound
  supplies a left shifted-inverse bound with the same constants.
- **SA-C60 — Real resolvent set.** Define the real shifts admitting bounded two-sided
  inverse data.
- **SA-C61 — Real spectrum.** Define the real spectrum as the complement of the real
  resolvent set.
- **SA-C62 — Separation of real spectral sets.** Define separation by a positive lower
  bound on pairwise distances between specified subsets of the real spectra of two partial
  operators.
- **SA-C63 — Symmetry of real spectral separation.** Swapping the two operators and
  spectral sets preserves the separation condition.
- **SA-C64 — Monotonicity in the gap.** Decreasing the requested gap preserves spectral-set
  separation.
- **SA-C65 — Monotonicity in the spectral sets.** Passing to smaller selected spectral sets
  preserves separation.

#### Domain-aware Sylvester equations

The rectangular Sylvester equation packages `AX-XB=C` together with domain transport between
possibly different Hilbert spaces. Its linear structure provides the interface consumed by
quantitative Sylvester estimates.

- **SA-C66 — Rectangular Sylvester equation.** For partial operators `A,B` and bounded maps
  `X,C`, define the domain-aware equation by `X(dom B) ⊆ dom A` and
  `AXx-XBx=Cx` for every `x ∈ dom B`.
- **SA-C67 — Bounded Sylvester specialization.** For bounded everywhere-defined `A,B`, the
  ordinary bounded Sylvester equation gives the domain-aware equation `SA-C66`.
- **SA-C68 — Zero solution.** The zero unknown solves the Sylvester equation with zero
  right-hand side.
- **SA-C69 — Addition of Sylvester equations.** Solutions are closed under addition, with
  right-hand sides added.
- **SA-C70 — Negation of Sylvester equations.** Solutions are closed under negation.
- **SA-C71 — Subtraction of Sylvester equations.** Solutions are closed under subtraction.
- **SA-C72 — Scalar multiplication of Sylvester equations.** Solutions are closed under
  scalar multiplication.
- **SA-C73 — Bounded everywhere inverse.** Define a bounded inverse for a partial operator
  whose range lies in the operator domain and which satisfies both inverse laws.
- **SA-C74 — Injectivity from a bounded everywhere inverse.** A partial operator with the
  data of `SA-C73` is injective on its domain.
- **SA-C75 — Surjectivity from a bounded everywhere inverse.** A partial operator with the
  data of `SA-C73` is surjective onto the ambient space.

#### Quadratic-form bounds

Lower and upper form bounds are the order language for spectral location on a subspace. The
bounded spectral-restriction bridge converts selected spectrum into the corresponding quadratic
form inequalities.

- **SA-C76 — Lower form bound on a subspace.** Define
  `c‖x‖² ≤ Re⟪Ax,x⟫` for every `x ∈ U`.
- **SA-C77 — Upper form bound on a subspace.** Define
  `Re⟪Ax,x⟫ ≤ c‖x‖²` for every `x ∈ U`.
- **SA-C78 — Lower-bound monotonicity in the constant.** A lower form bound at `c` implies
  every lower form bound at `c'≤c`.
- **SA-C79 — Lower-bound restriction to subspaces.** A lower form bound on `U` restricts to
  every `U'≤U`.
- **SA-C80 — Upper-bound monotonicity in the constant.** An upper form bound at `c` implies
  every upper form bound at `c'≥c`.
- **SA-C81 — Upper-bound restriction to subspaces.** An upper form bound on `U` restricts to
  every `U'≤U`.
- **SA-C82 — Positivity gives the zero lower bound.** A positive bounded operator has lower
  form bound `0` on the whole space.
- **SA-C83 — Zero lower bound characterizes positivity.** A symmetric bounded operator with
  lower form bound `0` on the whole space is positive.
- **SA-C84 — Lower form bound from restriction spectrum.** For a bounded symmetric complex
  operator preserving `U`, if the Banach-algebra spectrum of the restriction lies in
  `[c,∞)`, then `c‖x‖² ≤ Re⟪Ax,x⟫` for every `x ∈ U`.
- **SA-C85 — Upper form bound from restriction spectrum.** Under the corresponding upper
  spectral inclusion `spectrum(A|_U) ⊆ (-∞,c]`,
  `Re⟪Ax,x⟫ ≤ c‖x‖²` for every `x ∈ U`.

**Milestone C1 — domain geometry and transport.** `SA-C01`–`SA-C43`.

**Milestone C2 — perturbation and Sylvester vocabulary.** `SA-C44`–`SA-C75`.

**Milestone C3 — form-bound vocabulary and spectral bridges.** `SA-C76`–`SA-C85`.

### Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

Independently submittable.

**Objects.** The resolvent set and spectrum of a partial operator, the named bounded
resolvent at a resolvent point, and the Cayley transform of a complex self-adjoint partial
operator.

#### Resolvent algebra

The resolvent set records shifts `A-z` with bounded two-sided inverses into the domain. The
resolvent identity, commutation, openness, and spectral mapping form the algebraic layer for the
self-adjoint estimates.

- **SA-D01 — Resolvent set of a partial operator.** For `A : E →ₗ.[𝕜] E`, define the set of
  `z : 𝕜` for which `A-z` has a bounded two-sided inverse from `E` into `dom A`.
- **SA-D02 — Spectrum of a partial operator.** Define the spectrum as the complement of the
  resolvent set.
- **SA-D03 — Named resolvent.** At `z` in the resolvent set, choose the unique bounded
  two-sided inverse `R(z)`.
- **SA-D04 — Uniqueness of the resolvent.** Two bounded operators satisfying the two-sided
  inverse laws for `A-z` are equal.
- **SA-D05 — Left inverse law.** For `x ∈ dom A`, `R(z)(A-z)x=x`.
- **SA-D06 — Range in the domain.** For every ambient vector `y`, `R(z)y ∈ dom A`.
- **SA-D07 — Right inverse law.** For every ambient vector `y`, `(A-z)R(z)y=y`.
- **SA-D08 — First resolvent identity.** For common resolvent points `w,z`,
  `R(w)-R(z)=(w-z)R(w)R(z)`.
- **SA-D09 — Commutation of resolvents.** For common resolvent points `w,z`,
  `R(w)R(z)=R(z)R(w)`.
- **SA-D10 — Resolvent spectral mapping in the exclusion direction.** If `μ ≠ 0` and
  `z+μ⁻¹` lies in the resolvent set of `A`, then `μ` lies outside the Banach-algebra
  spectrum of the bounded operator `R(z)`.
- **SA-D11 — Openness of the resolvent set.** The resolvent set of a partial operator is
  open.
- **SA-D12 — Closedness of the spectrum.** The spectrum of a partial operator is closed.
- **SA-D13 — Measurability of the real spectrum.** The real spectrum of a complex
  self-adjoint partial operator is a Borel subset of `ℝ`.

#### Self-adjoint resolvent estimates

Symmetry gives the off-real lower bound, and self-adjointness upgrades it to surjectivity and
the sharp resolvent norm estimate. Real spectral gaps give the corresponding shifted inverse
bounds.

- **SA-D14 — Off-real lower bound.** For symmetric complex `A`,
  `‖(A-z)x‖ ≥ |Im z| ‖x‖` for every `x ∈ dom A`.
- **SA-D15 — Closed range off the real axis.** For self-adjoint `A` and `Im z ≠ 0`, the
  range of `A-z` is closed.
- **SA-D16 — Dense range off the real axis.** Under the hypotheses of `SA-D15`, the range of
  `A-z` is dense.
- **SA-D17 — Nonreal points are resolvent points.** If `A` is self-adjoint and `Im z ≠ 0`,
  then `z` belongs to the resolvent set.
- **SA-D18 — Reality of the spectrum.** The spectrum of a complex self-adjoint partial
  operator is contained in the real axis.
- **SA-D19 — Quantitative resolvent bound.** If `A` is self-adjoint and `Im z ≠ 0`, then
  `‖R(z)‖ ≤ |Im z|⁻¹`.
- **SA-D20 — Adjoint of the resolvent.** For self-adjoint `A`,
  `R(z)†=R(conj z)`.
- **SA-D21 — Real resolvents are self-adjoint.** At a real resolvent point of self-adjoint
  `A`, the bounded operator `R(z)` is self-adjoint.
- **SA-D22 — Real-point resolvent from a lower bound.** If a real shift `z` satisfies
  `c‖x‖ ≤ ‖(A-z)x‖` on the domain for some `c>0`, the closed-range argument produces a
  bounded resolvent at `z` with norm at most `c⁻¹`.
- **SA-D23 — Shifted inverse across a spectral gap.** If the spectrum is disjoint from
  `(c-s,c+s)` and `s>0`, then the shifted operator `A-c` has a bounded two-sided inverse
  with norm at most `s⁻¹`.

#### Cayley transform and C-star gap inverse

The Cayley transform converts an unbounded self-adjoint operator into a bounded unitary. The
C-star interval and gap-inverse statements provide bounded spectral estimates for this
conversion and for spectral restrictions.

- **SA-D24 — Cayley transform.** For self-adjoint `A`, define
  `U=1-2iR(-i)`, the bounded form of `(A-i)(A+i)⁻¹`.
- **SA-D25 — Cayley norm preservation.** For every `x`, `‖Ux‖=‖x‖`.
- **SA-D26 — Cayley surjectivity.** The Cayley transform is surjective.
- **SA-D27 — Cayley unitarity.** The Cayley transform is unitary.
- **SA-D28 — Cayley normality.** The Cayley transform is star-normal.
- **SA-D29 — Norm/spectrum interval characterization.** For a self-adjoint element `a` of a
  C-star algebra and `r≥0`, `‖a‖≤r` exactly when `spectrum(a) ⊆ [-r,r]`.
- **SA-D30 — C-star spectral-gap inverse.** If the spectrum of a self-adjoint C-star
  algebra element avoids `(-r,r)` with `r>0`, the element is a unit and its inverse has norm
  at most `r⁻¹`.

#### Intertwining

Domain-aware intertwining passes through resolvents, Cayley transforms, and their continuous
functional calculi. This makes bounded functional-calculus transport available from a
partial-operator relation.

- **SA-D31 — Domain-aware intertwining relation.** For partial operators `A,B` and bounded
  `X`, formulate `XA ⊆ BX` by domain transport together with equality on `dom A`.
- **SA-D32 — Resolvent intertwining.** A domain-aware intertwiner of `A` and `B` intertwines
  their resolvents at common resolvent points.
- **SA-D33 — Cayley intertwining.** An intertwiner of self-adjoint `A,B` intertwines their
  Cayley transforms.
- **SA-D34 — Continuous-calculus intertwining.** Under the hypotheses of `SA-D33`, the
  intertwiner commutes through the continuous functional calculus of the two Cayley
  transforms for matching continuous symbols.

#### Completion statements

The characterization and analyticity statements complete the general resolvent interface.
Bounded and multiplication-operator bridges connect it to standard Banach-algebra and model
examples.

- **SA-D35 — Resolvent characterization.** A point `z` belongs to the resolvent set exactly
  when `A-z` is injective, has closed dense range, and its inverse on the range extends to a
  bounded operator on the whole space.
- **SA-D36 — Analyticity of the resolvent.** The operator-valued map `z ↦ R(z)` is analytic
  on the resolvent set.
- **SA-D37 — Bounded-operator resolvent-set bridge.** For a bounded operator viewed as a
  total partial operator, the partial-operator resolvent set agrees with the complement of
  Mathlib's Banach-algebra spectrum.
- **SA-D38 — Bounded-operator resolvent bridge.** Under `SA-D37`, the named partial-operator
  resolvent agrees with the bounded Banach-algebra resolvent.
- **SA-D39 — Neumann-series resolvent formula.** On a Neumann neighborhood of a bounded
  resolvent point, the resolvent is given by the convergent Neumann-series formula.
- **SA-D40 — Multiplication-operator spectrum.** The spectrum of a multiplication operator
  is the essential range of its symbol.

**Milestone D1 — resolvent algebra and quantitative real spectrum.** `SA-D01`–`SA-D34`.

**Milestone D2 — characterization and bounded models.** `SA-D35`–`SA-D40`.

### Part E — the spectral measure of an unbounded self-adjoint operator, Stone uniqueness, Yosida

Needs Parts A, B and D.

**Objects.** For self-adjoint `A : H →ₗ.[ℂ] H`, the spectral PVM is obtained from the
Borel calculus of the Cayley transform by measurable reindexing along the inverse Cayley
map. Its ranges give spectral subspaces. The Yosida approximants at the two imaginary shifts
produce bounded self-adjoint approximants and the generated unitary group.

#### Spectral measure and reduction

The inverse Cayley map transfers the bounded spectral PVM to a real spectral measure for `A`.
The resolvent formula characterizes it, while spectral restrictions and support convert
projection data into self-adjoint reductions and form bounds.

- **SA-E01 — Spectral PVM of an unbounded self-adjoint operator.** Define a real PVM by
  reindexing the PVM of the Cayley transform along `w ↦ i(1+w)/(1-w)`.
- **SA-E02 — Zero mass at the Cayley singular point.** Every diagonal measure of the Cayley
  spectral PVM assigns mass zero to `{1}`.
- **SA-E03 — Spectral projection.** For a Borel set `B ⊆ ℝ`, define the spectral projection
  `P_A(B)` as the corresponding value of the spectral PVM.
- **SA-E04 — Spectral subspace.** Define the spectral subspace for `B` as `range P_A(B)`.
- **SA-E05 — Resolvent formula.** For `Im z ≠ 0`,
  `⟪ξ,R(z)ξ⟫ = ∫ (s-z)⁻¹ dμξ(s)`.
- **SA-E06 — Spectral projections commute with resolvents.** For Borel `B` and resolvent
  point `z`, `P_A(B)R(z)=R(z)P_A(B)`.
- **SA-E07 — Spectral projections preserve the domain.** For Borel `B`, `P_A(B)` maps
  `dom A` into itself.
- **SA-E08 — Spectral support on the spectrum.** If a Borel set `B` consists of resolvent
  points, then `P_A(B)=0`.
- **SA-E09 — Self-adjoint spectral restriction.** The restriction of `A` to a spectral
  subspace is self-adjoint.
- **SA-E10 — Gap resolvent for a spectral restriction.** If a spectral subspace is supported
  away from a real point `λ` by a positive gap, then `λ` belongs to the resolvent set of the
  restricted operator.
- **SA-E11 — Lower form bound from spectral support.** If `P_A((−∞,c))=0`, then
  `c‖x‖² ≤ Re⟪Ax,x⟫` for every `x ∈ dom A`.
- **SA-E12 — Upper form bound from spectral support.** If `P_A((c,∞))=0`, then
  `Re⟪Ax,x⟫ ≤ c‖x‖²` for every `x ∈ dom A`.
- **SA-E13 — Two-sided form bounds on a spectral range.** If `B ⊆ [β,α]`, then on
  `range P_A(B)` the quadratic form of `A` lies between `β‖x‖²` and `α‖x‖²`.

#### Yosida approximation and generated group

The two imaginary-shift resolvents produce bounded approximants, and symmetrization makes
them self-adjoint. Their unitary exponentials converge strongly to the generated group, and
maximality identifies its generator with `A`.

- **SA-E14 — Positive-shift Yosida approximant.** For `n≥1`, define
  `A_n^+ = n²R(in)-inI`.
- **SA-E15 — Negative-shift Yosida approximant.** Define
  `A_n^- = n²R(-in)+inI`.
- **SA-E16 — Symmetrized Yosida approximant.** Define
  `S_n = ½(A_n^+ + A_n^-)`.
- **SA-E17 — Boundedness of the raw approximants.** Each `A_n^+` and `A_n^-` is bounded.
- **SA-E18 — Strong convergence of raw approximants on the domain.** For every
  `x ∈ dom A`, `A_n^+x → Ax` and `A_n^-x → Ax`.
- **SA-E19 — Resolvent contraction at the positive shift.** `‖nR(in)‖ ≤ 1`.
- **SA-E20 — Resolvent contraction at the negative shift.** `‖nR(-in)‖ ≤ 1`.
- **SA-E21 — Self-adjointness of the symmetrized approximant.** Every `S_n` is
  self-adjoint.
- **SA-E22 — Yosida unitary group.** For each `n`, `t ↦ exp(itS_n)` is a one-parameter
  unitary group.
- **SA-E23 — Commutation of Yosida approximants.** The operators `S_m` and `S_n` commute for
  all `m,n`.
- **SA-E24 — Uniform compact-time Cauchy estimate.** For every vector, the Yosida unitary
  groups form a Cauchy family uniformly for `t` in compact intervals.
- **SA-E25 — Strong limit group.** The pointwise strong limit of the Yosida unitary groups
  is a one-parameter unitary group.
- **SA-E26 — Generated group.** Define the unitary group generated by `A` as the strong
  limit in `SA-E25`.
- **SA-E27 — Strong convergence to the generated group.** For every `t` and `ψ`,
  `exp(itS_n)ψ → U_A(t)ψ`.
- **SA-E28 — Maximality of self-adjoint operators.** If self-adjoint partial operators
  satisfy `A ≤ B`, then `A=B`.
- **SA-E29 — Stone uniqueness.** The generator of the group `U_A` in `SA-E26` is `A`.
- **SA-E30 — Spectral projections commute with the generated group.** For every Borel set
  `B` and time `t`, `P_A(B)U_A(t)=U_A(t)P_A(B)`.
- **SA-E31 — Strong convergence of interval cutoffs.** Spectral projections of increasing
  bounded intervals exhausting `ℝ` converge strongly to the identity.

#### Spectral block tools

Spectral grid cells decompose vectors into orthogonal frequency blocks. Cut operators, gap
inverses, and reassembly translate local spectral support into quantitative operator bounds.

- **SA-E32 — Spectral grid cells.** For `ε>0` and integer `k`, define
  `I_k=[kε,(k+1)ε)`.
- **SA-E33 — Disjointness of spectral grid cells.** Distinct grid cells are disjoint.
- **SA-E34 — Covering by spectral grid cells.** The union of all grid cells is `ℝ`.
- **SA-E35 — Norm splitting across the grid.** For every vector, the squared norms of its
  spectral-grid components sum to the squared norm of the vector.
- **SA-E36 — Cut operator on a spectral range.** For a spectral range and center `c`, define
  the bounded restriction/cut operator representing `A-c` on that range under a pointwise
  radius bound.
- **SA-E37 — Pointwise-to-operator cut bound.** A pointwise estimate
  `‖Ay-cy‖ ≤ r‖y‖` on a spectral range yields the corresponding operator-norm bound for the
  cut operator.
- **SA-E38 — Spectral-gap inverse.** For `δ>0`, define the bounded spectral multiplier
  obtained from the reciprocal symbol on `|s|≥δ` and zero on `|s|<δ`.
- **SA-E39 — Spectral-gap inverse equation.** If the diagonal spectral measure of `ξ`
  assigns zero mass to `(-δ,δ)`, then the spectral-gap inverse of `ξ` belongs to `dom A` and
  applying `A` to it gives `ξ`.
- **SA-E40 — Spectral-gap inverse norm bound.** Under the hypotheses of `SA-E39`, the
  spectral-gap inverse satisfies `‖G_δ ξ‖ ≤ δ⁻¹‖ξ‖`.
- **SA-E41 — Reassembly of block lower bounds.** Orthogonal spectral blocks carrying a
  uniform lower bound reassemble to the same lower bound on their Hilbert sum.

#### Packaged spectral theorems

These declarations package the preceding construction as the unbounded spectral theorem, Stone
correspondence, and spectral-measure uniqueness. Compatibility results identify the bounded and
multiplication-operator models.

- **SA-E42 — Unbounded spectral theorem.** A self-adjoint partial operator is the spectral
  integral of the identity function against its spectral PVM.
- **SA-E43 — Packaged Stone theorem.** Self-adjoint operators and strongly continuous
  one-parameter unitary groups correspond through `A ↦ exp(itA)` and the generator.
- **SA-E44 — Uniqueness of the spectral measure.** A real projection-valued measure whose
  diagonal measures satisfy the resolvent formula `SA-E05` equals the spectral PVM
  `SA-E01`.
- **SA-E45 — Bounded spectral-measure compatibility.** For bounded self-adjoint `T` viewed
  as a total partial operator, the PVM `SA-E01` agrees with the real bounded spectral PVM
  `SA-B31`.
- **SA-E46 — Bounded generated-group compatibility.** For bounded self-adjoint `T`, the
  generated group is `t ↦ exp(itT)`.
- **SA-E47 — Multiplication-operator spectral projections.** For a multiplication operator,
  its spectral projections act by multiplication by indicator functions of the selected
  spectral sets.

**Milestone E1 — spectral measure and reduction.** `SA-E01`–`SA-E13`.

**Milestone E2 — Yosida construction and Stone uniqueness.** `SA-E14`–`SA-E31`.

**Milestone E3 — spectral block tools and packaged theorems.** `SA-E32`–`SA-E47`.

## Worked examples (acceptance criteria)

### Part A — one-parameter unitary groups and Stone's theorem

**Acceptance examples.** The bounded exponential model is `SA-A23`; the full-domain
norm-continuity criterion is `SA-A24`.

### Part B — the Borel functional calculus and projection-valued measures

**Acceptance examples.** The multiplication-operator model is `SA-B36`; half-line spectral
projections and form bounds are `SA-B32`–`SA-B33`.

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

**Acceptance examples.** Total bounded self-adjoint operators are `SA-C56`; graph-norm
equivalence for bounded maps is `SA-C43`; the full domain is a graph core by `SA-C40`.

### Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

**Acceptance examples.** Bounded resolvent compatibility is `SA-D37`–`SA-D39`; the spectrum
of a multiplication operator is `SA-D40`.

### Part E — the spectral measure of an unbounded self-adjoint operator, Stone uniqueness, Yosida

**Acceptance examples.** Bounded spectral-measure compatibility is `SA-E45`; bounded
generated-group compatibility is `SA-E46`; multiplication-operator spectral projections are
`SA-E47`.

---

## Ordering

**Internal.** Parts A, B and D are mutually independent and each independently submittable.
Part C is independent of them but consumes
[`OrthogonalGeometry`](../OrthogonalGeometry/README.md). Part E is the confluence
and needs exactly A + B + D — the Cayley transform and resolvent bounds from D, the Borel
calculus and `ProjValMeasure` from B, the unitary-group vocabulary, von Neumann criterion and
Duhamel estimate from A. It does not consume Part C: the shared carrier of C, D and E is
`LinearPMap` itself. Within Part E the Yosida and maximality material precedes the
construction.

**External.** [`OrthogonalGeometry`](../OrthogonalGeometry/README.md), for the reducing
subspaces and the restriction of a symmetric operator that Part C's form bounds are stated
over.

The [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
roadmap owns the general dynamical layer: strongly continuous semigroups, their generators,
the general unbounded resolvent, Hille–Yosida, Lumer–Phillips, and real-shift Yosida
approximation. This roadmap owns the unitary/self-adjoint specialization and Stone's theorem.
The bridge is `OneParameterUnitaryGroup.toSemigroup` together with the exact generator relation
for the convention `U t = exp (i t A)`: the semigroup generator is `i A`. The two roadmaps share
that bridge rather than duplicating semigroup or generator theory.

**Downstream.** `SpectralSubspacePerturbation` consumes Part A's unitary/Stone vocabulary,
Part C's domain-aware `SylvesterEquation` and form-bound vocabulary, Part D's `LinearPMap`
resolvent/spectrum API, and Part E's spectral-measure/intertwining results.
`MatrixSpectralStatistics` consumes Mathlib's Hermitian continuous-functional-calculus
continuity directly rather than depending on this roadmap.

## Definitions

**D1 (`SA-A02`).** Domain `{ψ : (U(t)ψ-ψ)/(it) converges as t → 0}`, with value the
limit — the generator of a one-parameter unitary group.

**D2 (`SA-B04`–`SA-B05`).** Matrix elements given by the polarized quarter-sum
`¼ ∑ₖ iᵏ ∫ f dμ_{ξ+iᵏψ}` — the bounded Borel functional calculus.

**D3 (`SA-C52`).** `(A+V)ψ=Aψ+Vψ` on `dom A` — perturbation by a map defined on the
domain.

**D4 (`SA-D03`–`SA-D07`).** The bounded two-sided inverse of `A-z` — the resolvent at a
point of the resolvent set.

**D5 (`SA-E01`).** The spectral PVM of the Cayley transform, relabelled along
`w ↦ i(1+w)/(1-w)` — the spectral measure of an unbounded self-adjoint operator.

**D6 (`SA-E26`–`SA-E27`).** `t ↦ e^{itA}`, defined as the strong limit of the Yosida
unitary groups — the generated unitary group.

**D7 (`SA-E14`–`SA-E16`, `SA-E21`).** `A_n^+=n²R(in)-inI` and
`A_n^-=n²R(-in)+inI`, with `S_n=½(A_n^++A_n^-)` — the two raw Yosida approximants and
their self-adjoint symmetrization.

## References

- M. Reed, B. Simon, *Methods of Modern Mathematical Physics I: Functional Analysis*
  (rev. ed. 1980) — VII (the spectral theorem, bounded and unbounded), VIII.3–4 (Stone's
  theorem, the Cayley transform, von Neumann's criterion).
- K. Schmüdgen, *Unbounded Self-adjoint Operators on Hilbert Space* (GTM 265, 2012) — graph
  norms, cores, resolvents, semibounded operators, the spectral measure via the Cayley
  transform.
- W. Rudin, *Functional Analysis* (2nd ed. 1991), Ch. 12–13 — the Borel functional calculus
  and projection-valued measures for normal operators.
- T. Kato, *Perturbation Theory for Linear Operators* (2nd ed. 1976) — relative boundedness,
  Kato–Rellich, resolvent perturbation.
- J. Weidmann, *Linear Operators in Hilbert Spaces* (GTM 68, 1980) — closed operators, form
  bounds, spectral representation.
- K.-J. Engel, R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations* (GTM 194,
  2000) — the semigroup side of Stone's theorem and the Yosida approximation.

## Acknowledgements

An Apache-2.0 implementation of all five Parts exists in the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
(Kitware, Inc.), in namespaces `TauCeti.*` and `LinearPMap.*`. The public API and proof
structure may change during integration.

Part of the unitary-group material was adapted from the Spectra Formalization Project
(Apache-2.0, Adam Bornemann), with per-file provenance headers; the construction of the
spectral measure through the Cayley transform and the Borel calculus was chosen over that
project's Herglotz/Poisson route.
