# Roadmap: approximation spaces and real interpolation of quasi-normed groups

**Summary.** An approximation scheme `{0} = A_0 ⊆ A_1 ⊆ A_2 ⊆ …` in a quasi-normed group `X`
measures the smoothness of an element `f` by the decay of its error of best approximation
`E_n(f) = inf_{a ∈ A_n} ‖f − a‖`, and Pietsch's approximation space `A^s_q` consists of the `f`
with `(n^{s − 1/q} E_{n−1}(f))_{n ≥ 1}` in `ℓ_q`. This roadmap builds these spaces in quasi-normed
groups, the real interpolation of quasi-normed couples through the K- and E-functionals, and the
Besov spaces of a scheme of functions on a finite measure space, with errors measured in `L_p`.
Every statement covers the whole range `0 < p, q ≤ ∞`. For `p < 1` the space `L_p` is only
quasi-normed and `L_p[0, 1]` carries no nonzero continuous linear functional, so near-best
approximants take the place of bounded projections throughout.

The headline theorems are these. If an approximation scheme satisfies Jackson's inequality
`E_n(f) ≤ C n^{−r} |f|_Y` and Bernstein's inequality `|a|_Y ≤ C n^r ‖a‖` for `a ∈ A_n` with
respect to a quasi-normed space `Y`, then for `0 < s < r` and `0 < q ≤ ∞` the approximation space
`A^s_q` is the real interpolation space `(X, Y)_{s/r,q}`, and `A^s_q = (X, A^r_τ)_{s/r,q}` for every
`0 < τ ≤ ∞`. In a `ρ`-normed group and for `s > 0`, `f ∈ A^s_q` if and only if `f` is the limit of
the partial sums of blocks `a_k ∈ A_{2^k}` with `(2^{ks} ‖a_k‖)_k ∈ ℓ_q`. A modulus `ω(f, k)` at the
scales `2^{−k}` with a `ρ`-triangle inequality, `ω(f, k) ≤ C ‖f‖`, Jackson's inequality
`E_{2^k}(f) ≤ C ω(f, k)` and an inverse inequality of order `θ` describes `A^s_q` for `0 ≤ s < θ` as
the space of the `f` with `‖f‖ + ‖(2^{ks} ω(f, k))_k‖_{ℓ_q} < ∞`. For a scheme of bounded functions
on a finite measure space whose approximants satisfy Nikolskii's inequality
`‖a‖_∞ ≤ C n^{D/p} ‖a‖_p`, the associated Besov spaces embed as
`B^s_{p,q} ⊆ B^{s − D(1/p − 1/r)}_{r,q}` for `0 < p ≤ r ≤ ∞` and `s > D(1/p − 1/r)`. For `n`-term
approximation from a Hilbert basis, `f ∈ A^α_τ` with `0 < τ < 2` and `α = 1/τ − 1/2` if and only if
the coefficients of `f` lie in `ℓ_τ`.

Mathlib supplies the `L_p` spaces with their quasi-triangle inequality and the sequence spaces
`ℓ_q`. The K-method for Banach couples comes from Tau Ceti, in the area of the
[NoncommutativeIntegration](../NoncommutativeIntegration/README.md) roadmap; this roadmap extends
it to quasi-normed couples and agrees with it on Banach couples. Tau Ceti's decreasing
rearrangement measures `n`-term approximation. The roadmap ClassicalApproximationSpaces consumes
this one: its trigonometric, band-limited, spline and step schemes satisfy Jackson's and inverse
inequalities with respect to moduli of smoothness, and the theorems here turn these inequalities
into descriptions of Besov spaces.

Part A builds quasi-normed groups, approximation schemes and their spaces, Jackson's and
Bernstein's inequalities, block decompositions, `n`-term approximation from a Hilbert basis, and
the Besov spaces of a scheme of functions on a finite measure space with Nikolskii's inequality
and the embeddings. Part B builds the real interpolation of quasi-normed couples, the
E-functional, the representation theorems and the coincidence theorem for moduli.

## How to read the build

The build has two parts, A and B. The labels `AS-A01`, …, `AS-B10` of their targets, one heading
`### AS-Xnn` each, are the complete obligation set of this roadmap: each label names one definition
or theorem, the worked examples cite them, and `Suggested.lean` cites the labels its declarations
represent. Each part groups its labels into numbered milestones, listed at the head of the part.
Every target states its exponent range in its own statement, and its *Needs:* line lists what the
statement and the route described need, so that a target proved another way does not wait for an
unrelated one.

Part A rests on Mathlib's `L_p` spaces and sequence spaces and on Tau Ceti's decreasing
rearrangement. Part B rests on Part A and on the K-method of NoncommutativeIntegration.

## Conventions

1. **Exponents.** `p q : ℝ≥0∞` with `0 < p, q ≤ ∞`; `ρ := min(1, p)`. Smoothness `s : ℝ`; the order
   `r > 0` of Jackson's and Bernstein's inequalities is real. In Lean, `1/∞ = 0`.
2. **Quasi-norms take values in `ℝ≥0∞`.** Membership in a space means finiteness of its quasi-norm,
   and every space is an additive subgroup, a submodule where scalars act, of an ambient group,
   with that quasi-norm. A quasi-norm is data, not a class, because one group carries several
   quasi-norms (the couples of Part B).
