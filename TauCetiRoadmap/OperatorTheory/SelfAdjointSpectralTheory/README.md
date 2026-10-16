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
  are used in von Neumann's self-adjointness criterion. Thus `A-z=-(zI-A)`; norm lower bounds may
  be written using either shift, while the resolvent convention below is always `zI-A`.
- **Resolvent and spectrum.** `ρ(A)` denotes the resolvent set, `σ(A)` its complement in the scalar
  field, and `R_A(z)` or `R(z)` the bounded two-sided inverse of `zI-A` for `z ∈ ρ(A)`.
- **One-parameter unitary groups.** `U(t)` denotes a strongly continuous unitary representation of
  `(ℝ,+)`. The generator convention is `U(t)=e^{itA}`, with generator difference quotient
  `(U(t)ψ-ψ)/(it)` at `t=0`.
- **Bounded Borel functional calculus.** For a normal bounded operator `a`, `f(a)` denotes the
  operator assigned to a bounded Borel symbol `f` on the spectrum. Indicator functions give the
  associated spectral projections.
- **Projection-valued measures.** `P(B)` denotes the orthogonal projection assigned to a measurable
  set `B`. For a vector `ξ`, the diagonal measure is
  `μ_ξ(B) := ⟪ξ,P(B)ξ⟫`; polarized matrix elements are recovered from these diagonal measures.
- **Extended norms and infinite sums.** `‖x‖ₑ ∈ ℝ≥0∞` denotes the extended norm, and `∑'`
  denotes an infinite `tsum`. These forms are used for countable spectral-grid decompositions and
  block reassembly.
- **Semibounds.** A lower semibound `c` for `A` means `c‖x‖² ≤ Re⟪Ax,x⟫` on `dom A`; an upper
  semibound is defined with the reversed inequality.
- **Graph norm and cores.** The graph norm on `dom A` is
  `‖x‖_A := sqrt(‖x‖²+‖Ax‖²)`. A *core* is a subspace of the domain that is dense for this graph
  norm.
- **Relative boundedness.** A partial map `V` is relatively `A`-bounded with coefficients `(a,b)`
  when `‖Vx‖ ≤ a‖x‖+b‖Ax‖` on `dom A`.
- **Cayley transform.** For complex self-adjoint `A`,
  `U_A := 1+2iR_A(-i) = (A-i)(A+i)⁻¹` denotes the Cayley transform. The inverse Cayley coordinate is
  `w ↦ i(1+w)/(1-w)` away from the point `w=1`.
- **Spectral measure of an unbounded operator.** `P_A` denotes the real spectral PVM obtained from
  the Cayley spectral measure. The corresponding scalar spectral measure for `ξ` is denoted
  `μ^A_ξ`.
- **Yosida approximants.** For `n≥1`,
  `A_n^+ := -n²R_A(in)-inI`, `A_n^- := -n²R_A(-in)+inI`, and
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
- **Vector measures**: native `VectorMeasure.variation`, `VectorMeasure.integral`
  and its norm/simple-function identities; scalar complex integration uses
  the existing real-bilinear multiplication pairing.
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

Tau Ceti provides the `TauCeti.LinearPMap` resolvent core in
`TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded`, already stated over a nontrivially normed
scalar field with the `zI-A` convention. Part D consumes it and builds the self-adjoint spectral
theory on top, rather than restating it.

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
* The partial-operator spectrum over the supplied `TauCeti.LinearPMap` resolvent
  core, self-adjoint resolvent estimates and the Cayley transform.
* The spectral measure of an unbounded self-adjoint operator, its spectral projections,
  Stone uniqueness, and the imaginary-shift Yosida approximants.

## The build, in layers

The labels in Parts A–E form the complete mathematical obligation set for this roadmap.
Each label names one construction or theorem with its stated companion API.
Milestones record construction order, and acceptance examples cite these
labels. `Suggested.lean` cites the labels represented by its sample declarations.

### Part A — one-parameter unitary groups and Stone's theorem

`SA-A01`–`SA-A14` and `SA-A17`–`SA-A24` depend only on Mathlib. `SA-A15`–`SA-A16`
consume the general contraction-semigroup API from
[`OneParameterSemigroups`](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md).

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

All Part B targets except SA-B63 and SA-B65 depend only on Mathlib.
The bidual/Goldstine comparison SA-B63 and SA-B65 also consumes
[BanachSpaceTheory B1 and B5](../../BanachSpaceTheory/README.md)'s Goldstine
theorem and normed regular scalar-measure dual of `C(K)`. These targets
retain the same `ProjValMeasure` and bounded-Borel symbol carriers.

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
  measurable functions `f : X → ℂ` admitting a uniform norm bound. Construct
  pullback homomorphism `BoundedBorelFunction Y →⋆ₐ[ℂ] BoundedBorelFunction X` along
  every measurable κ:X→Y, with pointwise evaluation, identity and composition laws. Bundle the
  pointwise function as `pullbackHom`; its norm bound belongs to SA-B37.
  For compact K,L and continuous measurable φ:K→L, SA-B38 proves
  `pullbackHom φ hφ (ofContinuousMap g)=ofContinuousMap (g.comp φ)`.
- **SA-B02 — Simultaneous continuous approximation.** Specialize SA-B58 to a compact
  metric space: a bounded
  Borel symbol admits continuous approximants arbitrarily close in `L¹` for any prescribed
  finite sum of finite Borel measures; consume the native regularity
  instance for finite measures on a compact metric space.
- **SA-B03 — Diagonal Riesz identification.** Specialize SA-B59/60 to
  `cfcHom ha`: `(ofRepresentation (cfcHom ha)).diagMeasure ξ` is the
  regular Riesz measure of its diagonal positive functional.
- **SA-B04 — Polarized pairing.** Prove
  `⟪ξ,borelCalculus ha f ψ⟫=¼Σ_(k=0..3)i^(−k)∫f dμ_(ξ+i^kψ)`
  for a bounded Borel symbol, using SA-B21's diagonal measures of the
  SA-B30 PVM, as a consequence of SA-B40/43/45.
