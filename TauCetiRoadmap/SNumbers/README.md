# s-numbers and entropy numbers of operators between Banach spaces

## Introduction

Singular values are defined for operators between Hilbert spaces. An **s-number sequence**
assigns to every bounded operator `T : X → Y` between normed spaces a nonincreasing sequence
`s₀(T) ≥ s₁(T) ≥ … ≥ 0` that behaves like the singular values: it starts at the operator
norm, is stable under perturbation and composition, vanishes on operators of low rank, and is
normalized on the Euclidean identities. Pietsch's axioms single out this behaviour, and five
classical sequences satisfy them: the approximation numbers `aₙ`, the Gelfand numbers `cₙ`,
the Kolmogorov numbers `dₙ`, the Bernstein numbers `bₙ` and the Hilbert numbers `hₙ`. On
Hilbert spaces all of them coincide with the singular values; on Banach spaces they differ,
and the inequalities between them measure how far a Banach space is from a Hilbert space.

This roadmap builds the axiomatic theory, the five sequences with their basic calculus, the
two extremal sequences (`hₙ ≤ sₙ ≤ aₙ` for every s-number sequence `s`), the compactness
criteria, the inequalities between the sequences, among them the maximal difference theorem
`aₙ(T) ≤ e (n+1) hₙ(T)`, the duality between Gelfand and Kolmogorov numbers, the entropy
numbers `eₙ`, which are pseudo-s-numbers in Pietsch's sense (they satisfy the first three
axioms and fail the rank axiom) and bound every s-number sequence through
`sₙ ≤ 2e (n+1) eₙ`, and the examples that calibrate
all of this: identities and diagonal operators between the spaces `ℓ_p^m`, and the inclusion
`ℓ₁ → ℓ_∞`, on which the factor `n+1` is attained.

Approximation numbers are consumed from
[OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md), where they are
`ContinuousLinearMap.singularValue` and are used here under their Banach-space name
`approximationNumber`; the Schmidt series of compact operators, the
Banach-space duality and the projection theorems are consumed from
[BanachSpaceTheory](../BanachSpaceTheory/README.md). The bar for "done": the inequalities
between s-numbers in Pietsch's *Eigenvalues and s-Numbers*, Chapter 2, are available on
operators between arbitrary normed spaces, with the hypotheses each one needs and nothing
more.

Suggested home: `TauCeti/Analysis/Normed/Operator/SNumbers/`, beside the compact,
absolutely summing and weakly compact operators of the Banach-space theory; nothing of
this roadmap lives under `TauCeti/Analysis/OperatorIdeal/`, which holds the approximation
numbers and their gauges.

## Scope and conventions

- **Indexing is zero-based.** `s₀(T) = ‖T‖`. The one-based literature writes `s_{n+1}` for
  the `sₙ` of this roadmap; the same convention as `OperatorIdeals`.
- **Values are in `ℝ≥0`**, as the approximation numbers of `OperatorIdeals`.
- **Approximation numbers: one object, the Banach-space name.** `OperatorIdeals` implements
  `aₙ(T)` (`OI-A01`) as `ContinuousLinearMap.singularValue`. On Banach spaces "singular
  value" is a misnomer: singular values are the Hilbert-space case. This roadmap therefore
  states everything with `ContinuousLinearMap.approximationNumber`, an `abbrev` for
  `singularValue`: the same object under its Banach-space name, so the whole `OperatorIdeals`
  API applies without a second definition and without transfer lemmas.
- **Spaces** are normed spaces (`NormedAddCommGroup`, `NormedSpace 𝕜`) over a scalar field `𝕜`.
  Completeness of a space is a hypothesis of the statements whose proofs use it, and of no
  other statement.
