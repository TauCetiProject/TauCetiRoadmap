# Roadmap: s-numbers and entropy numbers of operators between Banach spaces

**Summary.** Singular values are defined for operators between Hilbert spaces. An *s-number
sequence* assigns to every bounded operator T : X → Y between normed spaces a nonincreasing
sequence s₀(T) ≥ s₁(T) ≥ … ≥ 0 that behaves like them. It starts at the operator norm, moves by at
most ‖S‖ under a perturbation T + S, satisfies sₙ(BTA) ≤ ‖B‖ sₙ(T) ‖A‖, vanishes at index n on
operators of rank at most n, and equals 1 at index n on the identity of Euclidean (n + 1)-space.
These are Pietsch's axioms. Five classical sequences satisfy them: the approximation numbers aₙ
(the distance to operators of rank at most n), the Gelfand numbers cₙ (restrictions to subspaces
of codimension at most n), the Kolmogorov numbers dₙ (the distance of the image of the unit ball
from n-dimensional subspaces), the Bernstein numbers bₙ (the best lower bound of T on an
(n + 1)-dimensional subspace) and the Hilbert numbers hₙ (the approximation numbers of the
operators B T A factored through ℓ₂). The roadmap also builds the entropy numbers eₙ, the least
radius of 2ⁿ balls covering the image of the unit ball. Indexing starts at zero, values are
nonnegative reals, and the scalars form a nontrivially normed field, ℝ or ℂ wherever Hilbert
spaces, duality or the examples enter.

The headline theorems are these. Every s-number sequence satisfies hₙ(T) ≤ sₙ(T) ≤ aₙ(T), the upper
bound over any nontrivially normed field and the lower one over ℝ or ℂ; between Hilbert spaces all
s-number sequences are the approximation numbers, and in finite dimension the singular values. The
maximal difference theorem: over ℝ or ℂ, aₙ(T) ≤ e (n + 1) hₙ(T) for every operator between normed
spaces, hence sₙ(T) ≤ e (n + 1) tₙ(T) for any two s-number sequences; for the inclusion ℓ₁ → ℓ∞,
cₙ ≥ (n + 1)/2 · hₙ, so the linear factor cannot be improved. Over ℝ or ℂ, the Kolmogorov numbers
of the dual operator are the Gelfand numbers of T, and for compact T between Banach spaces the
Gelfand numbers of the dual are the Kolmogorov numbers of T. Over ℝ or ℂ the entropy numbers bound
every s-number sequence, sₙ(T) ≤ 2e (n + 1) eₙ(T), and for complete Y, T is compact if and only if
cₙ(T) → 0, if and only if dₙ(T) → 0, if and only if eₙ(T) → 0.

The approximation numbers, with their calculus, the min–max formulas on Hilbert spaces, the
compactness criterion on Hilbert targets and the Eckart–Young theorem, come from Tau Ceti, in the
area of the [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) roadmap.
[BanachSpaceTheory](../BanachSpaceTheory/README.md) supplies duality, the Schmidt series,
Grothendieck's theorem, local reflexivity and the projection theorems of Kadec–Snobar and
Garling–Gordon. Mathlib supplies operators, quotients, Riesz's lemma and the Hahn–Banach theorem.

Below, Layer 1 states the axioms and verifies them for the five sequences, with Pietsch's lifting
and embedding identities, injectivity and surjectivity. Layer 2 proves the sandwich, uniqueness on
Hilbert spaces, the compactness criteria and the extremal property of the Bernstein numbers.
Layer 3 proves the projection bounds, the maximal difference theorem through determinant
quantities, duality and the index laws. Layer 4 develops the entropy numbers, and Layer 5 computes
the examples that calibrate the constants.

## How to read the build

Each layer is a sequence of numbered targets `### k.n`. A target names its scalar field and its
completeness hypotheses in its own statement, and its *Needs:* line lists what the statement and
the route described need, so that a target proved another way is not blocked behind an unrelated
one. Layer 1 rests on Mathlib and on Tau Ceti's approximation numbers. Layer 2 rests on Layer 1 and
on Tau Ceti's min–max theory and Eckart–Young theorem. Layer 3 rests on Layers 1 and 2, on Tau
Ceti's duality isometries and local reflexivity, and on the projection theorems of
BanachSpaceTheory B7. Layer 4 rests on Layers 1–3. Layer 5 rests on Layers 1–4, on the Schmidt
series of BanachSpaceTheory B4 and on Grothendieck's theorem of BanachSpaceTheory B6.

## Conventions

1. **Indexing is zero-based.** `s₀(T) = ‖T‖`. The one-based literature writes `s_{n+1}` for the
   `sₙ` of this roadmap. Tau Ceti's approximation numbers follow the same convention.
2. **Values are in `ℝ≥0`.** Inequalities are stated in `ℝ≥0` where both sides are, and in `ℝ` where
   a real constant such as `e = Real.exp 1`, `√n` or `(n+1)⁻¹` appears.
3. **The approximation numbers** `aₙ(T) = inf {‖T − R‖ : rank R ≤ n}` are Tau Ceti's
   `ContinuousLinearMap.singularValue`, defined over any nontrivially normed field on seminormed
   spaces in any universes. On Banach spaces "singular value" is a misnomer, since singular values
   are the Hilbert-space case. This README calls them approximation numbers and writes `aₙ(T)`, and
   it uses the library declaration under the library's name. No second name is introduced, and
   the library's calculus applies unchanged.
4. **Spaces** are normed spaces (`NormedAddCommGroup`, `NormedSpace 𝕜`) over a scalar field `𝕜`.
   Completeness of a space is a hypothesis of the statements whose proofs use it, and of no
   other statement. `B_X` is the closed unit ball `Metric.closedBall (0 : X) 1`.