- **SA-B05 — Borel functional calculus.** For normal bounded `a`, define
  `borelCalculus a` as the integral against
  `ProjValMeasure.ofRepresentation (cfcHom ha)` from SA-B59/44. SA-B03
  and SA-B04 describe its scalar measures/pairings; they do not construct
  a second Borel calculus.
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
  derive the finite scalar measure `μξ` with `μξ(B)=⟪ξ,P(B)ξ⟫` on measurable sets,
  including its `IsFiniteMeasure` instance.
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
- **SA-B30 — Spectral PVM of a normal bounded operator.** Use
  `ProjValMeasure.ofRepresentation (cfcHom ha)` on `spectrum ℂ a`.
  Indicator calculus agrees with its projection field by SA-B46;
  SA-B26–29 are the corresponding projection-law corollaries.
- **SA-B31 — Real spectral PVM of a bounded self-adjoint operator.** For bounded
  self-adjoint `T`, measurable reindexing by the real coordinate gives a PVM on `ℝ`.
- **SA-B32 — Lower half-line form criterion.** For bounded self-adjoint `T`, vanishing of
  the spectral projection on `(-∞,c)` is equivalent to the lower form bound
  `c‖x‖² ≤ Re⟪Tx,x⟫` for every `x`.
- **SA-B33 — Upper half-line form criterion.** For bounded self-adjoint `T`, vanishing of
  the spectral projection on `(c,∞)` is equivalent to the upper form bound
  `Re⟪Tx,x⟫ ≤ c‖x‖²` for every `x`.
- **SA-B34 — Uniqueness of the bounded spectral PVM.** Every normalized
  PVM on `spectrum ℂ a` whose integral agrees with `cfcHom ha` on continuous
  symbols equals the SA-B30 PVM. Apply SA-B62 with native regularity of
  finite Borel measures on this compact metrizable spectrum,
  `Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`.
- **SA-B35 — Bounded spectral theorem.** A bounded self-adjoint operator is
  the integral of the restricted coordinate against its compact spectral PVM,
  using SA-B38/44/55. Against SA-B31's reindexed real PVM use SA-B51 and
  the bounded symbol `x↦x` on `[−‖T‖,‖T‖]` and zero outside.
- **SA-B36 — Multiplication-operator model.** For finite positive ν and
  bounded measurable h:X→ℂ, let M_h act on `Lp ℂ 2 ν`. Prove its spectral
  PVM on ℂ, obtained from the compact spectral PVM by SA-B25’s
  inclusion pushforward and SA-B51’s change of variables; `P(B)` is
  multiplication by the indicator of h⁻¹(B). For bounded Borel g:ℂ→ℂ,
  `g(M_h)=M_(g∘h)`, where g(M_h) uses its restriction to σ(M_h).
  Prove `spectrum ℂ M_h=(ν.map h).support` with native `Measure.support`,
  including the zero measure. This target covers finite ν.

#### Abstract PVM integration

- **SA-B37 — Sup norm of bounded Borel symbols.** Equip the existing
  `BoundedBorelFunction X` with its supremum norm, zero when X is empty,
  and complete normed star-algebra structure. Prove pointwise evaluation
  bounds and the C*-identity; require nonempty X for the norm-one unit.
- **SA-B38 — Continuous-symbol embedding.** For compact X with
  `OpensMeasurableSpace X`, construct the unital star-algebra homomorphism
  `BoundedBorelFunction.ofContinuousMap` from C(X,ℂ), with pointwise
  evaluation and norm equality. SA-B06 uses this embedding.
- **SA-B39 — Uniform finite-range approximation.** Every bounded measurable
  complex symbol admits measurable finite-range simple functions converging
  uniformly. Construct a finite mesh of its bounded range, measurable
  disjoint preimages and error bounds; pointwise `SimpleFunc.approxOn`
  alone is insufficient.
- **SA-B40 — Polarized complex measure.** For the existing normalized
  `ProjValMeasure X H`, construct native `MeasureTheory.ComplexMeasure X`
  with its conjugate-linear/linear dependence on (ξ,ψ).
- **SA-B41 — Scalar measure evaluation.** Prove
  `μ_(ξ,ψ)(B)=⟪ξ,P(B)ψ⟫` for measurable B and the conjugate-first convention.
- **SA-B42 — Scalar variation bound.** Prove
  `|μ_(ξ,ψ)|(X)≤‖ξ‖‖ψ‖` by orthogonal disjoint ranges and finite-partition
  Cauchy–Schwarz; derive `IsFiniteMeasure μ_(ξ,ψ).variation`.
- **SA-B43 — Diagonal integral comparison.** Identify
  `μ_(ξ,ξ)=μ_ξ.withDensityᵥ (fun _=>1)` and prove
  `∫ᵛ f dμ_(ξ,ξ)=∫x,f(x) dμ_ξ` for every bounded measurable complex f,
  with μ_ξ SA-B21's finite positive diagonal measure. Consume native
  `VectorMeasure.integral` with the ℝ-bilinear
  multiplication pairing `ContinuousLinearMap.mul ℝ ℂ`. Supply the needed
  generic complex homogeneity and measure-linearity comparisons from
  SA-B81–82. Do not construct another scalar-measure integral.
- **SA-B44 — Abstract operator integral.** Construct `P.integral` as a
  unital star-algebra homomorphism on the same bounded-Borel algebra, by
  disjoint simple functions and uniform approximation, independent of
  partitions and approximants. The vector measure B↦P(B)ξ need not have
  finite variation and is not the scalar-integration carrier.
- **SA-B45 — Integral matrix elements.** Prove
  `⟪ξ,(P.integral f)ψ⟫=∫ᵛ f dμ_(ξ,ψ)` with the native multiplication pairing.

- **SA-B46 — Indicator recovery.** The integral of a measurable indicator
  equals its PVM projection. Derive the constant-symbol identity from the
  unital homomorphism.