- **Scalar field, by layer.** The axioms, the approximation, Gelfand, Kolmogorov and
  Bernstein numbers, the entropy numbers and the injectivity results are over a
  `NontriviallyNormedField 𝕜`. The strict normalization of `aₙ` and of `dₙ` needs
  `CompleteSpace 𝕜` (Riesz's lemma on a closed finite-dimensional subspace). Pietsch's
  lifting identity and the multiplicativity of entropy numbers need a `DenselyNormedField 𝕜`
  (a rescaling `|c| ↘ ‖A‖`). The Hilbert numbers, everything on Hilbert spaces, the
  projection theorems, the maximal difference theorem, the duality and the examples are over
  `RCLike 𝕜`. Each item below names the field it needs.
- **One universe.** An s-number family is defined on all pairs of normed spaces in one
  universe `u` over `𝕜 : Type u`, the shape of `OperatorIdealFamily`. The Hilbert numbers
  test with `ℓ₂ := lp (fun _ : ℕ => 𝕜) 2`, which lives in that universe.
- **Rank** is `ContinuousLinearMap.rank`, the cardinal rank of the underlying linear map, as
  in `OperatorIdeals`; "`rank T ≤ n`" compares with `(n : Cardinal)`.
- **Model spaces.** `ℓ₂^{n+1} := EuclideanSpace 𝕜 (Fin (n+1))`,
  `ℓ_p^m := PiLp p (fun _ : Fin m => 𝕜)` for `1 ≤ p ≤ ∞`, and `ℓ_p := lp (fun _ : ℕ => 𝕜) p`.
- **The dual operator** `T' : Y* → X*` and the duals `StrongDual 𝕜 X` are those of
  `BanachSpaceTheory` B1 (`ContinuousLinearMap.precomp`), with its annihilators `Mᗮ`, `V_⊥` and
  the identifications `(X/M)* ≅ Mᗮ`, `M* ≅ X*/Mᗮ`.
- **Names.** The five sequences and the entropy numbers are `ContinuousLinearMap.gelfandNumber`,
  `kolmogorovNumber`, `bernsteinNumber`, `hilbertNumber`, `entropyNumber`, each of type
  `(X →L[𝕜] Y) → ℕ → ℝ≥0`, beside `approximationNumber`. The family type and the axioms are
  `TauCeti.SNumberFamily` and `TauCeti.IsSNumberSequence`; the families of the six sequences
  are `approximation`, `gelfand`, `kolmogorov`, `bernstein`, `hilbert`, `entropy`.
- Inequalities are stated in `ℝ≥0` where both sides are, and in `ℝ` where a real constant such
  as `e = Real.exp 1` or `√n` appears.

## What Mathlib already has (consume)

- Bounded operators `X →L[𝕜] Y` with the operator norm; `Submodule`, closed submodules and
  normed quotients; `LinearMap.rank` and `Module.rank`; `riesz_lemma`; Hahn–Banach
  (`exists_extension_norm_eq`, `exists_dual_vector`) over `RCLike`; `IsCompactOperator`;
  `TotallyBounded`, `Metric.infDist`; `EuclideanSpace`, `PiLp`, `lp`; `LinearMap.det`,
  `Matrix.det` and its multilinearity; `LinearMap.singularValues` on finite-dimensional inner
  product spaces; `Real.exp` with `(1 + 1/n)^n ≤ e`.

## What Tau Ceti and its roadmaps supply (consume)

- **`OperatorIdeals` Part A**: `aₙ(T)` with its calculus (`OI-A01`–`OI-A22`: norm, antitone,
  perturbation, mixed-index additivity and multiplicativity, two-sided ideal inequality,
  homogeneity), rank and compactness (`OI-A23`–`OI-A29`), adjoint invariance (`OI-A30`), the
  min–max formulations and the converse localization on every `RCLike` Hilbert pair
  (`OI-A35`–`OI-A40`), and the Eckart–Young identification `aₙ(T) = σₙ(T)` in finite dimension
  (`OI-A49`).
- **`BanachSpaceTheory` B1**: annihilators, the double-annihilator theorem, the isometric
  identifications `(X/M)* ≅ Mᗮ` and `M* ≅ X*/Mᗮ`, the dual operator with its norm.
- **`BanachSpaceTheory` B4**: the Schmidt series `T x = ∑ sⱼ ⟪eⱼ, x⟫ fⱼ` of a compact operator
  between Hilbert spaces with `sⱼ = aⱼ(T)` in the zero-based convention.
- **`BanachSpaceTheory` B7**: John's theorem with the contact-point decomposition over `𝕜`,
  the Kadec–Snobar projection theorem (range of dimension `≤ n`, `‖P‖ ≤ √n`), the
  Garling–Gordon projection theorem (kernel of codimension `≤ n`, `‖P‖ ≤ √n + ε`), and local
  reflexivity with the clause `T(J_E x) = x` for `J_E x ∈ F`.
- **`BanachSpaceTheory` B6**: Grothendieck's theorem `π₁(T) ≤ κ_𝕜 ‖T‖` for operators from
  `ℓ₁^m` into a Hilbert space, with the absolutely `p`-summing norms and `π₂ ≤ π₁`.

## What is missing (build here)

- The axioms of an s-number sequence and a strict s-number sequence, with the elementary
  consequences every sequence shares.
- The Gelfand, Kolmogorov, Bernstein and Hilbert numbers, each verified against the axioms,
  with Pietsch's lifting and embedding identities and the injectivity of `c`, surjectivity
  of `d`.
- The extremal sequences: `hₙ ≤ sₙ ≤ aₙ`, uniqueness on Hilbert spaces, `sₙ = σₙ` in finite
  dimension, and the compactness criteria by `cₙ`, `dₙ` and, on Hilbert spaces, by every `s`.
- The inequalities: `aₙ ≤ (1+√n) min(cₙ, dₙ)`, the maximal difference theorem
  `aₙ ≤ e (n+1) hₙ` with its corollaries `sₙ ≤ e (n+1) tₙ` and `max(cₙ, dₙ) ≤ e (n+1) bₙ`,
  the duality `dₙ(T') = cₙ(T)`, `cₙ(T') ≤ dₙ(T)` with equality for compact `T`, the
  additivity and multiplicativity of `a`, `c` and `d`, the additivity of `h`, and examples
  showing that the Bernstein numbers have neither property.
- The entropy numbers: definition, their pseudo-s-number laws, compactness criterion, the
  comparisons
  `max(cₙ, dₙ) ≤ (n+1) eₙ`, `hₙ ≤ 2 eₙ`, `sₙ ≤ 2e (n+1) eₙ`.
- The examples: identities and diagonal operators between `ℓ_p^m` spaces, the inclusion
  `ℓ₁ → ℓ_∞` with `hₙ = 1/(n+1)`, and the identity of `ℓ₁^m` with `hₙ ≍ (n+1)^{-1/2}`, which
  shows that `h` is neither strict nor multiplicative.

## The build, in layers

The labels in Parts A–E are the complete obligation set of this roadmap. Each label names one
definition or theorem; the milestones, the definitions section and the acceptance examples
cite them, and `Suggested.lean` cites the labels its sample declarations represent.

### Part A: the axioms and the five classical sequences

**Objects.** An s-number family assigns to every bounded `T : X →L[𝕜] Y` between normed
spaces in one universe a sequence `ℕ → ℝ≥0`. The five classical families are the
approximation numbers (consumed), and the Gelfand, Kolmogorov, Bernstein and Hilbert numbers
(built here).

#### The axioms

- **SN-A01 — s-number family.** The type of families `s` with
  `s T : ℕ → ℝ≥0` for every `T : X →L[𝕜] Y` and all normed `𝕜`-spaces `X`, `Y` in one universe.
- **SN-A02 — s-number sequence.** `IsSNumberSequence s` holds when, for all normed spaces and
  all bounded operators,
  (S1) `s T 0 = ‖T‖₊` and `n ↦ s T n` is antitone;
  (S2) `s (S + T) n ≤ s S n + ‖T‖₊`;
  (S3) `s (B ∘L T ∘L A) n ≤ ‖B‖₊ * s T n * ‖A‖₊`;
  (S4) `rank T ≤ n → s T n = 0`;
  (S5) `s (id : ℓ₂^{n+1} → ℓ₂^{n+1}) n = 1`.
- **SN-A03 — Strict s-number sequence.** `IsStrictSNumberSequence s`: (S1)–(S4) together with
  (S5′) `s (id_X) n = 1` for every normed space `X` with `n < Module.rank 𝕜 X`, including
  infinite-dimensional `X`. (S5′) implies (S5).
- **SN-A04 — Norm bound and continuity.** For every s-number sequence, `s T n ≤ ‖T‖₊`,
  `|s S n - s T n| ≤ ‖S - T‖`, and `T ↦ s T n` is continuous in operator norm.
- **SN-A05 — Homogeneity.** `s (c • T) n = ‖c‖₊ * s T n`.
- **SN-A06 — Approximation numbers of identities.** Over a complete `𝕜`: if `n < rank X`,
  then `aₙ(id_X) = 1`. For `L` of rank `≤ n` the range of `L` is a proper closed subspace of
  `X`, and Riesz's lemma gives unit vectors `x` with `‖x - L x‖ ≥ r` for every `r < 1`.
- **SN-A07 — Approximation numbers form a strict s-number sequence.** Over a complete `𝕜`,
  `approximationNumber` satisfies (S1)–(S4), each axiom one `OperatorIdeals` theorem (`OI-A12`,
  `OI-A13`, `OI-A16`, `OI-A20`, `OI-A23`), and (S5′) is `SN-A06`.

#### Gelfand and Kolmogorov numbers

- **SN-A08 — Gelfand number.**
  `cₙ(T) := ⨅ {‖T ∘L M.subtypeL‖₊ : M ≤ X closed, rank (X ⧸ M) ≤ n}`, the infimum of the
  norms of the restrictions of `T` to closed subspaces of codimension at most `n`.
- **SN-A09 — Gelfand numbers are strict.** Over any nontrivially normed `𝕜`. (S3) by
  `M' := A⁻¹(M)`, closed, of codimension at most that of `M` by the first isomorphism theorem
  for `π_M ∘ A`; (S4) by `M := ker T`; (S5′) because the inclusion of `M` is an isometry and
  `codim M ≤ n < rank X` forces `M ≠ 0`.
- **SN-A10 — Kolmogorov number.**
  `dₙ(T) := ⨅ {⨆_{‖x‖ ≤ 1} infDist (T x) V : V ≤ Y, rank V ≤ n}`, the infimum over subspaces
  of dimension at most `n` of the deviation of `T(B_X)` from `V`.
- **SN-A11 — Quotient form.** `dₙ(T) = ⨅_{rank V ≤ n} ‖V.mkQ ∘L T‖₊`, with the quotient
  seminorm of `Y ⧸ V`.
- **SN-A12 — Kolmogorov numbers are an s-number sequence.** Over any nontrivially normed `𝕜`.
  (S2) is the triangle inequality for `π_V ∘ T`; (S3) transports an admissible `V` for `T` to
  `B(V)` for `B ∘ T ∘ A`; (S4) takes `V := range T`.
- **SN-A13 — Kolmogorov numbers are strict.** Over a complete `𝕜`: for `rank V ≤ n < rank X`
  the closure of `V` is proper, Riesz's lemma produces unit vectors at distance arbitrarily
  close to `1` from `V`, so `‖π_V‖ = 1` and `dₙ(id_X) = 1`.
- **SN-A14 — Pietsch's lifting identity.** For complete `X` and every `T : X →L[𝕜] Y`,
  `dₙ(T) = aₙ(T ∘L Q_X)`, where `Q_X : ℓ₁(B_X) → X`, `Q_X α = ∑_{x ∈ B_X} α x • x`, is the
  summation surjection from `lp (fun _ : closedBall (0 : X) 1 => 𝕜) 1`. The inequality
  `dₙ(T) ≤ aₙ(T ∘ Q_X)` takes `V := range L` for a rank-`≤ n` approximant `L`; the reverse
  lifts near-best points `w_x ∈ V` to `L α := ∑ α x • w_x`.
- **SN-A15 — Pietsch's embedding identity.** Over `RCLike 𝕜`: `cₙ(T) = aₙ(J_Y ∘L T)`, where
  `J_Y : Y → ℓ_∞(B_{Y*})`, `(J_Y y) φ = φ y`, is the canonical metric injection into
  `lp (fun _ : closedBall (0 : StrongDual 𝕜 Y) 1 => 𝕜) ∞`. The inequality `aₙ(J_Y T) ≤ cₙ(T)`:
  for `M` of codimension `≤ n` and each `φ ∈ B_{Y*}`, Hahn–Banach extends `(φ ∘ T)|_M` to
  `g_φ ∈ X*` with `‖g_φ‖ ≤ ‖T|_M‖`; then `L x := (φ(T x) - g_φ x)_φ` factors through `X ⧸ M`,
  has rank `≤ n`, and `‖J_Y T - L‖ ≤ ‖T|_M‖`. The reverse: for `L` of rank `≤ n`,
  `M := ker L` has codimension `≤ n`, and `‖T|_M‖ = ‖(J_Y T - L)|_M‖ ≤ ‖J_Y T - L‖` because
  `J_Y` is isometric.

#### Bernstein and Hilbert numbers

- **SN-A16 — Bernstein number.**
  `bₙ(T) := ⨆ {⨅_{0 ≠ x ∈ M} ‖T x‖₊ / ‖x‖₊ : M ≤ X, rank M = n + 1}`, the largest gain of `T`
  on an `(n+1)`-dimensional subspace.
- **SN-A17 — Bernstein numbers are strict.** Over any nontrivially normed `𝕜`. (S2) is the
  pointwise triangle inequality through infimum and supremum; (S3): if `A` is not injective on
  `M` the gain of `B T A` vanishes, otherwise `A(M)` has dimension `n+1`; (S4) by rank–nullity;
  (S5′) because the identity has gain `1` on every nonzero subspace.
- **SN-A18 — Hilbert number.** Over `RCLike 𝕜`:
  `hₙ(T) := ⨆ {aₙ(B ∘L T ∘L A) : A : ℓ₂ →L[𝕜] X, B : Y →L[𝕜] ℓ₂, ‖A‖ ≤ 1, ‖B‖ ≤ 1}`.
- **SN-A19 — Ratio form.** `hₙ(T) = ⨆ {aₙ(B T A) / (‖B‖₊ * ‖A‖₊) : A ≠ 0, B ≠ 0}`.
- **SN-A20 — Hilbert numbers are an s-number sequence.** (S1)–(S4) are pushed through the
  supremum from `OI-A12`–`OI-A23`; `h₀(T) = ‖T‖` uses a rank-one factorization of unit vectors
  through `ℓ₂`; (S5) tests the supremum with the canonical embedding and projection between
  `ℓ₂^{n+1}` and `ℓ₂`. The Hilbert numbers are not strict (`SN-E13`).

#### Injective and surjective sequences

- **SN-A21 — Metric injections and surjections.** A metric injection `J : Y →L[𝕜] Z` has
  `‖J y‖ = ‖y‖` for all `y`; a metric surjection `Q : W →L[𝕜] X` has `‖Q‖ ≤ 1` and
  `‖x‖ = ⨅ {‖w‖ : Q w = x}`. Post-composition with `J` and pre-composition with `Q` leave the
  operator norm unchanged.
- **SN-A22 — Injective and surjective sequences.** `s` is injective when `s (J ∘L T) n = s T n`
  for every metric injection `J`, surjective when `s (T ∘L Q) n = s T n` for every metric
  surjection `Q`.
- **SN-A23 — Gelfand numbers are injective.** `cₙ(J ∘L T) = cₙ(T)`.
- **SN-A24 — Kolmogorov numbers are surjective.** `dₙ(T ∘L Q) = dₙ(T)`.

**Milestone A1 — the axioms and the approximation numbers.** `SN-A01`–`SN-A07`.

**Milestone A2 — Gelfand and Kolmogorov numbers.** `SN-A08`–`SN-A15`.

**Milestone A3 — Bernstein and Hilbert numbers.** `SN-A16`–`SN-A20`.

**Milestone A4 — injectivity and surjectivity.** `SN-A21`–`SN-A24`.

### Part B: the extremal sequences, Hilbert spaces and compactness

**Objects.** Every s-number sequence lies between the Hilbert numbers and the approximation
numbers; on Hilbert spaces the sandwich collapses. The Gelfand and Kolmogorov numbers detect
compactness on every Banach space.

- **SN-B01 — Upper bound by approximation numbers.** `s T n ≤ aₙ(T)` for every s-number
  sequence: by (S2) and (S4), `s T n ≤ s L n + ‖T - L‖₊ = ‖T - L‖₊` for every `L` of rank
  `≤ n`.
- **SN-B02 — Scalar factorization.** Over `RCLike 𝕜`, for complete Hilbert spaces `H₁`, `H₂`,
  every bounded `T : H₁ →L[𝕜] H₂` and every `0 ≤ c < aₙ(T)` there are `A : ℓ₂^{n+1} →L[𝕜] H₁`
  and `B : H₂ →L[𝕜] ℓ₂^{n+1}` with `‖A‖ ≤ 1`, `‖B‖ ≤ 1` and `B ∘L T ∘L A = c • id`. From
  `OI-A39`: an `(n+1)`-dimensional `V` with `‖T x‖ ≥ c' ‖x‖` on `V`, `c < c'`; `A` an isometry
  onto `V`, `B := c • (T ∘ A)⁻¹ ∘ P_{T(V)}` on the orthogonal projection onto `T(V)`.
- **SN-B03 — Uniqueness on Hilbert spaces.** `s T n = aₙ(T)` for every s-number sequence `s`
  and every `T : H₁ →L[𝕜] H₂` between complete Hilbert spaces over `RCLike 𝕜`: `SN-B01`, and
  for `c < aₙ(T)` chain (S3), (S5) and `SN-A05` on `SN-B02` to get `c ≤ s T n`.
- **SN-B04 — Lower bound by Hilbert numbers.** `hₙ(T) ≤ s T n` for every s-number sequence,
  over `RCLike 𝕜`: each `aₙ(B T A)` in the supremum defining `hₙ` equals `s (B T A) n` by
  `SN-B03` and is at most `s T n` by (S3). Together with `SN-B01`: `hₙ(T) ≤ sₙ(T) ≤ aₙ(T)`.
- **SN-B05 — Singular values in finite dimension.** For finite-dimensional inner product
  spaces over `RCLike 𝕜` and every s-number sequence, `s T n = σₙ(T)`, Mathlib's
  `LinearMap.singularValues`, by `SN-B03` and `OI-A49`.
- **SN-B06 — Covering estimates.** If `T(B_X)` is covered by `k` closed `ε`-balls with centres
  `y₁, …, y_k`, then `d_k(T) ≤ ε` (take `V := span {y_i}`) and `c_k(T) ≤ 2ε` (take
  `M := ⋂ ker φ_i` for norming functionals `φ_i` of the `y_i`, so that `‖T x‖ ≤ 2ε` on
  `M ∩ B_X`). Over `RCLike 𝕜`.
- **SN-B07 — Kolmogorov numbers and total boundedness.** Over `RCLike 𝕜`, `dₙ(T) → 0` if and
  only if `T(B_X)` is totally bounded. If `dₙ(T) < ε`, then `T(B_X)` lies within `ε` of the
  bounded piece `V ∩ (‖T‖ + ε) B_Y` of a finite-dimensional `V`, which is totally bounded.
- **SN-B08 — Gelfand numbers and total boundedness.** Over `RCLike 𝕜`, `cₙ(T) → 0` if and only
  if `T(B_X)` is totally bounded. If `cₙ(T) < ε` with `M` of finite codimension, the image of
  `B_X` in `X ⧸ M` is totally bounded; lift a finite `δ`-net to `u₁, …, u_N ∈ B_X`; for
  `‖[x] - [u_j]‖ < δ` there is `m ∈ M` with `‖(x - u_j) - m‖ < δ` and `‖m‖ ≤ 2 + δ`, a bound
  independent of the codimension, so `‖T x - T u_j‖ < ε(2 + δ) + ‖T‖ δ`. No projection with
  kernel `M` is used: `(1 + √n) cₙ(T)` need not tend to `0`.
- **SN-B09 — Compactness on Banach spaces.** Over `RCLike 𝕜` and for complete `Y`:
  `IsCompactOperator T ↔ cₙ(T) → 0 ↔ dₙ(T) → 0`. The forward implications need no
  completeness.
- **SN-B10 — Compactness on Hilbert spaces.** For complete Hilbert spaces over `RCLike 𝕜` and
  every s-number sequence `s`: `IsCompactOperator T ↔ s T n → 0`, by `SN-B03` and `OI-A29`.
- **SN-B11 — Bernstein numbers below Gelfand numbers.** `bₙ(T) ≤ cₙ(T)` over any nontrivially
  normed `𝕜`: an `(n+1)`-dimensional `M` and a closed `N` of codimension `≤ n` meet in a
  nonzero vector `x`, so the gain of `T` on `M` is at most `‖T x‖ / ‖x‖ ≤ ‖T|_N‖`.
- **SN-B12 — Bernstein numbers are the smallest injective strict s-numbers.** Over any
  nontrivially normed `𝕜`, `bₙ(T) ≤ sₙ(T)` for every injective strict s-number sequence `s`.
  If `T` has gain `c > 0` on an `(n+1)`-dimensional `M`, then `T|_M = ι ∘ T₀` with `ι` the
  inclusion of `T(M)` (a metric injection) and `T₀ : M → T(M)` invertible with
  `‖T₀⁻¹‖ ≤ 1/c`; injectivity, (S3) and (S5′) give `1 = sₙ(id_M) ≤ c⁻¹ sₙ(T₀) = c⁻¹ sₙ(T|_M)
  ≤ c⁻¹ sₙ(T)`.

**Milestone B1 — the sandwich and uniqueness.** `SN-B01`–`SN-B05`.

**Milestone B2 — compactness and the Bernstein numbers.** `SN-B06`–`SN-B12`.

### Part C: inequalities between s-numbers

**Objects.** The projection theorems compare `aₙ` with `cₙ` and `dₙ` up to `1 + √n`; the
determinant quantities `Δ_k` compare `aₙ` with `hₙ` up to `e (n+1)`, which bounds any two
s-number sequences against each other; duality exchanges `cₙ` and `dₙ`; and the additive and
multiplicative index laws extend from `aₙ` to `cₙ`, `dₙ` and (additivity) `hₙ`. Everything in
this part is over `RCLike 𝕜`.

#### Approximation numbers against Gelfand and Kolmogorov numbers

- **SN-C01 — Gelfand bound.** `aₙ(T) ≤ (1 + √n) cₙ(T)`. For `M` of codimension `≤ n` and a
  Garling–Gordon projection `P` with `ker P = M`, `‖P‖ ≤ √n + ε` (B7), `T ∘ P` has rank `≤ n`
  and `‖T - T P‖ = ‖T|_M ∘ (1 - P)‖ ≤ (1 + √n + ε) ‖T|_M‖`.
- **SN-C02 — Kolmogorov bound.** `aₙ(T) ≤ (1 + √n) dₙ(T)`. For `V` of dimension `≤ n` and a
  Kadec–Snobar projection `P` onto `V` (B7), `P ∘ T` has rank `≤ n` and
  `‖(1 - P) y‖ ≤ (1 + √n) infDist y V`.
- **SN-C03 — Combined bound.** `aₙ(T) ≤ (1 + √n) min (cₙ(T), dₙ(T))`.

#### The maximal difference theorem

- **SN-C04 — Determinant quantities.** For `k : ℕ`,
  `Δ_k(T) := ⨆ {|det (B ∘L T ∘L A)| : A : ℓ₂^k →L[𝕜] X, B : Y →L[𝕜] ℓ₂^k, ‖A‖ ≤ 1, ‖B‖ ≤ 1}`,
  with `det` the determinant of the endomorphism `B T A` of `ℓ₂^k`; `Δ_0(T) = 1` and
  `Δ_k(T) ≤ ‖T‖^k`.
- **SN-C05 — Product of approximation numbers.** For an endomorphism `S` of a
  finite-dimensional inner product space of dimension `m`, `∏_{k < m} a_k(S) = |det S|`, by
  `OI-A49` and the product of the singular values.
- **SN-C06 — Bordered determinant.** For a commutative ring `R`, a `(k+1) × (k+1)` matrix `M`
  and `w : Fin k → R` with `M i last = ∑ j, M i j * w j` for every `i < k`:
  `det M = (M last last - ∑ j, M last j * w j) * det M'`, `M'` the top-left `k × k` block.
- **SN-C07 — Lower recursion.** `k^k / (k+1)^{k+1} * a_k(T) * Δ_k(T) ≤ Δ_{k+1}(T)`: border an
  admissible pair for `Δ_k` by a vector of `B_X` on which a near-best rank-`k` approximant of
  `T` is far from `T`, and optimize the weight of the new coordinate.
- **SN-C08 — Upper recursion.** `Δ_{n+1}(T) ≤ hₙ(T) * Δ_n(T)`: for an admissible pair for
  `Δ_{n+1}`, `B T A` is an endomorphism of `ℓ₂^{n+1}`, `|det (B T A)| = ∏_{k ≤ n} a_k(B T A)`
  by `SN-C05`, `a_n(B T A) ≤ hₙ(T)` by `SN-A18`, and `∏_{k < n} a_k(B T A) ≤ Δ_n(T)` by
  restricting the pair to the first `n` coordinates along the singular vectors.
- **SN-C09 — Maximal difference theorem, sharp form.**
  `aₙ(T) ≤ (n+1)^{n+1} / n^n * hₙ(T)` (with `0^0 = 1`), by `SN-C07`, `SN-C08` and cancelling
  `Δ_n(T) > 0`, which holds when `aₙ(T) > 0`.
- **SN-C10 — Maximal difference theorem.** `aₙ(T) ≤ e (n+1) hₙ(T)`, from `SN-C09` and
  `(1 + 1/n)^n ≤ e`.
- **SN-C11 — Any two s-number sequences.** `s T n ≤ e (n+1) * t T n` for all s-number
  sequences `s`, `t`, from `SN-B01`, `SN-C10` and `SN-B04`.
- **SN-C12 — Gelfand and Kolmogorov against Bernstein numbers.**
  `max (cₙ(T), dₙ(T)) ≤ e (n+1) bₙ(T)`, the case `t = b` of `SN-C11`.

#### Duality

- **SN-C13 — Kolmogorov numbers of the dual.** `dₙ(T') = cₙ(T)` for every `T : X →L[𝕜] Y`
  between normed spaces. The admissible subspaces `V ≤ X*` of dimension `≤ n` and the closed
  `M ≤ X` of codimension `≤ n` correspond through `M = V_⊥`, `V = Mᗮ` (a finite-dimensional
  `V` is weak-star closed), and `X*/V ≅ (V_⊥)*` isometrically (B1), so that
  `‖π_V ∘ T'‖ = ‖(T|_{V_⊥})'‖ = ‖T|_{V_⊥}‖`.
- **SN-C14 — Gelfand numbers of the dual.** `cₙ(T') ≤ dₙ(T)` for every `T`: for `V ≤ Y` of
  dimension `≤ n`, `Vᗮ` is closed of codimension `≤ n` in `Y*` and
  `‖T'|_{Vᗮ}‖ = ‖(π_V ∘ T)'‖ = ‖π_V ∘ T‖` through `(Y/V)* ≅ Vᗮ` (B1).
- **SN-C15 — Duality for compact operators.** `cₙ(T') = dₙ(T)` for compact `T` between Banach
  spaces. Since `dₙ(T'') = cₙ(T')` by `SN-C13`, it suffices that `dₙ(T) ≤ dₙ(T'')`: take
  `W ≤ Y**` of dimension `≤ n` with `‖π_W ∘ T''‖ < dₙ(T'') + ε`, a finite `δ`-net
  `T x₁, …, T x_N` of `T(B_X)`, and local reflexivity (B7) on
  `F := W + span {J_Y (T x_j)}` with a map `R : F → Y` of distortion `≤ 1 + ε` and
  `R (J_Y y) = y`; then `V := R(W)` has dimension `≤ n` and
  `infDist (T x) V ≤ δ + (1 + ε)(dₙ(T'') + ε)` for every `x ∈ B_X`.

#### Additivity and multiplicativity

- **SN-C16 — Additive and multiplicative families.** A family `s` is additive when
  `s (S + T) (m + n) ≤ s S m + s T n`, and multiplicative when
  `s (S ∘L T) (m + n) ≤ s S m * s T n`, for all operators and indices. With (S1), an additive
  family satisfies (S2) and a multiplicative family satisfies (S3).
- **SN-C17 — Gelfand numbers are additive and multiplicative.** Additivity: restrict to
  `M ∩ N`, whose codimension is at most `codim M + codim N`. Multiplicativity: for `N ≤ Y`
  admissible for `S` and `M ≤ X` admissible for `T`, restrict to `M ∩ T⁻¹(N)`.
- **SN-C18 — Kolmogorov numbers are additive and multiplicative.** Additivity: use `V + W`.
  Multiplicativity: for `V ≤ Y` admissible for `T` and `W ≤ Z` admissible for `S`, use
  `W + S(V)`, of dimension `≤ m + n`: `T x = v + r` with `v ∈ V`, so `S T x = S v + S r`, and
  `S r` is within `d_m(S) ‖r‖` of `W`.
- **SN-C19 — Approximation numbers are additive and multiplicative**, as families: the
  inequalities are `OI-A17` and `OI-A22`.
- **SN-C20 — Hilbert numbers are additive.** `h_{m+n}(S + T) ≤ h_m(S) + h_n(T)`, from
  `OI-A17` under the supremum. They are not multiplicative (`SN-E14`).
- **SN-C21 — Bernstein numbers of the identities between `ℓ₂^N` and `ℓ_∞^N`.** For `n < N`:
  `bₙ(id : ℓ₂^N → ℓ_∞^N) ≤ 1/√(n+1)`, because every `(n+1)`-dimensional subspace contains a
  vector whose coordinates all have modulus `≤ 1` and at least `n+1` of which have modulus
  `1`; and `bₙ(id : ℓ_∞^N → ℓ₂^N) ≤ √(N/(n+1))`, because for an orthonormal basis
  `v₀, …, vₙ` of an `(n+1)`-dimensional `M` and each coordinate `k`, the vector
  `x = ∑ᵢ conj(vᵢ(k)) vᵢ ∈ M` has `x(k) = ‖x‖₂²`, and summing over `k` gives
  `c² (n+1) ≤ N` for the gain `c` on `M`.
- **SN-C22 — Bernstein numbers are not multiplicative.** For `T = id : ℓ₂³ → ℓ_∞³` and
  `S = id : ℓ_∞³ → ℓ₂³`, `b₂(S ∘L T) = 1 > b₁(S) * b₁(T)`, by `SN-C21`.
- **SN-C23 — Bernstein numbers are not additive.** On `ℓ₂⁷¹ × ℓ_∞⁷¹` with the maximum of the
  two norms, `S (x, y) = (0, x)` and `T (x, y) = (y/9, 0)`: `S + T` maps `(x, 3x)` to
  `(1/3) • (x, 3x)`, so `b₇₀(S + T) ≥ 1/3`, while `b₃₅(S) ≤ 1/6` and `b₃₅(T) ≤ √71/54 < 1/6`,
  by `SN-C21`.

**Milestone C1 — projection bounds.** `SN-C01`–`SN-C03`.

**Milestone C2 — the maximal difference theorem.** `SN-C04`–`SN-C12`.

**Milestone C3 — duality.** `SN-C13`–`SN-C15`.

**Milestone C4 — index laws.** `SN-C16`–`SN-C23`.

### Part D: entropy numbers, the pseudo-s-numbers

**Objects.** The entropy numbers measure the image of the unit ball by coverings with `2^n`
balls. They are pseudo-s-numbers in the sense of Pietsch (*Operator Ideals*, Chapter 12): they
satisfy the axioms (S1)–(S3) and fail the rank axiom (S4), since `eₙ(T) > 0` for every
`T ≠ 0`. They bound every s-number sequence from above with the factor `2e (n+1)`.
`SN-D01`–`SN-D06` are over any nontrivially normed `𝕜` unless stated; `SN-D07`–`SN-D14` are
over `RCLike 𝕜`.

- **SN-D01 — Entropy number.** `eₙ(T) := ⨅ {ε : ∃ N : Finset Y, N.card ≤ 2^n ∧ T(B_X) ⊆ ⋃_{y ∈ N} closedBall y ε}`,
  with `B_X` the closed unit ball and arbitrary centres in `Y`; `e₀` allows one ball.
- **SN-D02 — Monotonicity and the norm.** `e_{n+1}(T) ≤ eₙ(T) ≤ ‖T‖₊` and `e₀(T) = ‖T‖₊`: a
  ball `closedBall y ε ⊇ T(B_X)` also contains `-T(B_X)`, so `‖T x‖ ≤ ε` for every `x ∈ B_X`.
- **SN-D03 — Additivity.** `e_{n+m}(S + T) ≤ eₙ(S) + e_m(T)`: cover `S(B_X)` by `2^n` balls
  and `T(B_X)` by `2^m` balls and take all sums of centres.
- **SN-D04 — Multiplicativity.** Over a `DenselyNormedField 𝕜`,
  `e_{n+m}(B ∘L S) ≤ eₙ(B) * e_m(S)`: cover `S(B_X)` by `2^m` balls of radius `ε`, rescale each
  ball into `B_Y` by a scalar of norm just above `ε`, and cover each image `B(ball)` by `2^n`
  balls.
- **SN-D05 — Pseudo-s-numbers.** The entropy numbers satisfy (S1) by `SN-D02`, (S2)
  `eₙ(S + T) ≤ eₙ(S) + ‖T‖₊` by `SN-D03` with `m = 0`, and (S3)
  `eₙ(B ∘L T ∘L A) ≤ ‖B‖₊ * eₙ(T) * ‖A‖₊` by `SN-D04` with one index `0`, over a
  `DenselyNormedField 𝕜`; they fail (S4): `eₙ(T) > 0` for every `T ≠ 0` and every `n`, since
  `T(B_X)` contains a segment `[-T x, T x]` with `T x ≠ 0`, which no finite family of balls
  of radius below `‖T x‖ / 2^{n+1}` covers.
- **SN-D06 — Entropy numbers and compactness.** `eₙ(T) → 0` if and only if `T(B_X)` is
  totally bounded; for complete `Y`, `IsCompactOperator T ↔ eₙ(T) → 0`.
- **SN-D07 — Dyadic comparison.** `d_{2^n}(T) ≤ eₙ(T)` and `c_{2^n}(T) ≤ 2 eₙ(T)`, from
  `SN-B06` with a `2^n`-point net.
- **SN-D08 — Separation bounds entropy from below.** If `T(B_X)` contains more than `2^n`
  points at mutual distance `≥ δ`, then `eₙ(T) ≥ δ / 2`.
- **SN-D09 — Entropy of the identity.** `eₙ(id_X) ≥ 1/2` when `n < rank X`. For
  finite-dimensional `X`, compare volumes: `2^n` balls of radius `ε` cover `B_X` only if
  `2^n ε^D ≥ 1`, `D > n` the real dimension. For infinite-dimensional `X`, Riesz's lemma
  gives infinitely many points of `B_X` at mutual distance at least `r` for every `r < 1`,
  and `SN-D08` applies.
- **SN-D10 — Triangular flags.** For `γ < dₙ(T)` there are `x₀, …, xₙ ∈ B_X` and subspaces
  `V₀, …, Vₙ ≤ Y` with `T x_k ∈ V_j` for `k < j` and `‖T x_j + w‖ > γ` for all `w ∈ V_j`; for
  `0 < γ < cₙ(T)` there are `x₀, …, xₙ ∈ B_X` and `ρ₀, …, ρₙ ∈ Y*` with `‖ρ_j‖ ≤ 1`,
  `ρ_j (T x_j) = γ` and `ρ_i (T x_j) = 0` for `i < j`.
- **SN-D11 — Gelfand and Kolmogorov against entropy numbers.**
  `max (cₙ(T), dₙ(T)) ≤ (n+1) eₙ(T)`: the `2^{n+1}` sign combinations `∑ ε_k T x_k` of a
  triangular flag are `2γ/(n+1)`-separated, and `SN-D08` applies.
- **SN-D12 — Approximation numbers against entropy numbers on Hilbert spaces.**
  `aₙ(T) ≤ 2 eₙ(T)` for `T` between complete Hilbert spaces: for `γ < aₙ(T)` the scalar
  factorization `SN-B02` gives contractions with `γ⁻¹ B T A = id` on `ℓ₂^{n+1}`, so
  `1/2 ≤ eₙ(id_{ℓ₂^{n+1}}) ≤ γ⁻¹ eₙ(T)` by `SN-D09` and `SN-D04`.
- **SN-D13 — Hilbert numbers against entropy numbers.** `hₙ(T) ≤ 2 eₙ(T)`: each
  `aₙ(B T A)` in `SN-A18` is at most `2 eₙ(B T A) ≤ 2 ‖B‖ eₙ(T) ‖A‖` by `SN-D12` and
  `SN-D04`.
- **SN-D14 — Entropy numbers bound every s-number sequence.** `s T n ≤ 2e (n+1) eₙ(T)` for
  every s-number sequence, from `SN-C11` with `t = h` and `SN-D13`.

**Milestone D1 — the calculus of entropy numbers.** `SN-D01`–`SN-D06`.

**Milestone D2 — entropy numbers against s-numbers.** `SN-D07`–`SN-D14`.

### Part E: examples and acceptance theorems

Over `RCLike 𝕜`. These exercise the definitions on operators whose s-numbers are known
exactly, and they certify that the constants of Part C are of the right order.

#### Identities and diagonal operators between `ℓ_p^m` spaces

- **SN-E01 — Norm of the identity.** For `1 ≤ p ≤ q < ∞` and `m ≥ 1`,
  `‖id : ℓ_q^m → ℓ_p^m‖ = m^{1/p - 1/q}`.
- **SN-E02 — Approximation numbers of the identity.** For `1 ≤ p ≤ q < ∞` and `n < m`,
  `aₙ(id : ℓ_q^m → ℓ_p^m) = (m - n)^{1/p - 1/q}`.
- **SN-E03 — Strict sequences on `ℓ_p^m`.** For every strict s-number sequence, `1 ≤ p ≤ ∞`
  and `n < m`, `s (id_{ℓ_p^m}) n = 1`.
- **SN-E04 — Diagonal operators, same exponent.** For `1 ≤ p ≤ ∞`, `σ : Fin m → 𝕜` with
  `|σ|` nonincreasing and `D_σ : ℓ_p^m → ℓ_p^m`, `D_σ x = (σ_i x_i)_i`: `‖D_σ‖ = max |σ_i|` and
  `s (D_σ) n = |σₙ|` for every strict s-number sequence and `n < m`.
- **SN-E05 — Diagonal operators, `p < q`.** For `1 ≤ p < q < ∞`, `1/r = 1/p - 1/q`, `|σ|`
  nonincreasing and `D_σ : ℓ_q^m → ℓ_p^m`: `aₙ(D_σ) = (∑_{k ≥ n} |σ_k|^r)^{1/r}`, in
  particular `‖D_σ‖ = ‖σ‖_{ℓ_r}`.
- **SN-E06 — Diagonal operators, `q ≤ p`.** For `1 ≤ q ≤ p ≤ ∞` and `D_σ : ℓ_q^m → ℓ_p^m`:
  `‖D_σ‖ = max |σ_i|` and `s (D_σ) n ≤ |σₙ|` for every s-number sequence.

#### The inclusion `ℓ₁ → ℓ_∞`

Write `I : ℓ₁ →L[𝕜] ℓ_∞` for the inclusion of `lp (fun _ : ℕ => 𝕜) 1` into
`lp (fun _ : ℕ => 𝕜) ∞`.

- **SN-E07 — Sign averaging.** For finitely many vectors `w_j` of an inner product space and
  `M : ℝ`, if `‖∑ ε_j w_j‖ ≤ M` for every choice of signs `ε ∈ {±1}^J`, then
  `∑ ‖w_j‖² ≤ M²`.
- **SN-E08 — Column and row bounds.** For `B : ℓ_∞ →L[𝕜] H`, `∑_{j ∈ J} ‖B e_j‖² ≤ ‖B‖²` for
  every finite `J`; for `A : H →L[𝕜] ℓ₁` with rows `w_j ∈ H`, `⟪w_j, x⟫ = (A x)_j`,
  `∑_{j ∈ J} ‖w_j‖² ≤ ‖A‖²`.
- **SN-E09 — Approximation numbers of a factored operator.** If `T = T₂ ∘L T₁` is compact,
  `T₁ : H₁ →L H₂`, `T₂ : H₂ →L H₃`, and `∑_{k ∈ s} ‖T₁ u_k‖² ≤ a²`, `∑_{k ∈ s} ‖T₂† v_k‖² ≤ b²`
  for all finite `s` and all orthonormal families `(u_k)`, `(v_k)`, then
  `(n+1) aₙ(T) ≤ ∑_{k ≤ n} a_k(T) ≤ a b`, through the Schmidt series of `T` (B4).
- **SN-E10 — Gelfand numbers of the inclusion.** `1/2 ≤ cₙ(I) ≤ 1` for all `n`.
- **SN-E11 — Hilbert numbers of the inclusion.** `hₙ(I) = 1 / (n+1)`: the upper bound from
  `SN-E08`, `SN-E09` applied to `B I A = (B ∘ ι₂) ∘ (ι₁ ∘ A)` with the inclusions
  `ι₁ : ℓ₁ → ℓ₂`, `ι₂ : ℓ₂ → ℓ_∞`; the lower bound from `A := (n+1)^{-1/2} id : ℓ₂^{n+1} → ℓ₁^{n+1}`
  and `B := (n+1)^{-1/2} id : ℓ_∞^{n+1} → ℓ₂^{n+1}`.
- **SN-E12 — The factor `n+1` is of the right order.** `(n+1)/2 * hₙ(I) ≤ cₙ(I) ≤ aₙ(I)`, so
  no bound `aₙ ≤ φ(n) hₙ` with `φ(n) = o(n)` holds for all operators.

#### The identity of `ℓ₁^m`

- **SN-E13 — Hilbert numbers of the identity of `ℓ₁^m`.** For `n < m`,
  `(n+1)^{-1/2} ≤ hₙ(id_{ℓ₁^m}) ≤ κ_𝕜 (n+1)^{-1/2}`, with `κ_𝕜` the Grothendieck constant of
  B6. Lower bound: `A := (n+1)^{-1/2} id : ℓ₂^{n+1} → ℓ₁^{n+1}` and
  `B := id : ℓ₁^{n+1} → ℓ₂^{n+1}`, both embedded in the first `n+1` coordinates, give
  `B ∘ id ∘ A = (n+1)^{-1/2} id` on `ℓ₂^{n+1}`. Upper bound: for contractions `A : ℓ₂ → ℓ₁^m` and
  `B : ℓ₁^m → ℓ₂`, `π₂(B A) ≤ π₁(B) ≤ κ_𝕜` (B6), hence `∑_k ‖B A u_k‖² ≤ κ_𝕜²` for every
  orthonormal family, and `(n+1) aₙ(B A)² ≤ ∑_{k ≤ n} a_k(B A)² ≤ κ_𝕜²` by the Schmidt series
  (B4). Consequently the Hilbert numbers are not strict: `hₙ(id_{ℓ₁^m}) < 1` for
  `n + 1 > κ_𝕜²` and `m > n`.
- **SN-E14 — The Hilbert numbers are not multiplicative.** For `n` with
  `(n+1)² > κ_𝕜² (2n+1)` and `m > 2n`, `h_{2n}(id_{ℓ₁^m}) > hₙ(id_{ℓ₁^m})²` by `SN-E13`, while
  multiplicativity would give `h_{2n}(id ∘ id) ≤ hₙ(id)²`.

**Milestone E1 — identities and diagonal operators.** `SN-E01`–`SN-E06`.

**Milestone E2 — the inclusion `ℓ₁ → ℓ_∞`.** `SN-E07`–`SN-E12`.

**Milestone E3 — the identity of `ℓ₁^m`.** `SN-E13`–`SN-E14`.

## Worked examples (acceptance criteria)

- **All sequences agree on a finite diagonal.** For `D_σ : ℓ₂^m → ℓ₂^m` with `|σ|`
  nonincreasing, `aₙ = cₙ = dₙ = bₙ = hₙ = |σₙ|` (`SN-B03`, `SN-E04`).
- **The sandwich is strict.** For the inclusion `I : ℓ₁ → ℓ_∞`, `hₙ(I) = 1/(n+1) < 1/2 ≤ cₙ(I)`
  for `n ≥ 2` (`SN-E10`, `SN-E11`). Over `ℝ` the sign-averaging bounds `SN-E07`, `SN-E08`
  carry constant `1`; over `ℂ` the same statements hold with the same constant, by splitting
  real and imaginary parts.
- **The maximal difference theorem is sharp up to `e`.** `cₙ(I) ≥ (n+1)/2 * hₙ(I)` against
  `aₙ(I) ≤ e (n+1) hₙ(I)` (`SN-C10`, `SN-E12`).
- **Compactness bites.** The diagonal operator on `ℓ₂` with coefficients `1/(n+1)` is compact
  and every s-number sequence of it tends to `0`; the identity of an infinite-dimensional
  space has `cₙ = dₙ = 1` for all `n` and is not compact (`SN-A09`, `SN-A13`, `SN-B09`).
- **Duality on a finite example.** For `D_σ : ℓ_q^m → ℓ_p^m` with `1 ≤ p < q < ∞`,
  `cₙ(D_σ') = dₙ(D_σ)` with `D_σ' : ℓ_{p'}^m → ℓ_{q'}^m` the transpose (`SN-C15` in finite
  dimension).
- **The Hilbert numbers fail two laws.** `SN-E13` and `SN-E14`.
- **Strict, additive and multiplicative are independent.** `a`, `c`, `d` have all three
  properties; `b` is strict and neither additive nor multiplicative (`SN-A17`, `SN-C22`,
  `SN-C23`); `h` is additive and neither strict nor multiplicative (`SN-C20`, `SN-E13`,
  `SN-E14`).

## Ordering

Part A consumes `OperatorIdeals` Part A. Part B consumes Part A, `OI-A29`, `OI-A39` and
`OI-A49`. Part C consumes Parts A and B, `BanachSpaceTheory` B1 (duality) and B7 (projection
theorems and local reflexivity). Part D consumes Parts A–C; `SN-D14` consumes `SN-C11`. Part E
consumes Parts A–D, B4 (Schmidt series) and B6 (Grothendieck's theorem, `SN-E13` only).

## Ownership boundaries

- **`OperatorIdeals`** owns the approximation numbers and every gauge of them (Ky Fan,
  Schatten, trace class, Hilbert–Schmidt). This roadmap consumes `singularValue` through the
  abbreviation `approximationNumber` and adds no gauge. The Hilbert numbers are defined from approximation numbers and are a different
  s-number sequence, owned here.
- **`BanachSpaceTheory`** owns duality (B1), the Schmidt series and nuclear operators (B4),
  summing operators and Grothendieck's inequality (B6), the Banach–Mazur distance, local
  reflexivity, John's theorem and the projection theorems (B7).
- **`PolarDecomposition`** owns finite singular systems.
- This roadmap owns the axioms of s-number sequences, the Gelfand, Kolmogorov, Bernstein,
  Hilbert and entropy numbers, the inequalities between them, and the examples of Part E.

## Definitions

**D1 (`SN-A02`).** An s-number sequence is a family `s` with (S1) `s T 0 = ‖T‖₊`, antitone;
(S2) `s (S + T) n ≤ s S n + ‖T‖₊`; (S3) `s (B T A) n ≤ ‖B‖₊ s T n ‖A‖₊`; (S4) `rank T ≤ n →
s T n = 0`; (S5) `s (id_{ℓ₂^{n+1}}) n = 1`. Strict (`SN-A03`): (S5′) `s (id_X) n = 1` for
`n < rank X`.

**D2 (`SN-A08`).** `cₙ(T) = inf {‖T|_M‖ : M ≤ X closed, codim M ≤ n}`.

**D3 (`SN-A10`).** `dₙ(T) = inf_{dim V ≤ n} sup_{‖x‖ ≤ 1} dist (T x, V)`.

**D4 (`SN-A16`).** `bₙ(T) = sup_{dim M = n+1} inf_{0 ≠ x ∈ M} ‖T x‖ / ‖x‖`.

**D5 (`SN-A18`).** `hₙ(T) = sup {aₙ(B T A) : A : ℓ₂ → X, B : Y → ℓ₂, ‖A‖ ≤ 1, ‖B‖ ≤ 1}`.

**D6 (`SN-C04`).** `Δ_k(T) = sup {|det (B T A)| : A : ℓ₂^k → X, B : Y → ℓ₂^k, ‖A‖ ≤ 1, ‖B‖ ≤ 1}`.

**D7 (`SN-D01`).** `eₙ(T) = inf {ε : T(B_X) is covered by 2^n closed ε-balls of Y}`.

**D8 (`SN-A21`, `SN-A22`).** A metric injection preserves norms; a metric surjection is a
contraction with `‖x‖ = inf {‖w‖ : Q w = x}`. A sequence is injective when invariant under
post-composition with metric injections, surjective when invariant under pre-composition
with metric surjections.

## References

- A. Pietsch, *s-Numbers of operators in Banach spaces*, Studia Math. **51** (1974),
  201–223: the axioms, the five sequences, the lifting and embedding identities, the duality
  `SN-C13`–`SN-C15`.
- A. Pietsch, *Operator Ideals*, North-Holland, 1980, Chapter 11 (s-numbers) and Chapter 12
  (entropy numbers as pseudo-s-numbers; 12.3.2 is `SN-D11`).
- A. Pietsch, *Eigenvalues and s-Numbers*, Cambridge Studies in Advanced Mathematics 13,
  1987, Chapter 2; 1.5.5 (Kadec–Snobar), 1.7.17 (Garling–Gordon), 2.10.2 (`SN-C01`).
- B. Carl and I. Stephani, *Entropy, Compactness and the Approximation of Operators*,
  Cambridge, 1990, Chapters 1–2: entropy numbers and their comparison with s-numbers.
- M. Ullrich, *Inequalities between s-numbers*, Adv. Oper. Theory **9** (2024), no. 4, art. 82:
  the bound `max(cₙ, dₙ) ≤ (n+1)(h₀ ⋯ hₙ)^{1/(n+1)}`, which `SN-C10` sharpens.
- M. Ullrich, *On bounds between all s-numbers and widths of convex sets*, arXiv:2608.05024
  (2026): the maximal difference theorem `SN-C07`–`SN-C12` and the example `SN-E12`.
- D. J. H. Garling and Y. Gordon, *Relations between some constants associated with finite
  dimensional Banach spaces*, Israel J. Math. **9** (1971), 346–361; M. I. Kadets and
  M. G. Snobar, *Certain functionals on the Minkowski compactum*, Mat. Zametki **10** (1971),
  453–457: the projection theorems consumed in `SN-C01`, `SN-C02`.
- A. Pietsch, *Bad properties of the Bernstein numbers*, Studia Math. **184** (2008),
  Theorem 3: the Bernstein numbers are neither additive nor multiplicative; `SN-C22`,
  `SN-C23` are elementary finite examples.
- B. S. Mityagin and G. M. Henkin, *Inequalities between n-diameters*, Proc. Seminar on
  Functional Analysis, Voronezh 1963: the conjecture behind `SN-C12`.

## Provenance

An Apache-2.0 formalization of everything in this roadmap except the duality
`SN-C13`–`SN-C15` and the identity of `ℓ₁^m` in `SN-E13`, `SN-E14` exists in
[Lean-SNumbers](https://github.com/mario-ullrich/Lean-SNumbers) (Mario Ullrich, Lean 4 with
Mathlib `v4.35.0`, sorry-free, with a blueprint that names the Lean declaration of every
statement). It defines the five sequences with values in `ℝ` over `NontriviallyNormedField 𝕜`
and the Hilbert numbers over `RCLike 𝕜`, proves the maximal difference theorem through the
determinant quantities `Δ_k`, and contains John's theorem over `𝕜` with the two projection
theorems. The roadmap specifies the mathematics; the repository is a cited source, and its
file map is not prescriptive: `SNumbers/Basic.lean` (`SN-A01`–`SN-A05`),
`Approximation.lean`, `Gelfand.lean`, `GelfandEmbedding.lean`, `Kolmogorov.lean`,
`KolmogorovLifting.lean`,
`Bernstein.lean`, `Hilbert.lean`, `Injectivity.lean` (Part A), `Uniqueness.lean`,
`SingularValuesFinDim.lean`, `AddOns/Compact.lean` (Part B), `Inequalities.lean`,
`MaxDifference.lean`, `BasicResults/Determinant.lean` (Part C), `Entropy.lean`,
`EntropyBounds.lean` (Part D), `Examples/` and `BasicResults/LittleGrothendieck.lean`
(Part E; `Examples/IdentityL2Linfty.lean` for `SN-C21`–`SN-C23`).