3. **Quasi-triangle and `ρ`-triangle.** A quasi-norm with constant `K ≥ 1` satisfies
   `N(x + y) ≤ K (N x + N y)`; a `ρ`-norm, `0 < ρ ≤ 1`, satisfies `N(x + y)^ρ ≤ N(x)^ρ + N(y)^ρ`. On
   `L_p` the constant `K` is Mathlib's `LpAddConst p` (`2^{1/p − 1}` for `p < 1`, else `1`), and
   `‖·‖_p` is a `min(1, p)`-norm.
4. **Indexing.** `A_0 = {0}`, so `E_0(f) = ‖f‖`. Dyadic quasi-norms use `E_{2^k}`, `k ≥ 0`.
5. **Scalars.** Modules over a normed field `𝕜`, `RCLike 𝕜` where Hilbert spaces enter (AS-A13).
   Schemes of functions consist of functions with values in `ℂ` (AS-A14).
6. **Schemes of functions.** On a finite measure space `(Ω, μ)` the approximants are classes in
   `L_∞(μ)`, and one scheme measures errors in every `L_p(μ)`, `0 < p ≤ ∞` (AS-A14).
7. **Names.** The declarations of this roadmap live in `TauCetiRoadmap.ApproximationSpaces` in
   `Suggested.lean`: `QuasiENorm`, `lpQuasiENorm`; `ApproximationScheme` with `approxError`,
   `approxNorm`, `approxNormDyadic`, `approxSpace`, `complexity`; `QuasiCouple` with
   `kFunctional`, `kMethodENorm`; `eFunctional`, `embeddingCouple`; `FunctionScheme` with
   `lpError`, `besovENorm`. A scheme's Bernstein inequality is written out as a hypothesis and is
   never named `bernstein…`, a name that belongs to the Bernstein numbers of
   [SNumbers](../SNumbers/README.md). Nikolskii's inequality for a scheme is likewise an explicit
   hypothesis, never a predicate.
8. **Constants.** "There is `C`" means a finite constant depending only on the parameters named in
   the statement (exponents, orders, the quasi-triangle constant and the constants of the
   hypotheses), never on the function.

## Part A: quasi-normed groups, approximation schemes and approximation spaces

**Milestone A1: quasi-normed groups and discrete Hardy inequalities.** AS-A01, AS-A02.

**Milestone A2: schemes and approximation spaces.** AS-A03–AS-A08.

**Milestone A3: Jackson and Bernstein inequalities, lifting, decompositions.** AS-A09–AS-A13.

**Milestone A4: schemes of functions on a finite measure space.** AS-A14–AS-A17.

### AS-A01 Quasi-normed groups

Define `QuasiENorm 𝕜 X`: for an additive commutative group `X` that is a `𝕜`-module, a function
`N : X → ℝ≥0∞` with `N 0 = 0`, `N (c • x) = ‖c‖ₑ N x` and `N (x + y) ≤ K (N x + N y)` for a constant
`K : ℝ≥0`, `K ≥ 1`; then `N (−x) = N x` and `{x | N x < ∞}` is a submodule. `N` is definite when
`N x = 0 → x = 0`. Prove the Aoki–Rolewicz theorem: for `ρ` with `2^{1/ρ − 1} = K` there is a
`ρ`-norm `N'` with `N' ≤ N ≤ C N'`, `C` depending on `K` only (Kalton–Peck–Roberts, *An F-space
sampler*, Theorem 1.3); completeness means completeness of the metric `N'(x − y)^ρ`. Instances: a
normed space (`K = 1`); `eLpNorm` on `Lp 𝕜 p μ` for every `0 < p ≤ ∞` with `K = LpAddConst p`, and
its `ρ`-triangle inequality `‖f + g‖_p^ρ ≤ ‖f‖_p^ρ + ‖g‖_p^ρ`, `ρ = min(1, p)`, for all functions
`f, g` (`eLpNorm_add_rpow_min_le`); the sequence spaces `ℓ_q` and `ℓ_q(X)` for every `0 < q ≤ ∞`.
*Needs:* Mathlib `MeasureTheory.Lp`, `eLpNorm`, `eLpNorm_add_le'`, `ENNReal.LpAddConst`,
`ENNReal.rpow_add_le_add_rpow`, `lp`.

**Checks.**
- `p = 1/2` on `[0, 1]`, `f = 1_{[0,1/2)}`, `g = 1_{[1/2,1)}`: `‖f‖_p = ‖g‖_p = 1/4` and
  `‖f + g‖_p = 1 > 1/2`, so the triangle inequality fails; `‖f + g‖_p^{1/2} = 1 = 1/2 + 1/2` and
  `1 = 2 (1/4 + 1/4)` with `LpAddConst (1/2) = 2`: both the `ρ`-triangle inequality and the
  quasi-triangle constant are attained.

### AS-A02 Discrete Hardy inequalities with geometric weights

Prove: for `s > 0`, `ρ > 0` and `0 < q ≤ ∞` there is `C` such that for every `a : ℕ → ℝ≥0∞`,
`‖(2^{ks} (∑_{j ≥ k} a_j^ρ)^{1/ρ})_k‖_{ℓ_q} ≤ C ‖(2^{ks} a_k)_k‖_{ℓ_q}` (tails) and
`‖(2^{−ks} (∑_{j ≤ k} a_j^ρ)^{1/ρ})_k‖_{ℓ_q} ≤ C ‖(2^{−ks} a_k)_k‖_{ℓ_q}` (partial sums). Route:
with `b_j = 2^{js} a_j` the left side is the `ℓ_{q/ρ}` quasi-norm of a convolution of `(b_j^ρ)` with
a geometric sequence; Young's inequality for `q ≥ ρ`, the embedding `ℓ_q ⊆ ℓ_ρ` and a change of the
order of summation for `q < ρ`. *Needs:* Mathlib `tsum`, `ENNReal.rpow_add_le_add_rpow`.