- **SA-B47 — Integral norm bound.** For explicit M≥0 and `∀x,‖f(x)‖≤M`,
  prove `‖P.integral f‖≤M`, including empty X.
- **SA-B48 — Simple-symbol norm.** The norm of the integral of a disjoint
  simple symbol is the maximum coefficient norm on nonzero projection
  pieces, zero if none; null pieces do not contribute.
- **SA-B49 — PVM null filter.** Construct `P.ae : Filter X` whose
  eventual predicates hold almost everywhere for every diagonal measure.
  Prove this defining equivalence and that, for measurable B, P(B)=0 iff
  every diagonal measure vanishes on B, equivalently its complement belongs
  to P.ae. Prove measurable P-null sets form a σ-ideal by disjointification.
- **SA-B50 — Almost-everywhere integral invariance.** Symbols equal
  P-almost-everywhere have the same integral.
- **SA-B51 — Integral change of variables.** For measurable κ:X→Y,
  prove the integral against SA-B25's `P.map κ` equals the integral of
  SA-B01's pullback symbol against P. Prove
  `(P.map κ).diagMeasure ξ=(P.diagMeasure ξ).map κ`.
- **SA-B52 — Vector norm-square identity.** Prove
  `‖(P.integral f)ξ‖²=∫|f|² dμ_ξ`.
- **SA-B53 — Bounded sequential convergence.** For f_n indexed by ℕ,
  a common uniform norm bound, and pointwise (or P-almost-everywhere)
  convergence to f, prove `P.integral f_n→P.integral f` strongly by
  dominated convergence. No bounded pointwise-net theorem is asserted.
- **SA-B54 — Normal Borel-calculus identification.** SA-B05 is
  integration against SA-B30's spectral PVM by definition.
- **SA-B55 — Normal identity recovery.** For normal a, prove
  `a=P.integral (ofContinuousMap z)`, where z is the restricted continuous
  coordinate on σ(a); derive this from SA-B06 and `cfcHom_id`.
- **SA-B56 — Full spectral support.** Every nonempty relatively open U
  in σ(a) has P(U)≠0.
- **SA-B57 — Spectral commutant equality.** A bounded operator commutes
  with normal a iff it commutes with every P(B), equivalently every bounded
  Borel integral. Consume `fuglede_putnam_rosenblum`, `Commute.cfcHom` and
  `Commute.cfc`; then apply SA-B79's representation commutant comparison.

#### Compact-Hausdorff representation comparison

- **SA-B58 — General compact-space approximation.** On compact Hausdorff
  Borel K, for any `RCLike 𝕜`, a finite family of finite regular
  positive measures ν_j and a measurable f:K→𝕜 with `∀ x, ‖f x‖≤M`,
  M≥0, and ε>0, construct g∈C(K,𝕜) with the same bound and
  `∫‖f−g‖dν_j<ε` simultaneously. Apply native
  `ContinuousMap.toLp_denseRange` to Σν_j, using native finite-sum
  regularity, then radial clipping to retain the bound. Scalar-measure
  variation tests are the instances ν_j=|μ_j|. For each fixed finite
  test family construct a sequence with L¹ errors tending to zero. This generic
  layer also supplies BanachSpaceTheory B5's variation-norm comparison.
- **SA-B59 — Representation PVM.** For unital
  `π:C(K,ℂ)→⋆ₐ[ℂ]B(H)`, with K compact Hausdorff and Borel, construct
  `ProjValMeasure.ofRepresentation π` on the same normalized carrier.
  Derive π's contractivity from the C*-algebra API. Use diagonal positive
  Riesz measures, polarization, Hilbert Riesz and SA-B58's approximation.
  Set `Λ_ξ:C_c(K,ℝ)→ₚ[ℝ]ℝ`,
  `Λ_ξ(f)=Re⟪ξ,π(f_ℂ)ξ⟫`, where `f_ℂ` is the continuous
  complex function obtained by composing f with ℝ→ℂ, and prove positivity and the compact-space
  continuous/compactly-supported comparison. Use these maps
  to prove the indicator laws, multiplicativity and strong countable
  additivity. Prove measure-level sesquilinearity and conjugate symmetry
  by SA-B84’s scalar-measure uniqueness on continuous tests. Before
  applying it, prove `|μ_(ξ,ψ)|≤¼Σ_(k=0..3) μ_(ξ+i^kψ)`, hence
  finite regular variation by positive RMK regularity and SA-B83. Use
  this domination in the subsequent approximations.
  Name the intermediate operator map `representationBorelOperator π f`
  on all bounded Borel symbols: with `continuousLinearMapOfBilin`'s
  convention `⟪B♯v,w⟫=B(v,w)`, take `(B♯)†`. Prove contractivity and
  the weighted matrix-element identity
  `μ_(ξ,representationBorelOperator π g ψ)=μ_(ξ,ψ).withDensity g (mul ℝ ℂ)`:
  first for continuous g using π and SA-B84 uniqueness on continuous tests,
  then for bounded Borel g by SA-B58 approximation and SA-B64's
  change-of-density identity. Use this to prove multiplicativity before
  defining the indicator projections,
  and prove `P.integral f=representationBorelOperator π f` by SA-B45.
  Pin `P.diagMeasure ξ=RealRMK.rieszMeasure Λ_ξ`. This construction depends
  on Mathlib and preceding B targets.
- **SA-B60 — Regularity.** Every diagonal measure of `ofRepresentation π`
  has native `Measure.Regular`, consuming `RealRMK.regular_rieszMeasure`.
  Consume SA-B83's finite absolute-continuity regularity theorem;
  consume SA-B59’s polarization/domination proof of regular scalar variation. No private
  complex-regularity predicate is introduced.
- **SA-B61 — Representation recovery.** Prove
  `P.integral (ofContinuousMap f)=π(f)` for all continuous f.
