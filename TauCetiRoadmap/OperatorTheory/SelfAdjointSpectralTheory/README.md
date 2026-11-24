# Roadmap: self-adjoint spectral theory

**Summary.** The spectral theorem describes an operator on a Hilbert space through a
projection-valued measure `P`, which assigns a projection `P(B)` to each measurable set `B`, with
`P(B ∩ C) = P(B) P(C)` and `P` of the whole space equal to `1`. Each vector `ξ` carries a finite
measure `μ_ξ(B) = ⟪ξ, P(B) ξ⟫`, its diagonal measure. This roadmap develops the spectral theory of
normal and self-adjoint operators on complex Hilbert spaces, which are not assumed separable:
one-parameter unitary groups, projection-valued measures and the bounded Borel calculus, closed
partial operators, resolvents, and the spectral measure of an unbounded self-adjoint operator.

The first main theorem concerns representations of `C(K)`, for `K` compact Hausdorff with its
Borel σ-algebra: unital star homomorphisms `π` from the continuous complex functions on `K` into
the bounded operators. Two projection-valued measures on `K` whose diagonal measures are regular
and whose integrals agree on every continuous function are equal. So the measure that
VonNeumannAlgebras attaches to `π` is the only one with regular diagonal measures whose integral
extends `π`; for metrizable `K` regularity is automatic. Without it uniqueness fails: on the
ordinal space `[0, ω₁]`, the Dieudonné measure and the point mass at `ω₁` integrate every
continuous function alike but disagree on `{ω₁}`.

The second is the spectral theorem for compact operators: a compact normal operator `T` on a
complex Hilbert space has a Hilbert basis of eigenvectors. The proof diagonalises the commuting
self-adjoint operators `(T + T*)/2` and `(T − T*)/(2i)` simultaneously, using the compact
self-adjoint case in Tau Ceti. The nonzero eigenvalues are countable, have finite multiplicity and
accumulate only at `0`. Over a finite set of nonzero eigenvalues, sum `λ` times the projection
onto the eigenspace of `λ`; as the set exhausts them, these sums converge to `T` in operator norm.

The third is the spectral theorem for a self-adjoint operator `A`, defined on a subspace of `H`
and equal to its adjoint, domains included. Its resolvent `R(z)` is the bounded inverse of
`z − A` off the spectrum. Exactly one projection-valued measure `P` on `ℝ` satisfies
`⟪ξ, R(z) ξ⟫ = ∫ (z − s)⁻¹ dμ_ξ(s)` for every vector `ξ` and every nonreal `z`. Uniqueness is
Stieltjes inversion: this transform determines a finite measure on `ℝ`. The same Part proves a
criterion for lower bounds: for real `c`, `c ‖x‖² ≤ Re ⟪x, A x⟫` holds for every `x` in the
domain exactly when `P` vanishes on the open half-line `(−∞, c)`. The half-line must be open: for
`A = diag(0, 1)` and `c = 0` the bound holds, yet `P((−∞, 0]) ≠ 0`.

The fourth concerns `U(t) = exp(i t A)`, by Stone's theorem in Tau Ceti the unique strongly
continuous unitary group whose generator, the derivative at `0`, is `i A`. For every real `t` and
every `ξ`, `⟪ξ, U(t) ξ⟫ = ∫ exp(i t s) dμ_ξ(s)`. The group is also a strong limit of bounded
exponentials. For `n ≥ 1` the symmetrised Yosida approximant
`S_n = −(n²/2) (R(i n) + R(−i n))` is bounded and self-adjoint, equal to `n² A (n² + A²)⁻¹` in the
calculus of `P`; then `exp(i t S_n) ψ → U(t) ψ` for every `t` and `ψ`. Teschl's textbook, cited
throughout, uses opposite signs, `(A − z)⁻¹` and `exp(−i t A)`.

The roadmap builds on Tau Ceti's projection-valued measures, resolvent theory and unitary groups.
[VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) provides the measure of a unital
representation of `C(K)`. It also provides the spectral measure of a self-adjoint operator, built
from its Cayley transform, which this roadmap shows satisfies the resolvent formula.
[BanachAlgebras](../../BanachAlgebras/README.md) provides the spectral decomposition of compact
operators. [UnboundedOperators](../UnboundedOperators/README.md) and
[SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md) use the spectral
measure, the first also the lower-bound criterion.

## How to read the build

The build has five Parts. Part A develops one-parameter unitary groups, their generators, von
Neumann's criterion and the comparisons with Stone's theorem. Part B develops bounded Borel
symbols, projection-valued measures and their integral, the Borel calculus of a normal operator,
and the spectral measures of representations of `C(K)` with the first main theorem. Part C develops
closed partial operators (domains, reducing subspaces, transport, graph cores, relative bounds,
Sylvester equations, form bounds) and the second main theorem. Part D develops the resolvent,
spectrum and Cayley transform of a partial operator. Part E brings these together: the third and
fourth main theorems, spectral subspaces and truncations, and Yosida approximation. Parts A, C and
D rest on Mathlib and Tau Ceti; Part B also on VonNeumannAlgebras; Part E on Parts A–D and
VonNeumannAlgebras' Cayley-transform construction.

Each item carries a label `SA-` followed by its Part letter and number; other roadmaps cite the
items by these labels, and the milestones of each Part list them in build order. An item that the
pinned Tau Ceti realises ends with a line *In Tau Ceti:* naming the declarations that realise it
(an item realised by Mathlib names it on a line *In Mathlib:*); an item with neither line is a
target of this roadmap. An item ending with *Supplied by:* is built by the roadmap named there and
is stated here in the form this roadmap consumes. The headline theorems named in SA-B62, SA-C86,
SA-E11, SA-E27, SA-E43 and SA-E44, and the two definitions they need, `IsSpectralMeasure` and
`yosidaApproximant`, are declared in `Suggested.lean`.

## Conventions

- `H`, `H′`, `H_i` are complete complex inner product spaces, in arbitrary universes, except in Part
  C and in SA-D14–SA-D22, which work over `𝕜 = ℝ` or `ℂ`, and in D.1, which works over a nontrivially
  normed field on a normed or Banach space, as each statement says. The inner product `⟪ξ, η⟫` is
  conjugate-linear in `ξ` and linear in `η`, as in Mathlib. Teschl2009 assumes every Hilbert space
  separable (p. 42, line 1780); the results cited from it are used here for arbitrary `H`, and none
  of the cited proofs uses separability.
- A partial operator is `A : H →ₗ.[ℂ] H` with domain `dom A = A.domain`. It is symmetric when
  `⟪A x, y⟫ = ⟪x, A y⟫` on its domain. Self-adjointness is Mathlib's `IsSelfAdjoint A`: `A` equals its
  adjoint, domains included. A bounded `T` enters the partial-operator theory as the total partial
  operator `(T : H →ₗ[ℂ] H).toPMap ⊤`.
- The resolvent is Tau Ceti's `LinearPMap.resolvent A z`, written `R(z)`, the bounded two-sided
  inverse of `z • 1 - A` for `z` in the resolvent set `ρ(A)`; the spectrum `σ(A)`,
  `LinearPMap.spectrum A`, is the complement of the resolvent set. Teschl writes
  `R_A(z) = (A - z)⁻¹`, the negative of `R(z)`.
- A projection-valued measure is Tau Ceti's `TauCeti.ProjValMeasure X H` on a measurable space
  `X`: projections `P(B)` on measurable sets `B`, finite diagonal measures `μ_ξ` with
  `μ_ξ(B) = ⟪ξ, P(B) ξ⟫`, `P(X) = 1` and `P(B ∩ C) = P(B) P(C)`. The polarised measure is
  `μ_(ξ,η)(B) = ⟪ξ, P(B) η⟫`, and `f(P) = ∫ f dP` is the integral of a bounded Borel symbol `f`. The
  measurable structures on `ℝ`, `ℂ` and a compact Hausdorff `K` are the Borel σ-algebras.
- The spectral measure of a self-adjoint `A` is the projection-valued measure `P_A` on `ℝ` with
  `IsSpectralMeasure A P_A`, the resolvent formula of SA-E05; `μ^A_ξ` is its diagonal measure.
- A unitary group is a Tau Ceti `TauCeti.Semigroups.StronglyContinuousGroup H` (real-linear
  operators `U(t)`) satisfying `IsUnitary`. Its complex generator `G` is the limit of
  `(U(t) x - x) / t`; its generator in the sense of SA-A02, the Stone generator, is `-i G`. A
  self-adjoint `A` generates the group with `G = i A`, written `U(t) = exp(i t A)`. Teschl writes
  `exp(-i t A)`.
- The Cayley transform is Tau Ceti's `LinearPMap.cayley A = 1 + 2 i R(-i)`, the bounded form of
  `(A - i)(A + i)⁻¹`; the inverse Cayley map is `w ↦ i (1 + w) / (1 - w)` off `w = 1`.
- `‖x‖ₑ ∈ [0, ∞]` is the extended norm and `Σ'` an unconditional sum (`tsum`); these forms are used
  for countable splittings and block reassembly.

## Part A: One-parameter unitary groups and Stone's theorem

Throughout, `H` is a complex Hilbert space and `U` a one-parameter unitary group on it (SA-A01).
Its generator `A` (SA-A02) is the limit of `(U(t)ψ − ψ)/(i t)` at `t = 0`, and its complex generator
is `G = i A`, the limit of `(U(t)ψ − ψ)/t`. Strong continuity and the group law determine the
generator; domain invariance, symmetry and commutant transport give the generator calculus used
by Stone theory; the positive-time restriction connects unitary groups with contraction
semigroups; bounded self-adjoint exponentials provide the model groups and the Duhamel estimate
used by Yosida approximation (SA-E22–SA-E27). Stone's theorem itself is Tau Ceti's, consumed with
its normalisation `G = i A`; this Part proves the generator calculus and the comparisons around it.

### A.1 Unitary groups and generators

- **SA-A01 — One-parameter unitary group.** A family `U(t)`, `t ∈ ℝ`, of bounded operators on
  `H` with `U(0) = 1`, `U(s + t) = U(s) U(t)`, `⟪U(t) x, U(t) y⟫ = ⟪x, y⟫` for all `t`, `x`, `y`, and
  `t ↦ U(t) ψ` continuous for every `ψ`. Each `U(t)` is then complex linear (SA-A08) and invertible
  with inverse `U(−t)`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary`.
- **SA-A02 — Generator.** The generator `A` of `U` is the partial operator whose domain consists
  of the vectors `ψ` for which `(U(t)ψ − ψ)/(i t)` converges as `t → 0` through nonzero real times,
  with `A ψ` the limit. The complex generator `G` has the same domain and `G ψ` the limit of
  `(U(t)ψ − ψ)/t`, so `G = i A` and `A = −i G`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.stoneGenerator`, `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator`, `TauCeti.Semigroups.StronglyContinuousGroup.stoneGenerator_domain`.
- **SA-A03 — Adjoint time reversal.** For every `t`, `U(−t) = U(t)*`: `⟪U(t) x, y⟫ = ⟪x, U(−t) y⟫`
  for all `x`, `y`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.inner_map_map`, `TauCeti.Semigroups.StronglyContinuousGroup.map_neg_apply_map_apply`.
- **SA-A04 — Norm preservation.** For every `t` and `ψ`, `‖U(t) ψ‖ = ‖ψ‖`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.norm_map`.
- **SA-A05 — Operator norm of the group.** `‖U(t)‖ ≤ 1` for every `t`, with equality when
  `H ≠ 0` (norm preservation at a nonzero vector); on `H = 0` every `U(t)` is `0 = 1`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.opNorm_le_one`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.norm_map`.
- **SA-A06 — Time-reversed group.** The family `t ↦ U(−t)` is a one-parameter unitary group.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.reflect`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.reflect`.
- **SA-A07 — Additivity of the generator difference quotient.** For each `t ≠ 0` the quotient
  `ψ ↦ (U(t)ψ − ψ)/(i t)` is additive in `ψ`; hence the generator domain is closed under addition
  and `A(ψ + φ) = A ψ + A φ`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator`.
- **SA-A08 — Complex homogeneity of the generator difference quotient.** `U(t)(c ψ) = c U(t) ψ`
  for every `c ∈ ℂ`, so the quotient is `ℂ`-homogeneous in `ψ`, the generator domain is a complex
  subspace and `A(c ψ) = c A ψ`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.map_smul`, `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator`.
- **SA-A09 — Generator-domain characterization.** A vector `ψ` lies in the generator domain
  exactly when the defining difference quotient converges; equivalently, when
  `(U(t)ψ − ψ)/t` converges as `t → 0⁺`; equivalently, when `t ↦ U(t) ψ` is differentiable at `0`.
  The one-sided, the left-hand and the two-sided limits then agree, and equal `G ψ = i A ψ`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.mem_domain_iff_tendsto`, `TauCeti.Semigroups.StronglyContinuousGroup.generator_tendsto_nhdsLT`, `TauCeti.Semigroups.StronglyContinuousGroup.hasDerivAt_zero`, `TauCeti.Semigroups.StronglyContinuousGroup.mem_domain_of_hasDerivAt_zero`.
- **SA-A10 — Invariance of the generator domain.** For every `s ∈ ℝ`, `U(s)` maps the generator
  domain into itself.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.map_mem_domain`.
- **SA-A11 — Generator covariance.** For every `s` and every `ψ` in the generator domain,
  `A(U(s) ψ) = U(s)(A ψ)`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.generator_map`.
- **SA-A12 — Symmetry of the generator.** `⟪A ψ, φ⟫ = ⟪ψ, A φ⟫` for `ψ`, `φ` in the generator
  domain; equivalently `⟪G ψ, φ⟫ = −⟪ψ, G φ⟫`, so `G` is a formal adjoint of `−G`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.inner_complexGenerator_eq_neg`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.complexGenerator_isFormalAdjoint_neg`.
- **SA-A13 — Commutant preserves the generator domain.** If a bounded complex-linear `T`
  satisfies `U(t) T = T U(t)` for every `t`, then `T` maps the generator domain into itself.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.complexGenerator_commute`.
- **SA-A14 — Commutant preserves the generator action.** Under the hypotheses of SA-A13,
  `A(T ψ) = T(A ψ)` for every `ψ` in the generator domain.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.complexGenerator_commute`.

*Needs:* Mathlib `LinearPMap`, `HasDerivAt`; Tau Ceti's strongly continuous groups.

**Checks.**

- For `U(t) = exp(i t) · 1` on `H ≠ 0`, the quotient `(exp(i t) − 1)/(i t) → 1`, so `A = 1` on all of
  `H` and `G = i`; a convention dividing by `t` alone would give `i`, not the self-adjoint `1`.
- For the translation group `(U(t) f)(x) = f(x + t)` on `L²(ℝ)`, `A = −i d/dx` on the Sobolev space
  `H¹(ℝ)`; the indicator of `[0, 1]` is not in the domain, its difference quotient having norm
  `√(2/|t|) → ∞`.

### A.2 Semigroup and exponential bridges

- **SA-A15 — Contraction-semigroup restriction.** Restricting `U(t)` to `t ≥ 0` and regarding `H`
  as a real Banach space gives a strongly continuous contraction semigroup: `‖U(t)‖ ≤ 1` for
  `t ≥ 0`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.toSemigroup`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.hasGrowthBound_zero_one`.
- **SA-A16 — Generator relation for the semigroup restriction.** Under the convention
  `U(t) = exp(i t A)`, the generator of the semigroup of SA-A15 is `i A` regarded as a real-linear
  partial operator, with the same domain as `A`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator_restrictScalars`, `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator_eq_I_smul_stoneGenerator`.
- **SA-A17 — Bounded self-adjoint exponential group.** For every bounded self-adjoint `S`,
  `t ↦ exp(i t S)` is a one-parameter unitary group.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp`, `TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp_apply`, `TauCeti.Semigroups.StronglyContinuousGroup.isUnitary_ofBoundedExp`.
- **SA-A18 — Norm preservation of bounded self-adjoint exponentials.** For bounded self-adjoint
  `S`, every `t` and every `ψ`, `‖exp(i t S) ψ‖ = ‖ψ‖`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.isUnitary_ofBoundedExp`, `TauCeti.Semigroups.StronglyContinuousGroup.IsUnitary.norm_map`.
- **SA-A19 — Derivative of a bounded exponential.** For a bounded operator `B` on a Banach space
  and every vector `ψ`, `d/dt exp(t B) ψ = exp(t B) B ψ` at every real `t`.
  *In Mathlib:* `hasDerivAt_exp_smul_const`.
- **SA-A20 — Commuting Duhamel estimate.** If bounded self-adjoint `S`, `T` commute, then
  `‖exp(i t S) ψ − exp(i t T) ψ‖ ≤ |t| ‖(S − T) ψ‖` for every real `t` and every `ψ`. With
  `B = S − T`, commutation gives `exp(i t S) − exp(i t T) = exp(i t T)(exp(i t B) − 1)`, and the
  Duhamel identity `exp(i t B) ψ − ψ = ∫₀ᵗ exp(i u B)(i B ψ) du` with unitary `exp(i u B)` gives
  `‖(exp(i t B) − 1) ψ‖ ≤ |t| ‖B ψ‖`, the operator form of `|exp(i t λ) − 1| ≤ |t λ|` (Teschl2009,
  proof of Theorem 5.1, p. 124, line 5215).

  *Needs:* SA-A17; Tau Ceti `ContinuousLinearMap.exp_smul_apply_sub_eq_intervalIntegral`; Mathlib
  `NormedSpace.exp_add_of_commute`.

  **Checks.**

  - The commutation hypothesis is needed: for `S` with rows `(0, 1)`, `(1, 0)` and `T` with rows
    `(0, 1)`, `(1, −1)`, `(S − T) e₁ = 0`, but `S² e₁ = e₁` and `T² e₁ = (1, −1)`, so
    `exp(i t S) e₁ ≠ exp(i t T) e₁` for small `t ≠ 0` while the right side of the estimate is `0`.
  - At `t = 0` both sides are `0`; for `S = s · 1`, `T = s′ · 1` on `ℂ` the estimate is
    `|exp(i t s) − exp(i t s′)| ≤ |t| |s − s′|`, sharp as `t → 0`.

### A.3 Self-adjointness and Stone's theorem

Von Neumann's shifted-surjectivity criterion converts symmetry into self-adjointness. Stone's
theorem is consumed from Tau Ceti: a partial operator `A` is self-adjoint exactly when `i A` is the
complex generator of a unitary group, and that group is unique. This Part proves the comparisons
of the generator of SA-A02 with that normalisation.

- **SA-A21 — von Neumann criterion.** A symmetric partial operator `A` on a complex Hilbert space
  for which `A + i` and `A − i` map the domain onto `H` is self-adjoint; density of the domain
  follows from the surjectivity of `A + i`.
  *In Tau Ceti:* `LinearPMap.isSelfAdjoint_of_surjective_addSub`.