**Checks.**
- `s > 0` is needed: at `s = 0`, `ρ = 1`, `q = ∞` and `a` the indicator of `{0, …, N − 1}`, the left
  side of the tail inequality is `N` and the right side is `C`.

### AS-A03 Approximation schemes

Define `ApproximationScheme N`: in a quasi-normed group `X`, a family `A : ℕ → Set X` of sets of
finite quasi-norm with `A 0 = {0}`, `A n ⊆ A (n + 1)`, `c • A n ⊆ A n` and `A m + A n ⊆ A (m + n)`
(Pietsch 1981, §1). It is linear when every `A n` is a submodule. Define its complexity
`complexity x = min {n : x ∈ A n}` (`∞` off `⋃ A n`), which vanishes exactly at `0`, is even, and
is subadditive. *Needs:* AS-A01.

### AS-A04 Error of best approximation

Define `approxError A n f = ⨅ a ∈ A n, N (f − a)` and prove `E_0(f) = N f`; `n ↦ E_n(f)` is
antitone; `E_n(c f) = ‖c‖ₑ E_n(f)` for `c ≠ 0`; `E_{m+n}(f + g) ≤ K (E_m(f) + E_n(g))`, and
`E_{m+n}(f + g)^ρ ≤ E_m(f)^ρ + E_n(g)^ρ` when `N` is a `ρ`-norm;
`E_n(f) ≤ K (E_n(g) + N (f − g))`; `E_n(f) → 0` if and only if `f` lies in the closure of
`⋃ n, A n`. *Needs:* AS-A03.

### AS-A05 Approximation quasi-norms

Define, for `s : ℝ` and `0 < q ≤ ∞`, Pietsch's quasi-norm
`approxNorm A s q f = ‖((n + 1)^{s − 1/q} E_n(f))_{n ≥ 0}‖_{ℓ_q}` and the dyadic quasi-norm
`approxNormDyadic A s q f = N f + ‖(2^{ks} E_{2^k}(f))_{k ≥ 0}‖_{ℓ_q}`. Prove that for `s ≥ 0` each
is bounded by `C` times the other, `C` depending on `s`, `q` and `K`. *Needs:* AS-A02, AS-A04.

**Checks.**
- At `s = 0`, `q = ∞` both quasi-norms are comparable to `N f`: Pietsch's is `sup_n E_n(f) = N f`,
  the dyadic one lies between `N f` and `2 N f`.

### AS-A06 The approximation space

Define `approxSpace A s q`, the `f` with `approxNorm A s q f < ∞`, and prove: a subgroup (a
submodule over `𝕜`) containing every `A n`; `N f ≤ approxNorm A s q f`; a quasi-norm with constant
depending on `s, q, K`; for `s > 0` contained in the closure of `⋃ n, A n`; complete when `X` is.
*Needs:* AS-A05.

### AS-A07 Embeddings between approximation spaces

Prove `A^s_q ⊆ A^t_r` for `t < s` and all `q, r`, and for `t = s`, `q ≤ r`, with explicit constants.
*Needs:* AS-A05, AS-A06.

### AS-A08 Functoriality

Prove: an additive map `T : X → Y` with `N_Y (T x) ≤ M N_X x` and `T (A n) ⊆ B n` for every `n`
satisfies `E^B_n(T f) ≤ M E^A_n(f)` and maps `A^s_q` into `B^s_q` with `‖T f‖ ≤ M ‖f‖`.
*Needs:* AS-A06.

### AS-A09 Jackson and Bernstein inequalities

For an additive map `ι : Y → X` from a quasi-normed group `Y` with `N_X (ι y) ≤ C N_Y y`, write as
explicit hypotheses: Jackson's inequality of order `r > 0`,
`∀ y n, 1 ≤ n → E_n(ι y) ≤ C n^{−r} N_Y y`; Bernstein's inequality of order `r`,
`∀ n a, 1 ≤ n → a ∈ A n → ∃ y, ι y = a ∧ N_Y y ≤ C n^r N_X a`. Prove that Jackson's inequality of
order `r` holds if and only if `ι` maps `Y` into `A^r_∞` with a bound. *Needs:* AS-A06.

### AS-A10 Lifting

Prove: let `N_X` be definite, let `ι` satisfy Bernstein's inequality of order `β ≥ 0`, let `Y` be
complete and `ρ` its Aoki–Rolewicz exponent. Every `f` with `∑_k (2^{kβ} E_{2^k}(f))^ρ < ∞` is `ι y`
for some `y` with `N_Y y ≤ C (N f + (∑_k (2^{kβ} E_{2^k}(f))^ρ)^{1/ρ})`. Definiteness is needed: the
construction gives `y` with `N_X (f − ι y) = 0`. *Needs:* AS-A01, AS-A09.

### AS-A11 Nikolskii transfer between approximation spaces

Prove: if moreover `ι` is injective, `0 ≤ α < s`, and every `a ∈ A n` is `ι y` with
`N_Y y ≤ C n^α N_X a`, then every `f ∈ A^s_q(X)` is `ι y` with `y` in the approximation space
`B^{s−α}_q(Y)` of the scheme `B n = ι⁻¹(A n)`, and `‖y‖_{B^{s−α}_q} ≤ C' ‖f‖_{A^s_q}`.
*Needs:* AS-A02, AS-A10.