5. **Scalar field, by target.** Each target names the field it needs. Over any
   `NontriviallyNormedField 𝕜`: the axioms and their elementary consequences, the approximation,
   Gelfand and Bernstein numbers as strict s-number sequences, the Kolmogorov numbers as an
   s-number sequence, injectivity and surjectivity, the upper bound by approximation numbers,
   the Bernstein comparisons of §2.11 and §2.12, the index laws of the Gelfand and Kolmogorov
   numbers, and the definition, monotonicity, additivity and compactness criterion of the entropy
   numbers. A complete field (`CompleteSpace 𝕜`) is needed for the strictness of the Kolmogorov
   numbers (Riesz's lemma on a finite-dimensional, hence closed, subspace). Dense norm values
   (`DenselyNormedField 𝕜`) are needed for the unit-ball form of the Kolmogorov numbers and the
   multiplicativity of entropy numbers, and a complete densely normed field for Pietsch's lifting
   identity. Everything else, namely the embedding identity, the Hilbert numbers, everything on
   Hilbert spaces, the compactness criteria by `cₙ` and `dₙ`, the projection bounds, the maximal
   difference theorem, duality, `e₀(T) = ‖T‖` and the comparisons of entropy numbers with
   s-numbers, and the examples, is over `RCLike 𝕜`.
6. **One universe.** An s-number family is defined on all pairs of normed spaces in one universe
   `u` over `𝕜 : Type u`. It is a family indexed by all pairs of spaces, like Tau Ceti's
   `TauCeti.OperatorIdealFamily`, with source and target in the universe of `𝕜`. The Hilbert numbers
   test with `ℓ₂ := lp (fun _ : ℕ => 𝕜) 2`, which lives in that universe.
7. **Rank** is Mathlib's `LinearMap.rank` of the underlying linear map, written `T.rank`, a
   cardinal; "`rank T ≤ n`" compares with `(n : Cardinal)`. Dimensions and codimensions of
   subspaces are `Module.rank 𝕜 V` and `Module.rank 𝕜 (X ⧸ M)`.
8. **Model spaces.** `ℓ₂^{n+1} := EuclideanSpace 𝕜 (Fin (n+1))`,
   `ℓ_p^m := PiLp p (fun _ : Fin m => 𝕜)` for `1 ≤ p ≤ ∞`, and `ℓ_p := lp (fun _ : ℕ => 𝕜) p`.
9. **Duality.** The dual of `X` is `StrongDual 𝕜 X`, written `X*`. The dual operator
   `T' : Y* → X*`, `φ ↦ φ ∘ T`, is Mathlib's `ContinuousLinearMap.precomp 𝕜 T`. For a subspace
   `M ≤ X` the annihilator `Mᗮ ≤ X*` and, for `V ≤ X*`, the preannihilator `V_⊥ ≤ X` are Mathlib's
   `Submodule.orthogonalBilin` for `topDualPairing 𝕜 X` and its flip, as in Tau Ceti. The
   identifications `(X/M)* ≅ Mᗮ` and `M* ≅ X*/Mᗮ` are Tau Ceti's (supplier contracts below).
10. **Names.** The four sequences built here, the entropy numbers and the determinant quantities
    are `ContinuousLinearMap.gelfandNumber`, `kolmogorovNumber`, `bernsteinNumber`,
    `hilbertNumber`, `entropyNumber` and `detNumber`, each of type `(X →L[𝕜] Y) → ℕ → ℝ≥0`. The
    family type and the axioms are `TauCetiRoadmap.SNumbers.SNumberFamily`, `IsSNumberSequence` and
    `IsStrictSNumberSequence`. The families of the six sequences are
    `TauCetiRoadmap.SNumbers.approximation`, `gelfand`, `kolmogorov`, `bernstein`, `hilbert` and
    `entropy`.

## Layer 1: the axioms and the five classical sequences

An s-number family assigns to every bounded `T : X →L[𝕜] Y` between normed spaces in one universe
a sequence `ℕ → ℝ≥0`. The five classical families are the approximation numbers, which are Tau
Ceti's, and the Gelfand, Kolmogorov, Bernstein and Hilbert numbers, built here. Sections 1.1–1.7
set up the axioms and their first model, the approximation numbers. Sections 1.8–1.15 treat the
Gelfand and Kolmogorov numbers, 1.16–1.20 the Bernstein and Hilbert numbers, and 1.21–1.24
injectivity and surjectivity.

### 1.1 s-number families

Define `SNumberFamily 𝕜`, for `𝕜 : Type u` a nontrivially normed field, as the type of families
`s` assigning to every pair of normed `𝕜`-spaces `X`, `Y : Type u` and every `T : X →L[𝕜] Y` a
sequence `s T : ℕ → ℝ≥0` (Pietsch 1974). *Needs:* Mathlib `ContinuousLinearMap`,
`NormedSpace`.

### 1.2 s-number sequences

Define `IsSNumberSequence s` as the conjunction of Pietsch's axioms, for all normed spaces and all
bounded operators (Ullrich 2026, §2):

- (S1) `s T 0 = ‖T‖₊`, and `n ↦ s T n` is antitone;
- (S2) `s (S + T) n ≤ s S n + ‖T‖₊`;
- (S3) `s (B ∘L T ∘L A) n ≤ ‖B‖₊ * s T n * ‖A‖₊`;
- (S4) `rank T ≤ n → s T n = 0`;
- (S5) `s (id : ℓ₂^{n+1} → ℓ₂^{n+1}) n = 1`.

*Needs:* §1.1; Mathlib `LinearMap.rank`, `EuclideanSpace`.

**Checks.**
- For the identity of `ℓ₂²` every s-number sequence has `s₀ = s₁ = 1` and `s₂ = 0`: (S1) gives
  `s₀ = ‖id‖ = 1`, (S5) with `n = 1` gives `s₁ = 1`, and (S4) with `n = 2` gives `s₂ = 0`. A
  one-based reading of (S5), the identity of `ℓ₂ⁿ` at index `n`, would instead force `s₂ = 1`,
  against the zero-based (S4).

### 1.3 Strict s-number sequences

Define `IsStrictSNumberSequence s` as (S1)–(S4) together with (S5′): `s (id_X) n = 1` for every
normed space `X` with `n < Module.rank 𝕜 X`, including infinite-dimensional `X` (Pietsch 1974, §1;
Ullrich 2024, Remark 1). Prove that (S5′) implies (S5), since `ℓ₂^{n+1}` has rank `n + 1`, so that a
strict s-number sequence is an s-number sequence. *Needs:* §1.2; Mathlib `Module.rank`,
`WithLp.linearEquiv`, `rank_fin_fun`.

### 1.4 Norm bound and continuity

Prove that every s-number sequence satisfies `s T n ≤ ‖T‖₊` (from (S1)),
`|s S n − s T n| ≤ ‖S − T‖` (from (S2) applied to `S = T + (S − T)` and symmetrically), and that
`T ↦ s T n` is continuous in operator norm; the second is `IsSNumberSequence.abs_sub_le`.
*Needs:* §1.2.

### 1.5 Homogeneity

Prove `IsSNumberSequence.smul`: every s-number sequence satisfies `s (c • T) n = ‖c‖₊ * s T n`.
The inequality `≤` is (S3) with `B = c • id`; for `c ≠ 0` the reverse is the same with `c⁻¹`, and
for `c = 0` both sides vanish by (S4). *Needs:* §1.2.

### 1.7 Approximation numbers form a strict s-number sequence

Prove `isStrictSNumberSequence_approximation`: over every nontrivially normed field, the family
`approximation` of Tau Ceti's approximation numbers `T ↦ T.singularValue` is a strict s-number
sequence. Each axiom is a theorem of Tau Ceti: (S1) is `singularValue_zero` and
`antitone_singularValue`, (S2) is `singularValue_add_le`, (S3) is `singularValue_comp_comp_le`,
(S4) is `singularValue_eq_zero_of_rank_le`, and (S5′) is `singularValue_id`, which gives
`aₙ(id_X) = 1` for `n < rank X` with no completeness of `𝕜` or of `X` (Pietsch 1987, Chapter 2).
*Needs:* §1.3; Tau Ceti `ContinuousLinearMap.singularValue`, `singularValue_zero`,
`antitone_singularValue`, `singularValue_add_le`, `singularValue_comp_comp_le`,
`singularValue_eq_zero_of_rank_le`, `singularValue_id`.

### 1.8 Gelfand numbers

Define `ContinuousLinearMap.gelfandNumber`:
`cₙ(T) := ⨅ {‖T ∘L M.subtypeL‖₊ : M ≤ X closed, rank (X ⧸ M) ≤ n}`, the infimum of the norms of the
restrictions of `T` to closed subspaces of codimension at most `n` (Pietsch 1974). API:

- `c₀(T) = ‖T‖`, since the only closed subspace of codimension `0` is `X`, and `n ↦ cₙ(T)` is
  antitone;
- `cₙ(T) ≤ ‖T‖` and `cₙ(T) ≤ ‖T|_M‖` for every admissible `M`;
- for every `ε > 0` there is a closed `M` of codimension at most `n` with `‖T|_M‖ < cₙ(T) + ε`.

*Needs:* Mathlib `Submodule.subtypeL`, `Module.rank`, the quotient `X ⧸ M`.

**Checks.**
- `c₀(T) = ‖T‖` for every `T`, while the variant with subspaces of *dimension* at most `n` would
  give `c₀(T) = 0`, the norm of the restriction to `M = 0`.
- For `D = diag(2, 1)` on `ℓ₂²` over `ℝ`, `c₀(D) = 2`, `c₁(D) = 1` (the restriction to the line
  spanned by `(cos θ, sin θ)` has norm `√(4cos²θ + sin²θ) ≥ 1`, with equality on the second axis)
  and `c₂(D) = 0`.

### 1.9 Gelfand numbers are strict

Prove `isStrictSNumberSequence_gelfand`: over any nontrivially normed field, `gelfand` is a strict
s-number sequence (Pietsch 1974, §4). (S3) uses `M' := A⁻¹(M)`, which is closed, of codimension
at most that of `M` by the first isomorphism theorem for `π_M ∘ A`. (S4) uses `M := ker T`. (S5′)
holds because the inclusion of `M` is an isometry and `codim M ≤ n < rank X` forces `M ≠ 0`.
*Needs:* §1.3, §1.8; Mathlib `Submodule.comap`, `LinearMap.quotKerEquivRange`,
`rank_quotient_add_rank_of_divisionRing`.

### 1.10 Kolmogorov numbers

Define `ContinuousLinearMap.kolmogorovNumber`:
`dₙ(T) := ⨅ {‖V.mkQL ∘L T‖₊ : V ≤ Y, rank V ≤ n}`, the infimum over subspaces `V` of dimension at
most `n` of the norm of `T` followed by the quotient map `π_V : Y → Y ⧸ V`, with the quotient
seminorm (Pietsch 1974). API:

- `d₀(T) = ‖T‖`, since `Y ⧸ ⊥` is isometric to `Y`, and `n ↦ dₙ(T)` is antitone;
- `‖π_V y‖ = infDist y V` (Mathlib `QuotientAddGroup.norm_mk`), so that `‖π_V ∘ T‖` bounds
  `infDist (T x) V / ‖x‖` for every `x ≠ 0`.

*Needs:* Mathlib `Submodule.mkQL`, `Submodule.Quotient.seminormedAddCommGroup`,
`QuotientAddGroup.norm_mk`.

### 1.11 Unit-ball form

Prove that over a `DenselyNormedField 𝕜`,
`dₙ(T) = ⨅_{rank V ≤ n} ⨆_{‖x‖ ≤ 1} infDist (T x) V`, the deviation of `T(B_X)` from the best
`n`-dimensional subspace: the norm of `π_V ∘ T` is the supremum over the closed unit ball
(`ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`). *Needs:* §1.10; Mathlib
`ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`, `QuotientAddGroup.norm_mk`.

**Checks.**
- Over `ℚ₂` with the norm `(3/2)|x|₂` the identity has `d₀ = 1`, while every point of its closed
  unit ball has norm at most `3/4`: the norm values are `(3/2)·2ᵏ`, so `‖x‖ ≤ 1` forces
  `|x|₂ ≤ 1/2`. The two forms differ there, and only the quotient form satisfies (S1).

### 1.12 Kolmogorov numbers are an s-number sequence

Prove that over any nontrivially normed field `kolmogorov` is an s-number sequence (Pietsch 1974).
(S1) is the API of §1.10. (S2) is the triangle inequality for `π_V ∘ T`. (S3) transports an
admissible `V` for `T` to `B(V)` for `B ∘ T ∘ A`. (S4) takes `V := range T`. (S5) holds because
every subspace `V` of `ℓ₂^{n+1}` of dimension at most `n` is closed (an intersection of kernels of
linear functionals, which are continuous on `𝕜^{n+1}`) and proper, and Riesz's lemma gives
`‖π_V‖ = 1`. *Needs:* §1.2, §1.10; Mathlib `riesz_lemma`, `Submodule.map`.

### 1.13 Kolmogorov numbers are strict

Prove `isStrictSNumberSequence_kolmogorov`: over a complete field (`CompleteSpace 𝕜`) the
Kolmogorov numbers form a strict s-number sequence (Pietsch 1974, Theorem 5.1). For
`rank V ≤ n < rank X` the finite-dimensional `V` is closed and proper, and Riesz's lemma gives,
for every `r < 1`, a vector `x ≠ 0` with `dist (x, V) ≥ r ‖x‖`, so `‖π_V‖ = 1` and `dₙ(id_X) = 1`.
Completeness of `𝕜` is needed: over `ℚ`, the line `ℚ · 1` is dense in the `ℚ`-normed space `ℝ`, so
`d₁(id_ℝ) = 0` although `ℝ` has rank greater than `1`. *Needs:* §1.3, §1.12; Mathlib
`riesz_lemma`, `Submodule.closed_of_finiteDimensional`.

### 1.14 Pietsch's lifting identity

Prove `kolmogorovNumber_eq_singularValue_comp_summation`: over a complete `DenselyNormedField 𝕜`,
for complete `X` and every `T : X →L[𝕜] Y`, `dₙ(T) = aₙ(T ∘L Q_X)`, where `Q_X : ℓ₁(B_X) → X`,
`Q_X α = ∑_{x ∈ B_X} α x • x`, is the summation surjection from
`lp (fun _ : closedBall (0 : X) 1 => 𝕜) 1` (Pietsch 1974). Dense norm values make `Q_X` a metric
surjection, so `dₙ(T) = dₙ(T ∘ Q_X)` by §1.24, and the inequality `dₙ(T) ≤ aₙ(T ∘ Q_X)` takes
`V := range L` for a rank-`≤ n` approximant `L`. The reverse lifts near-best points
`w_x ∈ V` to `L α := ∑ α x • w_x`, which converges in the complete space `V`. *Needs:* §1.10,
§1.24; Tau Ceti `ContinuousLinearMap.singularValue`, `singularValue_le_nnnorm_sub`; Mathlib `lp`,
`Submodule.complete_of_finiteDimensional`.

**Checks.**
- Over `ℚ`, with `X = Y = ℝ` and `T = id`, `d₁(T) = 0` because `ℚ` is dense in `ℝ`, while
  `a₁(Q_X) = 1`: a `ℚ`-linear map of rank at most one from `ℓ₁(B_ℝ; ℚ)` into `ℝ` is continuous and
  rational-valued after division by a vector spanning its range, so it vanishes on all but finitely
  many basis vectors `δ_x`, and `‖(Q_X − L) δ_x‖ = |x|` for the others. The completeness of `𝕜`
  excludes this.

### 1.15 Pietsch's embedding identity

Prove `gelfandNumber_eq_singularValue_embedding_comp`: over `RCLike 𝕜`, `cₙ(T) = aₙ(J_Y ∘L T)`,
where `J_Y : Y → ℓ∞(B_{Y*})`, `(J_Y y) φ = φ y`, is the canonical metric injection into
`lp (fun _ : closedBall (0 : StrongDual 𝕜 Y) 1 => 𝕜) ∞` (Pietsch 1974). The inequality
`aₙ(J_Y T) ≤ cₙ(T)`: for `M` of codimension `≤ n` and each `φ ∈ B_{Y*}`, the Hahn–Banach theorem
extends `(φ ∘ T)|_M` to `g_φ ∈ X*` with `‖g_φ‖ ≤ ‖T|_M‖`; then `L x := (φ(T x) − g_φ x)_φ` factors
through `X ⧸ M`, has rank `≤ n`, and `‖J_Y T − L‖ ≤ ‖T|_M‖`. The reverse: for `L` of rank `≤ n`,
`M := ker L` has codimension `≤ n`, and `‖T|_M‖ = ‖(J_Y T − L)|_M‖ ≤ ‖J_Y T − L‖` because `J_Y` is
isometric. *Needs:* §1.8; Tau Ceti `ContinuousLinearMap.singularValue`, `le_singularValue_iff`
and `singularValue_le_nnnorm_sub` (supplier contracts); Mathlib `exists_extension_norm_eq`,
`exists_dual_vector''`, `lp`.

### 1.16 Bernstein numbers

Define `ContinuousLinearMap.bernsteinNumber`:
`bₙ(T) := ⨆ {⨅_{0 ≠ x ∈ M} ‖T x‖₊ / ‖x‖₊ : M ≤ X, rank M = n + 1}`, the largest gain of `T` on an
`(n+1)`-dimensional subspace, and `0` when `X` has no such subspace (Pietsch 1974). API:

- `b₀(T) = ‖T‖`, since the gain on the line `𝕜 x` is `‖T x‖ / ‖x‖`, and `n ↦ bₙ(T)` is antitone;
- `bₙ(T) = 0` when `rank X ≤ n`.

*Needs:* Mathlib `Module.rank`, `Submodule`.

**Checks.**
- For `id : ℓ₂² → ℓ∞²` over `ℝ`, `b₁ = 1/√2`: the only two-dimensional subspace is the whole
  plane, and `min ‖x‖∞ / ‖x‖₂ = 1/√2`, attained at `(1, 1)`. The variant with the supremum of
  `‖T x‖ / ‖x‖` over `M` in place of the infimum gives `1`, the norm.

### 1.17 Bernstein numbers are strict

Prove `isStrictSNumberSequence_bernstein`: over any nontrivially normed field `bernstein` is a strict
s-number sequence (Pietsch 1974, Theorem 4.5). (S2) is the pointwise triangle inequality
through infimum and supremum. (S3): if `A` is not injective on `M` the gain of `B T A` vanishes,
and otherwise `A(M)` has dimension `n + 1`. (S4) is rank–nullity. (S5′) holds because the
identity has gain `1` on every nonzero subspace. *Needs:* §1.3, §1.16; Mathlib
`LinearMap.rank_range_add_rank_ker`.

### 1.18 Hilbert numbers

Define `ContinuousLinearMap.hilbertNumber` over `RCLike 𝕜`:
`hₙ(T) := ⨆ {aₙ(B ∘L T ∘L A) : A : ℓ₂ →L[𝕜] X, B : Y →L[𝕜] ℓ₂, ‖A‖ ≤ 1, ‖B‖ ≤ 1}` (Pietsch 1987,
Chapter 2). API:

- `hₙ(T) ≤ aₙ(T)` (Tau Ceti `singularValue_comp_comp_le`), so the supremum is bounded by `‖T‖`;
- `hₙ(T) ≥ aₙ(B T A)` for every pair of contractions, and for every `ε > 0` some pair attains
  `aₙ(B T A) > hₙ(T) − ε`.

*Needs:* Tau Ceti `ContinuousLinearMap.singularValue`, `singularValue_comp_comp_le`; Mathlib `lp`.

### 1.19 Ratio form

Prove `hₙ(T) = ⨆ {aₙ(B T A) / (‖B‖₊ * ‖A‖₊) : A ≠ 0, B ≠ 0}`, by rescaling `A` and `B` to norm one
with the homogeneity of the approximation numbers. *Needs:* §1.18; Tau Ceti `singularValue_smul`.

### 1.20 Hilbert numbers are an s-number sequence

Prove `isSNumberSequence_hilbert`: over `RCLike 𝕜` the family `hilbert` is an s-number sequence
(Pietsch 1987, Chapter 2). (S1)–(S4) are pushed through the supremum from Tau Ceti's calculus of
the approximation numbers. `h₀(T) = ‖T‖` uses a rank-one factorization of unit vectors through
`ℓ₂` and the Hahn–Banach theorem. (S5) tests the supremum with the canonical embedding and
projection between `ℓ₂^{n+1}` and `ℓ₂`. The Hilbert numbers are not strict (§5.13). *Needs:* §1.2,
§1.18; Tau Ceti `singularValue_zero`, `antitone_singularValue`, `singularValue_add_le`,
`singularValue_comp_comp_le`, `singularValue_eq_zero_of_rank_le`, `singularValue_id`; Mathlib
`exists_dual_vector''`.

### 1.21 Metric injections and surjections

Define a metric injection `J : Y →L[𝕜] Z` by `‖J y‖ = ‖y‖` for all `y`, and a metric surjection
`Q : W →L[𝕜] X` by `‖Q‖ ≤ 1` and `‖x‖ = ⨅ {‖w‖ : Q w = x}`; equivalently, every `x` has preimages
of norm less than `‖x‖ + ε` for every `ε > 0` (Pietsch 1980, Chapter 11). API:

- post-composition with `J` and pre-composition with `Q` leave the operator norm unchanged:
  `‖J ∘L T‖ = ‖T‖` and `‖T ∘L Q‖ = ‖T‖`;
- a metric injection is a linear isometry in Mathlib's sense (`LinearIsometry`), and `Q` is a
  metric surjection if and only if its underlying normed group homomorphism satisfies Mathlib's
  `NormedAddGroupHom.IsQuotient`;
- the quotient map `Y → Y ⧸ V` by any subspace is a metric surjection (Tau Ceti
  `Submodule.norm_comp_mkQL`).

*Needs:* Mathlib `LinearIsometry`, `NormedAddGroupHom.IsQuotient`; Tau Ceti
`Submodule.norm_comp_mkQL`.

### 1.22 Injective and surjective sequences

Define the predicates `Injective` and `Surjective` on s-number families: `s` is injective when
`s (J ∘L T) n = s T n` for every metric injection `J`, and surjective when `s (T ∘L Q) n = s T n`
for every metric surjection `Q`, for all operators and indices
(Pietsch 1980, Chapter 11). *Needs:* §1.1, §1.21.

### 1.23 Gelfand numbers are injective

Prove `injective_gelfand`: `cₙ(J ∘L T) = cₙ(T)`, over any nontrivially normed field, since
`‖J ∘ T|_M‖ = ‖T|_M‖` for every `M` (Pietsch 1974, Theorem 4.1). *Needs:* §1.8, §1.22.

### 1.24 Kolmogorov numbers are surjective

Prove `surjective_kolmogorov`: `dₙ(T ∘L Q) = dₙ(T)` over every nontrivially normed field, for the
quotient form of §1.10, since `‖π_V ∘ T ∘ Q‖ = ‖π_V ∘ T‖` by §1.21 (Pietsch 1974, Theorem 5.1).
*Needs:* §1.10, §1.21, §1.22.

**Checks.**
- On finitely supported sequences over `ℚ₂` with the norm `maxᵢ (1 + 1/(i+2)) |wᵢ|₂` and
  `Q w = ∑ wᵢ`, the map `Q` is a metric surjection (the preimages `x eᵢ` have norm tending to
  `|x|₂`), and the quotient form gives `d₀(Q) = 1 = d₀(id)`. The unit-ball deviation of `Q` is
  `1/2`: `‖w‖ ≤ 1` forces every `|wᵢ|₂ ≤ 1/2`, hence `|Q w|₂ ≤ 1/2`, with equality at `w = 2 e₀`.

### Examples

- Over any nontrivially normed field, for the identity of a normed space `X` and `n < rank X`, the
  approximation, Gelfand and Bernstein numbers are all `1`, and so are the Kolmogorov numbers over
  a complete field (§1.7, §1.9, §1.13, §1.17). For `n ≥ rank X` all of them vanish by (S4).
- For a rank-one operator `T = φ(·) y`, every s-number sequence has `s₀(T) = ‖φ‖ ‖y‖` and
  `sₙ(T) = 0` for `n ≥ 1`.

### Dependencies

Mathlib: bounded operators, normed quotients by arbitrary subspaces, `LinearMap.rank`, Riesz's
lemma, the Hahn–Banach theorem, `lp`, `EuclideanSpace`. Tau Ceti: the approximation numbers and
their calculus, including `singularValue_id`.

## Layer 2: the extremal sequences, Hilbert spaces and compactness

Every s-number sequence lies between the Hilbert numbers and the approximation numbers; on Hilbert
spaces the sandwich collapses. The Gelfand and Kolmogorov numbers detect compactness on every
Banach space, and the Bernstein numbers are the smallest injective strict s-numbers. Sections
2.1–2.5 prove the sandwich and uniqueness, and 2.6–2.12 compactness and the Bernstein numbers.

### 2.1 Upper bound by approximation numbers

Prove `IsSNumberSequence.le_singularValue`: over any nontrivially normed field, `s T n ≤ aₙ(T)` for
every s-number sequence `s`. By (S2) and (S4), `s T n ≤ s L n + ‖T − L‖₊ = ‖T − L‖₊` for every `L`
of rank `≤ n` (Pietsch 1987, Chapter 2). *Needs:* §1.2; Tau Ceti `le_singularValue_iff`.

### 2.2 Scalar factorization

Prove `exists_comp_comp_eq_smul_id`: over `RCLike 𝕜`, for a complete inner product space `H₁`, an
inner product space `H₂`, every bounded `T : H₁ →L[𝕜] H₂` and every `0 ≤ c < aₙ(T)`, there are
`A : ℓ₂^{n+1} →L[𝕜] H₁` and `B : H₂ →L[𝕜] ℓ₂^{n+1}` with `‖A‖ ≤ 1`, `‖B‖ ≤ 1` and
`B ∘L T ∘L A = c • id`. Route: the converse min–max localization gives an `(n+1)`-dimensional `V`
with `‖T x‖ ≥ c' ‖x‖` on `V` for some `c' > c`; take `A` an isometry onto `V` and
`B := c • (T ∘ A)⁻¹ ∘ P_{T(V)}` with the orthogonal projection onto the finite-dimensional, hence
complete, `T(V)` (Lean-SNumbers blueprint, Theorem 6.8). *Needs:* Tau Ceti
`TauCeti.HasMinMaxLowerBound.of_completeSpace`; Mathlib `EuclideanSpace`,
`Submodule.orthogonalProjection`.

### 2.3 Uniqueness on Hilbert spaces

Prove `IsSNumberSequence.eq_singularValue`: over `RCLike 𝕜`, `s T n = aₙ(T)` for every s-number
sequence `s` and every `T : H₁ →L[𝕜] H₂` from a complete inner product space to an inner product
space. One inequality is §2.1; for `c < aₙ(T)`, chain (S3), (S5) and §1.5 on §2.2 to get
`c ≤ s T n` (Pietsch 1987, Chapter 2). *Needs:* §1.5, §2.1, §2.2.

### 2.4 Lower bound by Hilbert numbers

Prove `IsSNumberSequence.hilbertNumber_le`: over `RCLike 𝕜`, `hₙ(T) ≤ s T n` for every s-number
sequence. Each `aₙ(B T A)` in the supremum defining `hₙ` equals `s (B T A) n` by §2.3 and is at
most `s T n` by (S3). Together with §2.1: `hₙ(T) ≤ sₙ(T) ≤ aₙ(T)` (Lean-SNumbers blueprint,
Theorem 4.2; Ullrich 2026, §1). *Needs:* §1.18, §2.3.

### 2.5 Singular values in finite dimension

Prove `IsSNumberSequence.eq_singularValues`: for finite-dimensional inner product spaces over
`RCLike 𝕜` and every s-number sequence, `s T n = σₙ(T)`, Mathlib's `LinearMap.singularValues`, by
§2.3 and the Eckart–Young identification. *Needs:* §2.3; Tau Ceti
`singularValue_eq_linearMap_singularValues`; Mathlib `LinearMap.singularValues`.

### 2.6 Covering estimates

Prove that over `RCLike 𝕜`, if `T(B_X)` is covered by `k` closed `ε`-balls with centres
`y₁, …, y_k`, then `d_k(T) ≤ ε` (take `V := span {y_i}`) and `c_k(T) ≤ 2ε`. For the second, take
`M := ⋂ ker (φ_i ∘ T) ⊆ X` for norming functionals `φ_i ∈ Y*` of the `y_i`, so that
`‖T x‖ ≤ 2ε` on `M ∩ B_X` (Carl–Stephani 1990, Chapters 1–2). *Needs:* §1.8, §1.10, §1.11; Mathlib
`exists_dual_vector''`.

### 2.7 Kolmogorov numbers and total boundedness

Prove that over `RCLike 𝕜`, `dₙ(T) → 0` if and only if `T(B_X)` is totally bounded. If
`dₙ(T) < ε`, then `T(B_X)` lies within `ε` of the bounded piece `V ∩ (‖T‖ + ε) B_Y` of a
finite-dimensional `V`, which is totally bounded; the converse is §2.6 (Pietsch 1974, Theorem 9.3).
*Needs:* §1.11, §2.6; Mathlib `TotallyBounded`, `FiniteDimensional.proper_rclike`.

### 2.8 Gelfand numbers and total boundedness

Prove that over `RCLike 𝕜`, `cₙ(T) → 0` if and only if `T(B_X)` is totally bounded. If
`cₙ(T) < ε` with `M` of finite codimension, the image of `B_X` in `X ⧸ M` is totally bounded; lift
a finite `δ`-net to `u₁, …, u_N ∈ B_X`. For `‖[x] − [u_j]‖ < δ` there is `m ∈ M` with
`‖(x − u_j) − m‖ < δ` and `‖m‖ ≤ 2 + δ`, a bound independent of the codimension, so
`‖T x − T u_j‖ < ε(2 + δ) + ‖T‖ δ`. No projection with kernel `M` is used: `(1 + √n) cₙ(T)` need
not tend to `0`. The converse is §2.6 (Pietsch 1974, Theorem 9.3). *Needs:* §1.8, §2.6; Mathlib
`TotallyBounded`, `FiniteDimensional.proper_rclike`.

### 2.9 Compactness on Banach spaces

Prove `isCompactOperator_iff_tendsto_kolmogorovNumber` and
`isCompactOperator_iff_tendsto_gelfandNumber`: over `RCLike 𝕜` and for complete `Y`,
`IsCompactOperator T ↔ cₙ(T) → 0 ↔ dₙ(T) → 0`. The forward implications need no completeness
(Pietsch 1974, Theorem 9.3). *Needs:* §2.7, §2.8; Tau Ceti
`IsCompactOperator.totallyBounded_image_closedBall`,
`isCompactOperator_of_totallyBounded_image_closedBall`.

**Checks.**
- For `𝕜 = 𝔽₂(u)((t))`, which is complete but not locally compact, `id_𝕜` has `dₙ = 0` for
  `n ≥ 1` and is not compact, since its closed unit ball `𝔽₂(u)[[t]]` has infinite residue field
  `𝔽₂(u)`. The scalar field matters.

### 2.10 Compactness on Hilbert spaces

Prove `IsSNumberSequence.isCompactOperator_iff`: for complete Hilbert spaces over `RCLike 𝕜` and
every s-number sequence `s`, `IsCompactOperator T ↔ s T n → 0`, by §2.3 and the compactness
criterion for approximation numbers on Hilbert targets. *Needs:* §2.3; Tau Ceti
`isCompactOperator_iff_tendsto_singularValue`.

### 2.11 Bernstein numbers below Gelfand numbers

Prove `bernsteinNumber_le_gelfandNumber`: `bₙ(T) ≤ cₙ(T)` over any nontrivially normed field. An
`(n+1)`-dimensional `M` and a closed `N` of codimension `≤ n` meet in a nonzero vector `x`, so the
gain of `T` on `M` is at most `‖T x‖ / ‖x‖ ≤ ‖T|_N‖` (Pietsch 1974, Theorem 8.1). *Needs:* §1.8,
§1.16.

### 2.12 Bernstein numbers are the smallest injective strict s-numbers

Prove `IsStrictSNumberSequence.bernsteinNumber_le`: over any nontrivially normed field,
`bₙ(T) ≤ sₙ(T)` for every injective strict s-number sequence `s`. If `T` has gain `c > 0` on an
`(n+1)`-dimensional `M`, then `T|_M = ι ∘ T₀` with `ι` the inclusion of `T(M)` (a metric
injection) and `T₀ : M → T(M)` invertible with `‖T₀⁻¹‖ ≤ 1/c`. Injectivity, (S3) and (S5′) give
`1 = sₙ(id_M) ≤ c⁻¹ sₙ(T₀) = c⁻¹ sₙ(T|_M) ≤ c⁻¹ sₙ(T)` (Pietsch 1974, Theorem 4.6). *Needs:*
§1.3, §1.16, §1.22.

### Examples

- For a diagonal operator `D_σ : ℓ₂^m → ℓ₂^m` with `|σ|` nonincreasing and `n < m`, every s-number
  sequence gives `|σₙ|` (§2.3, §5.4).
- The diagonal operator on `ℓ₂` with coefficients `1/(n+1)` is compact, and every s-number
  sequence of it tends to `0` (§2.10).

### Dependencies

Layer 1. Tau Ceti: the converse min–max localization on Hilbert spaces, the Eckart–Young
identification, the compactness criterion for approximation numbers on Hilbert targets, and the
characterization of compact operators by total boundedness. Mathlib: `LinearMap.singularValues`,
orthogonal projections, `TotallyBounded`.

## Layer 3: inequalities between s-numbers

The projection theorems compare `aₙ` with `cₙ` and `dₙ` up to `1 + √n`. The determinant
quantities `Δ_k` compare `aₙ` with `hₙ` up to `e (n+1)`, which bounds any two s-number sequences
against each other. Duality exchanges `cₙ` and `dₙ`, and the additive and multiplicative index
laws extend from `aₙ` to `cₙ`, `dₙ` and, for additivity, `hₙ`. Everything in this layer is over
`RCLike 𝕜` except the bordered determinant of §3.6, which is over a commutative ring, and the index
laws of §3.16–§3.18, which are over any nontrivially normed field. Sections 3.1–3.3 prove the
projection bounds, 3.4–3.12 the maximal difference theorem, 3.13–3.15 duality and 3.16–3.22 the
index laws.

### 3.1 Gelfand bound

Prove `singularValue_le_sqrt_mul_gelfandNumber`: `aₙ(T) ≤ (1 + √n) cₙ(T)` (Pietsch 1987, 2.10.2).
For `M` of codimension `≤ n` and a Garling–Gordon projection `P` with `ker P = M` and
`‖P‖ ≤ √n + ε`, `T ∘ P` has rank `≤ n` and `‖T − T P‖ = ‖T|_M ∘ (1 − P)‖ ≤ (1 + √n + ε) ‖T|_M‖`.
*Needs:* §1.8; BanachSpaceTheory B7 (the Garling–Gordon projection theorem); Tau Ceti
`singularValue_le_nnnorm_sub`.

### 3.2 Kolmogorov bound

Prove `singularValue_le_sqrt_mul_kolmogorovNumber`: `aₙ(T) ≤ (1 + √n) dₙ(T)` (Pietsch 1987,
Chapter 2; Kadets–Snobar 1971). For `V` of dimension `≤ n` and a Kadec–Snobar projection `P` onto
`V`, `P ∘ T` has rank `≤ n` and `‖(1 − P) y‖ ≤ (1 + √n) infDist y V`. *Needs:* §1.10, §1.11;
BanachSpaceTheory B7 (the Kadec–Snobar projection theorem); Tau Ceti `singularValue_le_nnnorm_sub`.

### 3.3 Combined bound

Prove `aₙ(T) ≤ (1 + √n) min (cₙ(T), dₙ(T))`, from §3.1 and §3.2 (Pietsch 1974, Theorem 8.4, whose
proof gives the factor `1 + √n` in this indexing). *Needs:* §3.1, §3.2.

### 3.4 Determinant quantities

Define `ContinuousLinearMap.detNumber`: for `k : ℕ`,
`Δ_k(T) := ⨆ {|det (B ∘L T ∘L A)| : A : ℓ₂^k →L[𝕜] X, B : Y →L[𝕜] ℓ₂^k, ‖A‖ ≤ 1, ‖B‖ ≤ 1}`, with
`det` the determinant of the endomorphism `B T A` of `ℓ₂^k` (Ullrich 2026, §3). API:

- `Δ_0(T) = 1`, the determinant of the endomorphism of the zero space;
- `Δ_k(T) ≤ ‖T‖^k`, since `|det S| ≤ ‖S‖^k` on `ℓ₂^k`;
- `Δ_1(T) = ‖T‖`, by the Hahn–Banach theorem.

*Needs:* Mathlib `LinearMap.det`, `EuclideanSpace`, `exists_dual_vector''`.

**Checks.**
- For `T = diag(1, t)` on `ℓ₂²` with `0 ≤ t ≤ 1`: `Δ_1(T) = 1` and `Δ_2(T) = t`, since
  `|det (B T A)| = t |det B| |det A| ≤ t` for contractions, with equality at `A = B = id`. Then
  §3.7 at `k = 1` reads `t/4 ≤ t`, and §3.8 at `n = 1` reads `t ≤ h₁(T) Δ_1(T) = t`, an equality
  (`h₁(T) = a₁(T) = t` by §2.3). Without the constraints `‖A‖, ‖B‖ ≤ 1`, rescaling `A` would make the
  supremum infinite for `t > 0`.

### 3.5 Product of approximation numbers

Prove that for an endomorphism `S` of a finite-dimensional inner product space of dimension `m`
over `RCLike 𝕜`, `∏_{k < m} a_k(S) = |det S|` (Lean-SNumbers blueprint, Lemma 7.9). Route: the
Eckart–Young identification and Mathlib's `LinearMap.normDet_eq_prod_singularValues` with
`LinearMap.normDet_eq_norm_det`. *Needs:* Tau Ceti `singularValue_eq_linearMap_singularValues`;
Mathlib `LinearMap.normDet_eq_prod_singularValues`, `LinearMap.normDet_eq_norm_det`.

### 3.6 Bordered determinant

Prove that for a commutative ring `R`, a `(k+1) × (k+1)` matrix `M` and `w : Fin k → R` with
`M i last = ∑ j, M i j * w j` for every `i < k`,
`det M = (M last last − ∑ j, M last j * w j) * det M'`, `M'` the top-left `k × k` block. Route:
subtract `∑ j, w j • (column j)` from the last column, which leaves the determinant unchanged and
kills the last column off the diagonal, then expand along the last column. *Needs:* Mathlib
`Matrix.det_updateCol_add_smul_self`; Tau Ceti `Matrix.det_eq_mul_det_submatrix_castSucc_of_col`.

### 3.7 Lower recursion

Prove `pow_div_mul_singularValue_mul_detNumber_le`:
`k^k / (k+1)^{k+1} * a_k(T) * Δ_k(T) ≤ Δ_{k+1}(T)`, with `0⁰ = 1` (Ullrich 2026). Route: for an
admissible pair `(A, B)` for `Δ_k` with `det (B T A) ≠ 0`, the operator `L := T A (B T A)⁻¹ B T`
has rank at most `k`, so `‖T − L‖ ≥ a_k(T)`. Border the pair by a vector `x ∈ B_X` on which
`T − L` nearly attains its norm and a functional `b` of norm `≤ 1` norming `(T − L) x`; by §3.6 the
bordered determinant is `λ^{2k} μ² · b((T − L) x) · det (B T A)` for weights `λ² + μ² = 1`, and
optimize the weights. *Needs:* §3.4, §3.6; Tau Ceti `singularValue_le_nnnorm_sub`; Mathlib
`exists_dual_vector''`.

### 3.8 Upper recursion

Prove `detNumber_succ_le`: `Δ_{n+1}(T) ≤ hₙ(T) * Δ_n(T)` (Ullrich 2026). For an admissible pair for
`Δ_{n+1}`, `B T A` is an endomorphism of `ℓ₂^{n+1}`. By §3.5, `|det (B T A)| = ∏_{k ≤ n} a_k(B T A)`.
Through the coordinate embedding of `ℓ₂^{n+1}` in `ℓ₂`, `a_n(B T A) ≤ hₙ(T)` (§1.18). Restricting
the pair to the first `n` singular directions gives `∏_{k < n} a_k(B T A) ≤ Δ_n(T)`. *Needs:*
§1.18, §3.4, §3.5.

### 3.9 Maximal difference theorem, sharp form

Prove `singularValue_le_pow_div_pow_mul_hilbertNumber`: `aₙ(T) ≤ (n+1)^{n+1} / n^n * hₙ(T)` (with
`0⁰ = 1`), by §3.7, §3.8 and cancelling `Δ_n(T) > 0`, which holds when `aₙ(T) > 0` (Ullrich 2026,
Lemmas 3, 4 and the proof of Theorem 1). *Needs:* §3.7, §3.8.

**Checks.**
- At `n = 0` the sharp form reads `a₀(T) ≤ h₀(T)`, an equality since both are `‖T‖`. It uses
  `0⁰ = 1`. In Lean's `ℝ`, where `x / 0 = 0`, a convention `0⁰ = 0` would turn the bound into
  `a₀(T) ≤ 0`.
- At `n = 1, 2` the factor is `4` and `27/4`, below `e (n + 1) ≈ 5.44` and `8.15`.

### 3.10 Maximal difference theorem

Prove `singularValue_le_exp_mul_hilbertNumber`: `aₙ(T) ≤ e (n+1) hₙ(T)`, from §3.9 and
`(1 + 1/n)^n ≤ e` (Ullrich 2026, Theorem 1). *Needs:* §3.9; Mathlib `Real.one_add_inv_pow_le_exp`.

### 3.11 Any two s-number sequences

Prove `IsSNumberSequence.le_exp_mul`: `s T n ≤ e (n+1) * t T n` for all s-number sequences `s`,
`t`, from §2.1, §3.10 and §2.4 (Ullrich 2026). *Needs:* §2.1, §2.4, §3.10.

### 3.12 Gelfand and Kolmogorov against Bernstein numbers

Prove `max_gelfandNumber_kolmogorovNumber_le`: `max (cₙ(T), dₙ(T)) ≤ e (n+1) bₙ(T)`, the cases
`s = c, d` and `t = b` of §3.11 (Ullrich 2026; the conjecture behind it is Mityagin–Henkin 1963).
*Needs:* §1.9, §1.13, §1.17, §3.11.

### 3.13 Kolmogorov numbers of the dual

Prove `kolmogorovNumber_precomp`: `dₙ(T') = cₙ(T)` for every `T : X →L[𝕜] Y` between normed
spaces, with `T' = ContinuousLinearMap.precomp 𝕜 T` (Pietsch 1974, Theorem 6.2). The admissible
subspaces `V ≤ X*` of dimension `≤ n` and the closed `M ≤ X` of codimension `≤ n` correspond
through `M = V_⊥`, `V = Mᗮ`. A finite-dimensional `V` is weak-star closed, so `(V_⊥)ᗮ = V`, and
`(Mᗮ)_⊥ = M` for closed `M`. Moreover `X*/V ≅ (V_⊥)*` isometrically, so that
`‖π_V ∘ T'‖ = ‖(T|_{V_⊥})'‖ = ‖T|_{V_⊥}‖`. *Needs:* §1.8, §1.10; Tau Ceti
`Submodule.quotientAnnihilatorEquivDual`, `Submodule.quotientDualEquivAnnihilator`,
`Submodule.orthogonalBilin_orthogonalBilin_topDualPairing_eq_topologicalClosure`,
`Submodule.orthogonalBilin_orthogonalBilin_topDualPairing_flip_eq_of_finiteDimensional`,
`norm_precomp`; Mathlib `ContinuousLinearMap.precomp`.

### 3.14 Gelfand numbers of the dual

Prove `gelfandNumber_precomp_le`: `cₙ(T') ≤ dₙ(T)` for every `T` (Pietsch 1974, proof of
Theorem 6.3). For `V ≤ Y` of dimension `≤ n`, `Vᗮ` is closed of codimension `≤ n` in `Y*`, and
`‖T'|_{Vᗮ}‖ = ‖(π_V ∘ T)'‖ = ‖π_V ∘ T‖` through `(Y/V)* ≅ Vᗮ`. *Needs:* §1.8, §1.10; Tau Ceti
`Submodule.quotientDualEquivAnnihilator`, `Submodule.isClosed_orthogonalBilin_topDualPairing_flip`,
`norm_precomp`.

### 3.15 Duality for compact operators

Prove `gelfandNumber_precomp_of_isCompactOperator`: `cₙ(T') = dₙ(T)` for compact `T` between Banach
spaces (Pietsch 1974, Theorem 6.3). Since `dₙ(T'') = cₙ(T')` by §3.13, it suffices that
`dₙ(T) ≤ dₙ(T'')`. Take `W ≤ Y**` of dimension `≤ n` with `‖π_W ∘ T''‖ < dₙ(T'') + ε` and a finite
`δ`-net `T x₁, …, T x_N` of `T(B_X)`. Apply local reflexivity on `F := W + span {J_Y (T x_j)}`,
with a map `R : F → Y` of distortion `≤ 1 + ε` and `R (J_Y y) = y`. Then `V := R(W)` has dimension
`≤ n`, and `infDist (T x) V ≤ δ + (1 + ε)(dₙ(T'') + ε)` for every `x ∈ B_X`. *Needs:* §1.10, §2.7,
§3.13, §3.14; Tau Ceti `LinearIsometry.exists_continuousLinearMap_of_doubleDual`,
`IsCompactOperator.totallyBounded_image_closedBall`; Mathlib `NormedSpace.inclusionInDoubleDual`.

### 3.16 Additive and multiplicative families

Define the predicates `Additive` and `Multiplicative` on s-number families, over any nontrivially
normed field: `s` is additive when `s (S + T) (m + n) ≤ s S m + s T n`, and multiplicative when
`s (S ∘L T) (m + n) ≤ s S m * s T n`, for all operators and indices (Pietsch 1980, Chapter 11).
Prove that with (S1) an additive family satisfies (S2) and a multiplicative family satisfies (S3),
and that the approximation numbers are additive and multiplicative by Tau Ceti's
`singularValue_add_index_le` and `singularValue_comp_add_le_mul`.
*Needs:* §1.1, §1.2; Tau Ceti `singularValue_add_index_le`, `singularValue_comp_add_le_mul`.

### 3.17 Gelfand numbers are additive and multiplicative

Prove `additive_gelfand` and `multiplicative_gelfand`, over any nontrivially normed field.
Additivity: restrict to `M ∩ N`, whose codimension is at most `codim M + codim N`.
Multiplicativity: for `N ≤ Y` admissible for `S` and `M ≤ X` admissible for `T`, restrict to
`M ∩ T⁻¹(N)` (additivity: Pietsch 1974, Theorem 9.5; multiplicativity: Lean-SNumbers blueprint,
Theorem 3.6). *Needs:* §1.8, §3.16.

### 3.18 Kolmogorov numbers are additive and multiplicative

Prove `additive_kolmogorov` and `multiplicative_kolmogorov`, over any nontrivially normed field.
Additivity: use `V + W`. Multiplicativity: for `V ≤ Y` admissible for `T` and `W ≤ Z` admissible
for `S`, use `W + S(V)`, of dimension `≤ m + n`. Write `T x = v + r` with `v ∈ V` and `‖r‖` close
to `‖π_V T x‖`; then `S T x = S v + S r`, and `S r` is within `d_m(S) ‖r‖` of `W` (additivity:
Pietsch 1974, Theorem 9.5; multiplicativity: Lean-SNumbers blueprint, Theorem 3.8). *Needs:*
§1.10, §3.16.

### 3.19 Hilbert numbers are additive

Prove `additive_hilbert`: `h_{m+n}(S + T) ≤ h_m(S) + h_n(T)`, from the mixed-index additivity of
the approximation numbers under the supremum (Lean-SNumbers blueprint, Proposition 3.12). The
Hilbert numbers are not multiplicative (§5.14). *Needs:* §1.18, §3.16; Tau Ceti
`singularValue_add_index_le`.

### 3.20 Bernstein numbers of the identities between `ℓ₂^N` and `ℓ∞^N`

Prove that for `n < N`, `bₙ(id : ℓ₂^N → ℓ∞^N) ≤ 1/√(n+1)` and
`bₙ(id : ℓ∞^N → ℓ₂^N) ≤ √(N/(n+1))`. For the first, every
`(n+1)`-dimensional subspace contains a vector whose coordinates all have modulus `≤ 1` and at
least `n+1` of which have modulus `1`. For the second, take an orthonormal basis `v₀, …, vₙ` of
an `(n+1)`-dimensional `M` and a coordinate `k`. The vector `x = ∑ᵢ conj(vᵢ(k)) vᵢ ∈ M` has
`x(k) = ‖x‖₂²`, so `‖x‖₂² ≤ c⁻²` for the gain `c` on `M`, and summing over `k` gives
`c² (n+1) ≤ N` (Lean-SNumbers blueprint, proof of Theorem 3.4; the vector of the first bound is
Pietsch 1974, Lemma 7.1). *Needs:* §1.16; Mathlib `EuclideanSpace`, `PiLp`, `OrthonormalBasis`.

### 3.21 Bernstein numbers are not multiplicative

Prove `not_multiplicative_bernstein`. For `T = id : ℓ₂³ → ℓ∞³` and `S = id : ℓ∞³ → ℓ₂³`,
`b₂(S ∘L T) = b₂(id_{ℓ₂³}) = 1`, while by §3.20 `b₁(S) * b₁(T) ≤ √(3/2) · 1/√2 = √3/2 < 1`
(the failure is Pietsch 2008, Theorem 3; this finite example is elementary). *Needs:* §1.17,
§3.16, §3.20.

### 3.22 Bernstein numbers are not additive

Prove `not_additive_bernstein`. On `ℓ₂⁷¹ × ℓ∞⁷¹` with the maximum of the two norms, let
`S (x, y) = (0, x)` and `T (x, y) = (y/9, 0)`. Then `S + T` maps `(x, 3x)` to `(1/3) • (x, 3x)`, so
`b₇₀(S + T) ≥ 1/3`, while by §3.20 and (S3) `b₃₅(S) ≤ 1/6` and `b₃₅(T) ≤ √71/54 < 1/6`
(Pietsch 2008, Theorem 3, for both failures; the two examples here are elementary finite ones).
*Needs:* §1.17, §3.16, §3.20.

**Checks.**
- `√71/54 ≈ 0.15604 < 1/6 ≈ 0.16667`, so `b₃₅(S) + b₃₅(T) < 1/3`, and additivity would give
  `b₇₀(S + T) ≤ b₃₅(S) + b₃₅(T)`.

### Examples

- For the inclusion `I : ℓ₁ → ℓ∞`, `aₙ(I) ≥ cₙ(I) ≥ (n+1)/2 · hₙ(I)` (§5.12), against
  `aₙ(I) ≤ e (n+1) hₙ(I)` (§3.10): the factor `n + 1` is optimal up to a constant between `1/2`
  and `e`.
- On Hilbert spaces both sides of §3.13–§3.15 are the approximation numbers, which are invariant
  under the Hilbert adjoint (Tau Ceti `singularValue_adjoint`).

### Dependencies

Layers 1 and 2. BanachSpaceTheory B7: the Kadec–Snobar and Garling–Gordon projection theorems.
Tau Ceti: the duality isometries and the norm of the dual operator, local reflexivity, the
calculus and index laws of the approximation numbers, the Eckart–Young identification, and the
corner-minor expansion of determinants. Mathlib: determinants, `normDet` and singular values,
`(1 + 1/n)^n ≤ e`.

## Layer 4: entropy numbers, the pseudo-s-numbers

The entropy numbers measure the image of the unit ball by coverings with `2^n` balls. They are
pseudo-s-numbers in the sense of Pietsch (*Operator Ideals*, Chapter 12): they satisfy the axioms
(S1)–(S3) and fail the rank axiom (S4), since `eₙ(T) > 0` for every `T ≠ 0`. They bound every
s-number sequence from above with the factor `2e (n+1)`. §4.1, §4.3, §4.6 and the inequalities of
§4.2 are over any nontrivially normed field, and §4.4 over a `DenselyNormedField 𝕜`. The equality
`e₀ = ‖·‖` in §4.2, §4.5 and §4.7–§4.14 are over `RCLike 𝕜`. Sections 4.1–4.6 develop the calculus
of entropy numbers, and 4.7–4.14 compare them with s-numbers.

### 4.1 Entropy numbers

Define `ContinuousLinearMap.entropyNumber`:
`eₙ(T) := ⨅ {ε : ∃ N : Finset Y, N.card ≤ 2^n ∧ T(B_X) ⊆ ⋃_{y ∈ N} closedBall y ε}`, with arbitrary
centres in `Y`; `e₀` allows one ball (Carl–Stephani 1990, Chapters 1–2; Pietsch 1980, Chapter 12).
API:

- `eₙ(T)` is the infimum of the `ε ≥ 0` for which Mathlib's
  `Metric.externalCoveringNumber ε (T '' B_X)` is at most `2^n`;
- the set of admissible radii is nonempty (one ball of radius `‖T‖` about `0`) and upward closed.

*Needs:* Mathlib `Metric.closedBall`, `Metric.externalCoveringNumber`.

**Checks.**
- Over `ℝ`, `eₙ(id_ℝ) = 2^{-n}`: `2ⁿ` intervals of radius `2^{-n}` with midpoints spaced `2^{1-n}`
  cover `[−1, 1]`, and `2ⁿ` intervals of radius `r` cover a set of length at most `2^{n+1} r`. The
  variant with `n` balls in place of `2ⁿ` gives `e₁ = 1` and `e₂ = 1/2`.

### 4.2 Monotonicity and the norm

Prove `e_{n+1}(T) ≤ eₙ(T) ≤ ‖T‖₊` over any nontrivially normed field, and over `RCLike 𝕜` also
`e₀(T) = ‖T‖₊`. A ball `closedBall y ε ⊇ T(B_X)` also contains `−T(B_X)`, so `‖T x‖ ≤ ε` for every
`x ∈ B_X`, and rescaling gives `‖T‖ ≤ ε` (Carl–Stephani 1990, Chapters 1–2). *Needs:* §4.1; Mathlib
`ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`.

**Checks.**
- Over `ℚ₂` with the norm `(3/2)|x|₂` the identity has `e₀ = 3/4 < 1 = ‖id‖`: the norm is
  ultrametric, so a ball containing `0` and `2` has radius at least `‖2‖ = 3/4`, and the ball of
  radius `3/4` about `0` contains `B_X`.

### 4.3 Additivity

Prove `additive_entropy`: `e_{n+m}(S + T) ≤ eₙ(S) + e_m(T)`, over any nontrivially normed field.
Cover `S(B_X)` by `2^n` balls and `T(B_X)` by `2^m` balls and take all sums of centres
(Carl–Stephani 1990, Chapters 1–2). *Needs:* §3.16, §4.1.

### 4.4 Multiplicativity

Prove `multiplicative_entropy`: over a `DenselyNormedField 𝕜`, `e_{n+m}(B ∘L S) ≤ eₙ(B) * e_m(S)`.
Cover `S(B_X)` by `2^m` balls of radius `ε`, rescale each ball into `B_Y` by a scalar of norm just
above `ε`, and cover each image `B(ball)` by `2^n` balls (Carl–Stephani 1990, Chapters 1–2). *Needs:*
§3.16, §4.1.

### 4.5 Pseudo-s-numbers

Prove that over `RCLike 𝕜` the entropy numbers satisfy (S1) by §4.2, (S2)
`eₙ(S + T) ≤ eₙ(S) + ‖T‖₊` by §4.3 with `m = 0`, and (S3)
`eₙ(B ∘L T ∘L A) ≤ ‖B‖₊ * eₙ(T) * ‖A‖₊` by §4.4 with one index `0`. Prove `entropyNumber_pos`:
they fail (S4), since `eₙ(T) > 0` for every `T ≠ 0` and every `n`. Indeed `T(B_X)` contains the
segment `[−T x, T x]` for some `x ∈ B_X` with `T x ≠ 0`, and `2ⁿ` balls of radius `r` cover a
segment of length at most `2^{n+1} r`, so `eₙ(T) ≥ ‖T x‖ / 2ⁿ` (Pietsch 1980, Chapter 12). The
family `entropy` is therefore not an s-number sequence. *Needs:* §1.2, §4.2, §4.3, §4.4.

**Checks.**
- For `id_ℝ` the bound `eₙ ≥ ‖x‖ / 2ⁿ` at `x = 1` is attained (§4.1). Without a bound on the number
  of balls the conclusion fails, since a segment is covered by finitely many balls of any positive
  radius.

### 4.6 Entropy numbers and compactness

Prove that `eₙ(T) → 0` if and only if `T(B_X)` is totally bounded, and
`isCompactOperator_iff_tendsto_entropyNumber`: for complete `Y`, `IsCompactOperator T ↔ eₙ(T) → 0`,
over any nontrivially normed field (Carl–Stephani 1990, Chapters 1–2). *Needs:* §4.1; Tau Ceti
`IsCompactOperator.totallyBounded_image_closedBall`,
`isCompactOperator_of_totallyBounded_image_closedBall`; Mathlib `TotallyBounded`.

### 4.7 Dyadic comparison

Prove `kolmogorovNumber_two_pow_le_entropyNumber`: `d_{2^n}(T) ≤ eₙ(T)`, and `c_{2^n}(T) ≤ 2 eₙ(T)`,
from §2.6 with a `2^n`-point net. *Needs:* §2.6, §4.1.

### 4.8 Separation bounds entropy from below

Prove that if `T(B_X)` contains more than `2^n` points at mutual distance `≥ δ`, then
`eₙ(T) ≥ δ / 2`: a ball of radius below `δ/2` contains at most one of them (Carl–Stephani 1990,
Chapters 1–2). *Needs:* §4.1.

### 4.9 Entropy of the identity

Prove `eₙ(id_X) ≥ 1/2` when `n < rank X`. For finite-dimensional `X`, compare volumes: `2^n` balls
of radius `ε` cover `B_X` only if `2^n ε^D ≥ 1`, with `D > n` the real dimension. For
infinite-dimensional `X`, Riesz's lemma gives infinitely many points of `B_X` at mutual distance
at least `r` for every `r < 1`, and §4.8 applies (Carl–Stephani 1990, Chapters 1–2). *Needs:* §4.8;
Mathlib `riesz_lemma`, `MeasureTheory.Measure.addHaar_closedBall`.

### 4.10 Triangular flags

Prove the following two constructions (Pietsch 1980, Chapter 12):

- for `γ < dₙ(T)` there are `x₀, …, xₙ ∈ B_X` and subspaces `V₀, …, Vₙ ≤ Y` with `T x_k ∈ V_j` for
  `k < j` and `‖T x_j + w‖ > γ` for all `w ∈ V_j`; take `V_j := span {T x_k : k < j}`;
- for `0 < γ < cₙ(T)` there are `x₀, …, xₙ ∈ B_X` and `ρ₀, …, ρₙ ∈ Y*` with `‖ρ_j‖ ≤ 1`,
  `ρ_j (T x_j) = γ` and `ρ_i (T x_j) = 0` for `i < j`; take `x_j` in
  `⋂_{i<j} ker (ρ_i ∘ T) ∩ B_X` with `‖T x_j‖ > γ`, and `ρ_j` a rescaled norming functional of
  `T x_j`.

*Needs:* §1.8, §1.11; Mathlib `exists_dual_vector''`.

### 4.11 Gelfand and Kolmogorov against entropy numbers

Prove `max_gelfandNumber_kolmogorovNumber_le_entropyNumber`: `max (cₙ(T), dₙ(T)) ≤ (n+1) eₙ(T)`.
For a triangular flag the `2^{n+1}` vectors `(n+1)⁻¹ ∑ ε_k x_k`, `ε ∈ {±1}^{n+1}`, lie in `B_X`. Their
images are `2γ/(n+1)`-separated: compare at the largest index where two sign vectors differ for
the Kolmogorov flag, and apply `ρ_j` at the smallest such index for the Gelfand flag. Then §4.8
applies (Pietsch 1980, 12.3.2). *Needs:* §4.8, §4.10.

### 4.12 Approximation numbers against entropy numbers on Hilbert spaces

Prove `aₙ(T) ≤ 2 eₙ(T)` for `T` between complete Hilbert spaces over `RCLike 𝕜`. If `aₙ(T) = 0`
there is nothing to prove. Otherwise, for `0 < γ < aₙ(T)` the scalar factorization §2.2 gives
contractions with `γ⁻¹ B T A = id` on `ℓ₂^{n+1}`, so `1/2 ≤ eₙ(id_{ℓ₂^{n+1}}) ≤ γ⁻¹ eₙ(T)` by §4.9
and §4.5 (Carl–Stephani 1990, Chapters 1–2). *Needs:* §2.2, §4.5, §4.9.

### 4.13 Hilbert numbers against entropy numbers

Prove `hilbertNumber_le_two_mul_entropyNumber`: `hₙ(T) ≤ 2 eₙ(T)`. Each `aₙ(B T A)` in §1.18 is at
most `2 eₙ(B T A) ≤ 2 ‖B‖ eₙ(T) ‖A‖` by §4.12 and §4.5 (Pietsch 1980, 12.3.1; Carl–Stephani 1990,
Chapters 1–2). *Needs:* §1.18, §4.5, §4.12.

### 4.14 Entropy numbers bound every s-number sequence

Prove `IsSNumberSequence.le_two_exp_mul_entropyNumber`: `s T n ≤ 2e (n+1) eₙ(T)` for every
s-number sequence, from §3.11 with `t = h` and §4.13, a consequence of the maximal difference
theorem (Ullrich 2026). *Needs:* §1.20, §3.11, §4.13.

### Examples

- Over `ℝ`, `eₙ(id_ℝ) = 2^{-n}`, while every s-number sequence of `id_ℝ` is `1` at `n = 0` and `0`
  from `n = 1` on (§4.1, (S4)).
- The identity of an infinite-dimensional normed space over `ℝ` or `ℂ` has `eₙ ≥ 1/2` for every `n`
  (§4.9) and is not compact (§4.6).

### Dependencies

Layers 1–3. Mathlib: covering numbers, Haar measure of balls, Riesz's lemma, the Hahn–Banach
theorem. Tau Ceti: the characterization of compact operators by total boundedness.

## Layer 5: examples and acceptance theorems

Everything in this layer is over `RCLike 𝕜`. These targets exercise the definitions on operators
whose s-numbers are known exactly, and they certify that the constants of Layer 3 are of the right
order. Sections 5.1–5.6 treat identities and diagonal operators between the spaces `ℓ_p^m`,
5.7–5.12 the inclusion `ℓ₁ → ℓ∞`, and 5.13–5.14 the identity of `ℓ₁^m`. Throughout, `I : ℓ₁ →L[𝕜] ℓ∞`
is the inclusion of `lp (fun _ : ℕ => 𝕜) 1` into `lp (fun _ : ℕ => 𝕜) ∞`.

### 5.1 Norm of the identity

Prove that for `1 ≤ p ≤ q < ∞` and `m ≥ 1`, `‖id : ℓ_q^m → ℓ_p^m‖ = m^{1/p − 1/q}`, by Hölder's
inequality, with equality at the constant vector. *Needs:* Mathlib `PiLp`,
`Real.inner_le_Lp_mul_Lq`.

**Checks.**
- For `m = 2`, `p = 1`, `q = 2` the norm is `√2`, attained at `(1, 1)`; the reversed exponent
  `m^{1/q − 1/p}` would give `1/√2 < 1`, below the value `1` at a basis vector.

### 5.2 Approximation numbers of the identity

Prove that for `1 ≤ p ≤ q < ∞` and `n < m`, `aₙ(id : ℓ_q^m → ℓ_p^m) = (m − n)^{1/p − 1/q}`.
*Needs:* §5.1, §5.5; Tau Ceti `ContinuousLinearMap.singularValue`,
`singularValue_id`.

**Checks.**
- For `m = 2`, `p = 1`, `q = 2`, `n = 1` the value is `1`. Every `R` of rank one kills some
  `x ≠ 0`, and `‖x‖₁ ≥ ‖x‖₂`, so `‖id − R‖ ≥ 1`. The projection `R` onto the second coordinate
  leaves `id − R : x ↦ (x₁, 0)`, of norm `1`.

### 5.3 Strict sequences on `ℓ_p^m`

Prove that for every strict s-number sequence, `1 ≤ p ≤ ∞` and `n < m`, `s (id_{ℓ_p^m}) n = 1`,
from (S5′). *Needs:* §1.3; Mathlib `PiLp`, `Module.finrank_fin_fun`.

### 5.4 Diagonal operators, same exponent

Define the diagonal operator `ContinuousLinearMap.diagOp`: for `σ : Fin m → 𝕜`,
`D_σ = diagOp p q σ : ℓ_q^m → ℓ_p^m`, `(D_σ x)_i = σ_i x_i`. Prove that for
`1 ≤ p ≤ ∞` and `σ : Fin m → 𝕜` with `|σ|` nonincreasing, `D_σ : ℓ_p^m → ℓ_p^m` has
`‖D_σ‖ = max |σ_i|`, and prove `IsStrictSNumberSequence.apply_diagOp`: `s (D_σ) n = |σₙ|` for every
strict s-number sequence and `n < m` (Pietsch 1974, Theorem 7.1). The upper bound is §2.1 with the
truncation of `σ` after `n` terms; the lower bound restricts `D_σ` to the first `n + 1`
coordinates, where it is invertible with inverse of norm `|σₙ|⁻¹` when `σₙ ≠ 0`, and applies
(S5′). *Needs:* §1.3, §2.1; Mathlib `PiLp`, `WithLp.linearEquiv`.

### 5.5 Diagonal operators, `p < q`

Prove `singularValue_diagOp`: for `1 ≤ p < q < ∞`, `1/r = 1/p − 1/q`, `|σ|` nonincreasing and
`D_σ : ℓ_q^m → ℓ_p^m`, `aₙ(D_σ) = (∑_{k ≥ n} |σ_k|^r)^{1/r}` for `n < m`; in particular
`‖D_σ‖ = ‖σ‖_{ℓ_r}`. *Needs:* §5.4; Tau Ceti `ContinuousLinearMap.singularValue`,
`le_singularValue_of_lt_rank`; Mathlib `Real.inner_le_Lp_mul_Lq`.

### 5.6 Diagonal operators, `q ≤ p`

Prove that for `1 ≤ q ≤ p ≤ ∞`, `m ≥ 1` and `σ : Fin m → 𝕜` with `|σ|` nonincreasing,
`D_σ : ℓ_q^m → ℓ_p^m` has `‖D_σ‖ = max |σ_i|` and `s (D_σ) n ≤ |σₙ|` for every s-number sequence
and `n < m` (Lean-SNumbers blueprint, Theorem 8.6). *Needs:* §2.1, §5.4.

**Checks.**
- `σ = (0, 1)`, `p = q = 2`, `n = 0` violates the ordering, and indeed `a₀(D_σ) = ‖D_σ‖ = 1 > 0`.

### 5.7 Sign averaging

Prove that for finitely many vectors `w_j` of an inner product space and `M : ℝ`, if
`‖∑ ε_j w_j‖ ≤ M` for every choice of signs `ε ∈ {±1}^J`, then `∑ ‖w_j‖² ≤ M²`. The average of
`‖∑ ε_j w_j‖²` over all signs is `∑ ‖w_j‖²`, since the cross terms cancel; this holds over `ℝ` and
`ℂ` with the same constant. *Needs:* Mathlib `inner_add_left`, `Finset.sum_comm`.

### 5.8 Column and row bounds

Prove that for `B : ℓ∞ →L[𝕜] H`, `∑_{j ∈ J} ‖B e_j‖² ≤ ‖B‖²` for every finite `J`, and that for
`A : H →L[𝕜] ℓ₁` with rows `w_j ∈ H`, `⟪w_j, x⟫ = (A x)_j`, `∑_{j ∈ J} ‖w_j‖² ≤ ‖A‖²`. Both are §5.7:
`‖∑ ε_j e_j‖∞ = 1`, and `|∑ ε_j (A x)_j| ≤ ‖A x‖₁`. *Needs:* §5.7; Mathlib `lp`.

### 5.9 Approximation numbers of a factored operator

Prove that if `T = T₂ ∘L T₁` is compact, with `T₁ : H₁ →L H₂` and `T₂ : H₂ →L H₃` between complete
Hilbert spaces, and `∑_{k ∈ s} ‖T₁ u_k‖² ≤ a²`, `∑_{k ∈ s} ‖T₂† v_k‖² ≤ b²` for all finite `s` and
all orthonormal families `(u_k)`, `(v_k)`, with `a, b ≥ 0`, then
`(n+1) aₙ(T) ≤ ∑_{k ≤ n} a_k(T) ≤ a b` (Lean-SNumbers blueprint, Theorem 8.10). Route: the Schmidt
series of `T` gives `∑_{k ≤ n} a_k(T) = ∑_{k ≤ n} ⟪T₁ e_k, T₂† f_k⟫`, and the Cauchy–Schwarz
inequality concludes.
*Needs:* BanachSpaceTheory B4 (the Schmidt series with `sⱼ = aⱼ(T)`); Tau Ceti
`antitone_singularValue`; Mathlib `ContinuousLinearMap.adjoint`.

**Checks.**
- For `T₁ = T₂ = id_ℝ` and `n = 0`, `a = b = 1` gives `1 ≤ 1 ≤ 1`, while `a = −1`, `b = 1` satisfies
  the squared bounds and is excluded by `a ≥ 0`.

### 5.10 Gelfand numbers of the inclusion

Prove `half_le_gelfandNumber_inclusion`: `1/2 ≤ cₙ(I) ≤ 1` for all `n` (Ullrich 2026). The upper
bound is `‖I‖ = 1`. For the lower bound, a closed `M` of codimension `≤ n` is the intersection of
the kernels of `n` functionals; among infinitely many basis vectors two, `e_k` and `e_l`, have
nearly equal values under all of them, and a small correction of `e_k − e_l` lies in `M`, with
`‖·‖∞ / ‖·‖₁` close to `1/2`. *Needs:* §1.8; Mathlib `lp`.

### 5.11 Hilbert numbers of the inclusion

Prove `hilbertNumber_inclusion_l1_linfty`: `hₙ(I) = 1 / (n+1)` (Lean-SNumbers blueprint,
Corollary 8.14). The upper bound comes from §5.8 and §5.9 applied to `B I A = (B ∘ ι₂) ∘ (ι₁ ∘ A)`
with the inclusions `ι₁ : ℓ₁ → ℓ₂`, `ι₂ : ℓ₂ → ℓ∞`. The lower bound comes from
`A := (n+1)^{-1/2} id : ℓ₂^{n+1} → ℓ₁^{n+1}` and `B := (n+1)^{-1/2} id : ℓ∞^{n+1} → ℓ₂^{n+1}`,
embedded in the first `n + 1` coordinates.
*Needs:* §1.18, §5.8, §5.9.

### 5.12 The factor `n+1` is of the right order

Prove `mul_hilbertNumber_le_gelfandNumber_inclusion`: `(n+1)/2 * hₙ(I) ≤ cₙ(I) ≤ aₙ(I)`, so no bound
`aₙ ≤ φ(n) hₙ` with `φ(n) = o(n)` holds for all operators (Ullrich 2026). *Needs:* §1.9, §2.1,
§5.10, §5.11.

### 5.13 Hilbert numbers of the identity of `ℓ₁^m`

Prove `le_hilbertNumber_id_piLp_one`: for `n < m`, `(n+1)^{-1/2} ≤ hₙ(id_{ℓ₁^m})`, and the upper
bound `hₙ(id_{ℓ₁^m}) ≤ κ_𝕜 (n+1)^{-1/2}`, with `κ_𝕜` the constant with which BanachSpaceTheory B6
proves Grothendieck's theorem (`κ_ℝ = 8`, `κ_ℂ = 16`). In particular there is one constant `κ` with
`hₙ(id_{ℓ₁^m}) ≤ κ (n+1)^{-1/2}` for all `m` and `n`, which is `exists_hilbertNumber_id_piLp_one_le`.

- Lower bound: `A := (n+1)^{-1/2} id : ℓ₂^{n+1} → ℓ₁^{n+1}` and `B := id : ℓ₁^{n+1} → ℓ₂^{n+1}`,
  both embedded in the first `n+1` coordinates, give `B ∘ id ∘ A = (n+1)^{-1/2} id` on `ℓ₂^{n+1}`.
- Upper bound: for contractions `A : ℓ₂ → ℓ₁^m` and `B : ℓ₁^m → ℓ₂`, Grothendieck's theorem gives
  `π₂(B A) ≤ π₁(B) ≤ κ_𝕜`. Hence `∑_k ‖B A u_k‖² ≤ κ_𝕜²` for every orthonormal family, and
  `(n+1) aₙ(B A)² ≤ ∑_{k ≤ n} a_k(B A)² ≤ κ_𝕜²` by the Schmidt series.

Consequently the Hilbert numbers are not strict, `not_isStrictSNumberSequence_hilbert`:
`hₙ(id_{ℓ₁^m}) < 1` for `n + 1 > κ_𝕜²` and `m > n`. *Needs:* §1.3, §1.18; BanachSpaceTheory B6
(Grothendieck's theorem `π₁(T) ≤ κ_𝕜 ‖T‖` for `T : L¹(μ) → H`), BanachSpaceTheory B4 (the Schmidt
series), or Tau Ceti `tsum_singularValue_sq_le_hilbertSchmidtEnergy` for the last step; Tau Ceti
`ContinuousLinearMap.summingENorm`, `summingENorm_le_summingENorm_of_exponent_le`.

**Checks.**
- Over `ℝ`, `n = 64` and `m = 65` give `hₙ(id_{ℓ₁^m}) ≤ 8/√65 ≈ 0.9923 < 1`, so strictness fails
  already there.

### 5.14 The Hilbert numbers are not multiplicative

Prove `not_multiplicative_hilbert` (derived here from §5.13). For `n` with
`(n+1)² > κ_𝕜⁴ (2n+1)` and `m > 2n`, §5.13 gives
`h_{2n}(id_{ℓ₁^m}) ≥ (2n+1)^{-1/2} > κ_𝕜² (n+1)^{-1} ≥ hₙ(id_{ℓ₁^m})²`, while multiplicativity would
give `h_{2n}(id ∘ id) ≤ hₙ(id)²`. *Needs:* §3.16, §5.13.

**Checks.**
- For `κ_ℝ = 8`, `n = 8192` and `m = 16385`: `(n+1)² = 67125249 > 67112960 = 8⁴ (2n+1)`.

### Examples

- For `D_σ : ℓ₂^m → ℓ₂^m` with `|σ|` nonincreasing and `n < m`, all five sequences equal `|σₙ|`
  (§2.3, §5.4).
- `hₙ(I) = 1/(n+1) < 1/2 ≤ cₙ(I)` for `n ≥ 2` (§5.10, §5.11).

### Dependencies

Layers 1–4. BanachSpaceTheory B4 (the Schmidt series) and B6 (Grothendieck's theorem, §5.13 only).
Tau Ceti: the absolutely summing norms, the Hilbert–Schmidt bound on approximation numbers.
Mathlib: `PiLp`, `lp`, Hölder's inequality, adjoints.

## Worked examples

- **All sequences agree on a finite diagonal.** For `D_σ : ℓ₂^m → ℓ₂^m` with `|σ|` nonincreasing and
  `n < m`, `aₙ = cₙ = dₙ = bₙ = hₙ = |σₙ|` (§2.3, §5.4).
- **The sandwich is strict.** For the inclusion `I : ℓ₁ → ℓ∞`, `hₙ(I) = 1/(n+1) < 1/2 ≤ cₙ(I)` for
  `n ≥ 2` (§5.10, §5.11). Over `ℝ` the sign-averaging bounds §5.7, §5.8 carry constant `1`; over
  `ℂ` the same statements hold with the same constant, by splitting real and imaginary parts.
- **The maximal difference theorem is sharp up to a constant.** `cₙ(I) ≥ (n+1)/2 · hₙ(I)` against
  `aₙ(I) ≤ e (n+1) hₙ(I)` (§3.10, §5.12): the optimal factor lies between `(n+1)/2` and
  `e (n+1)`.
- **Compactness bites.** The diagonal operator on `ℓ₂` with coefficients `1/(n+1)` is compact and
  every s-number sequence of it tends to `0`. The identity of an infinite-dimensional space has
  `cₙ = dₙ = 1` for all `n` and is not compact (§1.9, §1.13, §2.9).
- **Duality on a finite example.** For `D_σ : ℓ_q^m → ℓ_p^m` with `1 ≤ p < q < ∞`,
  `cₙ(D_σ') = dₙ(D_σ)` with `D_σ' : ℓ_{p'}^m → ℓ_{q'}^m` the transpose (§3.15 in finite dimension).
- **The Hilbert numbers fail two laws.** §5.13 and §5.14.
- **Strict, additive and multiplicative are independent.** `a`, `c`, `d` have all three
  properties; `b` is strict and neither additive nor multiplicative (§1.17, §3.21, §3.22); `h` is
  additive and neither strict nor multiplicative (§3.19, §5.13, §5.14).

## Provenance

An Apache-2.0 formalization of everything in this roadmap except the duality §3.13–§3.15 and the
identity of `ℓ₁^m` in §5.13, §5.14 exists in
[Lean-SNumbers](https://github.com/mario-ullrich/Lean-SNumbers) (Mario Ullrich, Lean 4 with
Mathlib `v4.35.0`, with a blueprint that names the Lean declaration of every statement). It
defines the five sequences with values in `ℝ` over `NontriviallyNormedField 𝕜` and the Hilbert
numbers over `RCLike 𝕜`. It proves the maximal difference theorem through the determinant
quantities `Δ_k`, and it contains John's theorem over `𝕜` with the two projection theorems. The
roadmap specifies the mathematics. The repository is a cited source, and its file map is not
prescriptive: `SNumbers/Basic.lean` (§1.1–§1.5), `Approximation.lean`, `Gelfand.lean`,
`GelfandEmbedding.lean`, `Kolmogorov.lean`, `KolmogorovLifting.lean`, `Bernstein.lean`,
`Hilbert.lean`, `Injectivity.lean` (Layer 1), `Uniqueness.lean`, `SingularValuesFinDim.lean`,
`AddOns/Compact.lean` (Layer 2), `Inequalities.lean`, `MaxDifference.lean`,
`BasicResults/Determinant.lean` (Layer 3), `Entropy.lean`, `EntropyBounds.lean` (Layer 4),
`Examples/` and `BasicResults/LittleGrothendieck.lean` (Layer 5; `Examples/IdentityL2Linfty.lean`
for §3.20–§3.22). The bound of §5.9 is its `SVD.mul_approximationNumber_le_of_factorization`.

## Scope and ownership

**This roadmap owns** the axioms of s-number sequences and strict s-number sequences with their
elementary consequences; the Gelfand, Kolmogorov, Bernstein and Hilbert numbers and their
verification against the axioms, with Pietsch's lifting and embedding identities and injectivity
and surjectivity; the extremal sequences, uniqueness on Hilbert spaces and the compactness
criteria (Layer 2); the projection bounds, the determinant quantities and the maximal difference
theorem, duality between Gelfand and Kolmogorov numbers, and the index laws of the Gelfand,
Kolmogorov, Hilbert and Bernstein numbers (Layer 3); the entropy numbers and their comparison with
s-numbers (Layer 4); and the examples of Layer 5. Its suggested home in Tau Ceti is
`TauCeti/Analysis/Normed/Operator/SNumbers/`, beside the compact, absolutely summing and weakly
compact operators of the Banach-space theory; nothing of it lives under
`TauCeti/Analysis/OperatorIdeal/`, which holds the approximation numbers and their gauges.

**Owned elsewhere and consumed here.**

- *Approximation numbers.* The [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md)
  roadmap owns the approximation numbers and every gauge built from them (Ky Fan, Schatten, trace
  class, Hilbert–Schmidt). At the Tau Ceti pin they are `ContinuousLinearMap.singularValue`, with
  their calculus, the vanishing on operators of low rank, the value `aₙ(id_X) = 1` for
  `n < rank X` over any nontrivially normed field (`singularValue_id`), the min–max formulas and
  the converse min–max localization on Hilbert spaces, the compactness criterion on Hilbert
  targets, adjoint invariance and the Eckart–Young identification. This roadmap consumes them and
  adds no gauge. The Hilbert numbers are defined from approximation numbers and are a different
  s-number sequence, owned here.
- *Banach-space theory.* [BanachSpaceTheory](../BanachSpaceTheory/README.md) owns duality (B1),
  the Schmidt series and nuclear operators (B4), summing operators and Grothendieck's inequality
  (B6), and the Banach–Mazur distance, local reflexivity, John's theorem and the projection
  theorems (B7). At the Tau Ceti pin, the annihilators, the double-annihilator theorems, the
  isometries `(X/M)* ≅ Mᗮ` and `M* ≅ X*/Mᗮ`, the norm of the dual operator, local reflexivity with
  the clause `R (J_E x) = x`, the absolutely summing norms with `π_q ≤ π_p` for `p ≤ q`, and
  Grothendieck's inequality for matrices are Tau Ceti's. The Kadec–Snobar and Garling–Gordon
  projection theorems, the Schmidt series and Grothendieck's theorem for operators from `L¹(μ)`
  into a Hilbert space are consumed from BanachSpaceTheory B7, B4 and B6.
- *Finite singular systems.*
  [PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) owns finite singular
  systems; Mathlib supplies `LinearMap.singularValues`.

## Exact supplier contracts

### From Mathlib

- Bounded operators `X →L[𝕜] Y` with the operator norm; `Submodule.subtypeL`, `Submodule.mkQL`,
  the quotient seminorm `Submodule.Quotient.seminormedAddCommGroup` on `Y ⧸ V` for every subspace
  `V` and the norm `Submodule.Quotient.normedAddCommGroup` for closed `V`;
  `QuotientAddGroup.norm_mk` (`‖[y]‖ = infDist y V`); `LinearMap.rank`, `Module.rank`.
- `riesz_lemma` (any normed field, a closed proper subspace) and
  `Submodule.closed_of_finiteDimensional` (complete field).
- The Hahn–Banach theorem: `exists_extension_norm_eq` (`IsRCLikeNormedField`) and
  `exists_dual_vector''` (`RCLike`, a functional of norm `≤ 1` attaining `‖x‖` at `x`).
- `ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`: over a `DenselyNormedField 𝕜`, the norm of
  `f : E →SL[σ] F` is the supremum of `‖f x‖₊` over the closed unit ball.
- `ContinuousLinearMap.precomp`, the dual operator `StrongDual 𝕜 Y →L[𝕜] StrongDual 𝕜 X`;
  `StrongDual`; `NormedSpace.inclusionInDoubleDual`; `Submodule.orthogonalBilin` and
  `topDualPairing`, from which annihilators are built.
- `IsCompactOperator`, `isCompactOperator_iff_isCompact_closure_image_closedBall`,
  `TotallyBounded`, `Metric.infDist`, `FiniteDimensional.proper_rclike`.
- `Metric.externalCoveringNumber` (minimal cardinality of an `ε`-cover by closed balls with
  centres anywhere, in `ℕ∞`); `MeasureTheory.Measure.addHaar_closedBall`.
- `LinearIsometry`; `NormedAddGroupHom.IsQuotient` (surjective, with the target norm the quotient
  norm).
- `EuclideanSpace`, `PiLp`, `WithLp.linearEquiv`, `lp`, `OrthonormalBasis`,
  `ContinuousLinearMap.adjoint`.
- `LinearMap.det`, `Matrix.det`, `Matrix.det_updateCol_add_smul_self`; `LinearMap.singularValues`
  (finite-dimensional inner product spaces over `RCLike`); `LinearMap.normDet_eq_prod_singularValues`
  and `LinearMap.normDet_eq_norm_det`, whose composite is `|det S| = ∏ σ_k(S)` for an endomorphism.
- `Real.exp`, `Real.one_add_inv_pow_le_exp` (`(1 + n⁻¹)^n ≤ e`), `Real.inner_le_Lp_mul_Lq`.

### From Tau Ceti

All the declarations below are proved at the pin. Paths are under `TauCeti/`.

- *Approximation numbers* (`Analysis/OperatorIdeal/ApproximationNumber/Basic.lean`), in namespace
  `ContinuousLinearMap`, over any `NontriviallyNormedField 𝕜` on seminormed spaces:
  `singularValue` (`aₙ(T) = ⨅ {‖T − R‖₊ : rank R ≤ n}`, zero-based, in `ℝ≥0`);
  `singularValue_zero` (`a₀(T) = ‖T‖₊`); `antitone_singularValue`; `singularValue_le_nnnorm`;
  `singularValue_le_nnnorm_sub` (`aₙ(T) ≤ ‖T − R‖₊` for `rank R ≤ n`); `le_singularValue_iff`;
  `singularValue_eq_zero_of_rank_le`;
  `singularValue_add_le` (`aₙ(S + T) ≤ aₙ(S) + ‖T‖₊`); `singularValue_add_index_le`
  (`a_{m+n}(S + T) ≤ aₘ(S) + aₙ(T)`); `abs_singularValue_sub_singularValue_le`;
  `singularValue_comp_comp_le` (`aₙ(A T B) ≤ ‖A‖₊ aₙ(T) ‖B‖₊`); `singularValue_comp_add_le_mul`
  (`a_{m+n}(S T) ≤ aₘ(S) aₙ(T)`); `singularValue_smul` (`aₙ(c T) = ‖c‖₊ aₙ(T)`).
- *Identities and coercive subspaces* (`…/ApproximationNumber/MinMax.lean`), in namespace
  `ContinuousLinearMap`: `singularValue_id` (over any `NontriviallyNormedField 𝕜` and a normed
  space `E` of rank `r`, possibly infinite, `aₙ(id) = 1` for `n < r` and `0` otherwise);
  `le_singularValue_of_lt_rank` (`c ≤ aₙ(T)` if `T` is `c`-coercive on a subspace of rank `> n`);
  `singularValue_eq_iInf_nnnorm_comp_orthogonal` (the orthogonal-tail min–max formula on a complete
  inner product source). In namespace `TauCeti`: `HasMinMaxLowerBound` and
  `HasMinMaxLowerBound.of_completeSpace` (over `RCLike 𝕜`, for a complete inner product space `E`
  and an inner product space `F`, every `0 ≤ r < aₙ(T)` is beaten by a coercivity constant `s > r`
  on the span of `n + 1` linearly independent vectors).
- *Compactness, adjoints, Eckart–Young* (`…/ApproximationNumber/Compact.lean`, `Adjoint.lean`,
  `EckartYoung.lean`, `HilbertSchmidt.lean`), in namespace `ContinuousLinearMap`:
  `isCompactOperator_iff_tendsto_singularValue` (over `RCLike 𝕜`, an inner product target that is
  complete: `T` compact iff `aₙ(T) → 0`); `singularValue_adjoint` (`aₙ(T†) = aₙ(T)`);
  `singularValue_eq_linearMap_singularValues` (finite-dimensional inner product spaces:
  `aₙ(T) = σₙ(T)`); `tsum_singularValue_sq_le_hilbertSchmidtEnergy` (complete source: `∑ aₙ(T)²` is
  at most the Hilbert–Schmidt energy `∑ ‖T bᵢ‖²` of a Hilbert basis). Also
  `IsCompactOperator.tendsto_singularValue` (the forward direction, target not complete).
- *Compact operators* (`Analysis/Normed/Operator/Compact/Basic.lean`):
  `IsCompactOperator.totallyBounded_image_closedBall` and
  `isCompactOperator_of_totallyBounded_image_closedBall` (complete Hausdorff target, a ball of
  positive radius).
- *Duality* (`Analysis/Normed/Module/Annihilator.lean`, `…/Dual/Quotient.lean`,
  `…/Dual/Submodule.lean`, `…/Dual/Functoriality.lean`), in namespace `Submodule`:
  `quotientDualEquivAnnihilator` (`StrongDual 𝕜 (E ⧸ S) ≃ₗᵢ[𝕜] Sᗮ`, any submodule `S`);
  `quotientAnnihilatorEquivDual` (`(StrongDual 𝕜 E ⧸ Sᗮ) ≃ₗᵢ[𝕜] StrongDual 𝕜 S`, for
  `IsRCLikeNormedField 𝕜`); `orthogonalBilin_orthogonalBilin_topDualPairing_eq_topologicalClosure`
  (over `RCLike 𝕜`, `(Sᗮ)_⊥` is the closure of `S`);
  `orthogonalBilin_orthogonalBilin_topDualPairing_flip_eq_of_finiteDimensional` (`(G_⊥)ᗮ = G` for a
  finite-dimensional `G ≤ E*`); `isClosed_orthogonalBilin_topDualPairing` and
  `isClosed_orthogonalBilin_topDualPairing_flip`. In namespace `ContinuousLinearMap`:
  `norm_precomp` (`‖T'‖ = ‖T‖` for `IsRCLikeNormedField 𝕜`).
- *Local reflexivity* (`Analysis/Normed/Module/Dual/LocalReflexivity.lean`):
  `LinearIsometry.exists_continuousLinearMap_of_doubleDual` (over `RCLike 𝕜`: for a
  finite-dimensional `V` embedded isometrically in `E**`, a finite-dimensional `G ≤ E*` and
  `ε > 0`, a map `T : V → E` with `(1 − ε)‖v‖ ≤ ‖T v‖ ≤ (1 + ε)‖v‖`, preserving the pairings with
  `G`, and with `T v = x` whenever `v` is the image of `J_E x`).
- *Absolutely summing operators* (`Analysis/Normed/Operator/AbsolutelySumming/Basic.lean`), in
  namespace `ContinuousLinearMap`: `summingENorm` (the norm `πₚ` in `ℝ≥0∞`) and
  `summingENorm_le_summingENorm_of_exponent_le` (over `RCLike 𝕜`, `π_q(T) ≤ π_p(T)` for `p ≤ q`).
  Grothendieck's inequality for matrices (`Analysis/Matrix/Grothendieck.lean`):
  `Matrix.abs_sum_sum_mul_inner_le_eight_mul` (real, constant `8`) and
  `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul` (`RCLike`, constant `16`).
- *Quotients and determinants*: `Submodule.norm_comp_mkQL` (`Analysis/Normed/Module/Quotient.lean`;
  `‖f ∘ mkQL‖ = ‖f‖`); `Matrix.det_eq_mul_det_submatrix_castSucc_of_col`
  (`LinearAlgebra/Matrix/CornerMinor.lean`; over a commutative ring, the expansion along a last
  column that vanishes off the diagonal).
- `TauCeti.OperatorIdealFamily` (`Analysis/OperatorIdeal/Family.lean`) is cited only for comparison
  in Convention 6.

### From TauCetiRoadmap.BanachSpaceTheory

- **B7**: the Kadec–Snobar projection theorem (every subspace of dimension at most `n` of a normed
  `𝕜`-space is the range of a projection of norm at most `√n`) and the Garling–Gordon projection
  theorem (every closed subspace of codimension at most `n` is, for every `ε > 0`, the kernel of a
  projection of norm at most `√n + ε`), over `𝕜`; consumed in §3.1 and §3.2.
- **B4**: the Schmidt series `T x = ∑ sⱼ ⟪eⱼ, x⟫ fⱼ` of a compact operator between complete Hilbert
  spaces, with `sⱼ = aⱼ(T)` in the zero-based convention; consumed in §5.9 and §5.13.
- **B6**: Grothendieck's theorem `π₁(T) ≤ κ_𝕜 ‖T‖` for `T : L¹(μ) → H` into a Hilbert space, with
  `κ_ℝ = 8` and `κ_ℂ = 16`, applied to `ℓ₁^m` as `L¹` of counting measure; consumed in §5.13.
- **B1**: duality and annihilators, consumed through the Tau Ceti declarations listed above.

### From TauCetiRoadmap.OperatorIdeals

The approximation numbers and their theory, consumed through the Tau Ceti declarations listed
above; no target of that roadmap beyond those declarations is used.

## References

- A. Pietsch, *s-Numbers of operators in Banach spaces*, Studia Math. **51** (1974), 201–223: the
  axioms, the five sequences, the lifting and embedding identities, the duality §3.13–§3.15.
- A. Pietsch, *Operator Ideals*, North-Holland, 1980, Chapter 11 (s-numbers) and Chapter 12
  (entropy numbers as pseudo-s-numbers; 12.3.2 is §4.11).
- A. Pietsch, *Eigenvalues and s-Numbers*, Cambridge Studies in Advanced Mathematics 13, 1987,
  Chapter 2; 1.5.5 (Kadec–Snobar), 1.7.17 (Garling–Gordon), 2.10.2 (§3.1).
- B. Carl and I. Stephani, *Entropy, Compactness and the Approximation of Operators*, Cambridge,
  1990, Chapters 1–2: entropy numbers and their comparison with s-numbers.
- M. Ullrich, *Inequalities between s-numbers*, Adv. Oper. Theory **9** (2024), no. 4, art. 82:
  the bound `max(cₙ, dₙ) ≤ (n+1)(h₀ ⋯ hₙ)^{1/(n+1)}`, which §3.10 sharpens.
- M. Ullrich, *On bounds between all s-numbers and widths of convex sets*, arXiv:2608.05024
  (2026): the maximal difference theorem §3.7–§3.12 and the example §5.12.
- D. J. H. Garling and Y. Gordon, *Relations between some constants associated with finite
  dimensional Banach spaces*, Israel J. Math. **9** (1971), 346–361; M. I. Kadets and
  M. G. Snobar, *Certain functionals on the Minkowski compactum*, Mat. Zametki **10** (1971),
  453–457: the projection theorems consumed in §3.1, §3.2.
- A. Pietsch, *Bad properties of the Bernstein numbers*, Studia Math. **184** (2008), Theorem 3:
  the Bernstein numbers are neither additive nor multiplicative; §3.21, §3.22 are elementary
  finite examples.
- B. S. Mityagin and G. M. Henkin, *Inequalities between n-diameters*, Proc. Seminar on Functional
  Analysis, Voronezh 1963: the conjecture behind §3.12.