- **SA-A22 — Difference-quotient generator comparison.** For a unitary group `U` with generator
  `A` (SA-A02) and complex generator `G`, the two have the same domain, `G = i A`, the real
  generator of the semigroup of SA-A15 is `i A` regarded as real-linear, and the right-hand limit
  of `(U(t)ψ − ψ)/t` as `t → 0⁺` agrees with the two-sided punctured limit of SA-A02: the
  negative-time quotient at `−s` is `U(−s)` applied to the positive-time quotient at `s`, and strong
  continuity and unitarity give the same limit. Consequently `A` is self-adjoint, by Stone's
  theorem. For `U(t) = exp(i t) · 1`, `A = 1` and `G = i · 1`.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator_eq_I_smul_stoneGenerator`, `TauCeti.Semigroups.StronglyContinuousGroup.complexGenerator_restrictScalars`, `TauCeti.Semigroups.StronglyContinuousGroup.hasDerivAt_zero`, `TauCeti.Semigroups.StronglyContinuousGroup.isSelfAdjoint_stoneGenerator`, `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`.
- **SA-A23 — Generator of a bounded exponential group.** For bounded self-adjoint `S`, the
  generator of `t ↦ exp(i t S)` is `S` regarded as a total partial operator (domain `H`).
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp_generator`.
- **SA-A24 — Norm-continuity criterion.** A one-parameter unitary group is continuous in operator
  norm exactly when its generator domain is the whole space; the forward and the time-reversed
  semigroups have the same generator domain, so the semigroup criterion applies to both
  half-lines.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousSemigroup.continuous_iff_domain_eq_top`, `TauCeti.Semigroups.StronglyContinuousGroup.reflect_domain`.

*Needs:* Tau Ceti `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`,
`LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` (Stone's theorem).

**Milestone A1 — unitary groups and generator calculus.** SA-A01–SA-A20.

**Milestone A2 — von Neumann and Stone.** SA-A21–SA-A24.

### Examples

- The bounded exponential model: for bounded self-adjoint `S`, `t ↦ exp(i t S)` has generator `S`
  with full domain (SA-A23), so it is norm-continuous (SA-A24).
- The translation group on `L²(ℝ)` is strongly but not norm-continuous: its generator `−i d/dx`
  has the proper domain `H¹(ℝ)`, and `‖U(t) − 1‖ = 2` for every `t ≠ 0`.

### Dependencies

- A.1 and A.2 need Mathlib and Tau Ceti's strongly continuous groups; SA-A20 needs SA-A17; A.3
  needs A.1–A.2 and Tau Ceti's Stone theorem. Part A needs nothing from Parts B–E.

## Part B: The Borel functional calculus and projection-valued measures

Bounded Borel symbols on a measurable space form a commutative C*-algebra; a projection-valued
measure assigns an orthogonal projection to each measurable set and integrates bounded Borel
symbols to a star-algebra homomorphism; scalar diagonal and polarised measures are derived from
it. For a unital representation of `C(K)`, `K` compact Hausdorff, and in particular for a normal
bounded operator, the integral of the representation's projection-valued measure is the Borel
functional calculus. All of Part B uses one carrier, `TauCeti.ProjValMeasure X H`, and one symbol
algebra, `TauCeti.BoundedBorelFunction X`. The construction of the projection-valued measure of a
representation and its Borel calculus, the essential norm and the commutant law are
VonNeumannAlgebras V2.BorelCalculus, and the multiplication models are VonNeumannAlgebras
V4.0.Multiplication: the items marked *Supplied by* state them in the form this roadmap uses.

### B.1 Bounded Borel calculus

Bounded measurable symbols on the spectrum form a pointwise star algebra, and the Borel calculus
extends the continuous calculus to it. Matrix-element integration supplies the norm, algebra,
commutation and almost-everywhere properties. Throughout B.1, `a` is a normal bounded operator on
`H`, `P_a` its spectral measure on `σ(a)` (SA-B30), `μ_ξ` the diagonal measures of `P_a`, and
`f(a) = ∫ f dP_a` for a bounded Borel symbol `f` on `σ(a)`.

- **SA-B01 — Bounded Borel symbols.** For a measurable space `X`, the bounded Borel symbols are
  the measurable `f : X → ℂ` with `sup_x |f(x)| < ∞`; under pointwise operations and complex
  conjugation they form a commutative unital star algebra. For measurable `κ : X → Y`, pullback
  `g ↦ g ∘ κ` is a unital star-algebra homomorphism from the symbols on `Y` to those on `X`, with
  `(g ∘ κ)(x) = g(κ x)`; pullback along the identity is the identity and pullback along a composite
  is the composite of the pullbacks. Its norm bound is SA-B37. For compact `K`, `L` and continuous
  `φ : K → L`, the pullback of a continuous symbol `g` is the continuous symbol `g ∘ φ` (SA-B38).
  *In Tau Ceti:* `TauCeti.BoundedBorelFunction`, `TauCeti.BoundedBorelFunction.compStarAlgHom'`, `TauCeti.BoundedBorelFunction.compStarAlgHom'_apply`, `TauCeti.BoundedBorelFunction.compStarAlgHom'_id`, `TauCeti.BoundedBorelFunction.compStarAlgHom'_comp`, `TauCeti.BoundedBorelFunction.compStarAlgHom'_ofContinuousMap`.
- **SA-B02 — Simultaneous continuous approximation.** On a compact metric space `K` with its
  Borel σ-algebra, let `f` be a bounded Borel symbol with `|f| ≤ M`, `ν_1, …, ν_m` finite Borel
  measures and `ε > 0`. There is a continuous `g : K → ℂ` with `|g| ≤ M` and `∫ |f − g| dν_j < ε` for
  every `j`. This is SA-B58 on a compact metric space, where every finite Borel measure is
  regular.
  *In Tau Ceti:* `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le`.
- **SA-B03 — Diagonal Riesz identification.** The diagonal measure `μ_ξ` of `P_a` is the regular
  Riesz measure on `σ(a)` of the positive functional `f ↦ ⟪ξ, f(a) ξ⟫` on `C(σ(a), ℂ)`; so
  `∫ f dμ_ξ = ⟪ξ, f(a) ξ⟫` for continuous `f`, and `μ_ξ(σ(a)) = ‖ξ‖²`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, on Tau Ceti `ContinuousLinearMap.diagMeasure`.
- **SA-B04 — Polarized pairing.** For a bounded Borel symbol `f` and vectors `ξ`, `ψ`,
  `⟪ξ, f(a) ψ⟫ = ¼ Σ_{k=0..3} i^(−k) ∫ f dμ_(ξ + i^k ψ)`, with the conjugate-first inner product;
  this follows from SA-B40, SA-B43 and SA-B45.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, on Tau Ceti `ContinuousLinearMap.pair`.