### AS-A12 Block decompositions

Prove: let `N` be a `ρ`-norm, `s > 0` and `0 < q ≤ ∞`. Then `f ∈ A^s_q` if and only if there are
`a_k ∈ A (2^k)` with `N(f − ∑_{k<n} a_k) → 0` and `‖(2^{ks} N a_k)_k‖_{ℓ_q} < ∞`; the infimum of
this quantity over all such decompositions is an equivalent quasi-norm. No completeness of `X` is
assumed: the partial sums are required to converge to `f`. Route: the partial sum `∑_{k<n} a_k` has
complexity below `2^n`, and the `ρ`-triangle inequality with the convergence gives
`E_{2^n}(f)^ρ ≤ ∑_{i ≥ 0} N(a_{n+i})^ρ`, then AS-A02; conversely the differences of near-best
approximants are blocks (DeVore–Popov 1988, Theorem 5.1 and its proof, the norm `N_3`; Corollary
5.3). *Needs:* AS-A02, AS-A05.

### AS-A13 `n`-term approximation from a Hilbert basis

Prove: for a `HilbertBasis` `(e_i)` of a Hilbert space `H` over `RCLike 𝕜`,
`Σ_n = {∑_{i ∈ Λ} c_i e_i : #Λ ≤ n}` is a scheme (not linear), and
`E_n(f)² = ∑_{k > n} (c*_k)²` with `c*` the decreasing rearrangement of `(|⟨e_i, f⟩|)_i`. For
`0 < τ < 2` and `α = 1/τ − 1/2`, `f ∈ A^α_τ(H, Σ)` if and only if `(⟨e_i, f⟩)_i ∈ ℓ_τ`, with
equivalent quasi-norms (Stechkin for `τ = 1`; DeVore 1998, Theorem 4). *Needs:* AS-A06; Mathlib
`HilbertBasis`; Tau Ceti `TauCeti.decreasingRearrangement` (null families).

### AS-A14 Schemes of functions and their Besov spaces

Let `(Ω, μ)` be a finite measure space. Define a scheme of functions as an approximation scheme `S`
(AS-A03) in `L_∞(μ)` with its norm (`FunctionScheme μ`). Prove that for every `0 < p ≤ ∞` the
classes of `S_n` in `L_p(μ)` form a scheme in the quasi-normed group `L_p(μ)` (AS-A01), with error
`E_n(f)_p = inf_{a ∈ S_n} ‖f − a‖_p`, and define the Besov space `B^s_{p,q}(S)` as its approximation
space (AS-A06) for every `0 < p, q ≤ ∞`, with Pietsch's quasi-norm and, for `s ≥ 0`, the equivalent
dyadic quasi-norm `‖f‖_p + ‖(2^{ks} E_{2^k}(f)_p)_k‖_{ℓ_q}` (`FunctionScheme.besovENorm`). Prove
that `B^s_{p,q}(S)` decreases in `s`, increases in `q`, and that `B^s_{r,q}(S) ⊆ B^s_{p,q}(S)` for
`p ≤ r`. A scheme of bounded continuous functions on a topological space `Ω` gives a scheme of
functions through the classes of its elements. *Needs:* AS-A01, AS-A05, AS-A06; Mathlib
`MeasureTheory.Lp`, `MemLp.mono_exponent`.

**Checks.**
- For `p ≥ 1` the definition is the approximation space of the scheme in the normed space
  `L_p(μ)`; for `p < 1` it uses the quasi-norm `‖·‖_p` with constant `LpAddConst p`, and no norm.

### AS-A15 Nikolskii's inequality for a scheme of functions

Write Nikolskii's inequality of dimension `D ≥ 0` at the exponent `p` as the explicit hypothesis
`∀ n ≥ 1, ∀ a ∈ S_n, ‖a‖_∞ ≤ C n^{D/p} ‖a‖_p`. Prove: if it holds at `p₀ < ∞` with constant `C`,
then it holds at every `0 < p ≤ p₀` with constant `C^{p₀/p}`, from
`‖a‖_{p₀}^{p₀} ≤ ‖a‖_∞^{p₀ − p} ‖a‖_p^p` and `‖a‖_∞ < ∞` (Ditzian–Prymak 2016, Theorem 2.1); and if
it holds at `p`, then `‖a‖_r ≤ C^{1 − p/r} n^{D(1/p − 1/r)} ‖a‖_p` for `p ≤ r ≤ ∞`, from
`‖a‖_r ≤ ‖a‖_∞^{1 − p/r} ‖a‖_p^{p/r}`. *Needs:* AS-A14; Mathlib `eLpNorm`, `eLpNormEssSup`.

### AS-A16 Embeddings of the Besov spaces of a scheme