- **SA-B62 — Regular uniqueness.** A normalized PVM with regular diagonal
  measures and SA-B61's recovery equals `ofRepresentation π`. Consume
  native `Measure.ext_of_integral_eq_on_compactlySupported`;
  regularity is an explicit hypothesis.
- **SA-B63 — Borel bidual embedding.** By integration against BanachSpaceTheory B5's normed
  finite regular measure dual of C(K), embed bounded Borel functions
  isometrically in C(K)**. Point Dirac measures prove the reverse norm bound.
  This is an embedding, not a surjectivity assertion.
- **SA-B64 — Weighted regular measures.** On a compact Hausdorff Borel
  space, for a native complex measure μ of finite regular variation and
  bounded Borel g, use
  `μ.withDensity g (ContinuousLinearMap.mul ℝ ℂ)` for g·μ. Consume
  `VectorMeasure.variation_withDensity` and `variation_transpose_eq` to
  obtain `|g·μ|=|μ|.withDensity (fun x=>‖g x‖ₑ)`. Prove finite regular variation
  by SA-B83 and the bound `|g·μ|≤‖g‖∞|μ|`. Own the change-of-density
  formula `∫ᵛ f d(g·μ)=∫ᵛ f·g dμ`, first for simple f then bounded
  Borel f by uniform approximation; prove `(gh)·μ=g·(h·μ)`, constants and
  native `VectorMeasure.withDensity_congr` for a.e.-independence.
  This target is independent of BanachSpaceTheory.
- **SA-B65 — Goldstine limit comparison.** BanachSpaceTheory B1's Goldstine theorem gives
  uniformly norm-bounded continuous nets converging against every regular
  measure to the Borel bidual image. Prove their π-images converge weakly
  to `ofRepresentation π`.integral f.
  There is one representation PVM construction, not a second Goldstine PVM.
- **SA-B66 — Essential-subspace completeness.** For
  `π:C(K,ℂ)→⋆ₙₐ[ℂ]B(H)`, prove π(1) is an orthogonal projection with closed
  range and equip its range with the induced complete Hilbert structure.
- **SA-B67 — Degenerate representation field.** Apply SA-B59 on that
  essential subspace and extend operators by zero on its orthogonal
  complement. Name `representationProjection π B=J P₀(B) J†` and
  `representationIntegral π f=J P₀.integral f J†`, where J includes
  range π(1). Prove `representationIntegral π (ofContinuousMap f)=π(f)`
  and the projection-field laws with total projection π(1).
  This field is a function with proved laws; its
  normalized essential PVM is `ProjValMeasure`, not a second carrier.
  Include zero representations and empty K; the essential subspace is
  then zero, and H is zero if π is unital.
- **SA-B68 — Regular pushforward.** A continuous pushforward between
  compact Hausdorff spaces preserves regular diagonal measures, using
  `Measure.InnerRegular.map_of_continuous` and the native finite
  inner-regular/regular instances on compact Hausdorff spaces.
- **SA-B69 — Representation-map naturality.** For continuous φ:K→L,
  composition of π with f↦f∘φ corresponds to the pushforward `P.map φ`,
  consuming SA-B01, SA-B51, SA-B62 and SA-B68.
- **SA-B70 — Unitary transport.** For every Hilbert isometry equivalence
  `U:H≃ₗᵢ[ℂ]H′`, set
  `π′=U.conjStarAlgEquiv.toStarAlgHom.comp π`, P=`ofRepresentation π`
  and P′=`ofRepresentation π′`. Prove
  `P′.proj B=U.conjStarAlgEquiv (P.proj B)` and the analogous
  integral equation, including H≠H′.
- **SA-B71 — Reducing restriction.** Restricting a representation to a
  closed subspace invariant under every π(f) and its adjoint restricts
  its PVM and integrals accordingly, using native submodules/projections
  and SA-B79 to prove invariance under every PVM projection.
- **SA-B72 — Direct sums.** On native `lp (fun i => H i) 2`, the representation direct sum has
  componentwise projection fields and integral action. Construct the
  direct-sum representation using SA-B80 and π_i's contractivity. Define its PVM by
  SA-B59, so regularity follows from SA-B60, then apply SA-B71 to the
  reducing coordinate summands, identified via SA-B70 and native
  `lp.single`, and prove `P(B)x=(P_i(B)x_i)_i` and the integral analogue.
- **SA-B73 — Planar reduction.** For compact K⊆ℂ and unital π set
  T=π(z), prove σ(T)⊆K, and prove the homomorphism equality
  `π=(cfcHom hT).comp (restriction along σ(T)⊆K)`. Consume
  `spectrum_apply_subset`, `ContinuousMap.spectrum_eq_range` and
  `ContinuousMap.starAlgHom_ext_map_X` with their actual hypotheses.
- **SA-B74 — Planar concentration.** Use SA-B69 on the inclusion σ(T)↪K,
  SA-B73 and SA-B60's regularity: the PVM on K vanishes on K∖σ(T);
  a relatively open U⊆K has P(U)≠0 when it meets σ(T), using SA-B56's
  full support and SA-B69. This does not assert
  full support on a larger K.
- **SA-B75 — Finite diagonal example.** Compute every projection and
  integral for a finite diagonal normal operator, merging repeated eigenvalues.
- **SA-B76 — Lebesgue multiplication example.** On L²[0,1], compute the
  PVM as multiplication by indicators and its integral as multiplication
  by the symbol, using the actual almost-everywhere quotient.
- **SA-B77 — Accumulating diagonal example.** On ℓ²(ℕ) compute the PVM
  for diag(1/(n+1)); its spectrum includes 0 although P({0})=0.
- **SA-B78 — Failure of norm additivity.** Infinite orthogonal coordinate
  projections give countable strong additivity whose partial sums do not
  converge in operator norm.