- **SA-B05 — Borel functional calculus.** For normal bounded `a`, the Borel calculus
  `f ↦ f(a)` on bounded Borel symbols on `σ(a)` is the integral against the projection-valued
  measure of the representation `cfcHom` of `C(σ(a), ℂ)` (SA-B59, SA-B44). SA-B03 and SA-B04
  describe its scalar measures and pairings; there is no second Borel calculus.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B06 — Agreement with the continuous calculus.** For continuous `g` on `σ(a)`, the Borel
  calculus of the continuous symbol `g` (SA-B38) is `cfcHom g`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B07 — Linearity of the Borel calculus.** `(f + g)(a) = f(a) + g(a)` and `(c f)(a) = c f(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B08 — Multiplicativity of the Borel calculus.** `(f g)(a) = f(a) g(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B09 — Star preservation.** `(f̄)(a) = f(a)*`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B10 — Commutation with the original operator.** `f(a) a = a f(a)` for every bounded Borel
  symbol `f`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B11 — Pairwise commutation of calculus values.** `f(a) g(a) = g(a) f(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B12 — Vector norm bound.** If `|f(x)| ≤ M` for every `x ∈ σ(a)`, then `‖f(a) ξ‖ ≤ M ‖ξ‖`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B13 — Almost-everywhere invariance.** If `f = g` `μ_ξ`-almost everywhere for every `ξ`, then
  `f(a) = g(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.

### B.2 Projection-valued measures

Throughout B.2–B.4, `X` is a measurable space and `P` a projection-valued measure on `X` acting on
`H`.

- **SA-B14 — Projection-valued measure.** A map `B ↦ P(B)` from the measurable sets of `X` to the
  orthogonal projections on `H` with `P(X) = 1`, `P(B ∩ C) = P(B) P(C)`, and strong countable
  additivity: for pairwise disjoint measurable `B_n`, `Σ_n P(B_n) ξ = P(⋃_n B_n) ξ` for every `ξ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure`, `TauCeti.ProjValMeasure.isStarProjection_proj`, `TauCeti.ProjValMeasure.hasSum_proj_of_pairwise_disjoint`.
- **SA-B15 — Idempotence of PVM values.** `P(B)² = P(B)` for every measurable `B`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.proj_idem`.
- **SA-B16 — Positivity of PVM values.** Every `P(B)` is a positive operator.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.isPositive_proj`.
- **SA-B17 — Monotonicity of PVM values.** If `B ⊆ C`, the range of `P(B)` is contained in the range
  of `P(C)`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.proj_range_mono`.
- **SA-B18 — Finite additivity of a PVM.** For disjoint measurable `B`, `C`,
  `P(B ∪ C) = P(B) + P(C)`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.proj_union`.
- **SA-B19 — PVM contraction bound.** `‖P(B) ξ‖ ≤ ‖ξ‖` for every measurable `B` and vector `ξ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.norm_proj_apply_le`.
- **SA-B20 — Extensionality from projection fields.** Two projection-valued measures with equal
  projections on every measurable set are equal.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.ext`.
- **SA-B21 — Diagonal scalar measure.** For every vector `ξ` there is a finite measure `μ_ξ` on `X`
  with `μ_ξ(B) = ⟪ξ, P(B) ξ⟫` on measurable sets; its total mass is `‖ξ‖²`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.diag`, `TauCeti.ProjValMeasure.instIsFiniteMeasureDiag`, `TauCeti.ProjValMeasure.diag_real_univ`.
- **SA-B22 — Diagonal-mass identity.** For measurable `B`, `⟪ξ, P(B) ξ⟫ = μ_ξ(B)` under the
  embedding `ℝ → ℂ`, and `‖P(B) ξ‖² = μ_ξ(B)`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.inner_proj`, `TauCeti.ProjValMeasure.norm_sq_proj_apply`.
- **SA-B23 — Extensionality from diagonal measures.** Two projection-valued measures with the same
  diagonal measure at every vector are equal.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.ext_of_diag`, `TauCeti.ProjValMeasure.ext_iff_diag`.
- **SA-B24 — Orthogonal countable splitting.** For a measurable partition `(B_k)` of `X`,
  `Σ'_k ‖P(B_k) ξ‖ₑ² = ‖ξ‖ₑ²`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.tsum_enorm_sq_proj`.
- **SA-B25 — Measurable reindexing.** A measurable `κ : X → Y` transports `P` to the
  projection-valued measure `P.map κ` on `Y` with `(P.map κ)(B) = P(κ⁻¹(B))`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.map`, `TauCeti.ProjValMeasure.map_proj`.

### B.3 Spectral PVM of a bounded operator

For a normal bounded operator, indicator calculus supplies its spectral projection-valued
measure; reindexing along the real coordinate gives the real spectral measure of a bounded
self-adjoint operator and its half-line form criteria.

- **SA-B26 — Indicator spectral projection.** For normal bounded `a` and Borel `B ⊆ σ(a)`, the
  Borel calculus `1_B(a)` of the indicator of `B` is an orthogonal projection.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B27 — Indicator idempotence.** `1_B(a)² = 1_B(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B28 — Indicator self-adjointness.** `1_B(a)* = 1_B(a)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B29 — Intersection law.** `1_B(a) 1_C(a) = 1_(B ∩ C)(a)` for Borel `B`, `C`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B30 — Spectral PVM of a normal bounded operator.** For normal bounded `a`, the spectral
  measure `P_a` on `σ(a)` is the projection-valued measure of the representation `cfcHom` of
  `C(σ(a), ℂ)` (SA-B59). Indicator calculus agrees with its projections, `1_B(a) = P_a(B)`, by
  SA-B46; SA-B26–SA-B29 are the corresponding projection laws.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B31 — Real spectral PVM of a bounded self-adjoint operator.** For bounded self-adjoint
  `T`, reindexing `P_T` along the real part `σ(T) → ℝ` (SA-B25) gives the projection-valued measure
  `B ↦ P_T({λ ∈ σ(T) : Re λ ∈ B})` on `ℝ`; it vanishes off the real spectrum, and SA-E45 identifies
  it with the spectral measure of `T` as a total partial operator.

  *Needs:* SA-B25, SA-B30.
- **SA-B32 — Lower half-line form criterion.** For bounded self-adjoint `T` with real spectral
  measure `P` (SA-B31) and real `c`, `P((−∞, c)) = 0` exactly when `c ‖x‖² ≤ Re ⟪T x, x⟫` for every
  `x`; both are equivalent to `σ(T) ⊆ [c, ∞)` and to `c ≤ T` in the order of Mathlib's continuous
  functional calculus.
- **SA-B33 — Upper half-line form criterion.** For bounded self-adjoint `T` and real `c`,
  `P((c, ∞)) = 0` exactly when `Re ⟪T x, x⟫ ≤ c ‖x‖²` for every `x`, equivalently `σ(T) ⊆ (−∞, c]`.

  The route for SA-B32 and SA-B33 writes `⟪x, T x⟫ = ∫ s dμ_x(s)` (SA-B35, SA-B45), so
  `⟪x, T x⟫ − c ‖x‖² = ∫ (s − c) dμ_x(s)`; this is `≥ 0` for every `x` exactly when no `μ_x` charges
  `(−∞, c)`, by testing on `x ∈ range P((−∞, c − δ))`.

  *Needs:* SA-B31, SA-B35, SA-B45, SA-B49; Mathlib `algebraMap_le_iff_le_spectrum`.

  **Checks.**

  - For `T = diag(0, 1)` and `c = 0` the lower bound holds and `P((−∞, 0)) = 0`; for `c = 1/2` it
    fails at `e₁` and `P((−∞, 1/2)) = e₁₁ ≠ 0`.
  - For the same `T` and `c = 0`, `P((−∞, 0]) = e₁₁ ≠ 0` although the bound holds: the criterion is
    stated with the open half-line.
- **SA-B34 — Uniqueness of the bounded spectral PVM.** For normal bounded `a`, every
  projection-valued measure on `σ(a)` whose integral agrees with `cfcHom` on continuous symbols is
  `P_a`. The spectrum is a compact metrizable space, on which every finite Borel measure is regular
  (Mathlib `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`), so
  SA-B62 applies.

  *Needs:* SA-B30, SA-B62.
- **SA-B35 — Bounded spectral theorem.** For normal bounded `a`, `a = ∫ z dP_a`, the integral of the
  restricted coordinate `z` on `σ(a)` (SA-B55). For bounded self-adjoint `T`, `T` is the integral
  against the real spectral measure of SA-B31 of the bounded symbol `s ↦ s` on `[−‖T‖, ‖T‖]`, zero
  outside, by the change of variables SA-B51; so `⟪ξ, T ξ⟫ = ∫ s dμ_ξ(s)`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, for the normal form.
- **SA-B36 — Multiplication-operator model.** Let `ν` be a finite positive measure on `X` and
  `h : X → ℂ` bounded measurable, and let `M_h` be multiplication by `h` on `L²(ν)`, a normal bounded
  operator. Its spectral measure on `ℂ`, obtained from `P_(M_h)` on `σ(M_h)` by the inclusion
  pushforward (SA-B25) and the change of variables (SA-B51), sends `B` to multiplication by the
  indicator of `h⁻¹(B)`, and `g(M_h) = M_(g ∘ h)` for every bounded Borel `g` on `ℂ`, where `g(M_h)`
  uses the restriction of `g` to `σ(M_h)`. Moreover `σ(M_h)` is the support of the image measure
  `ν ∘ h⁻¹` (Mathlib `MeasureTheory.Measure.support`), which is empty when `ν = 0` (Teschl2009, (3.7),
  p. 88, line 3605, on `L²(ℝ)`).

  *Needs:* SA-B25, SA-B30, SA-B34, SA-B51; Mathlib `MeasureTheory.Lp`.

  **Checks.**

  - For `h = 1_[0,1/2]` on `L²[0, 1]` with Lebesgue measure, `σ(M_h) = {0, 1}` and `P({1})` is
    multiplication by `1_[0,1/2]`.
  - For `ν = 0`, `L²(ν) = 0`, the spectrum is empty and the spectral measure is the zero field.

### B.4 Abstract PVM integration

- **SA-B37 — Sup norm of bounded Borel symbols.** The bounded Borel symbols on `X`, with the
  supremum norm (`0` when `X` is empty), form a commutative C*-algebra: complete, with
  `‖f* f‖ = ‖f‖²`; `|f(x)| ≤ ‖f‖` for every `x`, and `‖1‖ = 1` when `X` is nonempty.
  *In Tau Ceti:* `TauCeti.BoundedBorelFunction`, `TauCeti.BoundedBorelFunction.norm_eq_iSup_norm`, `TauCeti.BoundedBorelFunction.norm_coe_le_norm`, `TauCeti.BoundedBorelFunction.norm_eq_zero_of_empty`.
- **SA-B38 — Continuous-symbol embedding.** For compact `X` whose open sets are measurable, the
  inclusion of `C(X, ℂ)` in the bounded Borel symbols is a unital star-algebra homomorphism with
  pointwise evaluation and `‖f‖ = sup |f|`. SA-B06 uses this embedding.
  *In Tau Ceti:* `TauCeti.BoundedBorelFunction.ofContinuousMap`, `TauCeti.BoundedBorelFunction.ofContinuousMap_apply`, `TauCeti.BoundedBorelFunction.norm_ofContinuousMap`, `TauCeti.BoundedBorelFunction.isometry_ofContinuousMap`.
- **SA-B39 — Uniform finite-range approximation.** Every bounded measurable symbol is a uniform
  limit of measurable simple functions with finitely many values: cut its bounded range by a finite
  mesh and take measurable disjoint preimages, with explicit error bounds. Pointwise approximation
  by `MeasureTheory.SimpleFunc.approxOn` alone does not give uniform convergence.
  *In Tau Ceti:* `TauCeti.BoundedBorelFunction.denseRange_ofSimpleFunc`, `TauCeti.BoundedBorelFunction.exists_seq_tendsto_ofSimpleFunc`.
- **SA-B40 — Polarized complex measure.** For vectors `ξ`, `ψ`, the polarised measure `μ_(ξ,ψ)` is a
  complex measure on `X`, conjugate-linear in `ξ` and linear in `ψ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.polarizedComplexMeasure`.
- **SA-B41 — Scalar measure evaluation.** `μ_(ξ,ψ)(B) = ⟪ξ, P(B) ψ⟫` for measurable `B`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.polarizedComplexMeasure_apply`.
- **SA-B42 — Scalar variation bound.** `|μ_(ξ,ψ)|(X) ≤ ‖ξ‖ ‖ψ‖`, by orthogonality of the ranges of
  disjoint pieces and Cauchy–Schwarz over a finite partition; in particular `μ_(ξ,ψ)` has finite
  variation.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.polarizedComplexMeasure_variation_univ_le`, `TauCeti.ProjValMeasure.instIsFiniteMeasurePolarizedVariation`.
- **SA-B43 — Diagonal integral comparison.** `μ_(ξ,ξ)` is the finite positive measure `μ_ξ` of
  SA-B21 regarded as a complex measure (density `1`), and `∫ f dμ_(ξ,ξ) = ∫ f dμ_ξ` for every
  bounded measurable complex `f`; the scalar integral is the vector-measure integral with the
  real-bilinear multiplication pairing (SA-B81, SA-B82), not a separate construction.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.polarizedComplexMeasure_self_eq_withDensityᵥ`, `TauCeti.ProjValMeasure.integral_polarizedComplexMeasure_self`.
- **SA-B44 — Abstract operator integral.** The integral `f ↦ ∫ f dP` is a unital star-algebra
  homomorphism from the bounded Borel symbols on `X` to the bounded operators on `H`: on a disjoint
  simple symbol `Σ_k c_k 1_(B_k)` it is `Σ_k c_k P(B_k)`, and it extends by uniform approximation
  (SA-B39), independently of the partitions and approximants. The vector measure `B ↦ P(B) ξ` need
  not have finite variation and is not used for scalar integration.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.integral`, `TauCeti.ProjValMeasure.integralCLM`.
- **SA-B45 — Integral matrix elements.** `⟪ξ, (∫ f dP) ψ⟫ = ∫ f dμ_(ξ,ψ)`, and on the diagonal
  `⟪ξ, (∫ f dP) ξ⟫ = ∫ f dμ_ξ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.integral_polarizedComplexMeasure_eq_inner_integral`, `TauCeti.ProjValMeasure.integral_diag_eq_inner_integral`.
- **SA-B46 — Indicator recovery.** `∫ 1_B dP = P(B)` for measurable `B`, and `∫ c dP = c · 1` for a
  constant symbol `c`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.integral_indicator`.
- **SA-B47 — Integral norm bound.** If `M ≥ 0` and `|f(x)| ≤ M` for every `x`, then
  `‖∫ f dP‖ ≤ M`, including when `X` is empty.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.norm_integral_le`.
- **SA-B48 — Simple-symbol norm.** For a disjoint simple symbol `Σ_k c_k 1_(B_k)`, the norm of its
  integral is `max {|c_k| : P(B_k) ≠ 0}`, and `0` if every `P(B_k)` is `0`: null pieces do not
  contribute.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B49 — PVM null filter.** The filter `P.ae` on `X` whose eventual predicates are those that
  hold `μ_ξ`-almost everywhere for every `ξ`. For measurable `B`, `P(B) = 0` exactly when
  `μ_ξ(B) = 0` for every `ξ`, exactly when the complement of `B` belongs to `P.ae`; a countable union
  of measurable `P`-null sets is `P`-null.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.ae`, `TauCeti.ProjValMeasure.eventually_ae_iff`, `TauCeti.ProjValMeasure.proj_eq_zero_iff_forall_diag_apply_eq_zero`, `TauCeti.ProjValMeasure.proj_eq_zero_iff_compl_mem_ae`, `TauCeti.ProjValMeasure.proj_iUnion_eq_zero`.
- **SA-B50 — Almost-everywhere integral invariance.** Symbols equal `P`-almost everywhere have the
  same integral.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.integral_congr_ae`.
- **SA-B51 — Integral change of variables.** For measurable `κ : X → Y` and a bounded Borel symbol
  `g` on `Y`, `∫ g d(P.map κ) = ∫ (g ∘ κ) dP`, and the diagonal measure of `P.map κ` at `ξ` is the
  image of `μ_ξ` under `κ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.integral_map`, `TauCeti.ProjValMeasure.map_diag`.
- **SA-B52 — Vector norm-square identity.** `‖(∫ f dP) ξ‖² = ∫ |f|² dμ_ξ`.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.norm_sq_integral_apply`.
- **SA-B53 — Bounded sequential convergence.** If bounded Borel symbols `f_n`, `n ∈ ℕ`, have a
  common bound `|f_n| ≤ M` and converge to `f` pointwise (or `P`-almost everywhere), then
  `(∫ f_n dP) ξ → (∫ f dP) ξ` for every `ξ`, by dominated convergence (Teschl2009, Theorem 3.1, p. 90,
  line 3687). No statement about bounded pointwise convergent nets is made.
  *In Tau Ceti:* `TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`.
- **SA-B54 — Normal Borel-calculus identification.** The Borel calculus of SA-B05 is, by
  definition, integration against the spectral measure `P_a` of SA-B30.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B55 — Normal identity recovery.** For normal bounded `a`, `a = ∫ z dP_a`, where `z` is the
  restricted coordinate on `σ(a)`; this follows from SA-B06 and `cfcHom` of the coordinate being `a`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B56 — Full spectral support.** For normal bounded `a`, every nonempty relatively open
  `U ⊆ σ(a)` has `P_a(U) ≠ 0`. Take `λ ∈ U` and a continuous `f` with values in `[0, 1]`, supported in
  `U`, with `f(λ) = 1`: then `‖f(a)‖ = sup |f| = 1` because the continuous calculus is isometric, while
  `f(a) = ∫ f dP_a = 0` if `P_a(U) = 0` (Teschl2009, Theorem 3.8, p. 97, line 4015, for self-adjoint
  `a`).

  *Needs:* SA-B30, SA-B50; Mathlib `cfcHom`.
- **SA-B57 — Spectral commutant equality.** A bounded operator commutes with normal `a` exactly
  when it commutes with every `P_a(B)`, exactly when it commutes with every `f(a)`, `f` bounded Borel
  (Fuglede–Putnam, then SA-B79).
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.

### B.5 Representation PVMs and regular uniqueness

Throughout B.5–B.10, `K` is a compact Hausdorff space with its Borel σ-algebra, `π` a star
homomorphism from `C(K, ℂ)` to the bounded operators on `H`, unital unless B.7 says otherwise, and
`P_π` its projection-valued measure (SA-B59).

- **SA-B58 — General compact-space approximation.** On compact Hausdorff `K` with its Borel
  σ-algebra, for `𝕜 = ℝ` or `ℂ`, finitely many finite regular positive measures `ν_j`, a measurable
  `f : K → 𝕜` with `|f| ≤ M`, `M ≥ 0`, and `ε > 0`, there is a continuous `g : K → 𝕜` with `|g| ≤ M`
  and `∫ |f − g| dν_j < ε` for every `j`; and there is a sequence of such `g_n` with
  `∫ |f − g_n| dν_j → 0` for every `j`. The route approximates in `L¹(Σ_j ν_j)` by continuous
  functions and clips radially to keep the bound; the instances `ν_j = |μ_j|` give the
  scalar-measure tests.
  *In Tau Ceti:* `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le`, `MeasureTheory.exists_seq_continuous_norm_le_tendsto_integral_norm_sub`.
- **SA-B59 — Representation PVM.** For a unital star homomorphism `π : C(K, ℂ) → B(H)` there is a
  projection-valued measure `P_π` on `K`, on the carrier `TauCeti.ProjValMeasure K H`, whose diagonal
  measure at `ξ` is the regular Riesz measure of the positive functional `f ↦ ⟪ξ, π(f) ξ⟫` and whose
  integral extends `π`. Its construction: `π` is contractive; the polarised measures satisfy
  `|μ_(ξ,ψ)| ≤ ¼ Σ_{k=0..3} μ_(ξ + i^k ψ)`, so they have finite regular variation (SA-B83); the Borel
  operator `f ↦ π̃(f)` on bounded Borel symbols, defined by `⟪ξ, π̃(f) ψ⟫ = ∫ f dμ_(ξ,ψ)`, satisfies
  the weighted identity `μ_(ξ, π̃(g) ψ) = g · μ_(ξ,ψ)` (SA-B64), first for continuous `g` by
  uniqueness on continuous tests (SA-B84) and then for bounded Borel `g` by SA-B58; it is
  multiplicative, its indicator values are the projections `P_π(B)`, and `∫ f dP_π = π̃(f)` (SA-B45).
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, on Tau Ceti `StarAlgHom.representationDiagMeasure` and `StarAlgHom.representationBorelOperator`.
- **SA-B60 — Regularity.** Every diagonal measure of `P_π` is regular.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, on Tau Ceti `StarAlgHom.regular_representationDiagMeasure`.
- **SA-B61 — Representation recovery.** `∫ f dP_π = π(f)` for every continuous `f`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus, on Tau Ceti `StarAlgHom.representationBorelOperator_ofContinuousMap`.
- **SA-B62 — Regular uniqueness.** Prove `projValMeasure_eq_of_regular_of_integral_eq`: if two
  projection-valued measures `P`, `Q` on `K` have regular diagonal measures and `∫ f dP = ∫ f dQ` for
  every continuous `f`, then `P = Q` (Conway1990, Theorem IX.1.14). The route takes real continuous
  `f`: the diagonal measures of `P` and `Q` at `ξ` have the same integral `⟪ξ, f(P) ξ⟫` of `f`, so they
  are equal regular measures, and the projection-valued measures agree by SA-B23. With SA-B59–SA-B61
  this makes `P_π` the only projection-valued measure with regular diagonal measures whose integral
  extends `π`. For metrizable `K` every finite Borel measure is regular, so `P_π` is unique among all
  projection-valued measures extending `π`; this gives SA-B34.

  *Needs:* SA-B23, SA-B38, SA-B45; Tau Ceti `TauCeti.ProjValMeasure.integral_diag_eq_inner_integral`,
  `TauCeti.ProjValMeasure.ext_of_diag`, `TauCeti.BoundedBorelFunction.ofContinuousMap`; Mathlib
  `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`,
  `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`; SA-B59–SA-B61
  for the existence clause.

  **Checks.**

  - For `K` a point, both measures equal the identity at the point; the hypothesis on integrals is
    then `P(K) = Q(K) = 1` and carries no further information.
  - For `K = {0, 1}` and `π(f) = diag(f(0), f(1))` on `ℂ²`, `P_π({0}) = e₁₁` and `P_π({1}) = e₂₂`. The
    projection-valued measure with the two projections swapped integrates the indicator of `{0}`
    to `e₂₂ ≠ π(1_{0})`, so the integral clause fixes the labelling.
  - Regularity is needed. On the ordinal space `K = [0, ω₁]` the Dieudonné measure `μ_D` (mass 1 on
    Borel sets containing a closed unbounded subset of `[0, ω₁)`, 0 otherwise) is `{0,1}`-valued, so
    `B ↦ μ_D(B) · 1` is a projection-valued measure on `ℂ`. Every continuous function on `K` is
    eventually constant with value `f(ω₁)`, so its integral is `f(ω₁)`, the same as for the point
    mass at `ω₁`; yet the two measures give `{ω₁}` the projections `0` and `1`.
- **SA-B64 — Weighted regular measures.** On compact Hausdorff `K` with its Borel σ-algebra, let `μ`
  be a complex measure of finite regular variation and `g` a bounded Borel symbol, and let `g · μ` be
  `μ` with density `g` (the real-bilinear multiplication pairing). Then `|g · μ|` is `|μ|` with
  density `|g|`, so `g · μ` has finite regular variation (SA-B83) and `|g · μ| ≤ ‖g‖ |μ|`;
  `∫ f d(g · μ) = ∫ f g dμ` for every bounded Borel `f` (first for simple `f`, then by uniform
  approximation); `(g h) · μ = g · (h · μ)`, `c · μ` is the constant multiple, and `g · μ` depends only on
  the `|μ|`-almost-everywhere class of `g`.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.
- **SA-B79 — Representation commutant comparison.** A bounded operator `T` commutes with every
  `π(f)`, `f` continuous, exactly when it commutes with every projection `P_π(B)`, exactly when it
  commutes with every `∫ f dP_π`, `f` bounded Borel. The route compares `μ_(ξ, T ψ)` with
  `μ_(T* ξ, ψ)` on continuous tests and passes to Borel symbols with SA-B58, SA-B60 and the
  domination of SA-B59.
  *Supplied by:* VonNeumannAlgebras V2.BorelCalculus.

### B.6 The Borel bidual embedding

These statements specialise supplied results rather than a source theorem: the embedding and its
norm are the Riesz isometry of BanachSpaceTheory §5.4, and the limit comparison is Goldstine's
theorem. There is one representation projection-valued measure (SA-B59), not a second one built
by Goldstine limits.

- **SA-B63 — Borel bidual embedding.** Define `ι` from the bounded Borel functions on `K` to the
  bidual `C(K, ℂ)**` by `ι(f)(Λ) = ∫ f dμ_Λ`, where `μ_Λ` is the finite regular measure of
  BanachSpaceTheory §5.4 representing the functional `Λ`. Then `ι` is linear and isometric for the
  supremum norm: `|f(x)| = |ι(f)(δ_x)|` with `‖δ_x‖ = 1` gives the lower bound, and
  `|∫ f dμ| ≤ sup |f| · ‖μ‖` the upper. On continuous `g`, `ι(g)` is the canonical image
  `NormedSpace.inclusionInDoubleDual` of `g`. The map `ι` is an embedding, not onto in general.
- **SA-B65 — Goldstine limit comparison.** For bounded Borel `f` there is a net `g_α` of continuous
  functions with `‖g_α‖ ≤ sup |f|` and `∫ g_α dμ → ∫ f dμ` for every finite regular `μ` (Goldstine's
  theorem applied to `ι(f)`), and then `π(g_α) → ∫ f dP_π` in the weak operator topology, because
  `⟪ξ, π(g_α) η⟫ = ∫ g_α dμ_(ξ,η)` and the polarised measures of `P_π` are finite and regular.

*Needs:* SA-B59–SA-B61; BanachSpaceTheory §5.4; Tau Ceti
`NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`; Mathlib
`NormedSpace.inclusionInDoubleDual`.

**Checks.**

- For `K` a point, `C(K, ℂ) = ℂ`, the bounded Borel functions are `ℂ` and `ι` is the identity.
- On `K = [0, 1]` the functional `μ ↦ Σ_x μ({x})` (the atomic part) is bounded on `M(K)` but is not
  `ι(f)`: evaluating at point masses would force `f = 1`, while `ι(1)` sends Lebesgue measure to `1`
  and the atomic part sends it to `0`.
- For `π` the multiplication representation on `L²[0, 1]` and `f = 1_[0,1/2]`, continuous `g_α`
  converge weakly to `f(P_π)`, but never in norm: `sup |g − f| ≥ 1/2` for every continuous `g`, and
  the operator norm of a multiplication operator is the essential supremum.

### B.7 Degenerate representations

For a star homomorphism `π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H)`, not necessarily unital, the essential
subspace `H_π` is the range of `π(1)`, the essential representation `π₀` is `π` restricted to `H_π`,
and `J : H_π → H` is the inclusion. The source theorem is the unital one, Conway1990, Theorem
IX.1.14, applied to `π₀` on `H_π`; the laws below transport it along `J`.

- **SA-B66 — Essential-subspace completeness.** `π(1)` is an orthogonal projection, since
  `π(1)² = π(1)` and `π(1)* = π(1)`; so `H_π` is closed and complete with the induced Hilbert
  structure, and `π(f) = π(1) π(f) = π(f) π(1)` for every `f`.
- **SA-B67 — Degenerate representation field.** `π₀` is a unital star homomorphism into the
  bounded operators on `H_π` with `π(f) = J π₀(f) J*`. Define the spectral field
  `P_π(B) = J P_(π₀)(B) J*` and the integral `f ↦ J f(P_(π₀)) J*`. Each `P_π(B)` is an orthogonal
  projection, `P_π(K) = π(1)`, `P_π(B ∩ C) = P_π(B) P_π(C)`, and `B ↦ P_π(B)` is strongly countably
  additive; the integral is a star homomorphism from the bounded Borel functions on `K`, equal to
  `π(f)` on continuous `f` and to `P_π(B)` on the indicator of `B`; and a projection field with these
  laws whose diagonal measures are regular is `P_π` (SA-B62 on `H_π`). The field is a function with
  these laws; its normalised essential measure `P_(π₀)` is on the carrier `TauCeti.ProjValMeasure`,
  not a second carrier. Zero representations and empty `K` are included: the essential subspace is
  then `0`, and `H = 0` if `π` is unital.

*Needs:* SA-B59–SA-B62; Mathlib `IsStarProjection`.

**Checks.**

- For `π = 0`, `H_π = 0` and the field is zero.
- For `K = [0, 1]` and `π(f) = f(0) e₁₁` on `ℂ²`, `π(1) = e₁₁`, `H_π = ℂ e₁` and `P_π(B) = 1_B(0) e₁₁`;
  the total projection `P_π(K) = e₁₁` is `π(1)`, not the identity.
- For unital `π`, `H_π = H` and the field is `P_π` of SA-B59.
- For empty `K`, `C(K, ℂ) = 0`, so `π = 0` and `H_π = 0`; a unital `π` then forces `H = 0`, since
  `1 = 0` in `C(∅, ℂ)`.

### B.8 Regular pushforward and naturality

For multiplication `A` by the coordinate on `L²(ℝ, μ)` and real `f`, Teschl2009, (3.65)–(3.67),
pp. 100–101, lines 4183–4194, state the change of variables and the naturality
`P_(f(A))(Ω) = χ_(f⁻¹(Ω))` that the following generalise.

- **SA-B68 — Regular pushforward.** For a continuous map `φ : K → L` of compact Hausdorff spaces,
  the pushforward `P.map φ` of a projection-valued measure with regular diagonal measures again has
  regular diagonal measures: its diagonal measures are the images `(μ_ξ).map φ` (SA-B51), and a
  finite inner regular measure on a compact Hausdorff space is regular (Mathlib
  `MeasureTheory.Measure.InnerRegular.map_of_continuous`).
- **SA-B69 — Representation-map naturality.** For continuous `φ : K → L` and `φ*(g) = g ∘ φ`, the
  projection-valued measure of `π ∘ φ*` is `P_π.map φ`: both have regular diagonal measures (SA-B60,
  SA-B68), and the change of variables gives `g(P_π.map φ) = (g ∘ φ)(P_π) = π(g ∘ φ)` for continuous
  `g` (SA-B01, SA-B51), so SA-B62 applies.

*Needs:* SA-B01, SA-B51, SA-B60, SA-B62; Tau Ceti `TauCeti.ProjValMeasure.map`,
`TauCeti.ProjValMeasure.map_diag`, `TauCeti.ProjValMeasure.integral_map`,
`TauCeti.BoundedBorelFunction.compStarAlgHom'`; Mathlib
`MeasureTheory.Measure.InnerRegular.map_of_continuous`, `ContinuousMap.compStarAlgHom'`.

**Checks.**

- For `φ` constant with value `l₀`, `π ∘ φ*` is `g ↦ g(l₀) · 1` and `P_π.map φ` is the point mass at
  `l₀` times the identity, whatever `π` is.
- For `φ` the identity, `P_π.map φ = P_π`.
- For the inclusion `{0, 1} → [0, 1]` and `π(f) = diag(f(0), f(1))`, the pushforward vanishes on
  `(0, 1)` and gives `{0}` the projection `e₁₁`.

### B.9 Unitary transport, reducing restriction and direct sums

- **SA-B70 — Unitary transport.** For a linear isometric equivalence `U : H ≃ₗᵢ[ℂ] H′`, possibly
  with `H ≠ H′`, and `π′ = U.conjStarAlgEquiv ∘ π`, `P_(π′)(B) = U P_π(B) U⁻¹` and
  `f(P_(π′)) = U f(P_π) U⁻¹` for every bounded Borel `f` (Teschl2009, p. 97, lines 4009–4012, for
  unitarily equivalent self-adjoint operators).
- **SA-B71 — Reducing restriction.** If a closed subspace `V` is invariant under every `π(f)` (hence,
  `π` being a star homomorphism, under every `π(f)*`), then `V` is invariant under every `P_π(B)`
  (SA-B79; the self-adjoint case is Teschl2009, Lemma 4.5 with Corollary 4.6, p. 116, lines 4926 and
  4945), and the projection-valued measure and integrals of the restricted representation on `V`
  are the restrictions of those of `π`.
- **SA-B72 — Direct sums.** For unital `π_i` on `H_i`, the direct sum `(⊕ π_i)(f) = ⊕ π_i(f)` on
  `lp (fun i => H i) 2` is a unital star homomorphism (using `‖π_i(f)‖ ≤ ‖f‖` and SA-B80); its
  projection-valued measure is `B ↦ ⊕ P_(π_i)(B)`, that is `P(B) x = (P_(π_i)(B) x_i)_i`, and its
  integral is `f ↦ ⊕ f(P_(π_i))`. The route defines the measure by SA-B59, so regularity comes from
  SA-B60, and identifies it on the coordinate summands, which reduce the direct sum, by SA-B70 and
  SA-B71. For countably many self-adjoint operators, Teschl2009, Theorem 2.23, p. 79, line 3257,
  states the corresponding identity for resolvents.
- **SA-B80 — Hilbert direct-sum operators.** For a family `(H_i)_{i ∈ I}` and operators `T_i` on
  `H_i` with `‖T_i‖ ≤ M` for all `i`, the Hilbert direct sum `⊕ T_i` on `lp (fun i => H i) 2`,
  `(⊕ T_i x)_i = T_i x_i`, is a bounded operator with `‖⊕ T_i‖ = sup_i ‖T_i‖`, since
  `‖T_i x_i‖ ≤ M ‖x_i‖` keeps the image in `ℓ²` (Teschl2009, Problem 2.26, p. 80, line 3314, for
  countable families). It sends the single vector `v` at `i` to the single vector `T_i v` at `i`;
  `⊕ 1 = 1`, and `⊕` is additive, homogeneous and multiplicative in the family, with
  `(⊕ T_i)* = ⊕ T_i*` (Teschl2009, Problem 2.24, p. 80, line 3311, for countable families).

*Needs:* SA-B59–SA-B62, SA-B79; Mathlib `lp`, `lp.single`, `IsHilbertSum`,
`LinearIsometryEquiv.conjStarAlgEquiv`.

**Checks.**

- For `T_i = i · 1` on `ℂ`, `i ∈ ℕ`, the family is not uniformly bounded, and the coordinatewise map
  sends `(1/(i+1))_i ∈ ℓ²` to `(i/(i+1))_i ∉ ℓ²`: the bound hypothesis is needed.
- For two summands `ℂ ⊕ ℂ` with `T_1 = 1`, `T_2 = 2`, `⊕ T_i = diag(1, 2)` has norm `2`; for
  `T_1 = i · 1` the adjoint is `−i · 1` on that summand.
- For an empty index set, `ℓ² = 0` and `⊕ T_i = 0`.
- For `π(f) = diag(f(0), f(1))` on `ℂ²` and `U` the coordinate swap, `P_(π′)({0}) = e₂₂`. The
  subspace `ℂ e₁` reduces `π`, and the restricted spectral measure gives `{0}` the identity and
  `{1}` zero. The direct sum of `f ↦ f(0)` and `f ↦ f(1)` on `ℂ ⊕ ℂ` is `π`.

### B.10 Planar reduction and concentration

- **SA-B73 — Planar reduction.** For compact `K ⊆ ℂ` and unital `π`, let `T = π(z)` with `z` the
  coordinate. Then `T` is normal, `σ(T) ⊆ K`, and `π = cfcHom(T) ∘ ρ`, where
  `ρ : C(K, ℂ) → C(σ(T), ℂ)` is restriction: the two star homomorphisms agree on the coordinate and
  are continuous (Mathlib `AlgHom.spectrum_apply_subset` with `ContinuousMap.spectrum_eq_range` gives
  `σ(T) ⊆ K`, and `ContinuousMap.starAlgHom_ext_map_X` the factorisation).
- **SA-B74 — Planar concentration.** In the setting of SA-B73, `P_π(K \ σ(T)) = 0`, by SA-B69 applied
  to the inclusion `σ(T) → K`; and a relatively open `U ⊆ K` meeting `σ(T)` has `P_π(U) ≠ 0`, by the
  argument of SA-B56. Full support on the spectrum is the case `K = σ(T)`; on a larger `K` the
  support is `σ(T)`, not `K` (Teschl2009, Theorem 3.8 and Corollary 3.9, p. 97, lines 4015 and 4031,
  for self-adjoint `T`).

*Needs:* SA-B56, SA-B60, SA-B69; Mathlib `AlgHom.spectrum_apply_subset`,
`ContinuousMap.spectrum_eq_range`, `ContinuousMap.starAlgHom_ext_map_X`, `cfcHom`.

**Checks.**

- For `K` the closed unit disc, `H = ℂ` and `π(f) = f(z₀)` with `|z₀| < 1`, `T = z₀`, `σ(T) = {z₀}` and
  `P_π(K \ {z₀}) = 0`: the measure does not have full support on `K`.
- For `K = {0, 1}` and `π(f) = diag(f(0), f(1))`, `T = diag(0, 1)` and `σ(T) = K`.
- For `K` the unit circle and `π` the multiplication representation on `L²` of the circle, `T` is
  the bilateral shift, `σ(T)` is the circle and every nonempty relatively open arc has nonzero
  projection.

### B.11 Scalar integration against scalar measures

Over `𝕜 = ℝ` or `ℂ`, a scalar measure is a `𝕜`-valued vector measure, integrated with the
real-bilinear multiplication pairing `ContinuousLinearMap.mul ℝ 𝕜`: `I_μ(f) = ∫ f dμ`. Bounded
measurable functions are given as measurable `f : X → 𝕜` with an explicit bound, independently of
the symbol algebra. This layer precedes the representation measures.

- **SA-B81 — Scalar vector-integral linearity.** For scalar measures `μ`, `ν` of finite variation,
  `I_μ(c f) = c I_μ(f)`, `I_(μ+ν)(f) = I_μ(f) + I_ν(f)` and `I_(c μ)(f) = c I_μ(f)` under the
  corresponding variation-integrability hypotheses. The real and imaginary parts `re μ`, `im μ` are
  signed measures, and real signed measures `σ` embed as scalar measures `ofReal σ`, with
  `μ = ofReal(re μ) + i · ofReal(im μ)`, `|re μ| ≤ |μ|`, `|im μ| ≤ |μ|` and `|ofReal σ| = |σ|`, each
  variation a positive measure. For real `f` integrable against `|μ|`, the real and imaginary parts
  of `I_μ(f)` are `I_(re μ)(f)` and `I_(im μ)(f)`; for signed `σ` and real `f` integrable against
  `|σ|`, `I_(ofReal σ)(f) = I_σ(f)` in `𝕜`; and `ofReal(ν.withDensityᵥ r) = ν.withDensityᵥ (ofReal ∘ r)`
  for `r ∈ L¹(ν)`. For finite
  `ν₁`, `ν₂` and `f` integrable against each, the integral against `ν₁ − ν₂` (as a signed measure) is
  `∫ f dν₁ − ∫ f dν₂`, and for `f` integrable against `|σ|` the Jordan split
  `I_σ(f) = ∫ f dσ⁺ − ∫ f dσ⁻` holds. No case split on `𝕜` is used.
  *In Tau Ceti:* `MeasureTheory.VectorMeasure.integral_const_mul`, `MeasureTheory.VectorMeasure.integral_smul_vectorMeasure_mul`, `MeasureTheory.VectorMeasure.scalarMeasureRealPart`, `MeasureTheory.VectorMeasure.scalarMeasureImagPart`, `MeasureTheory.VectorMeasure.scalarMeasureOfReal`, `MeasureTheory.VectorMeasure.scalarMeasureOfReal_realPart_add_I_smul_imagPart`, `MeasureTheory.VectorMeasure.variation_scalarMeasureRealPart_le`, `MeasureTheory.VectorMeasure.variation_scalarMeasureImagPart_le`, `MeasureTheory.VectorMeasure.variation_scalarMeasureOfReal`, `MeasureTheory.VectorMeasure.re_integral_ofReal`, `MeasureTheory.VectorMeasure.im_integral_ofReal`, `MeasureTheory.VectorMeasure.integral_ofReal_scalarMeasureOfReal`, `MeasureTheory.VectorMeasure.scalarMeasureOfReal_withDensityᵥ`, `MeasureTheory.VectorMeasure.integral_mul_toSignedMeasure_sub`, `MeasureTheory.VectorMeasure.integral_mul_eq_integral_posPart_sub_integral_negPart`.
- **SA-B82 — Integral against a scalar density.** A finite positive measure `ν` embeds as the
  scalar measure `ν.withDensityᵥ 1`, with value `ν(B)` on measurable `B` and variation `ν`. For
  `g ∈ L¹(ν)` and measurable `f : X → 𝕜` with `|f| ≤ M`, `I_(ν.withDensityᵥ g)(f) = ∫ f g dν`; the case
  `g = 1` compares with the ordinary integral, and the integral depends only on the
  `ν`-almost-everywhere class of `f`.
  *In Tau Ceti:* `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ`, `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ_one`, `MeasureTheory.withDensityᵥ_one_apply`, `MeasureTheory.Measure.variation_withDensityᵥ_one`, `MeasureTheory.VectorMeasure.integral_withDensityᵥ_congr_ae`.
- **SA-B83 — Absolute-continuity regularity.** A finite Borel measure absolutely continuous with
  respect to a finite regular Borel measure on a compact Hausdorff space is regular (by `ε`–`δ`
  absolute continuity and transfer of inner and outer approximation). Finite sums and scalar
  multiples of finite regular measures are regular, and for scalar measures `μ`, `ν` of finite
  regular variation, `|μ + ν|` and `|μ − ν|` are regular, since they are dominated by `|μ| + |ν|`.
  *In Tau Ceti:* `MeasureTheory.Measure.AbsolutelyContinuous.regular`, `MeasureTheory.Measure.OuterRegular.add`, `MeasureTheory.Measure.WeaklyRegular.finsetSum`, `MeasureTheory.VectorMeasure.regular_variation_add`, `MeasureTheory.VectorMeasure.regular_variation_sub`, `MeasureTheory.VectorMeasure.regular_variation_smul`.
- **SA-B84 — Scalar-measure uniqueness.** On compact Hausdorff `K` with its Borel σ-algebra, for
  `𝕜 = ℝ` or `ℂ`, a scalar measure `μ` of finite regular variation with `∫ f dμ = 0` for every
  `f ∈ C(K, 𝕜)` is zero; two such measures with the same integrals of continuous functions are equal.
  The route splits `μ` into the Jordan parts of `re μ` and `im μ` (SA-B81), which are regular by
  SA-B83, and applies uniqueness of regular measures with the same integrals on continuous
  functions.
  *In Tau Ceti:* `MeasureTheory.VectorMeasure.eq_zero_of_integral_eq_zero_on_continuousMap`, `MeasureTheory.VectorMeasure.ext_of_integral_eq_on_continuousMap`, `MeasureTheory.VectorMeasure.ext_of_integral_eq_on_compactlySupported`.

### B.12 Multiplication models and essentially bounded symbols

- **SA-B85 — Cyclic multiplication models and multiplicity.** Let `π : C(K, ℂ) → B(H)` be a unital
  star homomorphism, `K` compact metrizable with its Borel σ-algebra, with projection-valued measure
  `P` (SA-B59) and finite regular diagonal measures `μ_ξ` (SA-B60).
  (i) For nonzero `ξ`, the cyclic subspace `H_ξ = closure {π(f) ξ : f ∈ C(K, ℂ)}` reduces `π`, and
  `f ↦ π(f) ξ` extends to a unitary `L²(K, μ_ξ) → H_ξ` intertwining multiplication by `f` with `π(f)`
  and the indicator multiplier of `B` with `P(B)`. Every `H` is an orthogonal sum of cyclic subspaces
  `⊕_j H_(ξ_j)`, without countability.
  (ii) For separable `H`, with a countable such decomposition, weights `w_j > 0` with
  `Σ_j w_j μ_j(K) < ∞` (`μ_j = μ_(ξ_j)`), the disjoint union `Ω = ⨿_j K` with measure `w_j μ_j` on piece
  `j` and coordinate `z : Ω → K`, `π` is unitarily equivalent to `f ↦ M_(f ∘ z)` on `L²(Ω)`. With the
  control measure `μ = Σ_j w_j μ_j` and densities `r_j = dμ_j/dμ`, the multiplicity function
  `m(x) = #{j : r_j(x) > 0} ∈ ℕ ∪ {∞}` gives a unitary onto the field with fibre `ℓ²` of dimension
  `m(x)` intertwining `π(f)` with diagonal multiplication by `f`.
  (iii) For Borel `B`, `μ(B) = 0` exactly when `P(B) = 0`. Two representations of the same `C(K)` are
  unitarily equivalent exactly when their control measures are mutually absolutely continuous and
  their multiplicity functions agree almost everywhere; the control class and the multiplicity are
  independent of the cyclic decomposition, vectors, weights, densities and enumerations, modulo
  null sets.
  (iv) For a normal operator `T` on separable `H` (with `K = σ(T)` and `π = cfcHom`), `T` is unitarily
  equivalent to multiplication by `z`, and two separable normal operators are unitarily equivalent
  exactly when their control classes on `ℂ` and multiplicities agree; `Ω` need not be a subset of
  `ℂ`: scalar multiplication on `ℂ²` has multiplicity `2`.
  (v) For a nondegenerate star homomorphism `π : C₀(X) → B(H)`, `X` second-countable locally
  compact Hausdorff and `H` separable, the unitisation `π⁺` on the one-point compactification `X⁺` is
  unital with `P({∞}) = 0`, and (ii)–(iii) hold on `X`, with `C₀(X)`-cyclic and `C(X⁺)`-cyclic
  subspaces equal; for two such representations the comparison is made over the sum of their
  control measures without assuming them equivalent. Zero `H`, zero control and empty cyclic sums
  are included; empty `X` forces `H = 0` by nondegeneracy.
  *Supplied by:* VonNeumannAlgebras V4.0.Multiplication.
- **SA-B86 — Essentially bounded PVM symbols.** The quotient of the measurable symbols bounded
  outside a `P`-null set (SA-B49) by those vanishing outside one is a commutative C*-algebra with norm
  the `P`-essential supremum; the Borel calculus extends to it as an isometric star homomorphism,
  independent of bounded representatives, and in the separable model of SA-B85 it is `L^∞` of a
  control measure. A pointwise Borel function is not a bounded symbol merely because its integral
  is suggested.
  *Supplied by:* VonNeumannAlgebras V4.0.Multiplication.

**Milestone B1 — symbols and scalar integration.** SA-B01, SA-B37–SA-B39, SA-B81–SA-B84, SA-B64 and
SA-B58, all independent of projection-valued measures.

**Milestone B2 — abstract PVMs and integration.** SA-B14–SA-B25 and SA-B40–SA-B53.

**Milestone B3 — compact-space representation PVMs.** SA-B59–SA-B62, SA-B79–SA-B80 and
SA-B66–SA-B72, after B1–B2.

**Milestone B4 — normal spectral calculus and examples.** SA-B02–SA-B13, SA-B26–SA-B36,
SA-B54–SA-B57 and SA-B73–SA-B78, after B3.

**Milestone B5 — bidual comparison.** SA-B63 and SA-B65, after B3, with BanachSpaceTheory §5.4.

**Milestone B6 — multiplication models and essential symbols.** SA-B85–SA-B86, after B3–B4.

### Examples

- **SA-B75 — Finite diagonal example.** For a finite diagonal normal operator
  `a = diag(λ_1, …, λ_n)`, `P_a({λ})` is the projection onto the span of the `e_i` with `λ_i = λ`
  (repeated eigenvalues merged), and `f(a) = diag(f(λ_i))`.
- **SA-B76 — Lebesgue multiplication example.** On `L²[0, 1]` with `a` the multiplication by `t`,
  `P_a(B)` is multiplication by `1_B` on almost-everywhere classes and `f(a)` is multiplication by `f`.
- **SA-B77 — Accumulating diagonal example.** On `ℓ²(ℕ)` with `a = diag(1/(n+1))`,
  `P_a({1/(n+1)}) = e_nn` and `P_a({0}) = 0`, although `0 ∈ σ(a)`.
- **SA-B78 — Failure of norm additivity.** For the same `a`, the partial sums `Σ_{n<N} e_nn`
  converge strongly to `1` but not in norm (`‖1 − Σ_{n<N} e_nn‖ = 1`): countable additivity is strong,
  not uniform.
- The multiplication-operator model is SA-B36; the half-line spectral projections and form bounds
  are SA-B32–SA-B33.
- SA-B85 retains multiplicity `2` for scalar multiplication on `ℂ²`, checks the weighted cyclic and
  fibre norm identities and the equivalence of control-null and `P`-null sets, and covers zero `H`,
  zero control, empty cyclic sums and the zero-`H`, empty-`X` representation of `C₀(X)`; SA-B86
  identifies essential symbols without choosing pointwise values on null sets.

### Dependencies

- B.1 needs B.2–B.5 and VonNeumannAlgebras V2.BorelCalculus; B.2 needs Tau Ceti's
  projection-valued measures; B.3 needs B.2, B.4 and B.5; B.4 needs B.2 and B.11; B.5 needs B.4 and
  B.11; B.6 needs B.5 and BanachSpaceTheory §5.4; B.7–B.9 need B.5; B.10 needs B.8; B.11 needs Mathlib
  only; B.12 needs B.5, B.9 and VonNeumannAlgebras V4.0.Multiplication. Part B needs nothing from
  Parts A, C, D and E.

## Part C: Closed operators on `LinearPMap`: graphs, constructions, form bounds

Part C supplies the domain geometry and perturbation vocabulary for partial operators
`A : E →ₗ.[𝕜] F` over `𝕜 = ℝ` or `ℂ`, on inner product spaces (Hilbert spaces where a statement uses
adjoints or orthogonal projections). It covers domain relations, reducing restrictions, transport
constructions, graph norms and graph cores, relative boundedness and perturbations, real spectral
separation, rectangular Sylvester equations and quadratic-form bounds, and it closes with the
spectral theorem for compact normal operators. Reducing subspaces use the orthogonal projection
onto a subspace with `Submodule.HasOrthogonalProjection`; the bounded form-bound bridge uses
Mathlib's `Module.End.invtSubmodule`, `LinearMap.IsSymmetric.restrict_invariant` and
`LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule`.

### C.1 Domain relations and reducing restrictions

Domain relations make comparison and extension of partial operators explicit. Reducing
restrictions carry self-adjoint operators to invariant subspaces together with the density,
closedness, symmetry and self-adjointness inherited there.

- **SA-C01 — Same-domain relation.** Two partial operators `A`, `B` on `E` have the same domain when
  `dom A = dom B` as subspaces.
  *In Mathlib:* equality of `LinearPMap.domain`.
- **SA-C02 — Reflexivity of same-domain.** Every partial operator has the same domain as itself.
  *In Mathlib:* equality of `LinearPMap.domain`.
- **SA-C03 — Symmetry of same-domain.** If `A` and `B` have the same domain, so do `B` and `A`.
  *In Mathlib:* equality of `LinearPMap.domain`.
- **SA-C04 — Transitivity of same-domain.** If `A`, `B` and `B`, `C` have the same domain, so do `A`,
  `C`.
  *In Mathlib:* equality of `LinearPMap.domain`.
- **SA-C05 — Domain transport relation.** For partial operators `A` on `E`, `B` on `F` and bounded
  `X : E → F`, the domain-transport condition is `X(dom A) ⊆ dom B`; with the action condition
  `X A x = B X x` on `dom A` it is the intertwining relation SA-D31.
  *In Tau Ceti:* `LinearPMap.Intertwines`.
- **SA-C06 — Identity domain transport.** The identity transports the domain of a partial operator
  to itself (and intertwines it with itself).
  *In Tau Ceti:* `LinearPMap.intertwines_id`.
- **SA-C07 — Composition of domain transports.** If `X(dom A) ⊆ dom B` and `Y(dom B) ⊆ dom C`, then
  `(Y X)(dom A) ⊆ dom C`, and likewise for intertwiners.
  *In Tau Ceti:* `LinearPMap.Intertwines.comp`.
- **SA-C08 — Extension relation.** `B` extends `A`, written `A ≤ B`, when `dom A ⊆ dom B` and
  `B x = A x` for every `x ∈ dom A`.
  *In Mathlib:* the order `≤` on `LinearPMap`.
- **SA-C09 — Reflexivity of extension.** `A ≤ A`.
  *In Mathlib:* the order `≤` on `LinearPMap`.
- **SA-C10 — Transitivity of extension.** `A ≤ B` and `B ≤ C` give `A ≤ C`.
  *In Mathlib:* the order `≤` on `LinearPMap`.
- **SA-C11 — Invariant subspace for a partial operator.** A subspace `U` is invariant under `A` when
  `A(dom A ∩ U) ⊆ U`.
  *In Tau Ceti:* `LinearPMap.IsInvariant`.
- **SA-C12 — Reducing subspace for a partial operator.** A closed subspace `U` reduces `A` when the
  orthogonal projections onto `U` and onto `U^⊥` map `dom A` into itself and both `U` and `U^⊥` are
  invariant under `A`; preservation of the domain by one projection gives it for the other.
  *In Tau Ceti:* `LinearPMap.IsReducing`, `LinearPMap.IsReducing.sub_starProjection_mem_domain`, `LinearPMap.IsReducing.orthogonal`.
- **SA-C13 — Reduced restriction.** For a subspace `U` invariant under `A`, the restriction of `A`
  to `U` is the partial operator on `U` with domain `dom A ∩ U` and the action of `A`.
  *In Tau Ceti:* `LinearPMap.restrict`.
- **SA-C14 — Domain of a reduced restriction.** A vector `x ∈ U` lies in the domain of the
  restriction exactly when `x ∈ dom A`.
  *In Tau Ceti:* `LinearPMap.mem_restrict_domain`.
- **SA-C15 — Action of a reduced restriction.** On its domain the restriction acts by `A`.
  *In Tau Ceti:* `LinearPMap.coe_restrict_apply`.
- **SA-C16 — Density of a reduced restriction.** If `U` reduces a densely defined `A`, the
  restriction of `A` to `U` is densely defined in `U`.
  *In Tau Ceti:* `LinearPMap.IsReducing.dense_restrict_domain`.
- **SA-C17 — Closedness of a reduced restriction.** If `A` is closed and `U` is invariant, the
  restriction is closed.
  *In Tau Ceti:* `LinearPMap.IsClosed.restrict`.
- **SA-C18 — Symmetry of a reduced restriction.** If `A` is symmetric and `U` is invariant, the
  restriction is symmetric.
  *In Tau Ceti:* `LinearPMap.IsFormalAdjoint.restrict`.
- **SA-C19 — Self-adjointness of a reduced restriction.** If `A` is self-adjoint on a Hilbert space
  and `U` reduces `A`, the restriction is self-adjoint.
  *In Tau Ceti:* `LinearPMap.IsReducing.isSelfAdjoint_restrict`.

### C.2 Transport constructions

Pullback, unitary conjugation and direct sum transport partial operators together with their
domains between spaces. Density, closedness, symmetry and self-adjointness pass through these
constructions.

- **SA-C20 — Pullback by a continuous linear equivalence.** For a continuous linear equivalence
  `e : E ≃ F` and a partial operator `A` on `F`, the pullback `e⁻¹ A e` is the partial operator on `E`
  with domain `e⁻¹(dom A)` and action `x ↦ e⁻¹(A(e x))`. For a linear isometric equivalence it is the
  unitary conjugate of SA-C25 by `e⁻¹`.
- **SA-C21 — Pullback-domain characterization.** `x ∈ dom(e⁻¹ A e)` exactly when `e x ∈ dom A`.
- **SA-C22 — Pullback action.** `(e⁻¹ A e) x = e⁻¹(A(e x))` on the pullback domain.
- **SA-C23 — Density under pullback.** If `A` is densely defined, so is `e⁻¹ A e`.
- **SA-C24 — Closedness under pullback.** If `A` is closed, so is `e⁻¹ A e`, its graph being the
  preimage of the graph of `A` under the homeomorphism `e × e`.
- **SA-C25 — Unitary conjugation.** For a linear isometric equivalence `U : H ≃ₗᵢ H′` and a partial
  operator `A` on `H`, `U A U⁻¹` is the partial operator on `H′` with domain `U(dom A)`.
  *In Tau Ceti:* `LinearPMap.unitaryConj`.
- **SA-C26 — Unitary-conjugation domain.** `x ∈ dom(U A U⁻¹)` exactly when `U⁻¹ x ∈ dom A`.
  *In Tau Ceti:* `LinearPMap.mem_unitaryConj_domain_iff`.
- **SA-C27 — Unitary-conjugation action.** `(U A U⁻¹) x = U(A(U⁻¹ x))` on its domain.
  *In Tau Ceti:* `LinearPMap.unitaryConj_apply`, `LinearPMap.unitaryConj_apply_map`.
- **SA-C28 — Self-adjointness under unitary conjugation.** If `A` is self-adjoint, so is `U A U⁻¹`.
  *In Tau Ceti:* `LinearPMap.isSelfAdjoint_unitaryConj`.
- **SA-C29 — Direct sum of partial operators.** For partial operators `A` on `E` and `B` on `F`,
  `A ⊕ B` is the partial operator on the Hilbert product `WithLp 2 (E × F)` with domain the product of
  the two domains, transported through the `WithLp` identification, under which `(x, y)` is written
  in SA-C30 and SA-C31.
  *In Tau Ceti:* `LinearPMap.withLpProdMap`, `LinearPMap.withLpProdMap_domain`.
- **SA-C30 — Direct-sum domain.** `(x, y) ∈ dom(A ⊕ B)` exactly when `x ∈ dom A` and `y ∈ dom B`.
  *In Tau Ceti:* `LinearPMap.mem_withLpProdMap_domain`.
- **SA-C31 — Direct-sum action.** `(A ⊕ B)(x, y) = (A x, B y)` on the direct-sum domain.
  *In Tau Ceti:* `LinearPMap.withLpProdMap_apply_fst`, `LinearPMap.withLpProdMap_apply_snd`, `LinearPMap.withLpProdMap_apply_toLp`.
- **SA-C32 — Density of direct sums.** The direct sum of densely defined partial operators is
  densely defined.
  *In Tau Ceti:* `LinearPMap.dense_withLpProdMap_domain`.
- **SA-C33 — Closedness of direct sums.** The direct sum of closed partial operators is closed.
  *In Tau Ceti:* `LinearPMap.IsClosed.withLpProdMap`, `LinearPMap.isClosed_withLpProdMap_iff`.

### C.3 Graph norm and graph cores

The graph norm measures ambient and image size together on `dom A`. Sequential graph cores
package the two convergences used to extend identities through closedness.

- **SA-C34 — Graph norm.** On `dom A`, `‖x‖_A = √(‖x‖² + ‖A x‖²)`, the norm of `(x, A x)` in the
  Hilbert product `WithLp 2 (E × F)`.
- **SA-C35 — Nonnegativity of the graph norm.** `0 ≤ ‖x‖_A` for every `x ∈ dom A`.
- **SA-C36 — Graph-norm square identity.** `‖x‖_A² = ‖x‖² + ‖A x‖²` for every `x ∈ dom A`.
- **SA-C37 — Ambient norm controlled by graph norm.** `‖x‖ ≤ ‖x‖_A` for every `x ∈ dom A`.
- **SA-C38 — Image norm controlled by graph norm.** `‖A x‖ ≤ ‖x‖_A` for every `x ∈ dom A`.
- **SA-C39 — Graph core.** A subspace `D ⊆ dom A` is a graph core of `A` when every `x ∈ dom A` is the
  limit of a sequence `x_n ∈ D` with `A x_n → A x`, that is, when `D` is dense in `dom A` for the graph
  norm.
  *In Mathlib:* `LinearPMap.HasCore`.
- **SA-C40 — Full domain as graph core.** `dom A` is a graph core of `A`.
  *In Mathlib:* `LinearPMap.HasCore`.
- **SA-C41 — Closed-graph characterization.** For a partial operator `A`, the following are
  equivalent: `A` is closed; its graph is closed in `E × F`; whenever `x_n ∈ dom A`, `x_n → x` and
  `A x_n → y`, then `x ∈ dom A` and `A x = y`.
  *In Mathlib:* `LinearPMap.IsClosed`.
  *In Tau Ceti:* `LinearPMap.IsClosed.mem_domain_of_tendsto`.
- **SA-C42 — Extension from a graph core.** If `D` is a graph core of `A` and the graph of `A`
  restricted to `D` lies in a closed set (for instance the graph of a closed operator `B`), the whole
  graph of `A` lies in it: an operator identity valid on a graph core extends to the whole domain.
  *In Tau Ceti:* `LinearPMap.HasCore.graph_subset_of_isClosed`, `LinearPMap.HasCore.of_graph_subset_closure`.
- **SA-C43 — Bounded graph-norm equivalence.** For a bounded total operator `T`,
  `‖x‖ ≤ ‖x‖_T ≤ √(1 + ‖T‖²) ‖x‖` for every `x`.
  *In Mathlib:* `ContinuousLinearMap.le_opNorm`.

### C.4 Relative boundedness and perturbations

Relative boundedness compares a domain-defined perturbation with the ambient and graph terms of
the base operator. The perturbation constructors keep the base domain explicit and support the
bounded and Kato–Rellich self-adjointness theorems.

- **SA-C44 — Relative boundedness.** For a partial operator `A : E →ₗ.[𝕜] F` and a linear map `V`
  defined on `dom A` (a partial map whose domain contains `dom A`) with values in `G`, `V` is
  relatively `A`-bounded with coefficients `a, b ≥ 0` when `‖V x‖ ≤ a ‖x‖ + b ‖A x‖` for every
  `x ∈ dom A`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded`.
- **SA-C45 — Zero relative perturbation.** The zero map is relatively bounded with coefficients
  `(0, 0)`.
  *In Tau Ceti:* `LinearPMap.isRelativelyBounded_zero`.
- **SA-C46 — Monotonicity of relative bounds.** Relative boundedness with `(a, b)` gives it with
  every `(a′, b′)` with `a ≤ a′`, `b ≤ b′`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded.mono`.
- **SA-C47 — Addition of relatively bounded maps.** If `V` has `(a, b)` and `W` has `(a′, b′)`, then
  `V + W` has `(a + a′, b + b′)`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded.add`.
- **SA-C48 — Scalar multiplication of relatively bounded maps.** If `V` has `(a, b)`, then `c V` has
  `(|c| a, |c| b)`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded.smul`.
- **SA-C49 — Negation of relatively bounded maps.** `−V` has the same coefficients as `V`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded.neg`.
- **SA-C50 — Subtraction of relatively bounded maps.** If `V` has `(a, b)` and `W` has `(a′, b′)`,
  then `V − W` has `(a + a′, b + b′)`.
  *In Tau Ceti:* `LinearPMap.IsRelativelyBounded.sub`.
- **SA-C51 — Restriction of a bounded perturbation to the domain.** A bounded operator `V` on the
  ambient space restricts to a map on `dom A` that is relatively `A`-bounded with coefficients
  `(‖V‖, 0)`.
  *In Tau Ceti:* `ContinuousLinearMap.isRelativelyBounded_toPMap`.
- **SA-C52 — Domain-defined perturbation.** For a linear map `V : dom A → F`, the perturbation
  `A + V` is the partial operator with domain `dom A` and `(A + V) x = A x + V x`.
  *In Tau Ceti:* `LinearPMap.perturb`.
- **SA-C53 — Bounded perturbation as a domain map.** A bounded ambient operator `V`, restricted to
  `dom A`, gives the domain-defined perturbation `A + V` of SA-C52, with domain `dom A`.
  *In Tau Ceti:* `LinearPMap.perturb`.
- **SA-C54 — Bounded Kato–Rellich theorem.** If `A` is self-adjoint and `V` bounded self-adjoint,
  then `A + V` is self-adjoint on `dom A`.
  *In Tau Ceti:* `LinearPMap.isSelfAdjoint_perturb_bounded`.
- **SA-C55 — Kato–Rellich theorem.** If `A` is self-adjoint and `V` is symmetric on `dom A` and
  relatively `A`-bounded with coefficients `(a, b)`, `b < 1`, then `A + V` is self-adjoint on `dom A`.
  *In Tau Ceti:* `IsSelfAdjoint.add_of_isRelativelyBounded`.
- **SA-C56 — Bounded self-adjoint operators as total partial operators.** A bounded self-adjoint
  operator, regarded as a partial operator with domain the whole space, is self-adjoint.
  *In Tau Ceti:* `LinearPMap.isSelfAdjoint_toPMap_top`.

### C.5 Real spectral separation

The resolvent set and spectrum of a partial operator are those of SA-D01–SA-D02. For a partial
operator over `𝕜`, its real spectral points are the `s ∈ ℝ` with `(s : 𝕜)` in its spectrum; real
spectral separation uses subsets of them. SA-D01–SA-D02 precede SA-C62–SA-C65.

- **SA-C62 — Separation of real spectral sets.** For partial operators `A`, `B`, sets `s`, `t ⊆ ℝ`
  and `d > 0`, `s` and `t` are separated by `d` when `d ≤ |a − b|` for every real spectral point `a` of
  `A` in `s` and every real spectral point `b` of `B` in `t`.
  *In Tau Ceti:* `LinearPMap.SpectralSetsSeparated`.
- **SA-C63 — Symmetry of real spectral separation.** Swapping the two operators and the two sets
  preserves separation.
  *In Tau Ceti:* `LinearPMap.SpectralSetsSeparated.symm`.
- **SA-C64 — Monotonicity in the gap.** Separation by `d` gives separation by every `d′` with
  `0 < d′ ≤ d`.
  *In Tau Ceti:* `LinearPMap.SpectralSetsSeparated.mono_gap`.
- **SA-C65 — Monotonicity in the spectral sets.** Separation of `s`, `t` gives separation of every
  `s′ ⊆ s`, `t′ ⊆ t`.
  *In Tau Ceti:* `LinearPMap.SpectralSetsSeparated.mono_sets`.

### C.6 Domain-aware Sylvester equations

The rectangular Sylvester equation packages `A X − X B = C` together with domain transport between
possibly different spaces. Its linear structure is the interface consumed by quantitative
Sylvester estimates (SpectralSubspacePerturbation).

- **SA-C66 — Rectangular Sylvester equation.** For partial operators `A` on `E`, `B` on `F` and
  bounded `X, C : F → E`, the domain-aware Sylvester equation holds when `X(dom B) ⊆ dom A` and
  `A X x − X B x = C x` for every `x ∈ dom B`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation`.
- **SA-C67 — Bounded Sylvester specialization.** For bounded everywhere-defined `A`, `B`, the
  operator identity `A X − X B = C` gives the domain-aware equation of SA-C66.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.ofBounded`.
- **SA-C68 — Zero solution.** `X = 0` solves the equation with `C = 0`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.zero`.
- **SA-C69 — Addition of Sylvester equations.** If `X` solves it with `C` and `X′` with `C′`, then
  `X + X′` solves it with `C + C′`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.add`.
- **SA-C70 — Negation of Sylvester equations.** `−X` solves it with `−C`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.neg`.
- **SA-C71 — Subtraction of Sylvester equations.** `X − X′` solves it with `C − C′`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.sub`.
- **SA-C72 — Scalar multiplication of Sylvester equations.** `c X` solves it with `c C`.
  *In Tau Ceti:* `LinearPMap.SylvesterEquation.smul`.

### C.7 Quadratic-form bounds

Lower and upper form bounds are the order language for spectral location on a subspace. For a
bounded operator `T` on an inner product space over `𝕜`, a subspace `U` and real `c`:

- **SA-C76 — Lower form bound on a subspace.** `T` has lower form bound `c` on `U` when
  `c ‖x‖² ≤ Re ⟪T x, x⟫` for every `x ∈ U`.
  *In Tau Ceti:* `ContinuousLinearMap.LowerFormBoundOn`, `ContinuousLinearMap.lowerFormBoundOn_iff`.
- **SA-C77 — Upper form bound on a subspace.** `T` has upper form bound `c` on `U` when
  `Re ⟪T x, x⟫ ≤ c ‖x‖²` for every `x ∈ U`.
  *In Tau Ceti:* `ContinuousLinearMap.UpperFormBoundOn`, `ContinuousLinearMap.upperFormBoundOn_iff`.
- **SA-C78 — Lower-bound monotonicity in the constant.** A lower form bound `c` on `U` gives every
  lower form bound `c′ ≤ c` on `U`.
  *In Tau Ceti:* `ContinuousLinearMap.LowerFormBoundOn.mono_const`.
- **SA-C79 — Lower-bound restriction to subspaces.** A lower form bound on `U` holds on every
  subspace `U′ ⊆ U`.
  *In Tau Ceti:* `ContinuousLinearMap.LowerFormBoundOn.mono_subspace`.
- **SA-C80 — Upper-bound monotonicity in the constant.** An upper form bound `c` on `U` gives every
  upper form bound `c′ ≥ c` on `U`.
  *In Tau Ceti:* `ContinuousLinearMap.UpperFormBoundOn.mono_const`.
- **SA-C81 — Upper-bound restriction to subspaces.** An upper form bound on `U` holds on every
  subspace `U′ ⊆ U`.
  *In Tau Ceti:* `ContinuousLinearMap.UpperFormBoundOn.mono_subspace`.
- **SA-C82 — Positivity gives the zero lower bound.** A positive bounded operator (Mathlib's
  `ContinuousLinearMap.IsPositive`) has lower form bound `0` on the whole space.
  *In Tau Ceti:* `ContinuousLinearMap.IsPositive.lowerFormBoundOn_top`.
- **SA-C83 — Zero lower bound characterizes positivity.** A symmetric bounded operator with lower
  form bound `0` on the whole space is positive.
  *In Tau Ceti:* `ContinuousLinearMap.isPositive_of_lowerFormBoundOn_top`.
- **SA-C84 — Lower form bound from restriction spectrum.** For a bounded symmetric operator `T` on
  a complex Hilbert space and a closed subspace `U` with `T U ⊆ U`, if the spectrum of the
  restriction `T|_U` (in the Banach algebra of bounded operators on `U`) lies in `[c, ∞)`, then
  `c ‖x‖² ≤ Re ⟪T x, x⟫` for every `x ∈ U`.
- **SA-C85 — Upper form bound from restriction spectrum.** Under the same hypotheses, if the
  spectrum of `T|_U` lies in `(−∞, c]`, then `Re ⟪T x, x⟫ ≤ c ‖x‖²` for every `x ∈ U`.

  SA-C84 and SA-C85 apply the bounded criteria SA-B32 and SA-B33 to the bounded self-adjoint
  operator `T|_U` on the Hilbert space `U` (Teschl2009, Theorem 2.18, p. 77, line 3170, gives `A ≥ c`
  exactly when `σ(A) ⊆ [c, ∞)`).

  *Needs:* SA-B32, SA-B33; Mathlib `LinearMap.IsSymmetric.restrict_invariant`,
  `algebraMap_le_iff_le_spectrum`.

**Checks.**

- For `T = diag(0, 1)` on `ℂ²`, `U = ℂ e₂` is invariant, `σ(T|_U) = {1}`, and `T` has lower form bound
  `1` on `U` but only `0` on `ℂ²`.
- The symmetry hypothesis of SA-C83 is needed: the rotation by `π/2` on `ℝ²` has `⟪T x, x⟫ = 0` for
  every `x`, so lower form bound `0`, but it is not symmetric, hence not positive.

### C.8 Compact normal operators

- **SA-C86 — Compact normal spectral decomposition.** Prove
  `exists_hilbertBasis_forall_hasEigenvector_of_isStarNormal`: a compact normal operator `T` on a
  complex Hilbert space has a Hilbert basis of eigenvectors (Teschl2009, Theorem 6.6, p. 136, line
  5757, for the self-adjoint case). Then define, for each nonzero eigenvalue `λ` of `T`, the
  eigenprojection `P_λ` onto the eigenspace of `λ`, and prove:
  - the eigenspaces of distinct eigenvalues are orthogonal, `T* x = conj(λ) x` whenever `T x = λ x`,
    and `H` is the orthogonal sum of the kernel of `T` and the closure of the sum of the nonzero
    eigenspaces;
  - the nonzero eigenvalues are countable, have finite multiplicity and accumulate only at `0`
    (Teschl2009, Theorem 6.6, p. 136, line 5757, for self-adjoint `T`);
  - `Σ_{λ ∈ F} λ P_λ → T` in operator norm as the finite set `F` exhausts the nonzero eigenvalues,
    with `‖T − Σ_{λ ∈ F} λ P_λ‖ = sup_{λ ∉ F} |λ|` (the supremum over an empty tail being `0`); the
    expansion is Teschl2009, (6.5), p. 136, line 5765, for self-adjoint `T`;
  - the comparisons of the eigenbasis with multiplicities, the kernel and finite-rank
    approximation, including finite and zero spectra.

  The route writes `T = X + i Y` with `X = (T + T*)/2` and `Y = (T − T*)/(2i)`, commuting compact
  self-adjoint operators; each eigenspace of `X` is invariant under `Y`; on each nonzero eigenspace
  of `X`, finite-dimensional by BanachAlgebras §8.1, diagonalise `Y`; on the kernel of `X` apply the
  compact self-adjoint eigenbasis to the restriction of `Y`; the eigenspaces of `X` span a dense
  subspace, and joint eigenvectors of `X` and `Y` are eigenvectors of `T`. This does not use a
  projection-valued measure.

  *Needs:* Tau Ceti `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`; Mathlib
  `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot`,
  `LinearMap.IsSymmetric.iSup_eigenspace_inf_eigenspace_of_commute`,
  `LinearMap.IsSymmetric.orthogonalFamily_eigenspace_inf_eigenspace`, `HilbertBasis`,
  `IsCompactOperator`; BanachAlgebras §8.1.

  **Checks.**

  - The Jordan block with rows `(0, 1)`, `(0, 0)` on `ℂ²` is compact but not normal, and its only
    eigenvectors are multiples of `e₁`: normality is needed.
  - Multiplication by `t` on `L²[0, 1]` is normal (self-adjoint) but not compact and has no
    eigenvectors: compactness is needed.
  - The rotation with rows `(0, −1)`, `(1, 0)` is normal and not self-adjoint, with eigenvalues `±i` and
    eigenvectors `(1, ∓i)/√2`: the theorem goes beyond the self-adjoint case.
  - For `diag(1/(n+1))` on `ℓ²`, the tail after the first `N` eigenvalues has norm `1/(N+1)`, `0` is in
    the spectrum but is not an eigenvalue, and the kernel is `0`.

### C.9 Finite Euclidean operator norms

- **SA-C87 — Finite Euclidean operator norms.** For a complex `n × n` matrix `T` acting on `ℂⁿ` with
  the Euclidean norm, `n ≥ 1`, `‖T‖² = max σ(T* T)`, and a unit eigenvector of `T* T` for its largest
  eigenvalue attains the norm; for `n = 0`, `‖T‖ = 0`. This is the Euclidean operator norm, not the
  entrywise matrix norm, and it uses Mathlib's finite-dimensional spectral theory, not SA-C86.

  **Checks.**

  - On `ℂ⁵` let `T` have rows `(3, 8, 0, −10, 2)`, `(−3, 4, 1, 0, −7)`, `(3, −4, 1, 0, 7)`,
    `(3, 4, 0, 15, −3)`, `(3, −4, 0, −5, −13)`. Its columns are orthogonal with squared norms
    `45, 128, 2, 350, 280`, so `T*T = diag(45, 128, 2, 350, 280)`: the standard basis is an eigenbasis
    of the compact normal `T*T`, and `‖T‖ = √350` by `‖T‖² = ‖T*T‖`, attained at `e₄`. The entrywise
    maximum `15` and the Frobenius norm `√805` both differ from `√350`.

**Milestone C1 — domain geometry and transport.** SA-C01–SA-C43.

**Milestone C2 — perturbation, spectral separation, and Sylvester vocabulary.** SA-C44–SA-C56,
SA-C62–SA-C72.

**Milestone C3 — form-bound vocabulary and spectral bridges.** SA-C76–SA-C85.

**Milestone C4 — compact normal operators.** SA-C86, with BanachAlgebras §8.1.

**Milestone C5 — finite matrix norms.** SA-C87, using Mathlib's matrix theory.

### Examples

- A bounded self-adjoint operator is self-adjoint as a total partial operator (SA-C56); for a
  bounded operator the graph norm is equivalent to the norm (SA-C43); the full domain is a graph
  core (SA-C40).
- For the zero operator every Hilbert basis is an eigenbasis, with all eigenvalues `0`, and the
  eigen-expansion is the empty sum.
- For a finite-rank orthogonal projection `Q`, the eigenvalues are `0` and `1` with `P_1 = Q`.

### Dependencies

- C.1–C.4 need Mathlib and Tau Ceti's partial operators; C.5 needs SA-D01–SA-D02; C.6 needs C.1;
  C.7 needs SA-B32–SA-B33 for SA-C84–SA-C85 and Mathlib otherwise; C.8 needs BanachAlgebras §8.1 and
  the compact self-adjoint eigenbasis at the Tau Ceti pin, and nothing from Part B; C.9 needs
  Mathlib only.

## Part D: Resolvents of self-adjoint `LinearPMap` operators, and semiboundedness

Part D builds on the scalar-generic resolvent core of partial operators, with the convention
`R(z) = (z • 1 − A)⁻¹`. D.1 holds over a nontrivially normed field `𝕜` on a normed space `X`: the
algebraic inverse and domain identities need nothing more, while Neumann perturbation, openness,
the local `Ring.inverse` formula and analyticity also need `X` complete. D.2–D.4 work over `𝕜 = ℝ`
or `ℂ` on a Hilbert space, complex where a statement uses `i`. The Cayley transform converts an
unbounded self-adjoint operator into a bounded unitary, the input of Part E's spectral measure.

### D.1 Resolvent algebra

The resolvent set records the shifts `z • 1 − A` with bounded two-sided inverses into the domain.
The resolvent identity, commutation, openness and spectral mapping form the algebraic layer for
the self-adjoint estimates.

- **SA-D01 — Resolvent core of a partial operator.** A scalar `z` is a resolvent point of
  `A : X →ₗ.[𝕜] X` with resolvent `R` when `R` is a bounded operator on `X` with range in `dom A`,
  `R(z x − A x) = x` for `x ∈ dom A` and `z R y − A R y = y` for every `y`; then `z • 1 − A` is a
  bijection from `dom A` onto `X`. The resolvent set `ρ(A)` is the set of resolvent points. If
  `A ≤ B` and some `z` lies in both `ρ(A)` and `ρ(B)`, then `A = B`; and `R(z)(A x) = A(R(z) x)` for
  `x ∈ dom A`.
  *In Tau Ceti:* `LinearPMap.IsResolventAt`, `LinearPMap.resolventSet`, `LinearPMap.mem_resolventSet_iff`, `LinearPMap.IsResolventAt.smul_sub_bijective`, `LinearPMap.eq_of_le_of_mem_resolventSet`, `LinearPMap.resolvent_apply_comm`.
- **SA-D02 — Spectrum of a partial operator.** `σ(A)` is the complement of `ρ(A)` in `𝕜`.
  *In Tau Ceti:* `LinearPMap.spectrum`, `LinearPMap.mem_spectrum_iff`.
- **SA-D03 — Named resolvent.** For `z ∈ ρ(A)`, `R(z)` is the bounded two-sided inverse of
  `z • 1 − A`.
  *In Tau Ceti:* `LinearPMap.resolvent`, `LinearPMap.isResolventAt_resolvent`.
- **SA-D04 — Uniqueness of the resolvent.** Two bounded operators satisfying the two-sided inverse
  laws for `z • 1 − A` are equal.
  *In Tau Ceti:* `LinearPMap.IsResolventAt.unique`.
- **SA-D05 — Left inverse law.** `R(z)(z x − A x) = x` for `x ∈ dom A`.
  *In Tau Ceti:* `LinearPMap.resolvent_smul_sub_apply`.
- **SA-D06 — Range in the domain.** `R(z) y ∈ dom A` for every `y`.
  *In Tau Ceti:* `LinearPMap.resolvent_mem_domain`.
- **SA-D07 — Right inverse law.** `(z • 1 − A) R(z) y = y` for every `y`.
  *In Tau Ceti:* `LinearPMap.smul_sub_apply_resolvent`.
- **SA-D08 — First resolvent identity.** For `w, z ∈ ρ(A)`, `R(w) − R(z) = (z − w) R(w) R(z)`.
  *In Tau Ceti:* `LinearPMap.resolvent_sub_resolvent`.
- **SA-D09 — Commutation of resolvents.** For `w, z ∈ ρ(A)`, `R(w) R(z) = R(z) R(w)`.
  *In Tau Ceti:* `LinearPMap.resolvent_comm`.
- **SA-D10 — Resolvent spectral mapping in the exclusion direction.** For `z ∈ ρ(A)` and `μ ≠ 0`,
  `μ` lies outside the Banach-algebra spectrum of `R(z)` exactly when `z − μ⁻¹ ∈ ρ(A)`; in particular
  `z − μ⁻¹ ∈ ρ(A)` excludes `μ` from the spectrum of `R(z)`.
  *In Tau Ceti:* `TauCeti.LinearPMap.notMem_spectrum_resolvent_iff`.
- **SA-D11 — Openness of the resolvent set.** On a Banach space, `ρ(A)` is open: if `w ∈ ρ(A)` and
  `‖z − w‖ ‖R(w)‖ < 1`, then `z ∈ ρ(A)`.
  *In Tau Ceti:* `LinearPMap.isOpen_resolventSet`, `TauCeti.LinearPMap.mem_resolventSet_of_norm_mul_lt_one`.
- **SA-D12 — Closedness of the spectrum.** On a Banach space, `σ(A)` is closed.
  *In Tau Ceti:* `LinearPMap.isClosed_spectrum`.
- **SA-D13 — Measurability of the real spectrum.** For a complex partial operator on a Banach space,
  the real spectrum `{s ∈ ℝ : (s : ℂ) ∈ σ(A)}` is closed, hence a Borel subset of `ℝ`.
  *In Tau Ceti:* `LinearPMap.isClosed_preimage_ofReal_spectrum`, `LinearPMap.measurableSet_preimage_ofReal_spectrum`.

### D.2 Self-adjoint resolvent estimates

Symmetry gives the off-real lower bound, and self-adjointness upgrades it to surjectivity and the
sharp resolvent bound. Real spectral gaps give the corresponding shifted inverse bounds.

- **SA-D14 — Off-real lower bound.** For symmetric `A` over `𝕜`, `|Im z| ‖x‖ ≤ ‖z x − A x‖` for every
  `x ∈ dom A` and every `z ∈ 𝕜`.
  *In Tau Ceti:* `LinearPMap.IsFormalAdjoint.abs_im_mul_norm_le_norm_smul_sub`.
- **SA-D15 — Closed range off the real axis.** For closed symmetric `A` on a Hilbert space (in
  particular for self-adjoint `A`) and `Im z ≠ 0`, the range of `z • 1 − A` is closed.
  *In Tau Ceti:* `LinearPMap.IsFormalAdjoint.isClosed_range_smul_sub`.
- **SA-D16 — Dense range off the real axis.** For self-adjoint `A` and `Im z ≠ 0`, the range of
  `z • 1 − A` is dense.
  *In Tau Ceti:* `IsSelfAdjoint.denseRange_smul_sub`.
- **SA-D17 — Nonreal points are resolvent points.** If `A` is self-adjoint and `Im z ≠ 0`, then
  `z ∈ ρ(A)`; `z • 1 − A` is then a bijection from `dom A` onto `H`.
  *In Tau Ceti:* `IsSelfAdjoint.mem_resolventSet_of_im_ne_zero`, `IsSelfAdjoint.smul_sub_surjective`, `IsSelfAdjoint.smul_sub_bijective`.
- **SA-D18 — Reality of the spectrum.** The spectrum of a self-adjoint partial operator lies in the
  real axis.
  *In Tau Ceti:* `IsSelfAdjoint.spectrum_subset_im_eq_zero`.
- **SA-D19 — Quantitative resolvent bound.** If `A` is self-adjoint and `Im z ≠ 0`, then
  `‖R(z)‖ ≤ |Im z|⁻¹`; at a resolvent point with `Im z ≠ 0` symmetry alone gives the bound.
  *In Tau Ceti:* `IsSelfAdjoint.norm_resolvent_le`, `LinearPMap.IsFormalAdjoint.norm_resolvent_le`.
- **SA-D20 — Adjoint of the resolvent.** For self-adjoint `A` and `z ∈ ρ(A)`, `conj z ∈ ρ(A)` and
  `R(z)* = R(conj z)`.
  *In Tau Ceti:* `IsSelfAdjoint.conj_mem_resolventSet`, `IsSelfAdjoint.adjoint_resolvent`.
- **SA-D21 — Real resolvents are self-adjoint.** At a real resolvent point of self-adjoint `A`,
  `R(z)` is self-adjoint.
  *In Tau Ceti:* `IsSelfAdjoint.isSelfAdjoint_resolvent`.
- **SA-D22 — Resolvent from a lower bound.** Let `A` be self-adjoint on a complete Hilbert space over
  `𝕜` and `z ∈ 𝕜` (in particular `z` real). If `c > 0` and `c ‖x‖ ≤ ‖z x − A x‖` for every `x ∈ dom A`,
  then `z ∈ ρ(A)` and `‖R(z)‖ ≤ c⁻¹`.
  *In Tau Ceti:* `IsSelfAdjoint.mem_resolventSet_of_norm_le`, `IsSelfAdjoint.norm_resolvent_le_of_norm_le`.
- **SA-D23 — Shifted inverse across a spectral gap.** For self-adjoint `A` on a complex Hilbert
  space, real `c` and `s > 0`, if `σ(A)` is disjoint from `(c − s, c + s)`, then `c ∈ ρ(A)`,
  `‖R(c)‖ ≤ s⁻¹`, and `s ‖x‖ ≤ ‖c x − A x‖` for every `x ∈ dom A`.
  *In Tau Ceti:* `IsSelfAdjoint.norm_resolvent_le_of_spectrum_gap`, `IsSelfAdjoint.mul_norm_le_norm_smul_sub_of_spectrum_gap`.

### D.3 Cayley transform and C*-gap inverse

- **SA-D24 — Cayley transform.** For a complex partial operator `A` with `−i ∈ ρ(A)`, the Cayley
  transform is `U_A = 1 + 2 i R(−i)`, the bounded form of `(A − i)(A + i)⁻¹`; on `dom A`,
  `U_A(A x + i x) = A x − i x`.
  *In Tau Ceti:* `LinearPMap.cayley`, `LinearPMap.cayley_apply`, `LinearPMap.cayley_neg_I_smul_sub_apply`.
- **SA-D25 — Cayley norm preservation.** For self-adjoint `A`, `‖U_A x‖ = ‖x‖` for every `x`.
  *In Tau Ceti:* `IsSelfAdjoint.norm_cayley_apply`.
- **SA-D26 — Cayley surjectivity.** For self-adjoint `A`, `U_A` is surjective.
  *In Tau Ceti:* `IsSelfAdjoint.cayley_surjective`.
- **SA-D27 — Cayley unitarity.** For self-adjoint `A`, `U_A` is unitary.
  *In Tau Ceti:* `IsSelfAdjoint.cayley_mem_unitary`.
- **SA-D28 — Cayley normality.** For self-adjoint `A`, `U_A` is star-normal.
  *In Tau Ceti:* `IsSelfAdjoint.isStarNormal_cayley`.
- **SA-D29 — Norm/spectrum interval characterization.** For a self-adjoint element `a` of a
  C*-algebra and `r ≥ 0`, `‖a‖ ≤ r` exactly when `σ(a) ⊆ [−r, r]`.
  *In Tau Ceti:* `IsSelfAdjoint.norm_le_iff_spectrum_subset_Icc`.
- **SA-D30 — C*-spectral-gap inverse.** If the spectrum of a self-adjoint element `a` of a
  C*-algebra avoids `(−r, r)` with `r > 0`, then `a` is invertible and `‖a⁻¹‖ ≤ r⁻¹`.
  *In Tau Ceti:* `IsSelfAdjoint.isUnit_and_norm_ringInverse_le`.

### D.4 Intertwining

Domain-aware intertwining passes through resolvents, Cayley transforms and their continuous
functional calculi.

- **SA-D31 — Domain-aware intertwining relation.** For partial operators `A` on `E`, `B` on `F` and
  bounded `X : E → F`, `X A ⊆ B X` means `X(dom A) ⊆ dom B` and `X(A x) = B(X x)` for `x ∈ dom A`; for
  bounded total `A`, `B` it is `X A = B X`.
  *In Tau Ceti:* `LinearPMap.Intertwines`, `ContinuousLinearMap.intertwines_toPMap_top_iff`.
- **SA-D32 — Resolvent intertwining.** If `z ∈ ρ(A) ∩ ρ(B)`, then `X A ⊆ B X` exactly when
  `X R_A(z) = R_B(z) X`.
  *In Tau Ceti:* `LinearPMap.intertwines_iff_comp_resolvent_eq`.
- **SA-D33 — Cayley intertwining.** If `−i ∈ ρ(A) ∩ ρ(B)` (in particular for self-adjoint `A`, `B`),
  then `X A ⊆ B X` exactly when `X U_A = U_B X`.
  *In Tau Ceti:* `LinearPMap.intertwines_iff_comp_cayley_eq`, `LinearPMap.Intertwines.comp_cayley_eq`.
- **SA-D34 — Continuous-calculus intertwining.** Under the hypotheses of SA-D33, with `A`, `B`
  self-adjoint, `X f(U_A) = f(U_B) X` for every `f` continuous on the spectra of `U_A` and `U_B`
  (subsets of the unit circle).
  *In Tau Ceti:* `LinearPMap.Intertwines.comp_cfc_cayley_eq`.

### D.5 Completion statements

The characterisation and analyticity statements complete the general resolvent interface; the
bounded-operator bridges connect it to Mathlib's Banach-algebra spectrum.

- **SA-D35 — Resolvent characterization.** On a Banach space, `z ∈ ρ(A)` exactly when `z • 1 − A` is
  injective with closed dense range and its inverse on the range extends to a bounded operator;
  equivalently, when the range of `z • 1 − A` is closed and dense and `c ‖x‖ ≤ ‖z x − A x‖` on `dom A`
  for some `c > 0`. Then `A` is closed.
  *In Tau Ceti:* `LinearPMap.mem_resolventSet_iff_isClosed_denseRange_norm_le`, `LinearPMap.mem_resolventSet_iff_isClosed_denseRange_apply_smul_sub`, `LinearPMap.isClosed_of_mem_resolventSet`.
- **SA-D36 — Analyticity of the resolvent.** On a Banach space, `z ↦ R(z)` is analytic in operator
  norm on `ρ(A)`.
  *In Tau Ceti:* `LinearPMap.analyticOnNhd_resolvent`, `TauCeti.LinearPMap.analyticAt_resolvent`.
- **SA-D37 — Bounded-operator resolvent-set bridge.** For a bounded operator `T` regarded as a
  total partial operator, `ρ(T)` is the complement of Mathlib's Banach-algebra spectrum of `T`, and
  the two spectra agree.
  *In Tau Ceti:* `ContinuousLinearMap.mem_resolventSet_toPMap_top_iff`, `ContinuousLinearMap.spectrum_toPMap_top`.
- **SA-D38 — Bounded-operator resolvent bridge.** Under SA-D37, `R(z)` is the Banach-algebra
  resolvent `(z − T)⁻¹`.
  *In Tau Ceti:* `ContinuousLinearMap.resolvent_toPMap_top`.
- **SA-D39 — Neumann-series resolvent formula.** On a Banach space, if `w ∈ ρ(A)` and
  `‖w − z‖ ‖R(w)‖ < 1`, then `R(z) = Σ_{n ≥ 0} (w − z)ⁿ R(w)ⁿ⁺¹ = R(w) Σ_{n ≥ 0} ((w − z) R(w))ⁿ`, with
  convergence in operator norm and the truncation error after `N` terms at most
  `‖R(w)‖ qᴺ/(1 − q)`, `q = ‖w − z‖ ‖R(w)‖`. The explicit series is the statement; the local
  `Ring.inverse` formula is its input, not a second construction.
  *In Tau Ceti:* `LinearPMap.hasSum_resolvent`, `LinearPMap.resolvent_eq_tsum`, `LinearPMap.norm_resolvent_sub_sum_le`, `TauCeti.LinearPMap.resolvent_eq_mul_inverse_one_sub`.

**Milestone D1 — resolvent algebra and quantitative real spectrum.** SA-D01–SA-D34.

**Milestone D2 — characterization and bounded models.** SA-D35–SA-D39.

### Examples

- Quantitative off-real bounds, real lower-bound resolvents and Cayley unitarity are SA-D19,
  SA-D22 and SA-D27; the explicit Neumann series is SA-D39.
- For `A = a · 1` on `ℂ` with `a ∈ ℝ`, `R(z) = 1/(z − a)`, `‖R(z)‖ = 1/|z − a| ≤ 1/|Im z|` with equality at
  `Re z = a`, and `U_A = (a − i)/(a + i)`, of modulus `1`.
- For multiplication by `t` on `L²(ℝ)`, `σ(A) = ℝ`, `R(z)` is multiplication by `1/(z − t)`, and `U_A` is
  multiplication by `(t − i)/(t + i)`, which omits the value `1`: `1` is not an eigenvalue of `U_A`.

### Dependencies

- D.1 needs Mathlib and Tau Ceti's resolvent core; D.2 needs D.1 and SA-A21's symmetric-operator
  setting; D.3 needs D.2; D.4 needs D.1 and D.3; D.5 needs D.1.

## Part E: The spectral measure of an unbounded self-adjoint operator and Stone compatibility

Throughout, `A : H →ₗ.[ℂ] H` is self-adjoint on a complex Hilbert space, `P` is a projection-valued
measure on `ℝ` with diagonal measures `μ_ξ` and polarised measures `μ_(ξ,η)`, and
`r_z(s) = (z − s)⁻¹` is the bounded Borel symbol of a nonreal `z`. The spectral measure of `A` is
characterised by the resolvent formula; VonNeumannAlgebras V10.ClosedOperators constructs it from
the Cayley transform, and this Part shows that construction satisfies the formula, proves
uniqueness, and develops spectral subspaces, form bounds, truncations and block tools, the
spectral representation of the unitary group `U(t) = exp(i t A)` that Tau Ceti's Stone theorem
attaches to `A`, and its Yosida approximation. Part E needs Parts A, B and D, Part C's reduced
restrictions SA-C12–SA-C19, and V10.ClosedOperators.

### E.1 The spectral measure and its resolvent characterisation

Define `IsSpectralMeasure A P` to hold when `⟪ξ, R(z) ξ⟫ = ∫ (z − s)⁻¹ dμ_ξ(s)` for every `z` with
nonzero imaginary part and every `ξ`. The integrand is bounded by `|Im z|⁻¹`, so the right side is
the Borel transform of the finite measure `μ_ξ` up to sign (Teschl2009, (3.40), p. 94, line 3881).

- **SA-E01 — Spectral PVM of an unbounded self-adjoint operator.** Let `P_U` be the spectral measure
  of the Cayley transform `U_A` (SA-D24–SA-D28, SA-B30) on its spectrum in the unit circle. Define
  the measurable coordinate `κ : ℂ → ℝ` by `κ(1) = 0` and `κ(w) = Re(i(1 + w)/(1 − w))` for `w ≠ 1`, and
  let `P_A` be the reindexing of `P_U` along `κ` (SA-B25). The value chosen at `w = 1` is immaterial by
  SA-E02. Then `⟪ξ, A η⟫ = ∫ s dμ_(ξ,η)(s)` for `η` in the domain, and the domain is
  `{ξ : ∫ s² dμ_ξ(s) < ∞}`.
  *Supplied by:* VonNeumannAlgebras V10.ClosedOperators, for the construction and the
  description of `A` and its domain.
- **SA-E02 — Zero mass at the Cayley singular point.** Every diagonal measure of `P_U` gives `{1}`
  mass `0`: `1` is not an eigenvalue of `U_A`, since `U_A x = x` forces `R(−i) x = 0`.
  *Supplied by:* VonNeumannAlgebras V10.ClosedOperators.
- **SA-E03 — Spectral projection.** For a Borel set `B ⊆ ℝ`, the spectral projection `P_A(B)` is the
  value of the spectral measure at `B`.
- **SA-E05 — Resolvent formula.** `IsSpectralMeasure A P_A`: for `Im z ≠ 0` and every `ξ`,
  `⟪ξ, R(z) ξ⟫ = ∫ (z − s)⁻¹ dμ_ξ(s)`. The route checks that `r_z(P_A)` inverts `z • 1 − A`, using the
  description of `A` and its domain in SA-E01. For any `P`:
  - `IsSpectralMeasure A P` gives the polarised identity `⟪ξ, R(z) η⟫ = ∫ (z − s)⁻¹ dμ_(ξ,η)(s)` and
    the operator identity `R(z) = r_z(P)`;
  - conversely, `R(z) = r_z(P)` for all nonreal `z` implies `IsSpectralMeasure A P`;
  - with `IsSpectralMeasure A P`, `⟪ξ, A η⟫ = ∫ s dμ_(ξ,η)(s)` for `η` in the domain, and the domain is
    `{ξ : ∫ s² dμ_ξ(s) < ∞}`.
- **SA-E44 — Uniqueness of the spectral measure.** A projection-valued measure on `ℝ` whose
  diagonal measures satisfy the resolvent formula of SA-E05 is `P_A`. With SA-E05, prove
  `existsUnique_isSpectralMeasure`: a self-adjoint `A` has exactly one projection-valued measure
  on `ℝ` satisfying the resolvent formula (Teschl2009, Theorem 3.7, p. 96, line 3983;
  Schmudgen2012, Theorem 5.7). Uniqueness: the Borel transform of a finite measure on `ℝ` determines
  the measure (Stieltjes inversion, Teschl2009, Theorem 3.21, p. 108, line 4497), so two such
  measures have the same diagonal measures and are equal by SA-B23.

*Needs:* SA-B23, SA-B25, SA-B30, SA-B40, SA-B45, SA-D24–SA-D28; VonNeumannAlgebras
V10.ClosedOperators; Tau Ceti `LinearPMap.resolvent`, `IsSelfAdjoint.norm_resolvent_le`,
`MeasureTheory.Measure.ext_of_resolventTransform`, `TauCeti.ProjValMeasure.ext_of_diag`,
`TauCeti.ProjValMeasure.polarizedComplexMeasure`,
`TauCeti.ProjValMeasure.integral_polarizedComplexMeasure_eq_inner_integral`.

**Checks.**

- For `A = a · 1` on `ℂ` with `a ∈ ℝ`, `P(B) = 1_B(a) · 1` and `μ_ξ = |ξ|² δ_a`; both sides equal
  `|ξ|²/(z − a)`. Teschl's convention `(A − z)⁻¹` gives `−|ξ|²/(z − a)` and fails the formula, so the
  formula pins the sign of the resolvent.
- For `A = diag(0, 1)` on `ℂ²` and `ξ = (1, 1)`, `μ_ξ = δ₀ + δ₁` and both sides equal `1/z + 1/(z − 1)`.
- For `A = 0` on `ℂ`, the measure `B ↦ 1_B(1) · 1` gives `1/(z − 1) ≠ 1/z`: a projection-valued measure
  not tied to `A` fails the formula.
- For `H = 0` every diagonal measure is zero, both sides are `0`, and the unique measure is the zero
  field.
- For multiplication by `t` on `L²(ℝ)`, `μ_ξ` has density `|ξ(t)|²` and both sides equal
  `∫ |ξ(t)|²/(z − t) dt`.

### E.2 Spectral subspaces and spectral support

Let `P = P_A`.

- **SA-E04 — Spectral subspace.** The spectral subspace of a Borel `B ⊆ ℝ` is the range of `P(B)`.
  For bounded `B` it lies in the domain of `A`, and `‖A x‖ ≤ sup_{s ∈ B} |s| · ‖x‖` there.
- **SA-E06 — Spectral projections commute with resolvents.** For every Borel `B` and every
  `z ∈ ρ(A)`, `P(B) R(z) = R(z) P(B)`: for nonreal `z` from `R(z) = r_z(P)` and commutativity of the
  integral, and at real resolvent points through SA-E07.
- **SA-E07 — Spectral projections preserve the domain.** For every Borel `B`, `P(B)` maps the domain
  of `A` into itself, and `A P(B) x = P(B) A x` there.
- **SA-E08 — Spectral support on the spectrum.** A Borel set `B ⊆ ℝ` of resolvent points of `A`, that
  is, with `(s : ℂ) ∉ σ(A)` for every `s ∈ B`, has `P(B) = 0` (Teschl2009, Corollary 3.9, p. 97, line
  4031).
- **SA-E09 — Self-adjoint spectral restriction.** Each spectral subspace reduces `A` in the sense of
  SA-C12, by SA-E06–SA-E07 (Teschl2009, Corollary 4.6, p. 116, line 4945), and the restriction of `A`
  to it is self-adjoint, by SA-C19.
- **SA-E10 — Gap resolvent for a spectral restriction.** If `B ∩ (λ − δ, λ + δ) = ∅` for real `λ` and
  `δ > 0`, then `λ` is a resolvent point of the restriction of `A` to the range of `P(B)`, with resolvent
  norm at most `δ⁻¹`.

*Needs:* E.1, SA-C12–SA-C19; Tau Ceti `LinearPMap.IsReducing`,
`LinearPMap.IsReducing.isSelfAdjoint_restrict`, `LinearPMap.spectrum`.

**Checks.**

- For `A = diag(0, 1)`, `P((−∞, 1/2)) = e₁₁`; the restriction to `ℂ e₁` is `0`, and with `λ = 1`,
  `δ = 1/2` its resolvent at `1` is `1 ≤ δ⁻¹ = 2`.
- For multiplication by `t` on `L²(ℝ)`, `P({t₀}) = 0` for every `t₀` although every `t₀` lies in
  `σ(A) = ℝ`: a null set need not consist of resolvent points, so SA-E08 has no converse for
  arbitrary Borel sets.
- For `A = 0` on `H ≠ 0`, `P = δ₀ · 1`, `σ(A) = {0}` and `P(ℝ \ {0}) = 0`.

### E.3 Semiboundedness from spectral support

- **SA-E11 — Lower form bound from spectral support.** Prove
  `forall_le_re_inner_iff_proj_Iio_eq_zero`: for real `c`, `c ‖x‖² ≤ Re ⟪x, A x⟫` for every `x` in
  the domain exactly when `P((−∞, c)) = 0` (Teschl2009, Theorem 2.18, p. 77, line 3170, which gives
  `A ≥ c` exactly when `σ(A) ⊆ [c, ∞)`, with the remark after Theorem 3.8, p. 97, line 4030). The route
  uses the quadratic form `⟪x, A x⟫ = ∫ s dμ_x(s)` (SA-E05).
- **SA-E12 — Upper form bound from spectral support.** For real `c`, `Re ⟪x, A x⟫ ≤ c ‖x‖²` for every
  `x` in the domain exactly when `P((c, ∞)) = 0`.
- **SA-E13 — Two-sided form bounds on a spectral range.** If `B ⊆ [β, α]`, then
  `β ‖x‖² ≤ Re ⟪x, A x⟫ ≤ α ‖x‖²` for every `x` in the range of `P(B)`.

For bounded self-adjoint `T` these are SA-B32–SA-B33, the two measures agreeing by SA-E45; the
invariant-subspace forms are SA-C84–SA-C85, and the laws of form bounds under change of constant
and subspace, with positivity, are SA-C78–SA-C83.

*Needs:* E.1, E.2.

**Checks.**

- For `A = diag(0, 1)` and `c = 0`, `P((−∞, 0]) = e₁₁ ≠ 0` although the bound holds: the criterion is
  stated with the open half-line.
- Multiplication by `|t|` on `L²(ℝ)` has lower bound `0` and `P((−∞, 0)) = 0`; multiplication by `t`
  has no lower bound, and `P((−∞, c))` is multiplication by `1_(−∞,c) ≠ 0` for every `c`.
- For `H = 0` both sides hold for every `c`.

### E.4 The Yosida approximants

For `n ≥ 1`:

- **SA-E14 — Positive-shift Yosida approximant.** `A_n^+ = −n² R(i n) − i n`.
- **SA-E15 — Negative-shift Yosida approximant.** `A_n^- = −n² R(−i n) + i n`.
- **SA-E16 — Symmetrized Yosida approximant.** `yosidaApproximant A n` is
  `S_n = (A_n^+ + A_n^-)/2 = −(n²/2) (R(i n) + R(−i n))`; at `n = 0` it is `0`.
- **SA-E17 — Boundedness of the raw approximants.** `A_n^+` and `A_n^-` are bounded operators.
- **SA-E18 — Strong convergence of raw approximants on the domain.** For `x` in the domain,
  `A_n^+ x = i n R(i n) A x` and `A_n^- x = −i n R(−i n) A x`, and both converge to `A x`.
- **SA-E19 — Resolvent contraction at the positive shift.** `‖n R(i n)‖ ≤ 1` (Teschl2009, Theorem
  2.18, p. 77, line 3172).
- **SA-E20 — Resolvent contraction at the negative shift.** `‖n R(−i n)‖ ≤ 1`.
- **SA-E21 — Self-adjointness of the symmetrized approximant.** `S_n` is self-adjoint, since
  `R(i n)* = R(−i n)`, with `S_n = s_n(P)` for `s_n(s) = n² s/(n² + s²)`, by `R(z) = r_z(P)` and
  multiplicativity of the integral (Teschl2009, Theorem 3.1, p. 90, line 3687); so `‖S_n‖ ≤ n/2`.
- **SA-E23 — Commutation of Yosida approximants.** `S_m` and `S_n` commute for all `m`, `n`, and
  `S_n x → A x` for `x` in the domain.

*Needs:* E.1; SA-D08–SA-D09, SA-D19–SA-D20; Tau Ceti `LinearPMap.resolvent`,
`LinearPMap.resolvent_comm`, `IsSelfAdjoint.norm_resolvent_le`, `IsSelfAdjoint.adjoint_resolvent`.

**Checks.**

- For `A = 1` on `ℂ` and `n = 1`, `R(i) = 1/(i − 1)`, `R(−i) = 1/(−i − 1)`, their sum is `−1`, so
  `S_1 = 1/2 = n² a/(n² + a²)`.
- For the same `A`, `A_1^+ = (1 − i)/2` is not real: the raw approximant is not self-adjoint, the
  symmetrised one is.
- For `A = 0`, `S_n = 0` for every `n`.
- For multiplication by `t` on `L²(ℝ)`, `S_n` is multiplication by `n² t/(n² + t²)`, whose supremum
  `n/2` is attained at `t = n`.

### E.5 The generated group and its spectral representation

Throughout E.5–E.6, `U` is the unitary group with complex generator `i • A`, unique by Tau Ceti's
`IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.

- **SA-E26 — Generated group.** The unitary group generated by `A`, written `U(t) = exp(i t A)`, is the
  unique unitary group whose complex generator is `i A` (Stone's theorem); by SA-E27 it is the strong
  limit of the Yosida groups, and by SA-E43 it is the integral of `s ↦ exp(i t s)` against `P_A`.
  *In Tau Ceti:* `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.
- **SA-E28 — Maximality of self-adjoint operators.** If self-adjoint partial operators satisfy
  `A ≤ B`, then `A = B`.
  *In Tau Ceti:* `LinearPMap.eq_of_le_of_isSelfAdjoint`.
- **SA-E29 — Stone uniqueness.** The generator of the group `U` of SA-E26 is `A`, and a unitary group
  is determined by its generator.
  *In Tau Ceti:* `TauCeti.Semigroups.StronglyContinuousGroup.eq_of_complexGenerator_eq`, `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`.
- **SA-E43 — Packaged Stone interface.** Prove `inner_apply_eq_integral_exp`:
  `⟪ξ, U(t) ξ⟫ = ∫ exp(i t s) dμ_ξ(s)` for every `t` and `ξ` (Teschl2009, Theorem 5.1, p. 123, line
  5183, and Theorem 5.2, p. 124, line 5232, written there for `exp(−i t A)`); so
  `U(t) = ∫ exp(i t s) dP_A(s)`. The route defines `V(t)` as the integral of `s ↦ exp(i t s)`: it is a
  unitary group because the integral is a star homomorphism, and strongly continuous by dominated
  convergence (SA-B53). For `x` in the domain of `A`, `(V(t) x − x)/t → i A x` by dominated
  convergence, since `|exp(i t s) − 1| ≤ |t s|` and `∫ s² dμ_x(s) < ∞`; so `A` is contained in the Stone
  generator of `V`, both are self-adjoint, maximality (SA-E28) makes them equal, and Stone
  uniqueness (SA-E29) gives `V = U`. Conversely, for every unitary group `U′` with generator `A′`
  (SA-A02), the group generated by `A′` is `U′`. The spectral measure and the bounded models
  (SA-E45–SA-E47) are compatible with this correspondence.
- **SA-E30 — Spectral projections commute with the generated group.** For every Borel `B` and time
  `t`, `P_A(B) U(t) = U(t) P_A(B)`.
- **SA-E46 — Bounded generated-group compatibility.** For bounded self-adjoint `T` regarded as a
  total partial operator, the generated group is `t ↦ exp(i t T)`, so
  `⟪ξ, exp(i t T) ξ⟫ = ∫ exp(i t s) dμ_ξ(s)`.

*Needs:* E.1, E.2, SA-A02, SA-A22, SA-B53; Tau Ceti
`TauCeti.Semigroups.StronglyContinuousGroup.eq_of_complexGenerator_eq`,
`TauCeti.Semigroups.StronglyContinuousGroup.isSelfAdjoint_stoneGenerator`,
`LinearPMap.eq_of_le_of_isSelfAdjoint`,
`TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`,
`TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp_generator`.

**Checks.**

- For `A = a · 1` on `ℂ`, `U(t) = exp(i t a)` and both sides equal `exp(i t a) |ξ|²`; at `a = 1`,
  `t = π/2` the value is `i |ξ|²`, while Teschl's `exp(−i t A)` gives `−i |ξ|²`.
- For `A = diag(0, 1)` and `ξ = (1, 1)`, both sides equal `1 + exp(i t)`.
- For multiplication by `t` on `L²(ℝ)`, `U(t)` is multiplication by `exp(i t s)` and both sides equal
  `∫ exp(i t s) |ξ(s)|² ds`.
- At `t = 0` both sides equal `‖ξ‖²`, the total mass of `μ_ξ`.

### E.6 Yosida approximation of the generated group

- **SA-E22 — Yosida unitary group.** For each `n`, `t ↦ exp(i t S_n)` is a one-parameter unitary group
  with complex generator `i S_n` (SA-A17, SA-A23).
- **SA-E24 — Uniform compact-time Cauchy estimate.** For every vector `ψ`, the vectors
  `exp(i t S_n) ψ` form a Cauchy sequence uniformly for `t` in compact intervals. For `ψ` in the
  domain this follows from the Duhamel estimate SA-A20, `‖exp(i t S_m) ψ − exp(i t S_n) ψ‖ ≤
  |t| ‖(S_m − S_n) ψ‖`, with SA-E23; density of the domain and unitarity extend it to every `ψ`.
- **SA-E25 — Strong limit group.** The pointwise strong limit of the Yosida unitary groups is a
  one-parameter unitary group.
- **SA-E27 — Strong convergence to the generated group.** Prove
  `tendsto_ofBoundedExp_yosidaApproximant`: `exp(i t S_n) ψ → U(t) ψ` for every `t` and `ψ`. In
  Teschl2009 this follows from strong resolvent convergence of `S_n` to `A` (Lemma 6.36, p. 155, line
  6655, with core the domain of `A`, and Theorem 6.31, p. 154, line 6602). The route here stays in the
  bounded calculus of `P`: `exp(i t S_n)` is the integral of `s ↦ exp(i t s_n(s))`, by `S_n = s_n(P)`
  (SA-E21) and Mathlib `NormedSpace.map_exp` applied to the continuous star-algebra homomorphism
  `f ↦ ∫ f dP`; `U(t)` is the integral of `s ↦ exp(i t s)` (SA-E43, with polarisation); so
  `‖exp(i t S_n) ψ − U(t) ψ‖² = ∫ |exp(i t s_n(s)) − exp(i t s)|² dμ_ψ(s)`, which tends to `0` by dominated
  convergence, since `s_n(s) → s` for every `s` and the integrand is at most `4`. The convergence is
  uniform for `t` in compact intervals, which gives SA-E24 and SA-E25 again with the limit `U`.

*Needs:* E.4, E.5, SA-A17, SA-A20, SA-A23; Tau Ceti
`TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp`,
`TauCeti.Semigroups.StronglyContinuousGroup.isUnitary_ofBoundedExp`,
`TauCeti.ProjValMeasure.continuous_integral`,
`TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`; Mathlib
`NormedSpace.map_exp`, `NormedSpace.exp_add_of_commute`.

**Checks.**

- For `A = a · 1`, `exp(i t n² a/(n² + a²)) → exp(i t a)`; at `a = t = n = 1` the approximant is
  `exp(i/2)`.
- For multiplication by `t` on `L²(ℝ)`, `sup_s |exp(i t n² s/(n² + s²)) − exp(i t s)|` does not tend to
  `0` (at `s = n` the phases differ by `t n/2`), so the convergence is strong and not in norm.
- At `t = 0` both sides equal `ψ`.

### E.7 Spectral truncation, cut operators and block tools

Spectral grid cells decompose vectors into orthogonal frequency blocks; cut operators, gap
inverses and reassembly translate local spectral support into quantitative operator bounds.

- **SA-E31 — Strong convergence of interval cutoffs.** For bounded intervals `I_n` increasing with
  union `ℝ` (for instance `[−n, n]`), `P(I_n) → 1` strongly (Teschl2009, Theorem 3.1, p. 90, line 3687:
  integrals of uniformly bounded, pointwise convergent symbols converge strongly), and the range of
  each `P(I_n)` lies in the domain of `A`.
- **SA-E32 — Spectral grid cells.** For `ε > 0` and `k ∈ ℤ`, `I_k = [k ε, (k+1) ε)`.
- **SA-E33 — Disjointness of spectral grid cells.** Distinct cells are disjoint.
- **SA-E34 — Covering by spectral grid cells.** The union of the cells is `ℝ`.
- **SA-E35 — Norm splitting across the grid.** For `ε > 0` and every `v ∈ H`,
  `Σ'_{k ∈ ℤ} ‖P(I_k) v‖ₑ² = ‖v‖ₑ²`, by strong σ-additivity (SA-B24; Teschl2009, p. 88, line 3587).
- **SA-E36 — Spectral cut operator.** For measurable `B ⊆ ℝ` and real `c`, `r` with `0 ≤ r` and
  `|s − c| ≤ r` for every `s ∈ B`, the cut operator `C_{B,c}` is the integral of the bounded symbol
  `s ↦ (s − c) 1_B(s)`.
- **SA-E37 — Spectral cut bounds, domain, and action.** Under SA-E36, `‖C_{B,c}‖ ≤ r`; the range of
  `P(B)` lies in the domain of `A`, since `|s| ≤ |c| + r` on `B`; `C_{B,c} y = A y − c y` for `y` in that
  range; and `C_{B,c}` commutes with every `P(B′)` and every `R(z)`.
- **SA-E38 — Spectral-gap inverse.** For `δ > 0`, `G_δ` is the integral of the bounded symbol
  `s ↦ 1_{|s| ≥ δ}(s) s⁻¹`, the operator of Teschl2009, proof of Theorem 3.8, p. 97, lines 4025–4029, at
  `λ₀ = 0`, `ε = δ`.
- **SA-E39 — Spectral-gap inverse equation.** For every `ξ`, `G_δ ξ` lies in the domain of `A` and
  `A G_δ ξ = P({|s| ≥ δ}) ξ`; if `μ_ξ((−δ, δ)) = 0`, then `A G_δ ξ = ξ`.
- **SA-E40 — Spectral-gap inverse norm bound.** `‖G_δ‖ ≤ δ⁻¹`, so `‖G_δ ξ‖ ≤ δ⁻¹ ‖ξ‖`.
- **SA-E41 — Reassembly of block lower bounds.** Let `(Q_i)_{i ∈ I}` be bounded operators on a
  complex inner product space and `c ∈ [0, ∞]`. If `Σ'_i ‖Q_i f‖ₑ² = ‖f‖ₑ²` for every `f` and
  `c ‖Q_i x‖ₑ ≤ ‖Q_i y‖ₑ` for every `i`, then `c ‖x‖ₑ ≤ ‖y‖ₑ`.

*Needs:* E.1, E.2; Tau Ceti `TauCeti.ProjValMeasure.tsum_enorm_sq_proj`,
`TauCeti.ProjValMeasure.norm_sq_integral_apply`, `TauCeti.ProjValMeasure.integral_indicator`,
`TauCeti.ProjValMeasure.tendsto_integral_apply_filter_of_dominated_convergence`.

**Checks.**

- For multiplication by `t` on `L²(ℝ)`, `B = [−1, 1]`, `c = 0` and `r = 1`, `C_{B,c}` is multiplication
  by `t 1_[−1,1]` with norm `1`; `‖1 − P([−n, n])‖ = 1` for every `n`, so truncation converges
  strongly, not in norm.
- For the same `A` and `δ = 1`, `G_δ` is multiplication by `1_{|t| ≥ 1} t⁻¹` with norm `1 = δ⁻¹`; for
  `ξ = 1_[0,1/2]` the gap hypothesis fails and `A G_δ ξ = 0 ≠ ξ`.
- For `A = diag(0, 1)` and `ε = 1`, `P([0, 1)) = e₁₁`, `P([1, 2)) = e₂₂`, all other cells give `0`, and
  `‖P([0,1)) v‖² + ‖P([1,2)) v‖² = ‖v‖²`.
- With `Q_1` the projection onto `ℂ e₁` in `ℂ²` alone, `x = e₂` and `y = 0`, every block bound holds but
  `c ‖x‖ ≤ ‖y‖` fails for `c > 0`: the norm-partition hypothesis is needed.

### E.8 Bounded operators and multiplication operators

- **SA-E45 — Bounded spectral-measure compatibility.** For bounded self-adjoint `T`, the spectral
  measure of its total partial operator is the real bounded spectral measure of SA-B31, the
  pushforward of `P_T` on `σ(T) ⊆ ℂ` along the real part, `B ↦ P_T({λ ∈ σ(T) : Re λ ∈ B})`: the
  resolvent is the continuous calculus of `(z − s)⁻¹` (SA-D38), and SA-E44 applies. In particular
  `⟪ξ, T ξ⟫ = ∫ s dμ_ξ(s)` and `T` is the integral of the bounded coordinate (SA-B35).
- **SA-E47 — Multiplication-operator spectral projections.** For a σ-finite measure `ν` on `X` and
  real measurable `h`, the multiplication `M_h` by `h` on `L²(ν)` with domain `{g : h g ∈ L²(ν)}` has
  resolvent `R(z) = M_{(z − h)⁻¹}` at every nonreal `z` (Teschl2009, (2.21), p. 59, line 2424, and
  (2.72), p. 74, line 3056, for a measure on `ℝⁿ`), so the projection-valued measure
  `B ↦ M_{1_{h⁻¹(B)}}` (Teschl2009, (3.7), p. 88, line 3605, on `L²(ℝ)`) satisfies
  `IsSpectralMeasure` for `M_h`, its diagonal measure at `g` being the image under `h` of `|g|² ν`:
  the spectral projections of `M_h` act by multiplication by the indicators of the preimages of the
  selected spectral sets. For bounded complex `h` the normal-operator form is SA-B36.

*Needs:* E.1, SA-B31, SA-B35, SA-B36, SA-D38; Mathlib `MeasureTheory.Lp`.

**Checks.**

- For `T = diag(0, 1)` as a total operator, the spectral measure is `δ₀ e₁₁ + δ₁ e₂₂`, the restriction
  of the bounded spectral measure.
- For multiplication by `t` on `L²[0, 1]`, `P(B)` is multiplication by `1_{B ∩ [0,1]}`. With `g = 1`
  and `z = i`, both sides of the resolvent formula equal `∫₀¹ (i − t)⁻¹ dt = −(log 2)/2 − iπ/4`; the
  field `B ↦ M_{1_{(−h)⁻¹(B)}}` gives `∫₀¹ (i + t)⁻¹ dt = (log 2)/2 − iπ/4` and fails it.
- For `ν = 0`, `L²(ν) = 0`, and the field is the zero projection-valued measure.

**Milestone E1 — spectral measure and reduction.** SA-E01–SA-E13.

**Milestone E2 — Yosida construction and Stone uniqueness.** SA-E14–SA-E31.

**Milestone E3 — spectral block tools and packaged theorems.** SA-E32–SA-E41, SA-E43–SA-E47.

### Examples

- Bounded spectral-measure compatibility is SA-E45, bounded generated-group compatibility SA-E46,
  and multiplication-operator spectral projections SA-E47.
- For `A = −d²/dx²` realised as multiplication by `ξ²` after the Fourier transform on `L²(ℝ)`,
  `P((−∞, 0)) = 0`, so `A ≥ 0` by SA-E11, and `P([0, 1])` is the Fourier multiplier `1_{|ξ| ≤ 1}`.
- For `A = diag(λ_n)` on `ℓ²` with real `λ_n`, `P(B)` is the coordinate projection onto
  `{n : λ_n ∈ B}`, `μ_ξ = Σ_n |ξ_n|² δ_{λ_n}`, `U(t) = diag(exp(i t λ_n))`, and `exp(i t S_m)` acts on `e_n`
  by `exp(i t m² λ_n/(m² + λ_n²))`.
- For bounded self-adjoint `T`, `exp(i t S_n) → exp(i t T)` in operator norm, since
  `‖S_n − T‖ ≤ ‖T‖³/n²`.

### Dependencies

- E.1 needs Part B (B.2, B.3, B.4), Part D (D.2, D.3) and VonNeumannAlgebras V10.ClosedOperators;
  E.2 needs E.1 and SA-C12–SA-C19; E.3 needs E.1–E.2; E.4 needs E.1 and D.1–D.2; E.5 needs E.1–E.2,
  Part A and Tau Ceti's Stone theorem; E.6 needs E.4–E.5 and SA-A20; E.7 needs E.1–E.2; E.8 needs
  E.1, SA-B31–SA-B36 and SA-D38.

## Downstream consumers

- SpectralSubspacePerturbation consumes the partial-operator spectrum and resolvent of Part D, the
  domain-aware Sylvester equation SA-C66–SA-C72, and Part E's spectral measure.
- UnboundedOperators, VariationalMethods, QuantumFoundations, CongruenceSpectralGap and
  HeegaardFloer consume Part E (the spectral measure SA-E01–SA-E05, spectral subspaces SA-E04–SA-E10
  and the lower-bound criterion SA-E11) and the spectral representation of the Stone group SA-E43.
- GeometricQuantization consumes von Neumann's criterion SA-A21, Stone's theorem and the graph cores
  SA-C39–SA-C42.
- OperatorAlgebraDynamics, AutomorphicSpectralTheory, NoncompactQuantumSymmetry and
  SpectralManifolds consume the multiplication models and multiplicity classification SA-B85, which
  are VonNeumannAlgebras V4.0.Multiplication's, and the transport and degenerate-representation
  results SA-B66–SA-B72.

## Scope and ownership

This roadmap owns, and states in its Parts above, every item labelled `SA-` except those marked
*Supplied by*:

- one-parameter unitary groups, their generators and generator calculus, the semigroup and
  exponential bridges, the commuting Duhamel estimate, von Neumann's criterion and the comparison of
  the difference-quotient generator with Tau Ceti's Stone normalisation (Part A);
- bounded Borel symbols, projection-valued measures, their scalar measures and integral, the real
  spectral measure of a bounded self-adjoint operator with its half-line form criteria, the
  multiplication-operator model, full spectral support, the uniqueness of a projection-valued
  measure with regular diagonal measures, the Borel bidual embedding and Goldstine comparison,
  degenerate representations, regular pushforward and naturality, unitary transport, reducing
  restriction and direct sums, Hilbert direct sums of operators, planar reduction and
  concentration, scalar integration against scalar measures, and the examples SA-B75–SA-B78
  (Part B);
- domain relations, reducing restrictions, transport constructions, graph norms and cores,
  relative boundedness, perturbations and Kato–Rellich, real spectral separation, rectangular
  Sylvester equations, quadratic-form bounds, the compact normal spectral theorem and finite
  Euclidean operator norms (Part C);
- the resolvent, spectrum and Cayley transform of a partial operator with their algebra,
  self-adjoint estimates, intertwining and completion statements (Part D);
- the resolvent characterisation of the spectral measure of a self-adjoint partial operator and its
  uniqueness, spectral subspaces, spectral support and gap resolvents, the spectral criterion for
  form bounds, the Yosida approximants, the generated group with its spectral representation and
  Yosida approximation, spectral truncations, cut operators, the spectral-gap inverse, grid
  decompositions and reassembly, and the comparison with bounded and multiplication operators
  (Part E).

Consumed from the library at the pins and not restated:

- From Tau Ceti: Stone's theorem in its existence, uniqueness and characterisation forms; the
  general theory of strongly continuous semigroups and groups; the eigenbasis of a compact
  self-adjoint operator; uniqueness of a finite measure on `ℝ` with a given resolvent transform;
  Goldstine's theorem; the Duhamel identity for bounded exponentials.
- From Mathlib: `LinearPMap` with its adjoint, self-adjointness, order, closedness and cores, the
  continuous functional calculus, joint eigenspaces of commuting symmetric operators, the
  Riesz–Markov–Kakutani measures and their uniqueness for regular measures.

Left to named owners and consumed by section:

- [VonNeumannAlgebras](../../VonNeumannAlgebras/README.md) owns the bounded Borel calculus and
  projection-valued measure of a unital representation of `C(K)` and of a normal operator, with
  the essential norm, weighted measures and commutant law (V2.BorelCalculus: SA-B03–SA-B13,
  SA-B26–SA-B30, the normal form of SA-B35, SA-B48, SA-B54, SA-B55, SA-B57, SA-B59–SA-B61, SA-B64,
  SA-B79); the cyclic multiplication models, control measures, measurable multiplicity, essentially
  bounded symbol quotient and the classification of representations of `C(K)` and `C₀(X)`
  (V4.0.Multiplication: SA-B85–SA-B86); and the construction of the spectral measure of a
  self-adjoint partial operator from its Cayley transform with the multiplier-form description of
  the operator (V10.ClosedOperators: SA-E01–SA-E02). These items are stated above in the form this
  roadmap consumes.
- [BanachSpaceTheory](../../BanachSpaceTheory/README.md) §5.4 owns the Banach space `M(K)` of
  finite regular measures and the Riesz isometry with `C(K)*`, consumed by SA-B63 and SA-B65.
- [BanachAlgebras](../../BanachAlgebras/README.md) §8.1 owns the compact spectral decomposition
  on Banach spaces, consumed by SA-C86.
- [OneParameterSemigroups](../../../Completed/OneParameterSemigroups/README.md) owns C₀
  semigroups and groups in general; Parts A and E consume their implementation at the Tau Ceti pin.

Owned by roadmaps that build on this one, and not used here:

- [UnboundedOperators](../UnboundedOperators/README.md) §1.6 owns the identification of the
  support of the spectral measure with the spectrum, of which SA-E08 proves the half that a set of
  real resolvent points is null; §1.7 owns the self-adjointness of the maximal multiplication
  operator by a real symbol; and §3.5 owns the spectra of multiplication and diagonal operators in
  general, of which SA-B36 states the bounded case on a finite measure.
- [SpectralSubspacePerturbation](../SpectralSubspacePerturbation/README.md) owns the solvability
  and a-priori estimates of Sylvester equations, Rosenblum's theorem and the Davis–Kahan
  theorems.

## Exact supplier contracts

### From Mathlib

- `LinearPMap`, `LinearPMap.adjoint`, `IsSelfAdjoint` for partial operators, `LinearMap.toPMap`,
  `LinearPMap.HasCore`, `LinearPMap.IsClosed`, the order `≤` on `LinearPMap`; assumed as defined,
  with no extra hypotheses.
- `cfcHom`, `cfc`, `IsStarNormal`, `algebraMap_le_iff_le_spectrum`, `AlgHom.spectrum_apply_subset`,
  `ContinuousMap.spectrum_eq_range`, `ContinuousMap.starAlgHom_ext_map_X`,
  `ContinuousMap.compStarAlgHom'`, `IsStarProjection`, `LinearIsometryEquiv.conjStarAlgEquiv`,
  `ContinuousLinearMap.IsPositive`, `ContinuousLinearMap.le_opNorm`.
- `Submodule.HasOrthogonalProjection`, `Module.End.invtSubmodule`,
  `LinearMap.IsSymmetric.restrict_invariant`,
  `LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule`.
- `IsCompactOperator`, `HilbertBasis`, `Module.End.HasEigenvector`,
  `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` (compact symmetric operators),
  `LinearMap.IsSymmetric.iSup_eigenspace_inf_eigenspace_of_commute` and
  `LinearMap.IsSymmetric.orthogonalFamily_eigenspace_inf_eigenspace` (joint eigenspaces).
- `MeasureTheory.Measure.Regular`, `MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`
  (two regular measures with the same integrals on compactly supported continuous functions are
  equal), `MeasureTheory.Measure.InnerRegular.map_of_continuous`,
  `MeasureTheory.Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure` (locally finite
  measures on σ-compact pseudometrizable spaces are regular), `RealRMK.rieszMeasure`,
  `MeasureTheory.Measure.support`, `MeasureTheory.SimpleFunc.approxOn`, `MeasureTheory.Lp`.
- `lp`, `lp.single`, `IsHilbertSum`, `NormedSpace.inclusionInDoubleDual`, `NormedSpace.exp`,
  `NormedSpace.map_exp` (a continuous ring homomorphism commutes with the exponential),
  `NormedSpace.exp_add_of_commute`, `hasDerivAt_exp_smul_const`.

### From Tau Ceti

The declarations realising this roadmap's own items are named on their *In Tau Ceti:* lines above.
Consumed besides:

- Stone's theorem (`TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean`):
  `IsSelfAdjoint.exists_isUnitary_complexGenerator_eq_I_smul`,
  `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` and
  `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`, for a partial operator
  on a complex Hilbert space, with the normalisation `G = i A`.
- Strongly continuous semigroups and groups (`TauCeti/Analysis/Semigroups/`), the implementation of
  OneParameterSemigroups: `TauCeti.Semigroups.StronglyContinuousSemigroup`,
  `TauCeti.Semigroups.StronglyContinuousSemigroup.continuous_iff_domain_eq_top`, and
  `TauCeti.Semigroups.StronglyContinuousGroup.ofBoundedExp` with
  `ofBoundedExp S t = exp(t • (i • S))`, real-linear.
- The representation measures and Borel operator underlying VonNeumannAlgebras V2.BorelCalculus
  (`TauCeti/Analysis/InnerProductSpace/ProjValMeasure/Representation/`,
  `TauCeti/Analysis/InnerProductSpace/BorelCalculus/`): `StarAlgHom.representationDiagMeasure`,
  `StarAlgHom.representationBorelOperator`, `StarAlgHom.regular_representationDiagMeasure`,
  `StarAlgHom.representationBorelOperator_ofContinuousMap`, `ContinuousLinearMap.diagMeasure`,
  `ContinuousLinearMap.pair`, each on an arbitrary compact Hausdorff space and complex Hilbert
  space as stated at the pin.
- Uniqueness of a finite measure on `ℝ` with a given resolvent transform on the upper half-plane,
  `MeasureTheory.Measure.ext_of_resolventTransform`
  (`TauCeti/MeasureTheory/Measure/ResolventTransform/Inversion.lean`), and Goldstine's theorem
  `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`
  (`TauCeti/Analysis/Normed/Module/Dual/Goldstine.lean`).
- Compact operators: `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector`
  (`TauCeti/Analysis/InnerProductSpace/Spectrum.lean`), a Hilbert basis of eigenvectors for a
  compact symmetric operator. Exponentials: `ContinuousLinearMap.exp_smul_apply_sub_eq_intervalIntegral`
  (`TauCeti/Analysis/Normed/Operator/Exponential.lean`), the Duhamel identity.

### From TauCetiRoadmap.VonNeumannAlgebras

- [V2.BorelCalculus](../../VonNeumannAlgebras/README.md#layer-2-elementary-algebra-corners-and-tensors):
  for compact Hausdorff `K` and a unital star homomorphism `π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)`, a
  projection-valued measure `P_π` on `K`, assumed on the carrier `TauCeti.ProjValMeasure K H`,
  whose diagonal measures are the regular Riesz measures of `f ↦ ⟪ξ, π(f) ξ⟫` and whose integral
  extends `π`; its essential norm, weighted measures and commutant law; and for normal bounded `a`
  the case `K = σ(a)`, `π = cfcHom`, with `a = ∫ z dP_a`.
- V4.0.Multiplication: the cyclic multiplication models, control measures and multiplicity of
  SA-B85 and the essentially bounded symbols of SA-B86, assumed on the same carriers.
- [V10.ClosedOperators](../../VonNeumannAlgebras/README.md#layer-10-affiliated-operators-and-tomitatakesaki-theory):
  for self-adjoint `A`, the projection-valued measure on `ℝ` obtained from the spectral measure of
  the Cayley transform by the inverse Cayley map, with `⟪ξ, A η⟫ = ∫ t dμ_(ξ,η)(t)` for `η` in the
  domain and the domain equal to `{ξ : ∫ t² dμ_ξ(t) < ∞}`; assumed on the carrier
  `TauCeti.ProjValMeasure ℝ H`.

### From TauCetiRoadmap.BanachSpaceTheory

[§5.4](../../BanachSpaceTheory/README.md#54-finite-regular-measures-and-the-dual-of-ck): the Banach
space `M(K)` of finite regular complex measures on compact Hausdorff `K` and the linear isometric
equivalence of `C(K, ℂ)*` with `M(K)` given by integration.

### From TauCetiRoadmap.BanachAlgebras

[§8.1](../../BanachAlgebras/README.md#81-compact-spectral-decomposition): for a compact operator on
a complex Banach space, the nonzero spectrum consists of eigenvalues, finitely many of modulus at
least `ε` for each `ε > 0`, each with a finite-dimensional eigenspace.

## References

- Teschl2009: G. Teschl, *Mathematical Methods in Quantum Mechanics, with Applications to
  Schrödinger Operators*, 2009. The separability convention, p. 42, line 1780; multiplication
  operators (2.21), p. 59, line 2424, and their resolvents (2.72), p. 74, line 3056; Theorem 2.18
  (self-adjointness, lower bounds and the spectrum), p. 77, lines 3170–3172; Theorem 2.23 (direct
  sums), p. 79, line 3257; Problems 2.24 and 2.26, p. 80, lines 3311 and 3314; projection-valued
  measures and strong σ-additivity, p. 88, line 3587, and the example (3.7), line 3605; Theorem 3.1
  (the bounded integral), p. 90, line 3687; Theorem 3.7 (spectral theorem), p. 96, line 3983; the
  Borel transform (3.40), p. 94, line 3881; unitary equivalence, p. 97, lines 4009–4012; Theorem 3.8
  (spectrum as support), p. 97, line 4015, with its proof, lines 4025–4029, and the remark at line
  4030; Corollary 3.9, p. 97, line 4031; (3.65)–(3.67), pp. 100–101, lines 4183–4194; Theorem 3.21
  (Stieltjes inversion), p. 108, line 4497; Lemma 4.5 and Corollary 4.6, p. 116, lines 4926 and 4945;
  Theorems 5.1 and 5.2 (Stone), pp. 123–124, lines 5183 and 5232, with the proof of Theorem 5.1 at
  line 5215; Theorem 6.6 (compact self-adjoint operators), p. 136, line 5757, and (6.5), line 5765;
  strong resolvent convergence (6.47), p. 153, line 6588, Theorem 6.31, p. 154, line 6602, and Lemma
  6.36, p. 155, line 6655.
- Conway1990: J. B. Conway, *A Course in Functional Analysis*, 2nd ed., Graduate Texts in
  Mathematics 96. Theorem IX.1.14 (the spectral measure of a representation of `C(X)`).
- Schmudgen2012: K. Schmüdgen, *Unbounded Self-adjoint Operators on Hilbert Space*, Graduate Texts
  in Mathematics 265. Theorem 5.7 (spectral theorem for self-adjoint operators).
- Prior formalisations: the [AIQ DKPS formalization](https://github.com/AIQ-Kitware/aiq-dkps-formalization)
  (Kitware, Inc., Apache-2.0) implements much of Parts A–E; the Spectra formalization project
  (Adam Bornemann, Apache-2.0) is the source of part of the unitary-group and
  projection-valued-measure material. Tau Ceti's files carry per-file provenance headers.