Prove: let `S` satisfy Nikolskii's inequality of dimension `D` at the exponent `p`, let
`0 < p ≤ r ≤ ∞`, `α = D(1/p − 1/r) < s` and `0 < q ≤ ∞`. There is `K` such that every
`f ∈ B^s_{p,q}(S)` lies in `L_r(μ)` and
`‖f‖_r + ‖(2^{k(s−α)} E_{2^k}(f)_r)_k‖_{ℓ_q} ≤ K (‖f‖_p + ‖(2^{ks} E_{2^k}(f)_p)_k‖_{ℓ_q})`, so
`f ∈ B^{s−α}_{r,q}(S)`. If `s > D/p`, `Ω` is a topological space with its Borel σ-algebra, `μ`
charges every nonempty open set and every approximant is the class of a bounded continuous
function, then `f` has a bounded continuous representative. Route: near-best approximants
`b_k ∈ S_{2^k}`, the blocks `b_{k+1} − b_k` with AS-A15, convergence in measure and Fatou's lemma
in `L_r`, then AS-A02 (DeVore–Popov 1988, Theorem 7.1, for dyadic splines, with the limiting case
`s = α`, `q = r`; Kerkyacharian–Petrushev 2015, Proposition 6.14). *Needs:* AS-A02, AS-A15;
Mathlib `TendstoInMeasure`, `lintegral_liminf_le`.

### AS-A17 Block decompositions in `L_p`

Prove: for `0 < p ≤ ∞`, `s > 0` and `0 < q ≤ ∞`, `f ∈ B^s_{p,q}(S)` if and only if `f = ∑_k g_k`
almost everywhere with `g_k ∈ S_{2^k}` and `‖(2^{ks} ‖g_k‖_p)_k‖_{ℓ_q} < ∞`; for every such series
the sum converges absolutely almost everywhere and the partial sums converge to `f` in `L_p(μ)` and
in measure (DeVore–Popov 1988, Corollary 5.3). *Needs:* AS-A12, AS-A14.

### Examples

The trigonometric polynomials of coordinate degree below `n` in `L_∞(𝕋^d)`, the dyadic splines in
`L_∞[0, 1]` and the dyadic step functions in `L_∞([0, 1]^d)`, which ClassicalApproximationSpaces
builds; `n`-term approximation in `ℓ_2` for AS-A13.

### Dependencies

AS-A01 and AS-A02 rest on Mathlib. AS-A03–AS-A13 rest on AS-A01, AS-A02. AS-A14–AS-A17 rest on
AS-A01–AS-A12 and Mathlib's `L_p` spaces.

## Part B: real interpolation of quasi-normed couples

**Milestone B1: couples, the K-method and reiteration.** AS-B01–AS-B04.

**Milestone B2: the E-functional and the representation theorems.** AS-B05–AS-B09.

**Milestone B3: moduli compatible with a scheme.** AS-B10.

### AS-B01 Quasi-normed couples and the K-method

Define `QuasiCouple 𝕜 V`: a `𝕜`-module `V` with two quasi-norms `N₀, N₁ : V → ℝ≥0∞` (AS-A01) that
may take the value `∞`; `X_i = {N_i < ∞}`. Define the K-functional
`K(t, x) = inf {N₀ x₀ + t N₁ x₁ : x = x₀ + x₁}` for `t > 0`, and for `0 < θ < 1`, `0 < q ≤ ∞` the
space `(X₀, X₁)_{θ,q}` of the `x` with `‖x‖_{θ,q} = ‖t ↦ t^{−θ} K(t, x)‖_{L_q((0,∞), dt/t)} < ∞`
(`QuasiCouple.kMethodENorm`). Prove exactness, `‖T x‖_{θ,q} ≤ M₀^{1−θ} M₁^θ ‖x‖_{θ,q}` for an
additive `T` with `N'_i (T x) ≤ M_i N_i x`, and completeness when `X₀` and `X₁` are complete
(Bergh–Löfström, §3.11). A `TauCeti.CompatibleCouple` gives a quasi-normed couple on its sum space
(`N_i x = ‖x‖_{X_i}` on the range of `X_i`, `∞` off it) with the same K-functional, and for
`1 ≤ q ≤ ∞` the same space and norm as `TauCeti.CompatibleCouple.kMethod`. *Needs:* AS-A01; Tau Ceti
`TauCeti.CompatibleCouple`, `CompatibleCouple.kFunctional`, `CompatibleCouple.kMethod`,
`CompatibleCouple.kMethodENorm`.

**Checks.**
- The couple `(N, N)` for a quasi-norm `N` with constant `K_N`:
  `min(1, t) N x / K_N ≤ K(t, x) ≤ min(1, t) N x`, with equality on the right when `N` is a norm,
  and `‖t ↦ t^{−θ} min(1, t)‖_{L_q(dt/t)}` is finite exactly because `0 < θ < 1`, for every
  `0 < q ≤ ∞`; so `‖x‖_{θ,q}` is comparable to `N x`. Equality on the right fails for quasi-norms:
  in `L_{1/2}[0, 1]` the functions of the Check of AS-A01 give
  `K(1, f + g) ≤ 1/2 < 1 = ‖f + g‖_p`.

### AS-B02 Discrete K-method

Prove: for `ρ > 0`, `‖x‖_{θ,q}` is equivalent to `‖(2^{kρθ} K(2^{−kρ}, x))_{k ∈ ℤ}‖_{ℓ_q}`; when
`N₀ ≤ C N₁`, to `N₀ x + ‖(2^{kρθ} K(2^{−kρ}, x))_{k ≥ 0}‖_{ℓ_q}` (Bergh–Löfström, Lemma 3.1.3 and
§3.11). *Needs:* AS-B01, AS-A02.

### AS-B03 Holmstedt's formula