- **SA-B79 — Representation commutant comparison.** A bounded operator
  commutes with every π(f), f continuous, iff it commutes with every
  projection of `ofRepresentation π`, iff it commutes with every bounded
  Borel integral. Compare μ_(ξ,Tψ) with μ_(T†ξ,ψ) first on continuous
  tests, then use SA-B58, SA-B60's regularity and SA-B59's diagonal domination to pass to
  Borel symbols. This precedes reducing restriction and direct sums.
- **SA-B80 — Hilbert direct-sum operators.** Construct ⊕T_i on native
  `lp (fun i => H i) 2` for every uniformly bounded family of operators,
  with coordinate evaluation, norm bound, identity, addition, scalar multiplication, composition
  and adjoint laws. Use native `single`, `evalCLM` and `IsHilbertSum`;
  the coordinate bound `‖T_i x_i‖≤M‖x_i‖` lands directly in ℓ².
  This precedes the direct-sum representation.

- **SA-B81 — Scalar vector-integral linearity.** Over `RCLike 𝕜`, use
  native scalar vector measures μ of finite variation and pairing `mul ℝ 𝕜`.
  Define `I_μ(f)=∫ᵛ x,f x ∂[mul ℝ 𝕜;μ]`. Prove
  `I_μ(c f)=c I_μ(f)`, `I_(μ+ν)(f)=I_μ(f)+I_ν(f)` and
  `I_(c μ)(f)=c I_μ(f)` under the corresponding variation-integrability
  hypotheses. Consume native `integral_add_vectorMeasure`,
  `integral_finsetSum_vectorMeasure` and real `integral_smul_vectorMeasure`;
  build the remaining scalar-homogeneity comparisons. Bounded measurable
  functions are given as f:X→𝕜 with measurability and an explicit bound,
  independently of the Borel symbol algebra.
  For scalar measures with values in any `RCLike 𝕜`, construct their
  signed parts by native `VectorMeasure.mapRangeL` using
  `RCLike.reCLM` and `RCLike.imCLM`. Prove the pointwise reconstruction
  `μ(B)=(re μ(B):𝕜)+I·(im μ(B):𝕜)` and its measure identity,
  real-linearity, variation domination and compatibility with native
  `SignedMeasure` and `ComplexMeasure.re/im`. These parts precede B84
  and BanachSpaceTheory B5; no ℝ-or-ℂ case split is used.
  Name these maps `scalarMeasureRealPart` and `scalarMeasureImagPart`,
  using the native real-linear `VectorMeasure.mapRangeL` forms. Define
  `scalarMeasureOfReal := VectorMeasure.mapRangeL RCLike.ofRealCLM`
  on signed measures and state the reconstruction
  `μ=scalarMeasureOfReal(re μ)+I•scalarMeasureOfReal(im μ)`.
  Prove `|(re μ)|≤|μ|`, `|(im μ)|≤|μ|` and
  `|scalarMeasureOfReal σ|=|σ|`, with each variation on its native
  measure carrier; these bounds give the required integral comparisons.
  For real-valued f integrable against μ.variation, prove that the real
  and imaginary parts of `I_μ(ofReal∘f)` are `I_(re μ)(f)` and
  `I_(im μ)(f)`. For signed σ and f integrable against σ.variation, prove
  `I_(scalarMeasureOfReal σ)(ofReal∘f)=ofReal(I_σ(f))`. Prove
  `scalarMeasureOfReal(ν.withDensityᵥ r)=ν.withDensityᵥ(ofReal∘r)`
  for r∈L¹(ν), setwise by native `withDensityᵥ_apply` and `integral_ofReal`.
  Derive the integral comparisons by simple-function comparison and variation
  bounds, before the density theorem in BanachSpaceTheory. Prove the
  signed integral split for `ν₁.toSignedMeasure−ν₂.toSignedMeasure`
  when ν₁,ν₂ are finite and f is integrable against each, using native
  `integral_toSignedMeasure`, `integral_sub_vectorMeasure` and
  `Measure.variation_toSignedMeasure`, including equality of the native
  `<•` and `mul ℝ ℝ` pairings. Deduce the Jordan split for f integrable
  against σ.variation. Export their integrability and naturality
  APIs as part of this initial scalar-integration layer.
- **SA-B82 — Integral against a scalar density.** Over `RCLike 𝕜`,
  embed a finite positive measure ν as `ν.withDensityᵥ (fun _ =>1)`,
  with value `(ν.real B : 𝕜)` on measurable B and variation ν.
  Prove `I_(ν.withDensityᵥ g)(f)=∫x,f(x)g(x)dν` when g∈L¹(ν)
  and f:X→𝕜 is measurable and satisfies `∀ x, ‖f x‖≤M` for some M≥0.
  Give the g=1 scalar comparison and a.e.-invariance. Consume native
  `Measure.variation_withDensityᵥ`.
- **SA-B83 — Absolute-continuity regularity.** A finite Borel measure
  absolutely continuous with respect to a finite regular Borel measure
  on a compact Hausdorff space is regular. Prove ε–δ absolute continuity,
  then transfer inner/open approximation; domination is a corollary.
  Consume Mathlib `Measure/Regular`'s native instance chain
  `Regular → InnerRegularCompactLTTop → InnerRegular`, finite-sum
  inner regularity, and the finite Borel R₁-space instance
  `InnerRegularCompactLTTop → Regular`; it supplies finite-sum regularity.
  Consume `VectorMeasure.variation_smul` and the same native regularity
  instances for finite scalar multiples. For scalar μ,ν, use native
  `variation_sub_le`/`variation_add_le`, then this sum regularity and
  domination to prove regularity of |μ−ν| and |μ+ν|. This precedes
  B58, representation PVMs and the regular-measure dual.

- **SA-B84 — Scalar-measure uniqueness.** On compact Hausdorff Borel K,
  for any `RCLike 𝕜`, a scalar measure μ with finite regular variation is zero
  if its `mul ℝ 𝕜` integral vanishes on every f∈C(K,𝕜).
  Prove the corresponding equality theorem for two such measures.
  Consume B81’s signed real/imaginary parts and reconstruction, their
  native Jordan decomposition and `SignedMeasure.totalVariation_eq_variation`
  for domination of the Jordan parts, SA-B83 for their regularity, SA-B81 for signed-part integral comparisons, and
  native `Measure.ext_of_integral_eq_on_compactlySupported`. This is
  independent of BanachSpaceTheory; B5 consumes it for injectivity.