Prove: for `0 ≤ θ₀ < θ₁ ≤ 1`, `λ = θ₁ − θ₀`, `Y_i = X_{θ_i, q_i}` for `0 < θ_i < 1` and
`Y_i = X_i` at the endpoints,
`K(t, x; Y₀, Y₁) ≍ (∫_0^{t^{1/λ}} (s^{−θ₀} K(s, x))^{q₀} ds/s)^{1/q₀} +
t (∫_{t^{1/λ}}^∞ (s^{−θ₁} K(s, x))^{q₁} ds/s)^{1/q₁}`; at an endpoint the term is
`K(t^{1/λ}, x)` for `Y₀ = X₀` and `t^{1 − 1/λ} K(t^{1/λ}, x)` for `Y₁ = X₁` (Holmstedt 1970;
Bergh–Löfström, Theorem 3.6.1). *Needs:* AS-B02.

### AS-B04 Reiteration theorem

Prove: with `Y_i` as in AS-B03, `0 < η < 1` and `0 < q ≤ ∞`, `(Y₀, Y₁)_{η,q} = X_{θ,q}` with
`θ = (1 − η)θ₀ + ηθ₁`, with equivalent quasi-norms (Bergh–Löfström, Theorems 3.5.3 and 3.11.5).
*Needs:* AS-B03.

### AS-B05 The E-functional

Define, for a quasi-norm `N₀` on `V` and a complexity `N₁ : V → ℝ≥0∞` (`N₁ 0 = 0`, even,
subadditive), `eFunctional N₀ N₁ t x = inf {N₀(x − y) : N₁ y ≤ t}`, antitone in `t`, with
`E(0, x) = N₀ x` when `N₁` vanishes only at `0`, and the E-spaces `E_{s,q}` with the dyadic
quasi-norm `N₀ x + ‖(2^{ks} E(2^k, x))_k‖_{ℓ_q}` and Pietsch's quasi-norm
`‖((n + 1)^{s − 1/q} E(n, x))_n‖_{ℓ_q}`, equivalent for `s ≥ 0` (Bergh–Löfström, Definition 7.1.5,
with the two spaces in the order of this roadmap). Prove that for the complexity of a scheme
(AS-A03), `E(n, f) = E_n(f)`, so the E-spaces are the `A^s_q`. *Needs:* AS-A03, AS-A05.

### AS-B06 The representation theorem

Prove: let `X` and `Y` be quasi-normed groups, `ι : Y → X` as in AS-A09 with Jackson's and
Bernstein's inequalities of order `r > 0`, `0 < s < r` and `0 < q ≤ ∞`. Then
`A^s_q = (X, ι Y)_{s/r,q}` for the couple on `X` with `N₀ = N_X` and `N₁ x = inf {N_Y y : ι y = x}`,
with equivalent quasi-norms (Pietsch 1981; DeVore 1998, §4.3, Theorem 1, stated there for normed
`X`, whose proof uses only the quasi-triangle inequality of `X` and a `ρ`-triangle inequality of
`Y`, which AS-A01 supplies). *Needs:* AS-A02, AS-A09, AS-B01, AS-B02, AS-B05.

### AS-B07 Approximation spaces interpolate themselves

Prove: for `0 < s < r` and `0 < q, τ ≤ ∞`, `A^s_q = (X, A^r_τ)_{s/r,q}` with equivalent quasi-norms,
`A^r_τ` carrying its dyadic quasi-norm (DeVore 1998, §4.3, Theorem 2, after DeVore–Popov 1988,
LNM 1302): Jackson's and Bernstein's inequalities of order `r` hold for `Y = A^r_τ`. *Needs:*
AS-B06.

### AS-B08 Reiteration for approximation spaces

Prove: for `0 ≤ s₀ < s₁` (`A^0_q := X`) and `0 < η < 1`,
`(A^{s₀}_{q₀}, A^{s₁}_{q₁})_{η,q} = A^{(1−η)s₀ + ηs₁}_q` for all `0 < q₀, q₁, q ≤ ∞`. *Needs:*
AS-B04, AS-B07.

### AS-B09 Same spaces from the same inequalities

Prove: two schemes in `X` with Jackson's and Bernstein's inequalities of order `r` for the same `ι`
have the same `A^s_q` for `0 < s < r`. *Needs:* AS-B06.

### AS-B10 Moduli compatible with a scheme

Let `ω : X → ℕ → ℝ≥0∞` (a modulus at the dyadic scales `2^{−k}`) satisfy, for some `ρ > 0`, `θ > 0`
and `C`: `ω(f + g, k)^ρ ≤ ω(f, k)^ρ + ω(g, k)^ρ`; `ω(f, k) ≤ C N f`; Jackson's inequality
`E_{2^k}(f) ≤ C ω(f, k)`; and the inverse inequality `ω(a, k) ≤ C 2^{−(k−j)_+ θ} N a` for
`a ∈ A (2^j)`. Prove: for `0 ≤ s < θ` and `0 < q ≤ ∞`, `f ∈ A^s_q` if and only if
`N f + ‖(2^{ks} ω(f, k))_k‖_{ℓ_q} < ∞`, with equivalent quasi-norms, and the inclusion of the space
of `ω` in `A^s_q` holds for every `s ≥ 0`. If moreover `ω(−f, k) = ω(f, k)`, then for
`0 < s < t ≤ θ` and `0 < q ≤ ∞`, `(X, B^t_{∞,ω})_{s/t,q} = B^s_{q,ω}`, where `B^t_{q,ω}` carries the
quasi-norm `N f + ‖(2^{kt} ω(f, k))_k‖_{ℓ_q}`, and `(X, B^{t}_{q₁,ω})_{η,q} = B^{ηt}_{q,ω}` for
`0 < t < θ`, `0 < η < 1` and every `0 < q₁, q ≤ ∞`. Route: near-best approximants and AS-A02 for the
coincidence; AS-B06 with `|f|_Y = sup_k 2^{kt} ω(f, k)` and AS-B07 for the interpolation
(DeVore–Popov 1988, §5, for splines). *Needs:* AS-A02, AS-A05, AS-B06, AS-B07.

For the classical schemes and the moduli of smoothness of order `r`, the inverse order is `θ = r`
for trigonometric polynomials, `θ = r − 1 + 1/p` for splines of order `r` on an interval, and
`θ = 1/p` for dyadic steps on a cube with `p ≤ 1`.

**Checks.**
- The bound `s < θ` is sharp: in `L_p(𝕋)` take the scheme `A_n` of the trigonometric polynomials of
  degree below `n` and `ω(f, k) = sup_{|h| ≤ 2^{−k}} ‖f(· + h) − f‖_p`, with `θ = 1`. The character
  `e_1(x) = exp(2πix)` lies in `A_2`, hence in every `A^s_q`, while
  `2^{ks} ω(e_1, k) = 2^{ks} · 2 sin(π 2^{−k}) ≥ 4 · 2^{k(s−1)}` for `k ≥ 1`, so `e_1` misses the
  space of `ω` for `s > 1`, and for `s = 1`, `q < ∞`.

### Examples

The couple `(N, N)` of AS-B01; the couple `(L_p, W^r_p)` for `p ≥ 1` and the couples of moduli of
smoothness on an interval and on a cube, which ClassicalApproximationSpaces builds.

### Dependencies

AS-B01–AS-B04 rest on Part A and on NoncommutativeIntegration §2.2 and §2.4 for the normed case.
AS-B05–AS-B10 rest on AS-B01–AS-B04 and Part A.

## Worked examples

- **`n`-term approximation.** For `f = ∑_{i ≥ 1} i^{−β} e_i`, `β > 1/2`, in a separable Hilbert
  space: `E_n(f) ≍ n^{1/2 − β}`, so `f ∈ A^{β − 1/2}_∞`; and `f ∈ A^α_τ` with `α = 1/τ − 1/2`
  exactly when `τβ > 1`, that is `α < β − 1/2` (AS-A13).

## Downstream consumers

ClassicalApproximationSpaces consumes both parts: the quasi-norm of `L_p` and the discrete Hardy
inequalities for moduli of smoothness (AS-A01, AS-A02); approximation schemes and their quasi-norms
for the trigonometric, band-limited and spline schemes (AS-A03, AS-A05); schemes of functions with
their Besov spaces, Nikolskii's inequality, the embeddings and block decompositions for the
trigonometric, spline and step schemes (AS-A14–AS-A17); `n`-term approximation for Haar functions
(AS-A13); the K-method for `(L_p, W^r_p)` and for Besov spaces outside the Banach range (AS-B01,
AS-B02, AS-B08); and AS-B10 for every description of a Besov space by a modulus of smoothness.

## Provenance

An Apache-2.0 formalisation of a large part of this roadmap exists in
[Lean-FunctionSpaces](https://github.com/mario-ullrich/Lean-FunctionSpaces) (Mario Ullrich, Lean 4
with Mathlib `v4.36.0`, sorry-free, with a blueprint that names the Lean declaration of every
statement). The roadmap specifies the mathematics; the repository is a cited source, and its file
map is not prescriptive.

- *Banach range.* Schemes and approximation spaces in normed spaces (AS-A03–AS-A12), `n`-term
  approximation from a Hilbert basis (AS-A13), couples of extended quasi-norms with the discrete
  and continuous K-method, the upper bound of Holmstedt's formula, the reiteration and
  representation theorems (Part B for `q ≥ 1`).
- *Quasi-Banach range.* The `ρ`-triangle inequality of `L_p` and Fatou's lemma for telescoping sums
  (AS-A01); the E-functional and the E-spaces of quasi-normed couples (AS-B05,
  `InterpCouple.eFunctional`, `InterpCouple.eNormDyadic`); `(N₀, E_{r,q₁})_{η,q} = E_{ηr,q}` for all
  `0 < q, q₁ ≤ ∞` (AS-B07, `InterpCouple.memKMethod_leftECouple_iff`); the Jackson–Bernstein theorem
  for quasi-normed couples (AS-B06,
  `InterpCouple.JacksonBernsteinData.memKMethod_smoothnessCouple_iff`); block decompositions in
  `ρ`-normed couples without completeness (AS-A12,
  `InterpCouple.eNormDyadic_lt_top_iff_eBlockDecompNorm_lt_top`); moduli compatible with a scheme
  (AS-B10, `InterpCouple.CoupleModulusData.eNormDyadic_lt_top_iff` and its interpolation
  corollaries); schemes of functions on a finite measure space with their Besov spaces for every
  `0 < p ≤ ∞` (AS-A14, `FunctionScheme.MemBesov`, `FunctionScheme.memBesov_iff_eNormDyadic_lt_top`),
  Nikolskii's inequality below `1` (AS-A15, `FunctionScheme.HasNikolskii.exists_eLpNorm_le_of_le`),
  the embeddings (AS-A16, `FunctionScheme.exists_uniform_inclusion_eq_of_nikolskii`,
  `FunctionScheme.MemBesov.exists_boundedContinuous_of_nikolskii`) and block decompositions in `L_p`
  (AS-A17, `FunctionScheme.memBesov_iff_exists_blocks`).