**Milestone B1 — symbols and scalar integration.** SA-B01, SA-B37–39,
SA-B81–84, SA-B64 and SA-B58, all independent of PVMs.

**Milestone B2 — abstract PVMs and integration.** SA-B14–25 and SA-B40–53.

**Milestone B3 — compact-space representation PVMs.** SA-B59–62, SA-B79–80
and SA-B66–72,
after B1–B2.

**Milestone B4 — normal spectral calculus and examples.** SA-B02–13, SA-B26–36,
SA-B54–57 and SA-B73–78, after B3.

**Milestone B5 — bidual comparison.** SA-B63 and SA-B65 after B3, additionally
consuming BanachSpaceTheory B1/B5.

### Part C — closed operators on `LinearPMap`: graphs, constructions, form bounds

Part C supplies the domain geometry and perturbation vocabulary for partial operators over
`[RCLike 𝕜]`. The bounded restriction/form-bound bridge uses Mathlib's
`Module.End.invtSubmodule`, `LinearMap.IsSymmetric.restrict_invariant`, and
`LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule`, together with the
reducing-subspace definition `OG-15` and projected-subspace completeness `OG-18`.

**Objects.** Domain relations, reducing restrictions, transport constructions, graph norms
and graph cores, relative boundedness, perturbations, real spectral predicates, rectangular
Sylvester equations, and quadratic-form bounds.

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
- **SA-C29 — Direct sum of partial operators.** Define `A ⊕ B` on the Hilbert
  product `WithLp 2 (E × F)`, with domain given by the product of the two operator domains
  transported through the `WithLp` identification. The notation `(x,y)` in `SA-C30` and
  `SA-C31` uses this identification.
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

#### Real spectral separation

The shared `TauCeti.LinearPMap` core in `SA-D01`–`SA-D02` supplies the resolvent and spectrum.
For a partial operator over `RCLike 𝕜`, its real spectral points are the preimage of
`TauCeti.LinearPMap.spectrum A` under `ℝ → 𝕜`. Real spectral separation uses subsets of
this preimage. The shared core precedes `SA-C62`–`SA-C65`.

- **SA-C62 — Separation of real spectral sets.** Define separation by a positive lower
  bound on pairwise distances between specified subsets of the real spectra of two partial
  operators.
- **SA-C63 — Symmetry of real spectral separation.** Swapping the two operators and
  spectral sets preserves the separation condition.
- **SA-C64 — Monotonicity in the gap.** Separation by `δ > 0` implies separation by
  every `δ'` with `0 < δ' ≤ δ`.
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

**Milestone C2 — perturbation, spectral separation, and Sylvester vocabulary.**
`SA-C44`–`SA-C56`, `SA-C62`–`SA-C72`.

**Milestone C3 — form-bound vocabulary and spectral bridges.** `SA-C76`–`SA-C85`.

### Part D — resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

This Part builds on the scalar-generic API in
`TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded`.

**Objects.** The spectrum of a partial operator, and the Cayley transform of a complex
self-adjoint partial operator, over the existing scalar-generic `TauCeti.LinearPMap` resolvent
core.

#### Resolvent algebra

The resolvent set records shifts `zI-A` with bounded two-sided inverses into the domain. The
resolvent identity, commutation, openness, and spectral mapping form the algebraic layer for the
self-adjoint estimates.

- **SA-D01 — Resolvent core of a partial operator.** Already supplied by
  `TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded` and
  `TauCeti.Analysis.Normed.Operator.Resolvent.Analytic`, over
  `[NontriviallyNormedField 𝕜]`: `IsResolventAt` and its bijectivity lemmas, `resolventSet`, the
  named `resolvent` and its inverse and domain laws, `eq_of_le_of_mem_resolventSet`, operator and
  resolvent commutation, the first resolvent identity and resolvent commutation, Neumann
  perturbation and openness, and the bounded-operator conversions. The algebraic
  inverse/domain identities hold on normed spaces; Neumann perturbation,
  openness, the local Ring.inverse formula and analyticity additionally
  require `[CompleteSpace X]`. Consume these declarations
  under their existing names; do not restate them here.
- **SA-D02 — Spectrum of a partial operator.** In the setting of `SA-D01`, define
  `TauCeti.LinearPMap.spectrum A` as the complement of `TauCeti.LinearPMap.resolventSet A`,
  in the same namespace and with dot notation `A.spectrum`.
- **SA-D03 — Named resolvent.** Supplied by `resolvent`; consume this API. Over a nontrivially normed field on a normed space, at `z` in the
  resolvent set, `TauCeti.LinearPMap.resolvent A z` is the bounded two-sided inverse `R(z)`.
- **SA-D04 — Uniqueness of the resolvent.** Supplied by `IsResolventAt.unique`; consume this API. Two bounded operators satisfying the two-sided
  inverse laws for `zI-A` are equal.
- **SA-D05 — Left inverse law.** Supplied by `resolvent_smul_sub_apply`; consume this API. For `x ∈ dom A`, `R(z)(zI-A)x=x`.
- **SA-D06 — Range in the domain.** Supplied by `resolvent_mem_domain`; consume this API. For every ambient vector `y`, `R(z)y ∈ dom A`.
- **SA-D07 — Right inverse law.** Supplied by `smul_sub_apply_resolvent`; consume this API. For every ambient vector `y`, `(zI-A)R(z)y=y`.
- **SA-D08 — First resolvent identity.** Supplied by `resolvent_sub_resolvent`; consume this API. Over a nontrivially normed field on a normed space, for
  common resolvent points `w,z`, `R(w)-R(z)=(z-w)R(w)R(z)`.
- **SA-D09 — Commutation of resolvents.** Supplied by `resolvent_comm`; consume this API. For common resolvent points `w,z`,
  `R(w)R(z)=R(z)R(w)`.
- **SA-D10 — Resolvent spectral mapping in the exclusion direction.** At z∈ρ(A), if `μ ≠ 0` and
  `z-μ⁻¹` lies in the resolvent set of `A`, then `μ` lies outside the Banach-algebra
  spectrum of the bounded operator `R(z)`.
- **SA-D11 — Openness of the resolvent set.** Supplied by `isOpen_resolventSet`; consume this API. On a Banach space, the resolvent set of a partial operator
  is open.
- **SA-D12 — Closedness of the spectrum.** On a Banach space, the spectrum
  of a partial operator is closed.
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
- **SA-D20 — Adjoint of the resolvent.** For self-adjoint `A` and z∈ρ(A),
  `R(z)†=R(conj z)`.
- **SA-D21 — Real resolvents are self-adjoint.** At a real resolvent point of self-adjoint
  `A`, the bounded operator `R(z)` is self-adjoint.
- **SA-D22 — Real-point resolvent from a lower bound.** Let `A` be a self-adjoint
  partial operator on a complete Hilbert space over `RCLike 𝕜`, and let `z : ℝ`.
  If `c > 0` and `c‖x‖ ≤ ‖Ax-zx‖` for every `x ∈ dom A`, then `z` belongs to
  the resolvent set and its resolvent has norm at most `c⁻¹`.
- **SA-D23 — Shifted inverse across a spectral gap.** If the spectrum is disjoint from
  `(c-s,c+s)` and `s>0`, then the shifted operator `A-c` has a bounded two-sided inverse
  with norm at most `s⁻¹`.

#### Cayley transform and C-star gap inverse

The Cayley transform converts an unbounded self-adjoint operator into a bounded unitary. The
C-star interval and gap-inverse statements provide bounded spectral estimates for this
conversion and for spectral restrictions.

- **SA-D24 — Cayley transform.** For self-adjoint `A`, define
  `U=1+2iR(-i)`, the bounded form of `(A-i)(A+i)⁻¹`.
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
  when `zI-A` is injective, has closed dense range, and its inverse on the range extends to a
  bounded operator on the whole space.
- **SA-D36 — Analyticity of the resolvent.** Supplied by `LinearPMap.analyticOnNhd_resolvent`; consume this API. On a Banach space, the operator-valued map `z ↦ R(z)` is analytic
  on the resolvent set.
- **SA-D37 — Bounded-operator resolvent-set bridge.** Supplied by `mem_resolventSet_toPMap_top_iff`; consume this API. For a bounded operator viewed as a
  total partial operator, the partial-operator resolvent set agrees with the complement of
  Mathlib's Banach-algebra spectrum.
- **SA-D38 — Bounded-operator resolvent bridge.** Supplied by `resolvent_toPMap_top`; consume this API. Under `SA-D37`, the named partial-operator
  resolvent agrees with the bounded Banach-algebra resolvent.
- **SA-D39 — Neumann-series resolvent formula.** On a Banach space, in
  a Neumann neighborhood of a
  resolvent point w, prove
  `R(z)=R(w)·∑_{n≥0}((w−z)•R(w))^n` when `‖w−z‖‖R(w)‖<1`.
  Consume Tau Ceti’s `resolvent_eq_mul_inverse_one_sub` and Mathlib’s
  `geom_series_eq_inverse`; the explicit convergent-series identity is
  the target, not a second construction of the supplied Ring.inverse formula.

**Milestone D1 — resolvent algebra and quantitative real spectrum.**
Build SA-D02, SA-D10, SA-D12–34, consuming the supplied D01, D03–09
and D11 interfaces.

**Milestone D2 — characterization and bounded models.** Build SA-D35
and the explicit-series SA-D39 target, consuming supplied D36–38.

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

- **SA-E01 — Spectral PVM of an unbounded self-adjoint operator.** Define a measurable
  coordinate `κ : ℂ → ℝ` by `κ(1)=0` and
  `κ(w)=Re(i(1+w)/(1-w))` for `w≠1`, and reindex the Cayley PVM along `κ`. The chosen
  value at `w=1` is immaterial by `SA-E02`.
- **SA-E02 — Zero mass at the Cayley singular point.** Every diagonal measure of the Cayley
  spectral PVM assigns mass zero to `{1}`.
- **SA-E03 — Spectral projection.** For a Borel set `B ⊆ ℝ`, define the spectral projection
  `P_A(B)` as the corresponding value of the spectral PVM.
- **SA-E04 — Spectral subspace.** Define the spectral subspace for `B` as `range P_A(B)`.
- **SA-E05 — Resolvent formula.** For `Im z ≠ 0`,
  `⟪ξ,R(z)ξ⟫ = ∫ (z-s)⁻¹ dμξ(s)`.
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
  `A_n^+ = -n²R(in)-inI`.
- **SA-E15 — Negative-shift Yosida approximant.** Define
  `A_n^- = -n²R(-in)+inI`.
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
- **SA-E35 — Norm splitting across the grid.** For `ε>0`, every `v∈H` satisfies
  `∑' k : ℤ, ‖P_A(I_k)v‖ₑ² = ‖v‖ₑ²`.
- **SA-E36 — Spectral cut operator.** Let self-adjoint `A : H →ₗ.[ℂ] H`, let `B ⊆ ℝ` be
  measurable, and let `c,r ∈ ℝ` satisfy `0≤r` and `|s-c|≤r` for every `s∈B`. Define the bounded
  spectral cut operator with truncated symbol `(s-c)1_B(s)`.