- *Not formalised there.* Holmstedt's formula in full (AS-B03).

## Scope and ownership

**This roadmap owns** quasi-normed groups and approximation schemes with their spaces, Jackson's
and Bernstein's inequalities of a scheme, block decompositions, `n`-term approximation from a
Hilbert basis, schemes of functions with their Besov spaces, Nikolskii's inequality for schemes
and the embeddings (Part A); quasi-normed couples, the discrete K-method, Holmstedt's formula, the
reiteration theorem, the E-functional, the representation theorems and moduli compatible with a
scheme (Part B). Its suggested home in Tau Ceti is `TauCeti/Analysis/Approximation/`.

**Owned elsewhere and consumed here.**

- *Real interpolation of Banach couples.*
  [NoncommutativeIntegration](../NoncommutativeIntegration/README.md) owns Banach couples, the
  K-functional and the K-method for `1 ≤ q ≤ ∞`, and the noncommutative `L_p` for `p < 1`. This
  roadmap owns quasi-normed couples, agreeing with them on Banach couples, the discrete K-method,
  Holmstedt's formula, the reiteration theorem and the E-functional. The complex method for
  quasi-Banach spaces lies outside this roadmap.
- *Operators.* [OperatorIdeals](../OperatorTheory/OperatorIdeals/README.md) and
  [SNumbers](../SNumbers/README.md) own approximation numbers and Bernstein numbers of operators;
  the Bernstein inequality of a scheme here is an inverse inequality.

Moduli of smoothness, the Littlewood–Paley Besov spaces and the trigonometric, band-limited,
spline, step and Haar schemes belong to ClassicalApproximationSpaces.

## Exact supplier contracts

### From Mathlib

- `MeasureTheory.Lp`, `eLpNorm`, `eLpNormEssSup`, `MemLp`, `MemLp.mono_exponent`;
  `eLpNorm_add_le'` with `ENNReal.LpAddConst` (`2^{1/p − 1}` for `0 < p < 1`, else `1`) and
  `eLpNorm'_add_le_of_le_one`; `ENNReal.rpow_add_le_add_rpow`; `lp`, `Memℓp`,
  `MeasureTheory.Measure.count`; `TendstoInMeasure`, `lintegral_liminf_le`.
- `Metric.infDist`; `HilbertBasis`.

### From Tau Ceti

Paths are under `TauCeti/`.

- *Real interpolation of Banach couples* (`Analysis/Normed/Interpolation/CompatibleCouple.lean`,
  `KFunctional.lean`, `RealMethod/Basic.lean`): `TauCeti.CompatibleCouple`,
  `CompatibleCouple.kFunctional`, `CompatibleCouple.kMethod`, `CompatibleCouple.kMethodENorm`,
  `CompatibleCouple.KMethodSpace`.
- *Rearrangements*: `TauCeti.decreasingRearrangement`
  (`Topology/Order/DecreasingRearrangement.lean`, the decreasing rearrangement of a nonnegative null
  family), consumed in AS-A13.

### From TauCetiRoadmap.NoncommutativeIntegration

- §2.2 and §2.4: Banach couples, the K-functional and the K-method for `1 ≤ q ≤ ∞`, consumed in
  AS-B01 through the Tau Ceti declarations above.

## References

- A. Pietsch, *Approximation spaces*, J. Approx. Theory **32** (1981), 115–134: Part A, AS-B06.
- R. A. DeVore and V. A. Popov, *Interpolation of Besov spaces*, Trans. Amer. Math. Soc. **305**
  (1988), 397–414: Theorem 5.1 and its proof, §5, Corollary 5.3, Theorem 7.1: AS-A12, AS-A16,
  AS-A17, AS-B10.
- R. A. DeVore and V. A. Popov, *Interpolation spaces and non-linear approximation*, Lecture Notes
  in Math. **1302** (1988), 191–205: AS-B07.
- R. A. DeVore, *Nonlinear approximation*, Acta Numer. **7** (1998), 51–150: §4.3, Theorems 1 and 2
  (AS-B06, AS-B07); Theorem 4 (AS-A13).
- Z. Ditzian and A. Prymak, *On Nikol'skii inequalities for domains in `ℝ^d`*, Constr. Approx.
  **44** (2016), 23–51, Theorem 2.1: AS-A15.
- G. Kerkyacharian and P. Petrushev, *Heat kernel based decomposition of spaces of distributions in
  the framework of Dirichlet spaces*, Trans. Amer. Math. Soc. **367** (2015), 121–189,
  Proposition 6.14: AS-A16.
- M. M. Day, *The spaces `L^p` with `0 < p < 1`*, Bull. Amer. Math. Soc. **46** (1940), 816–823: the
  absence of continuous linear functionals behind the near-best approximants of Part A.
- J. Bergh and J. Löfström, *Interpolation Spaces*, Grundlehren 223, Springer, 1976, §§3.1–3.6,
  3.11, 7.1: Part B.
- T. Holmstedt, *Interpolation of quasi-normed spaces*, Math. Scand. **26** (1970), 177–199: AS-B03.
- N. J. Kalton, N. T. Peck and J. W. Roberts, *An F-space Sampler*, Cambridge, 1984, Theorem 1.3
  (Aoki–Rolewicz): AS-A01.