- **SA-E37 — Spectral cut bounds, domain, and action.** Under `SA-E36`, the cut operator `C`
  satisfies `‖C‖≤r`; the spectral range `P_A(B)H` is contained in `dom A`; and for every
  `y∈P_A(B)H`, `Cy=Ay-cy`, with `Ay` evaluated using that domain membership. The radius
  hypothesis in `SA-E36` also gives `|s|≤|c|+r` on `B`, which supplies the bounded-spectral-range
  domain inclusion.
- **SA-E38 — Spectral-gap inverse.** For `δ>0`, define the bounded spectral multiplier
  obtained from the reciprocal symbol on `|s|≥δ` and zero on `|s|<δ`.
- **SA-E39 — Spectral-gap inverse equation.** If the diagonal spectral measure of `ξ`
  assigns zero mass to `(-δ,δ)`, then the spectral-gap inverse of `ξ` belongs to `dom A` and
  applying `A` to it gives `ξ`.
- **SA-E40 — Spectral-gap inverse norm bound.** Under the hypotheses of `SA-E39`, the
  spectral-gap inverse satisfies `‖G_δ ξ‖ ≤ δ⁻¹‖ξ‖`.
- **SA-E41 — Reassembly of block lower bounds.** Let `(Qᵢ)_{i∈I}` be bounded operators on a
  complex inner-product space and let `c∈ℝ≥0∞`. If
  `∑' i, ‖Qᵢf‖ₑ² = ‖f‖ₑ²` for every `f` and
  `c ‖Qᵢx‖ₑ ≤ ‖Qᵢy‖ₑ` for every `i`, then `c ‖x‖ₑ ≤ ‖y‖ₑ`.

#### Packaged spectral theorems

These declarations package the Stone correspondence, spectral-measure uniqueness, and
compatibility with bounded and multiplication-operator models.

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

**Milestone E3 — spectral block tools and packaged theorems.** `SA-E32`–`SA-E41`, `SA-E43`–`SA-E47`.

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

**Acceptance examples.** Quantitative off-real bounds, real lower-bound
resolvents and Cayley unitarity are `SA-D19`, `SA-D22` and `SA-D27`.
The explicit Neumann-series comparison is `SA-D39`.

### Part E — the spectral measure of an unbounded self-adjoint operator, Stone uniqueness, Yosida

**Acceptance examples.** Bounded spectral-measure compatibility is `SA-E45`; bounded
generated-group compatibility is `SA-E46`; multiplication-operator spectral projections are
`SA-E47`.

---

## Ordering

**Internal.** Part B depends only on Mathlib except SA-B63 and SA-B65, which consume
BanachSpaceTheory B1/B5 for the bidual/Goldstine comparison. Construct symbols/approximation, then abstract PVM integration, then the
compact-space representation PVM before specializing it to cfcHom.
SA-B05 and SA-B30 use that same construction, and SA-B54 is definitional.
SA-B35 uses the bounded compact-spectrum coordinate and SA-B51's reindexing.
The representation PVM and examples use no bidual comparison as an input. Part D consumes Tau Ceti’s supplied scalar-generic `TauCeti.LinearPMap`
resolvent core; its remaining obligations build on that existing API. Part A uses Mathlib together with the
`OneParameterSemigroups` bridge in `SA-A15`–`SA-A16`. Part C consumes
[`OrthogonalGeometry`](../OrthogonalGeometry/README.md); its real spectral-separation targets
`SA-C62`–`SA-C65` also use the shared core `SA-D01`–`SA-D02`. Part E is the confluence
and needs exactly A + B + D — the Cayley transform and resolvent bounds from D, the Borel
calculus and `ProjValMeasure` from B, the unitary-group vocabulary, von Neumann criterion and
Duhamel estimate from A. It does not consume Part C: the shared carrier of C, D and E is
`LinearPMap` itself. Within Part E the Yosida and maximality material precedes the
construction.

**External.** [`OrthogonalGeometry`](../OrthogonalGeometry/README.md) supplies the
reducing-subspace definition and completeness of projected subspaces. Mathlib supplies invariant
subspaces and symmetric restrictions for Part C's form bounds.

The [one-parameter semigroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md)
roadmap owns the general dynamical layer: strongly continuous semigroups, their generators,
the generator/Laplace-resolvent bridge, Hille–Yosida, Lumer–Phillips, and real-shift Yosida
approximation. The scalar-generic `TauCeti.LinearPMap` resolvent core is shared infrastructure
and is consumed in Part D here. This roadmap also owns the unitary/self-adjoint specialization
and Stone's theorem. The bridge is `OneParameterUnitaryGroup.toSemigroup` together with the exact generator relation
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

**D2 (`SA-B05`).** `borelCalculus ha :=
(ProjValMeasure.ofRepresentation (cfcHom ha)).integral`.
SA-B04 gives the polarized matrix-element formula with the conjugate-first convention.

**D3 (`SA-C52`).** `(A+V)ψ=Aψ+Vψ` on `dom A` — perturbation by a map defined on the
domain.

**D4 (`SA-D03`–`SA-D07`).** The bounded two-sided inverse of `zI-A` — the resolvent at a
point of the resolvent set.

**D5 (`SA-E01`).** The spectral PVM of the Cayley transform, relabelled along the total
coordinate `κ(1)=0` and `κ(w)=Re(i(1+w)/(1-w))` for `w≠1` — the spectral measure of an
unbounded self-adjoint operator.

**D6 (`SA-E26`–`SA-E27`).** `t ↦ e^{itA}`, defined as the strong limit of the Yosida
unitary groups — the generated unitary group.

**D7 (`SA-E14`–`SA-E16`, `SA-E21`).** `A_n^+=-n²R(in)-inI` and
`A_n^-=-n²R(-in)+inI`, with `S_n=½(A_n^++A_n^-)` — the two raw Yosida approximants and
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
(Kitware, Inc.), in namespaces `TauCeti.*` and `LinearPMap.*`.

Part of the unitary-group material was adapted from the Spectra Formalization Project
(Apache-2.0, Adam Bornemann), with per-file provenance headers. The DKPS spectral-measure
implementation uses the Cayley transform and the Borel calculus.
