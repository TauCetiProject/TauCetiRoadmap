# Roadmap: the quasi-polynomial inverse theorem for the Gowers norms

**Summary.** The Gowers norm `‖f‖_{U^{s+1}}` of a bounded function `f` on an interval
`[N] = {0, …, N − 1}` or on a cyclic group `ℤ/N` is large exactly when `f` correlates with a
nilsequence of degree `s`. This roadmap proves both directions with the bounds of Leng, Sah and
Sawhney:

- **Inverse theorem.** For every `s ≥ 1` there is `C` such that for every `N ≥ 1`, every
  `0 < δ ≤ 1/2` and every `f : [N] → ℂ` with `|f| ≤ 1` and `‖f‖_{U^{s+1}[N]} ≥ δ`, there is a
  nilsequence `ψ(n) = F(g(n)Γ)` of degree `s` on a nilmanifold of dimension at most `C L^C` and
  complexity at most `exp(C L^C)`, with `F` bounded and Lipschitz with constant `exp(C L^C)`, such
  that `|𝔼_{n ∈ [N]} f(n) conj ψ(n)| ≥ exp(−C L^C)`, where `L = log(1/δ)`. The same holds for
  `f : ℤ/N → ℂ`, with the nilsequence evaluated at the representatives `0, …, N − 1`.
- **Converse.** If `f` is 1-bounded and `|𝔼_{n ∈ [N]} f(n) conj ψ(n)| ≥ ε` for a nilsequence `ψ`
  of degree `s`, dimension at most `d` and complexity at most `M`, then
  `‖f‖_{U^{s+1}[N]} ≥ (ε/M)^{C (d+1)^C}`; likewise on `ℤ/N`.

Together they say that the `U^{s+1}` norm and the largest correlation with a degree-`s`
nilsequence of quasi-polynomially bounded complexity control each other up to quasi-polynomial
losses. The proof is Green, Tao and Ziegler's induction on `s`, quantified by Leng, Sah and
Sawhney: the derivatives `Δ_h f` of a function with large `U^{s+1}` norm correlate with
nilcharacters `χ_h` of degree `s − 1`; a Cauchy–Schwarz argument of Gowers shows that the `χ_h`
are compatible along additive quadruples; a *sunflower* and a *linearisation* step, driven by
quantitative equidistribution, show that the top-order Taylor coefficients of `χ_h` depend on `h`
in a bracket-linear way, one degree–rank at a time; the outcome is a nilcharacter of multidegree
`(1, s − 1)` in `(h, n)`, and a symmetrisation argument turns it into a degree-`s` nilsequence
correlating with `f`. Along the way the roadmap builds the calculus of nilcharacters in several
variables up to lower-order terms (equivalence, symbols, splitting, multilinearisation) and the
bracket-linear structure of approximate homomorphisms.

The roadmap sits between these neighbours:

- **NilsequenceEquidistribution** supplies the quantitative equidistribution and factorisation
  theorems for degree, degree–rank and multidegree nilsequences, including Leng's theorem in the
  form used by Leng–Sah–Sawhney; every use of equidistribution here is a call to it.
- **NilmanifoldsAndNilsequences** supplies nilmanifolds with complexity, polynomial sequences,
  nilsequences, nilcharacters and their vertical Fourier decomposition, on `ℤ^k` and on `ℤ/N`.
- **GowersUniformityNorms** supplies the Gowers norms on `ℤ/N` and on finite subsets of `ℤ`,
  their inductive formula, Fourier control of `U^2` and Freiman transport.
- **AlmostPeriodicityAndBohrSets** supplies the quasi-polynomial Bogolyubov–Ruzsa lemma and
  progressions in Bohr sets, which make the linear algebra of the linearisation step cheap.
- **NilpotentLieHeightsAndFiltrations** and **PolynomialOrbitsAndCubeGroups** supply the free
  degree–rank models behind the universal nilmanifolds, and the Leibman square used by the
  converse.

**How to read the build.**

| Layer | Content |
|---|---|
| 0 | Intervals and cyclic groups: derivatives, small scales, progressions, transfer between `[N]` and `ℤ/N` |
| 1 | Nilcharacters in several variables: specialisation, splitting, equivalence, symbols, multilinearisation |
| 2 | The converse inverse theorem |
| 3 | Approximate homomorphisms are bracket-linear |
| 4 | Correlation structures and Gowers' Cauchy–Schwarz argument |
| 5 | Horizontal Taylor coefficients and the sunflower step |
| 6 | The linearisation step |
| 7 | Universal nilmanifolds and the multidegree `(1, s − 1)` nilcharacter |
| 8 | Symmetrisation and the inverse theorem |

Layers 0–3 are independent of the induction and of one another, apart from Layer 2's use of
Layer 0. Layers 4–8 form the induction step: each assumes the inverse theorem in degree
`s − 1` and produces, in Layer 8, the theorem in degree `s`.

## Conventions

1. **Degrees and domains.** `s ≥ 1` is the degree of the conclusion; the hypothesis is on
   `U^{s+1}`. `[N] = Finset.Ico (0 : ℤ) N`, the image of `Finset.range N` in `ℤ`, for `N ≥ 1`.
   A function on `[N]` is a function
   `f : ℤ → ℂ` of which only the values on `[N]` matter; in derivatives and shifts it is replaced by
   `f · 1_{[N]}`. `[±N] = (−N, N) ∩ ℤ`. On `ZMod N` functions are evaluated at representatives
   through `ZMod.val` (NilmanifoldsAndNilsequences, Convention 9), and `f°(n) = f(n mod N)` is the
   pullback of `f : ZMod N → ℂ` to `[N]`.
2. **Gowers norms.** `Δ_h f(n) = f(n) conj f(n + h)` (GowersUniformityNorms' `mulDeriv`).
   `‖f‖_{U^k[N]}` is GowersUniformityNorms' relative norm `Finset.relGowersNorm k [N] f`;
   by its 6.2–6.3 it equals Leng–Sah–Sawhney's normalised norm (LSS, Definition 1.1) computed in
   any `ZMod Ñ` with `Ñ ≥ 2N`. `‖f‖_{U^k(ℤ/N)}` is `gowersNorm` for the uniform measure on
   `ZMod N`, which is `relGowersNorm k Finset.univ f` by the same 6.2.
3. **Nilsequences and their complexity.** Nilmanifolds, Mal'cev presentations, complexity,
   polynomial sequences, nilsequences, vertical frequencies and nilcharacters are those of
   NilmanifoldsAndNilsequences, with its filtrations indexed by degree, degree–rank or multidegree
   (its Convention 2), on `ℤ^k` with the degree or multidegree filtration (its Convention 4). As in
   LSS, §12, a nilsequence has *complexity `(M, d)`* if its nilmanifold has dimension at most `d`
   and complexity at most `M` and its function `F` satisfies `‖F‖_Lip ≤ M`; a nilcharacter has
   complexity `(M, d)` if moreover its output dimension and the height of its vertical frequency
   are at most `M`. For a finite downset `J ⊆ ℕ^k`, a nilsequence *of multidegree `J`* is one on a
   nilmanifold with a multidegree filtration of degree in `J`; *of degree `< J`* refers to the
   downset `J ∖ {maximal elements}` as in LSS, Lemma C.3. `M ≥ 2` and `d ≥ 1` throughout.
4. **Correlation.** For `f : Ω → ℂ^D` on a finite set, `‖𝔼_{n ∈ Ω} f(n)‖_∞` is the largest modulus
   of a coordinate. `f` *correlates at level `η` with complexity `(M, d)` in multidegree `J`*, written
   `f ∈ Corr_J(Ω; η, M, d)`, if `‖𝔼_{n ∈ Ω} f(n) ⊗ conj ψ(n)‖_∞ ≥ η` for a nilsequence `ψ` of
   multidegree `J` and complexity `(M, d)` (LSS, Definition 3.14, with the conjugate on `ψ`).
   For degree `s` on `ℤ` this is `Corr_s`.
5. **Bounds.** Constants `C ≥ 1` depend only on `s` (and on `k`, `J` where several variables
   appear) and are uniform in everything else. For `0 < δ ≤ 1/2`, `L = log(1/δ)`, and a quantity is
   *quasi-polynomial in `δ`* if it is at most `exp(C L^C)`; dimensions are *polylogarithmic* if at
   most `C L^C`. Inside the induction, bounds in terms of a correlation structure's parameters
   `(ρ, M, d, D)` take the forms `(M D/ρ)^{C d^C}` and `exp(C (d log(M D/ρ))^C)`, as in LSS.
6. **Phases.** `e(t) = exp(2πit)`, `‖t‖_{ℝ/ℤ}` is the distance to the nearest integer, and
   `{t} = t − ⌈t − 1/2⌉ ∈ (−1/2, 1/2]` is the signed fractional part of
   NilsequenceEquidistribution (`signedFract`; LSS, §2.5).
7. **Names.** Names in code font are declarations of Mathlib, of the cited roadmaps' Suggested
   files (named there), or of [`Suggested.lean`](Suggested.lean), in the namespace
   `TauCetiRoadmap.GowersInverseTheorem`. Names in italics are proposed names of targets that are
   not prototyped. This README is the specification.

## Layer 0: intervals, cyclic groups and transfer

### 0.1 Derivatives and cube counts on `[N]`

Prove, for `k ≥ 1`:

- **cube counts:** `c_k N^{k+1} ≤ #([N].cubes k) ≤ N^{k+1}` with `c_k > 0`;
- **domination by the mean:** for 1-bounded `f`, `‖f‖_{U^k[N]}^{2^k} ≤ C_k 𝔼_{n ∈ [N]} |f(n)|`;
- **monotonicity up to constants:** `‖f‖_{U^k[N]} ≤ C_k ‖f‖_{U^{k+1}[N]}`, by transport to
  `ZMod (2^{k+1} N)` (GowersUniformityNorms 6.3), nesting there (its 3.2), and the cube counts;
- **derivatives:** `Δ_h f · 1_{[N]}` is supported on `Q_h = [N] ∩ ([N] − h)`, and
  `‖f‖_{U^{k+1}[N]}^{2^{k+1}} ≤ C_k 𝔼_{h ∈ [±N]} ‖Δ_h f‖_{U^k[N]}^{2^k}`, from the derivative
  formula of GowersUniformityNorms 6.2; hence for 1-bounded `f` with `‖f‖_{U^{k+1}[N]} ≥ δ`, at
  least `c_k δ^{2^{k+1}} N` values `h ∈ [±N]` have `‖Δ_h f‖_{U^k[N]} ≥ c_k δ^{2}` (LSS, proof of
  Lemma 6.2).

*Needs:* GowersUniformityNorms 3.2, 6.1–6.3.

**Checks.**

- `#([2].cubes 1) = 4` and `#([2].cubes 2) = 6`: the cubes `(x, h)` with `h = 0`
  number `2`, those with exactly one nonzero `h_i` number `2 + 2` (`x = 0, h_i = 1` or
  `x = 1, h_i = −1`), and none has both `h_i ≠ 0`, since `x + h₁ + h₂` would leave `{0, 1}`.

### 0.2 Small scales

Prove `exists_isNilseqLE_eq_on_range`: every `f : ℤ → ℂ` with `|f| ≤ 1` agrees on `[N]` with a
nilsequence of degree `1` and complexity `(8N, 1)`: take the circle of degree `1`, `g(n) = n/(2N)`
and `F` the piecewise linear interpolation on `ℝ/ℤ` of the values `f(n)` at the points `n/(2N)`,
`n < N`, closed up linearly over `[(N − 1)/(2N), 1]`; consecutive values differ by at most `2` over
a distance at least `1/(2N)`, so `‖F‖_Lip ≤ 1 + 4N` (NilmanifoldsAndNilsequences 5.1).
With 0.1 this gives the inverse theorem when
`N ≤ exp(C L^C)`: then `ψ = f` on `[N]` has `𝔼_{[N]} |f|² ≥ (𝔼_{[N]} |f|)² ≥ c δ^{2^{s+2}}`, and a
degree-`1` nilsequence is one of degree `s` (NilmanifoldsAndNilsequences 5.2). This is the small-`N`
case of LSS (Remark after Theorem 6.4), done without Fourier analysis.

*Needs:* 0.1; NilmanifoldsAndNilsequences 5.1–5.2.

### 0.3 Progressions, cutoffs and residue partitions

- **Cutoffs.** For an arithmetic progression `P ⊆ [N]` of common difference `q ≥ 1` and
  `0 < ε ≤ 1`, there is a nilsequence `φ` of degree `1` and complexity `(C q/ε, 2)` with values in
  `[0, 1]` such that `φ = 1_P` outside a set of at most `εN` points of `[N]` (torus `ℝ²/ℤ²`,
  `g(n) = (n/(2N), n/q)`, `F` a product of a trapezoid in the first coordinate and a bump at the
  residue of `P` in the second).
- **Residue partitions.** For `q ≥ 1` and `0 < ε ≤ 1`, `[N]` is the disjoint union of at most
  `q(⌈1/ε⌉ + 1)` progressions of common difference `q` and length at most `εN`; if
  `|𝔼_{n ∈ [N]} f(n)| ≥ η` for 1-bounded `f`, then one of them, `P`, of length at least `εηN/(4q)`,
  has `|𝔼_{n ∈ P} f(n)| ≥ η/2`.
- **Progressions to major arcs** (LSS, Lemma 7.1, after Green–Tao–Ziegler's `U^4` paper as
  cited there). If `g : [N] → ℂ` is 1-bounded and `|𝔼_{n ∈ P} g(n)| ≥ δ` for a progression `P ⊆ [N]`
  of length `δN` and common difference `q`, then some `Θ ∈ ℝ` has `‖qΘ‖_{ℝ/ℤ} ≤ C δ^{−C}/N` and
  `|𝔼_{n ∈ [N]} e(Θn) g(n)| ≥ c δ^{C}`. *Route:* convolve `1_P` with the normalised indicator of a
  shorter centred progression, Fourier-expand on the circle, and bound the Fourier transforms of
  progressions by the geometric-sum estimate inside
  ProbabilisticAndMetricNumberTheory's `weyl_sum_linear_inverse` (§2.5a).

*Needs:* NilmanifoldsAndNilsequences 5.1–5.2; ProbabilisticAndMetricNumberTheory §2.5a; Mathlib
`fourierCoeff`.

### 0.4 Transfer between `ℤ/N` and `[N]`

Let `k ≥ 2` and `f : ZMod N → ℂ` be 1-bounded.

- **Freiman transfer of intervals.** For an interval `I ⊆ [N]` of length less than `N/2`, reduction
  modulo `N` is a Freiman isomorphism of order 2 from `I` onto its image (sums `a + b − c − d` of
  elements of `I` lie in `(−N, N)`), so for `u` supported on `I`,
  `relGowersNorm k I u° = relGowersNorm k (I mod N) u` (GowersUniformityNorms 6.3), and the ambient
  comparison of its 6.2 relates both to `‖u‖_{U^k(ℤ/N)}` and to `‖u°‖_{U^k[N]}` with factors
  `(#I/N)^{(k+1)/2^k}` up to constants.
- **Localisation to an interval.** If `‖f‖_{U^k(ℤ/N)} ≥ δ`, split `[N]` into `2^{k+2}` intervals
  `I_j`; by the triangle inequality some `u = f · (1_{I_j} ∘ val)` has
  `‖u‖_{U^k(ℤ/N)} ≥ 2^{−k−2} δ`, hence `‖u°‖_{U^k[N]} ≥ c_k δ`.
- **Cutting does not increase the norm much.** For an interval `I`,
  `‖f · (1_I ∘ val)‖_{U^k(ℤ/N)} ≤ η^{−1/2} ‖f‖_{U^k(ℤ/N)} + (2η)^{1/2^k}` for `1/N ≤ η ≤ 1`:
  replace `1_I` by its convolution `φ` with the normalised indicator of an interval of length `ηN`,
  whose Fourier coefficients have `ℓ¹` norm at most `η^{−1/2}` (Cauchy–Schwarz and Parseval),
  use phase invariance and the triangle inequality (GowersUniformityNorms 3.2, 4.1) for `fφ`, and
  `‖·‖_{U^k} ≤ ‖·‖_{L^{2^k}}` for the error.
- **Cyclic nilsequences from interval nilsequences.** If `ψ` is a nilsequence on `ℤ` of degree `s`
  and complexity `(M, d)` and `φ` the cutoff of 0.3 for `I_j` at accuracy `η/(2M)`, then
  `x ↦ (φψ)(x.val)` is a nilsequence on `ZMod N` (NilmanifoldsAndNilsequences 6.1) of degree `s` and
  complexity `(C (M/η)^C, d + 2)`, and
  `|𝔼_x f(x) conj (φψ)(x.val)| ≥ |𝔼_{n ∈ [N]} u°(n) conj ψ(n)| − η/2`.

*Needs:* 0.1, 0.3; GowersUniformityNorms 3.2, 4.1, 6.2–6.3; NilmanifoldsAndNilsequences 5.2, 6.1.

## Layer 1: nilcharacters in several variables

This layer is the quantitative calculus of Green–Tao–Ziegler, Appendix E, in the form of LSS,
Appendix C. Nilsequences and nilcharacters are on `ℤ^k` with the multidegree filtration, or with
the degree filtration where stated; every bound is of the form `M' ≤ M^{C d^C}`, `d' ≤ C d^C` with
`C` depending on `k` and the multidegrees.

### 1.1 Specialisation and pullback

Prove (LSS, Lemma C.2; GTZ, Lemma E.3 and Lemma E.8 (vi)):

- **freezing a variable:** fixing `h₁ = h*` in a nilsequence of multidegree `(s₁, …, s_k)` and
  complexity `(M, d)` gives one of multidegree `(s₂, …, s_k)` and complexity `(M^{C d^C}, d)`;
- **pullback:** for a `ℤ`-linear map `T : ℤ^ℓ → ℤ^k`, `ψ ∘ T` is a nilsequence of degree `s` and
  complexity `(M, d)` when `ψ` is of degree `s`; for the multidegree filtration the same holds for
  *block maps* `T`, which send the variables of each block to linear combinations of the variables
  of one block of `ℤ^ℓ`, with multidegree transported along the blocks;
- **total degree:** a nilsequence of multidegree `(s₁, …, s_k)` is one of degree `s₁ + ⋯ + s_k`
  with the same complexity, through the filtration `G_t = ∨_{|i| ≥ t} G_i`;
- **additive-triple restriction:** for a multidegree `(1, …, 1)` nilcharacter `χ` with `g(0) = 1`,
  the sequence `(h₁, h₁', h₂, …) ↦ (g(h₁ + h₁', h₂, …), g(h₁, h₂, …), g(h₁', h₂, …))` is polynomial
  for the filtration `G'_t = ∨ (G_i × G_i × G_i) ∨ {(g₁g₂, g₁, g₂) : g_i ∈ G_i}` of LSS, proof of
  Lemma C.4, on a nilmanifold of complexity `M^{C d^C}` and dimension `3d`;
- **translates and dilates:** `ψ(· + h)` and `ψ(q ·)` keep the multidegree, with complexity
  `M^{C(q) d^C}` (GTZ, remark after Corollary E.2).

*Needs:* NilmanifoldsAndNilsequences 0.2–0.3, 2.5, 4.2, 5.2.

### 1.2 Splitting

**Theorem** (LSS, Lemma C.6; quantitative GTZ, Lemma E.4). Let `J, J' ⊆ ℕ^k` be finite downsets,
`0 < ε ≤ 1/2`, and `β` a nilsequence of multidegree `J ∪ J'` and complexity `(M, d)`. Then
`|β − Σ_{j ≤ L} β_j β'_j| ≤ ε` on `ℤ^k` with `L ≤ (M/ε)^{C d^C}`, `β_j` of multidegree `J`,
`β'_j` of multidegree `J'`, all of complexity `((M/ε)^{C d^C}, C d^C)`.

*Route:* normalise `g(0) = 1`, lift to the free model of multidegree `J ∪ J'`
(NilpotentLieHeightsAndFiltrations 5.3) on generators of the layers, project to the quotients by the
subgroups generated by the layers outside `J`, respectively `J'`, whose intersection is trivial by
freeness, and approximate `F` by sums of products of Lipschitz functions pulled back from the two
quotients with an explicit partition of unity (NilmanifoldsAndNilsequences 3.4) in place of
Stone–Weierstrass.

*Needs:* 1.1; NilpotentLieHeightsAndFiltrations 5.3–5.4; NilmanifoldsAndNilsequences 3.4.

### 1.3 Basic facts about nilcharacters

Prove (quantitative GTZ, Lemma E.3; LSS, proof of Lemma 6.2):

- tensor products, complex conjugates, pullbacks along the maps of 1.1, translates and dilates of
  nilcharacters are nilcharacters, with output dimensions multiplying under tensor products and
  vertical frequencies adding;
- `Σ_i |χ_i|² = 1` pointwise, so `tr(χ ⊗ conj χ) = 1`;
- **embedding:** if `F` has vertical frequency `η` and `‖F‖_∞ ≤ K`, then `F/(2K)` is a coordinate
  of the nilcharacter `(F/(2K), F_η · (1 − |F/(2K)|²)^{1/2})` of frequency `η`, with `F_η` from
  NilmanifoldsAndNilsequences 5.4 (existence), of complexity `((M K)^{C d^C}, d)`;
- **correlation with a nilcharacter** (quantitative form of the first step of GTZ, proof of
  Corollary E.6): if
  `f ∈ Corr_s(Ω; η, M, d)` for 1-bounded `f` on a finite `Ω ⊆ ℤ^k`, then
  `‖𝔼_{n ∈ Ω} f(n) ⊗ conj χ(n) ⊗ conj ψ(n)‖_∞ ≥ (η/M)^{C d^C}` for a nilcharacter `χ` of degree `s`
  and a nilsequence `ψ` of degree `s − 1`, both of complexity `((M/η)^{C d^C}, C d)`
  (vertical Fourier decomposition, NilmanifoldsAndNilsequences 5.3–5.4, then the embedding).

*Needs:* 1.1; NilmanifoldsAndNilsequences 5.3–5.4.

### 1.4 Equivalence and symbols

**Definition** (LSS, Definition 7.3; quantified GTZ, Definition 6.22). Nilcharacters `χ, χ'` of
multidegree `J` (respectively degree `s`) on `ℤ^k` are *`(M, D, d)`-equivalent* if their output
dimensions are at most `D` and every coordinate of `χ ⊗ conj χ'` is a sum of at most `M`
nilsequences of degree `< J` (respectively `< s`) and complexity `(M, d)` (`NilcharEquiv`).

Prove:

- **reflexivity:** a nilcharacter of complexity `(M, d)` is `(M^{C d^C}, M, d)`-equivalent to itself,
  since `F ⊗ conj F` is invariant under the top layer and descends to a lower nilmanifold (GTZ,
  proof of Lemma E.7); symmetry is conjugation;
- **transitivity** (LSS, Lemma C.1; GTZ, Lemma E.7): equivalences with parameters `(M, D, d)`
  compose to `((M D)^C, (M D)^C, C d)`, using `tr(χ₂ ⊗ conj χ₂) = 1`;
- **transfer of correlation** (LSS, Lemma 7.4): if `‖𝔼_{n ∈ Ω} f(n) ⊗ χ(n)‖_∞ ≥ ρ` and `χ, χ'` are
  `(M, D, d)`-equivalent, then `‖𝔼 f ⊗ χ' · ψ‖_∞ ≥ (ρ/(M D))^C` for one of the nilsequences `ψ`
  of a witness of the equivalence;
- **symbol calculus** (LSS, Lemma C.3; GTZ, Lemma E.8): `χ ⊗ χ'` and `conj χ` respect equivalence;
  `χ(· + h* e_j)` is equivalent to `χ`; `χ(q ·)` is equivalent to `χ^{⊗ q^{|J|}}` for `q ∈ ℤ`
  (integer expansion of the dilate); for `q ≥ 1` there is `χ̃` with `χ̃^{⊗ q}` equivalent to `χ`
  (divisibility), each with explicit `(M, D, d)` depending on `q`; and `χ ∘ T` respects equivalence
  for the pullbacks of 1.1;
- **the symbol group.** On `ℤ^k`, call nilcharacters (of any complexity) *equivalent* if they are
  `(M, D, d)`-equivalent for some parameters. The quotient of the set of nilcharacters
  `ℤ^k → ℂ^D` (`D` ranging over `ℕ`) by this relation is an abelian group *Symb_J(ℤ^k)* under tensor
  product (GTZ, Lemma E.8 (iii)), with inverse given by conjugation, `q`-divisible for `J ≠ {0}`.

*Needs:* 1.1, 1.3; NilmanifoldsAndNilsequences 5.2.

**Checks.**

- On `ℤ`, `e(αn²)` and `e(αn² + βn)` are equivalent of degree `2`, since their quotient is the
  degree-1 nilsequence `e(−βn)`; `e(αn²)` and `e(2αn²)` are not equivalent for `α ∉ ℚ`.
- `χ(2·)` for `χ(n) = e(αn²)` is `e(4αn²) = χ(n)^4`, matching `q^{|J|} = 2²`.

### 1.5 Multilinearisation

Prove:

- (LSS, Lemma C.4) for a multidegree `(1, …, 1)` nilcharacter `χ` on `ℤ^k` of complexity `(M, d)`,
  `χ(h₁ + h₁', h₂, …, h_k)` and `χ(h₁, h₂, …) ⊗ χ(h₁', h₂, …)` are
  `(M^{C d^C}, M^{C d^C}, d^C)`-equivalent of degree `k − 1`, through the additive-triple restriction
  of 1.1;
- (LSS, Lemma C.5; GTZ, Theorem E.10) for a nilcharacter `χ` of multidegree `(s₁, …, s_k)` there is
  a multidegree `(1, …, 1)` nilcharacter `χ'` in `s₁ + ⋯ + s_k` variables, symmetric in each block of
  `s_i` variables, such that `χ` and `χ'(h₁, …, h₁, …, h_k, …, h_k)` are equivalent of degree
  `|s| − 1`, with complexity `(M^{C d^C}, d^C)`. The symmetric model can be built on the squarefree
  algebra and polarisation of NilpotentLieHeightsAndFiltrations 6.1–6.2.

*Needs:* 1.1, 1.4; NilpotentLieHeightsAndFiltrations 6.1–6.2.

## Layer 2: the converse inverse theorem

### 2.1 Degree lowering through the Leibman square

Let `G/Γ` have a full filtration of degree `s ≥ 1`, dimension `d` and complexity at most `M`, let
`F` have a `G_s`-vertical frequency and `‖F‖_Lip ≤ M`, and let `g` be polynomial with `g(0) = 1`.
For `h ∈ ℤ`, `n ↦ F(g(n + h)Γ) conj F(g(n)Γ)` is the nilsequence `F^□(g_h(n)Γ^□)` on the quotient
of the Leibman square `G^□ = G ×_{G_2} G` (PolynomialOrbitsAndCubeGroups 0.4, 4.1) by the diagonal
`Δ(G_s)`, of degree `s − 1`, dimension at most `2d`, complexity at most `M^{C d^C}` and with
`‖F^□‖_Lip ≤ M^{C d^C}`: this is NilsequenceEquidistribution 2.6 (Leibman squares with
complexity, and derivative sequences), combined with basepoint normalisation
(NilmanifoldsAndNilsequences 4.2). Nothing beyond that statement is needed here; this subsection
records the form in which 2.2 uses it.

*Needs:* NilsequenceEquidistribution 2.6; NilmanifoldsAndNilsequences 4.2.

### 2.2 The converse on `[N]` and on `ℤ/N`

**Theorem** (LSS, Lemma B.5; qualitatively GTZ, Proposition 5.6, which cites Green–Tao, *Linear
equations in primes*, §11). For every `s ≥ 0` there is `C` such that for `N ≥ 1`, `0 < ε ≤ 1`, 1-bounded `f`
and a nilsequence `ψ` of degree `s` and complexity `(M, d)` with
`|𝔼_{n ∈ [N]} f(n) conj ψ(n)| ≥ ε`, one has `‖f‖_{U^{s+1}[N]} ≥ (ε/M)^{C (d+1)^C}`
(`converse_interval`). The same holds for `f : ZMod N → ℂ`, a nilsequence `ψ` on `ZMod N` and
`‖f‖_{U^{s+1}(ℤ/N)}`, `s ≥ 1` (`converse_cyclic`).

*Route:* induction on `s`. For `s = 0`, `ψ` is constant and `‖f‖_{U^1[N]} = |𝔼 f|`. For `s ≥ 1`,
decompose `F` into vertical frequencies (NilmanifoldsAndNilsequences 5.3, or the efficient
vertical expansion of NilsequenceEquidistribution 2.4) and keep one term;
expand `|𝔼_n f(n) conj F_ξ(g(n)Γ)|²` as an average over `h ∈ [±N]` of correlations of `Δ_h f` with
the degree-`(s − 1)` nilsequences of 2.1; apply the induction hypothesis to many `h` and conclude
with 0.1. Each step multiplies `log(M/ε)` by `C d` and doubles `d`, which gives the stated bound.
On `ℤ/N`, split `[N]` into intervals and use 0.4 (cutting and Freiman transfer).

*Needs:* 0.1, 0.4, 2.1; NilmanifoldsAndNilsequences 5.3, 6.1; NilsequenceEquidistribution 2.4.

**Checks.**

- `s = 1`, `ψ(n) = e(an/N)` on `ZMod N`, `f = ψ`: the bound gives `‖ψ‖_{U^2(ℤ/N)} ≥ c`, and indeed
  `‖ψ‖_{U^2} = 1` (GowersUniformityNorms 3.2, Checks).
- `s = 2`, `f(x) = e(x.val²/(2N))` on `ZMod N` with `N` odd: `f` is itself a nilsequence of degree
  `2` and complexity `(8, 1)` on `ZMod N` (NilmanifoldsAndNilsequences 6.1, Checks), so
  `‖f‖_{U^3(ℤ/N)} ≥ c` with `c` independent of `N`, although `f` is not `N`-periodic as a function
  of `x.val`.

## Layer 3: approximate homomorphisms are bracket-linear

This layer is LSS, Appendix A, built on AlmostPeriodicityAndBohrSets. Write `N'` for a prime in
`[100N, 200N]` (Bertrand's postulate, Mathlib `Nat.exists_prime_lt_and_le_two_mul`).

### 3.1 Freiman homomorphisms on Bohr sets

For `S ⊆ ZMod N'` (identified with characters `x ↦ e(sx/N')`) and `0 < ρ < 1/4`, the Bohr set is
`B(S, ρ) = {x | ‖sx/N'‖_{ℝ/ℤ} ≤ ρ for s ∈ S}` (LSS, Definition A.3), which is the chord set of an
abelian Bohr set of AlmostPeriodicityAndBohrSets 5.4 with comparable widths. A Freiman homomorphism
(LSS, Definition A.5; Mathlib `IsAddFreimanHom 2`) `φ : B(S, ρ) → ℝ/ℤ` satisfies
`φ(n) = Σ_{α ∈ S} a_α {αn/N'} + γ` modulo `1` for all `n ∈ B(S, ρ |S|^{−2|S|})` and suitable
`a_α, γ ∈ ℝ` (LSS, Lemma A.6, which cites Green–Tao's `U^3` paper, Propositions 10.5 and 10.8).
*Route:* prove the sandwich `B(S, ρ|S|^{−2|S|}) ⊆ P ⊆ B(S, ρ)` for a proper progression `P` of
rank at most `|S|` (Green–Tao's `U^3` paper, Proposition 10.5, as cited by LSS), from the lattice
`Λ ⊆ ℝ^S` of the phases and its successive minima, as in the proof of
AlmostPeriodicityAndBohrSets 7.2, which gives the upper inclusion and the size; a Freiman
homomorphism on a proper progression is affine in its coordinates; and each coordinate of a point
of `P` is a real linear combination of the `{αn/N'}`, because `P` is the image of a box of `Λ`.

*Needs:* AlmostPeriodicityAndBohrSets 5.4, 7.1–7.2; Tau Ceti `ZLattice.successiveMin`; Mathlib
`IsAddFreimanHom`.

### 3.2 Graphs with many additive quadruples

**Theorem** (LSS, Lemma A.2). Let `0 < δ ≤ 1/2`, `H₁, …, H₄ ⊆ [N]` and `f_i : H_i → ℝ^d` with at
least `δN³` additive quadruples `h₁ + h₂ = h₃ + h₄` such that
`f₁(h₁) + f₂(h₂) − f₃(h₃) − f₄(h₄) ∈ ℤ^d`. Then there are `H' ⊆ H₁` with `#H' ≥ exp(−C L^C) N`,
`d' ≤ C L^C`, `a_i, b ∈ ℝ^d` and `α_i ∈ (1/N')ℤ` with
`f₁(h) − Σ_{i ≤ d'} a_i {α_i h} − b ∈ ℤ^d` for all `h ∈ H'` (`bracket_linear_of_energy`).

*Route:* the graphs `Γ_i = {(h, f_i(h) mod ℤ^d)}` have additive energy `E(Γ₁, …, Γ₄) ≥ δN³`
(LSS, Definition A.7, with the Cauchy–Schwarz bound `E(A₁, …, A₄) ≤ Π E(A_i)^{1/4}`), so `Γ₁` has
large energy; Balog–Szemerédi–Gowers (AlmostPeriodicityAndBohrSets 3.4) gives a large subset of
small doubling; its projection to `ZMod N'` is dense, and Bogolyubov–Ruzsa
(AlmostPeriodicityAndBohrSets 5.5, for the discrete group `ZMod N'`) puts a Bohr set of rank
`C L^C` and width `δ^C` in four-fold sums, on which the graph induces a Freiman homomorphism to
`(ℝ/ℤ)^d`; 3.1 makes it bracket-linear, and a covering argument returns to `H₁`.

### 3.3 Approximate version and error absorption

**Theorem** (LSS, Lemma A.1). Under the hypotheses of 3.2 with
`‖(f₁(h₁) + f₂(h₂) − f₃(h₃) − f₄(h₄))_j‖_{ℝ/ℤ} ≤ ε_j` for every coordinate `j`, in place of
membership in `ℤ^d`, the same conclusion holds with `‖(f₁(h) − Σ a_i {α_i h} − b)_j‖_{ℝ/ℤ} ≤ C ε_j`
and `#H' ≥ exp(−C (d + L)^C) N`. *Route* (LSS, proof of Lemma A.1, after Green–Tao–Ziegler's `U^4`
paper, Appendix C): round each `f_i` to the lattice `Π ε_j ℤ`; the rounded differences take at most
`11^d` values near `ℤ^d`, so one value `w` is attained by `11^{−d} δN³` quadruples; apply 3.2 to the
rounded functions with `f₄` shifted by `w`.

*Needs:* 3.1, 3.2; AlmostPeriodicityAndBohrSets 3.4, 5.5.

## Layer 4: correlation structures and Gowers' Cauchy–Schwarz argument

From here to Layer 8, `s ≥ 2` and the inverse theorem in degree `s − 1` (8.3) is a hypothesis.

### 4.1 Correlation structures

**Definition** (LSS, Definition 6.1). A *correlation structure* of degree–rank `(s − 1, r*)` with
parameters `(ρ, M, d, D)` for 1-bounded `f` on `[N]` consists of: `H ⊆ [N]` with `#H ≥ ρN`; a
nilcharacter `χ(h, n)` of multidegree `(1, s − 1)` on `G*/Γ*` with a `G*_{(1, s−1)}`-vertical
frequency, of complexity `(M, d)` and output dimension at most `D`; one nilmanifold `G/Γ` of
degree–rank `(s − 1, r*)`, dimension at most `d` and complexity at most `M`, one function `F` on it
with a `G_{(s−1, r*)}`-vertical frequency of height at most `M`, `M`-Lipschitz, output dimension at
most `D`; and polynomial sequences `g_h` with `g_h(0) = 1`, such that for `h ∈ H`,
`χ_h(n) = F(g_h(n)Γ)` satisfies `Δ_h f ⊗ χ(h, ·) ⊗ χ_h ∈ Corr_{s−2}([N]; ρ, M, d)`
(*CorrelationStructure*). The degree–rank filtrations are those of NilmanifoldsAndNilsequences,
Convention 2, and GTZ, Definition 6.7 ff.

### 4.2 The initial structure

**Theorem** (LSS, Lemma 6.2). If `‖f‖_{U^{s+1}[N]} ≥ δ`, there is a correlation structure of
degree–rank `(s − 1, s − 1)` with `ρ^{−1}, M, D ≤ exp(C L^C)` and `d ≤ C L^C`.

*Route:* 0.1 gives many `h` with `‖Δ_h f‖_{U^s[N]}` large; the hypothesis gives nilsequences;
basepoint normalisation (NilmanifoldsAndNilsequences 4.2); pigeonhole the nilmanifold among the at
most `M^{C d^C}` Mal'cev presentations of dimension `≤ d` and complexity `≤ M` (a count of
structure constants of bounded height, NilmanifoldsAndNilsequences 2.4) and the function `F` among
the locally constant approximations of NilmanifoldsAndNilsequences 6.3; give `G` the canonical
degree–rank filtration of its degree filtration (GTZ, Example 6.11;
NilpotentLieHeightsAndFiltrations 4.2, `exists_canonicalDegreeRank`) with an adapted Mal'cev basis
of complexity `M^{C d^C}`; take a vertical frequency and embed (1.3). `χ` is the trivial
nilcharacter.

*Needs:* 0.1, 1.3; NilmanifoldsAndNilsequences 2.4, 4.2, 5.3–5.4, 6.3;
NilpotentLieHeightsAndFiltrations 4.2.

### 4.3 Additive quadruples

**Theorem** (LSS, Lemma 7.2, after Gowers and GTZ, Proposition 7.3). If `f₁, f₂, χ_h` are
1-bounded and `𝔼_{h ∈ [N]} |𝔼_{n ∈ [N]} f₂(n) Δ_h f₁(n) χ_h(n)| ≥ δ`, then some `Θ` with
`‖Θ‖_{ℝ/ℤ} ≤ C δ^{−C}/N` has
`|𝔼_{h₁ + h₂ = h₃ + h₄, h_i ∈ [N]} 𝔼_{n ∈ [N]} Q_{h}(n) e(Θn)| ≥ c δ^C`, where `Q_h(n)` is the
product of `χ_{h₁}(n)`, `χ_{h₂}(n + h₁ − h₄)`, `χ_{h₃}(n)` and `χ_{h₄}(n + h₁ − h₄)` with the two
complex conjugations placed as in LSS, Lemma 7.2 (*four-fold product*).
*Route:* extend by zero to `ZMod Ñ` for a prime `Ñ ∈ [4N, 8N]`, Cauchy–Schwarz twice, and remove
the truncations with 0.3 (cutoffs and major arcs).

**Theorem** (LSS, Lemma 7.5 and Remark 7.6). For `s ≥ 3`, a correlation structure with parameters
`(ρ, M, d, D)` has at least `(M D/ρ)^{−C d^C} N³` additive quadruples in `H` for which the
four-fold product, taken with tensor products in place of products, lies in
`Corr_{s−2}([N]; ρ', M', d')` with `ρ'^{−1}, M' ≤ (M D/ρ)^{C d^C}` and `d' ≤ C d^C`; for
`s = 2` the same holds after multiplying by a phase `e(Θn)` with
`‖Θ‖_{ℝ/ℤ} ≤ (M D/ρ)^{C d^C}/N`. The four-fold product is a nilcharacter on `G⁴/Γ⁴` along
`n ↦ (g_{h₁}(n), g_{h₂}(n + h₁ − h₄), g_{h₃}(n), g_{h₄}(n + h₁ − h₄))`; its correlation is obtained
from the previous theorem, 1.2 to split off the multidegree `(1, s − 1)` factor `χ`, and 1.4.

*Needs:* 0.3, 1.1–1.4, 4.1.

## Layer 5: horizontal Taylor coefficients and the sunflower step

For a degree–rank filtration, `Taylor_i(g) ∈ G_{(i,1)}/G_{(i,2)}` is the `i`-th horizontal Taylor
coefficient of NilmanifoldsAndNilsequences 0.5 (GTZ, Definition 9.6), and
`X_i = (X ∩ log G_{(i,1)})/log G_{(i,2)}` the induced basis of this vector space.

### 5.1 Rational subspaces and commutator forms

- A subspace `V' ≤ V` is *`Q`-rational* for a basis `B` of `V` if it has a basis of combinations
  of `B` with coefficients of height at most `Q` (LSS, Definition 8.1); sums, intersections and
  complements of `Q`-rational subspaces are `Q^{C d^C}`-rational with explicit bases
  (NilpotentLieHeightsAndFiltrations 1.2–1.4).
- For `i₁ + ⋯ + i_r = s − 1` and a degree–rank filtration of degree–rank `(s − 1, r)`, every
  `(r − 1)`-fold commutator descends to a multilinear map
  `Π_j G_{(i_j,1)}/G_{(i_j,2)} → G_{(s−1, r)}` (LSS, Remark after Lemma 8.3), computed by the
  corresponding iterated Lie bracket.

*Needs:* NilpotentLieHeightsAndFiltrations 1.2–1.4, 4.2; NilmanifoldsAndNilsequences 0.5.

### 5.2 Taylor coefficients of bounded sequences

**Theorem** (LSS, Lemma 8.2). On a nilmanifold of degree–rank `(s, r)`, dimension `d` and
complexity at most `M`, a polynomial sequence `ε` with `d(1, ε(n)) ≤ M` for `n ∈ [N]` has
`|Taylor_i(ε)|_{X_i} ≤ M^{C d^C} N^{−i}` for `1 ≤ i ≤ s`. *Route:* the `i`-th finite difference
at spacing `⌊N/(2i)⌋` of the coordinates of the first kind, and the comparison of coordinates of
the first and second kind (NilpotentLieHeightsAndFiltrations Layer 8). This is the comparison used
to absorb the smooth part of a factorisation into the Lipschitz function.

*Needs:* 5.1; NilmanifoldsAndNilsequences 3.2, 4.1; NilpotentLieHeightsAndFiltrations Layer 8.

### 5.3 The sunflower step

**Theorem** (LSS, Lemma 8.3). Let `1 ≤ r* ≤ s − 1` and let `f` have a correlation structure of
degree–rank `(s − 1, r*)` with parameters `(ρ, M, d, D)`, `N ≥ (M D/ρ)^{C d^C}`. Then `f` has a
correlation structure of the same degree–rank with `ρ'^{−1} ≤ (M D/ρ)^{C d^C}`, `M' ≤ C M`,
`D' = D`, `d' ≤ C d`, `H' ⊆ H`, `G*' = G* × ℝ` (with the filtration and the extra phase `e(Θn)` of
LSS, Lemma 8.3), and `(M D/ρ)^{C d^C}`-rational subspaces `V_{i,Dep} ≤ V_i ≤ G_{(i,1)}/G_{(i,2)}` such
that `Taylor_i(g'_h) ∈ V_i` and `Taylor_i(g'_{h₁}) − Taylor_i(g'_{h₂}) ∈ V_{i,Dep}` for
`h, h₁, h₂ ∈ H'`, and the vertical frequency `η` kills every `(r* − 1)`-fold commutator of
`v_{i_j} ∈ V_{i_j}` (`Σ i_j = s − 1`) in which at least two entries lie in the `V_{i,Dep}`.

*Route:* the four-fold products of 4.3 are biased; the factorisation along a central frequency
(NilsequenceEquidistribution 4.1, `exists_factorization_of_verticalFrequency`; LSS, Theorem 5.4 and
Corollary 5.5, built on Leng's theorem, NilsequenceEquidistribution 3.1), applied to the
degree–rank nilmanifolds through the transfer of NilsequenceEquidistribution 4.5, factorises their
polynomial sequences; 5.2 absorbs the smooth parts; the rational parts are periodic
(NilsequenceEquidistribution 2.2) and are removed with residue partitions (0.3); and the
Furstenberg–Weiss commutator argument of LSS, §8, applied once (without iteration), produces the
subspaces.

*Needs:* 0.3, 4.1, 4.3, 5.1, 5.2; NilsequenceEquidistribution 2.2, 3.1, 4.1, 4.5.

## Layer 6: the linearisation step

**Theorem** (LSS, Lemma 9.1). Under the hypotheses of 5.3, with output of 5.3 as input, `f` has a
correlation structure of degree–rank `(s − 1, r*)` with `ρ'^{−1} ≤ exp(C (d log(M D/ρ))^C)`,
`M' ≤ C M`, `D' = D`, `d' ≤ C d`, `H' ⊆ H`, `G*' = G* × ℝ`, and linearly disjoint subspaces
`W_{i,*}, W_{i,Lin}, W_{i,Pet} ≤ G_{(i,1)}/G_{(i,2)}` with `(M D/ρ)^{C d^C}`-rational bases, such
that for `h, h₁, h₂ ∈ H'`:

- `Taylor_i(g'_h) ∈ W_i = W_{i,*} + W_{i,Lin} + W_{i,Pet}` and
  `Taylor_i(g'_{h₁}) − Taylor_i(g'_{h₂}) ∈ W_{i,Lin} + W_{i,Pet}`;
- the projection to `W_{i,Lin}` is bracket-linear in `h`:
  `Proj(Taylor_i(g'_h)) = Σ_{Z ∈ X_{i,Lin}} (γ_{i,Z} + Σ_{k ≤ d*} α_{i,Z,k} {β_k h}) Z` with
  `d* ≤ (d log(M D/ρ))^C` and `β_k ∈ (1/N')ℤ`;
- `η` kills every `(r* − 1)`-fold commutator with an entry in some `W_{i,Pet}` (a *petal*), or with
  two entries in the `W_{i,Lin}`.

*Route:* Leng's theorem (NilsequenceEquidistribution 3.1) and the factorisations from horizontal
characters (its 2.5), applied through its 4.5 to the four-fold products of 4.3, give approximate
additive relations between the `V_{i,Dep}`-components of `Taylor_i(g_h)` along many additive
quadruples, with the bracket bookkeeping of the refined bracket polynomial lemma (its 1.2,
`refined_bracket_polynomial`) and the many-shifts lemma (its 0.2); Layer 3 (with the error
absorption of 3.3) makes the relevant components bracket-linear on a dense subset of `H`; the
components that cannot be linearised are shown to be petals.

*Needs:* Layer 3, 4.1, 4.3, 5.1–5.3; NilsequenceEquidistribution 0.2, 1.2, 2.5, 3.1, 4.5.

## Layer 7: universal nilmanifolds and the multidegree `(1, s − 1)` nilcharacter

### 7.1 Universal nilmanifolds with marked generators

**Definition** (LSS, Definition 10.3; GTZ, Definition 9.1). For a dimension vector
`D = D* + D^Lin + D^Pet ∈ ℕ^{s−1}` the *universal nilpotent Lie algebra of degree–rank
`(s − 1, r*)`* is the free degree–rank model of NilpotentLieHeightsAndFiltrations 5.4 on generators
`e_{i,j}`, `1 ≤ i ≤ s − 1`, `1 ≤ j ≤ D_i`, of weight `i`, with degree–rank at most `(s − 1, r*)`; its
group `G_Univ` (the BCH group of the real form) carries the lattice `Γ_Univ` generated by the
`exp(e_{i,j})`. The generators are *marked* `*`, `Lin` or `Pet` according to the summand of `D_i`
containing `j`. Prove:

- (LSS, Lemma 10.4) the groups generated by iterated commutators of total weight `> d`, or `= d`
  with at least `r` entries, form a degree–rank filtration, and `G_Univ/Γ_Univ` is a nilmanifold
  with an adapted Mal'cev basis, with the dimension and complexity bounds of LSS, Lemma 10.4,
  depending only on `s` and `|D|`;
- (LSS, Definition 10.7 and the lemmas following it) the span of the commutators with an entry
  marked `Pet`, or with two entries marked `Lin` or `Pet`, is an ideal; its group `G_Rel` is a
  rational normal subgroup, and the quotient `G_Quot = G_Univ/G_Rel` is a degree–rank nilmanifold
  with the same kind of bounds.

*Needs:* NilpotentLieHeightsAndFiltrations 5.4, 4.2; NilmanifoldsAndNilsequences 1.2, 2.5;
ScatteringDiagrams §0.4 (*BCHGroup*).

### 7.2 Lifting and extraction

Prove (LSS, §§10–11, following GTZ, §12):

- a nilcharacter `χ_h` of a correlation structure satisfying the conclusions of Layer 6 lifts to
  `G_Univ` along the homomorphism sending `e_{i,j}` to the basis vectors of `W_{i,*}`, `W_{i,Lin}`,
  `W_{i,Pet}`, and modulo lower degree–rank it factors through `G_Quot`, where only bracket-linear
  `h`-dependence remains;
- (LSS, Lemma 11.3) the resulting function of `(h, n)` is a nilsequence on a multidegree
  `(1, s − 1)` nilmanifold `G_Multi/Γ_Multi` with a basis of complexity
  `exp(C (d log(M D/ρ))^C)`, and its function is Lipschitz with the same bound.

### 7.3 Lowering the rank

**Theorem** (LSS, Lemma 6.3). For `1 ≤ r* ≤ s − 1` and `N ≥ exp(C (d log(M D/ρ))^C)`, a
correlation structure of degree–rank `(s − 1, r*)` with parameters `(ρ, M, d, D)` yields one of
degree–rank `(s − 1, r* − 1)` with `ρ'^{−1}, M', D' ≤ exp(C (d log(M D/ρ))^C)` and
`d' ≤ C (d log(M D/ρ))^C`. *Route:* 5.3, Layer 6, 7.1–7.2, absorbing the extracted factor into
`χ(h, n)` with 1.3 and the remainder of lower degree–rank with 1.2.

**Theorem** (LSS, Theorem 6.4; GTZ, Theorem 7.1). If `‖f‖_{U^{s+1}[N]} ≥ δ`, there are
`H ⊆ [N]` with `#H ≥ ρN` and a multidegree `(1, s − 1)` nilcharacter `χ(h, n)` with
`Δ_h f ⊗ χ(h, ·) ∈ Corr_{s−2}([N]; ρ, M, d)` for `h ∈ H`, where `ρ^{−1}, M, D ≤ exp(C L^C)` and
`d ≤ C L^C`. *Route:* 4.2, then `s − 1` applications of the previous theorem; a degree–rank
`(s − 1, 0)` nilmanifold has a degree-`(s − 2)` filtration and is absorbed into `Corr_{s−2}`; the
case `N ≤ exp(C L^C)` is 0.2.

*Needs:* 0.2, 1.2–1.3, 4.2, 5.3, Layer 6, 7.1–7.2.

## Layer 8: symmetrisation and the inverse theorem

### 8.1 Multilinear symmetric models

**Theorem** (LSS, Lemma 12.1). If `𝔼_{h ∈ [N]} ‖𝔼_{n ∈ [N]} Δ_h f(n) ⊗ χ(h, n) ψ_h(n)‖_∞ ≥ 1/M`
with `χ` a multidegree `(1, s − 1)` nilcharacter and `ψ_h` nilsequences of degree `s − 2`, all of
complexity `(M, d)`, then the same holds, with `M` replaced by `M^{C d^C}` and `d` by `C d^C`, for
`χ̃(h, n, …, n) ⊗ ψ̃(n) ⊗ ψ̃_h(n)` with `χ̃` a multidegree `(1, …, 1)` nilcharacter in `s` variables
symmetric in the last `s − 1`, `ψ̃` of degree `s − 1` and `ψ̃_h` nilcharacters of degree `s − 2`.
*Route:* 1.5, 1.4 (transfer), 1.2 with 1.1 (freezing), 1.3.

*Needs:* 1.1–1.5.

### 8.2 Symmetrisation

**Theorem** (LSS, §12; GTZ, Theorem 7.4). Under the conclusion of 8.1 with `M, d` quasi-polynomial
and polylogarithmic in `δ`, `f` correlates with a nilsequence of degree `s` of complexity
`(exp(C L^C), C L^C)` at level `exp(−C L^C)`. *Route* (LSS, §12): show that `χ̃` is symmetric in all
`s` variables up to lower order, by a fixed number of Cauchy–Schwarz steps removing the 1-bounded
functions, multilinearisation (1.5) to combine `χ̃(y, x, n, …) ⊗ conj χ̃(y', x, n, …)` into
`χ̃(y − y', x, n, …)` up to equivalence, the symbol calculus (1.4), and a single call to
Leng's theorem (NilsequenceEquidistribution 3.1); the symmetric `χ̃` then has a diagonal `n ↦ χ̃(n, …, n)` which is a
degree-`s` nilcharacter (1.1), and the correlations of the `Δ_h f` with `χ̃(h, n, …, n)` assemble
into a correlation of `f` with a degree-`s` nilsequence.

*Needs:* 1.1–1.5, 8.1; NilsequenceEquidistribution 3.1, 4.5.

### 8.3 The inverse theorem on `[N]`

**Theorem** (LSS, Theorem 1.2; qualitatively GTZ, Theorem 1.3). For every `s ≥ 1` there is `C`
such that for all `N ≥ 1`, `0 < δ ≤ 1/2` and 1-bounded `f` with `‖f‖_{U^{s+1}[N]} ≥ δ`, there is a
nilsequence `ψ` of degree `s` and complexity `(exp(C L^C), C L^C)` with
`|𝔼_{n ∈ [N]} f(n) conj ψ(n)| ≥ exp(−C L^C)` (`inverse_theorem_interval`).

*Route:* induction on `s`. For `s = 1`, transport `f` to `ZMod Ñ` with `Ñ = 4N`; GowersUniformityNorms
4.1 gives a frequency `a` with `|𝔼_{x} f̃(x) e(−ax/Ñ)| ≥ c δ²`, and `n ↦ e(an/Ñ)` is a degree-`1`
nilsequence of complexity `(8, 1)` (NilmanifoldsAndNilsequences 5.1, Checks). For `s ≥ 2`, 7.3 and
8.1–8.2, with the hypothesis in degree `s − 1` supplied by induction. Composition of finitely many
quasi-polynomial bounds is quasi-polynomial, so the constant depends only on `s`.

*Needs:* 0.1–0.2, 7.3, 8.1–8.2; GowersUniformityNorms 4.1, 6.3.

### 8.4 The inverse theorem on `ℤ/N`

**Theorem.** For every `s ≥ 1` there is `C` such that for all `N ≥ 1`, `0 < δ ≤ 1/2` and 1-bounded
`f : ZMod N → ℂ` with `‖f‖_{U^{s+1}(ℤ/N)} ≥ δ`, there is a nilsequence `ψ` on `ZMod N`
(NilmanifoldsAndNilsequences 6.1) of degree `s` and complexity `(exp(C L^C), C L^C)` with
`|𝔼_{x} f(x) conj ψ(x)| ≥ exp(−C L^C)` (`inverse_theorem_cyclic`). *Route:* 0.4 (localisation,
then cyclic nilsequences from interval nilsequences) and 8.3.

**Corollary.** For 1-bounded `f` on `[N]` or `ℤ/N` and `0 < δ ≤ 1/2`: if `‖f‖_{U^{s+1}} ≥ δ`, then
`f` correlates at level `exp(−C L^C)` with a degree-`s` nilsequence of complexity
`(exp(C L^C), C L^C)` (8.3, 8.4); conversely, such a correlation forces
`‖f‖_{U^{s+1}} ≥ exp(−C' L^{C'})` (2.2), with `C'` depending only on `s`.

*Needs:* 0.4, 2.2, 8.3.

**Checks.**

- `s = 1` on `ZMod N`: the theorem returns a linear phase, matching GowersUniformityNorms 4.1.
- `s = 2`, `f(x) = e(x.val²/(2N))` with `N` odd: by the Check of 2.2, `‖f‖_{U^3(ℤ/N)} ≥ c`, and
  the theorem's conclusion is attained by `ψ = f` itself.

## Worked examples

- **`U^2` and `U^3`.** For `s = 1` the chain of this roadmap reduces to Fourier analysis (8.3). For
  `s = 2` the correlation structures of Layer 4 have `r* = 1`, the sunflower step is trivial
  (LSS, proof of Lemma 8.3), and Layers 3 and 6 recover the bracket-linear frequency `ξ_h` of
  Green–Tao's `U^3` theorem; the degree-2 nilsequences that arise include the Heisenberg
  nilcharacters (NilmanifoldsAndNilsequences, Worked examples).
- **Bracket polynomials.** The bracket cubic `e(a n [b n][c n])` is the model of a degree–rank
  `(3, 3)` term and `e(d n² [e n])` of a degree–rank `(3, 2)` term (LSS, §4.4); the degree–rank
  iteration of Layer 7 treats the first before the second.

## Downstream consumers

Quantitative Szemerédi-type theorems (the bound on sets without `k`-term progressions of Leng,
Sah and Sawhney, LSS Theorem 1.3) consume 8.3 and 2.2 together with GowersUniformityNorms 5. Counts
of linear patterns in the primes consume 8.4 through Green–Tao's transference. Neither is a target
here.

## Scope and ownership

This roadmap owns:

- Gowers-norm bookkeeping specific to intervals and cyclic groups: cube counts on `[N]`, the
  small-scale case, cutoffs, residue partitions, progressions to major arcs, and transfer between
  `ℤ/N` and `[N]` (Layer 0);
- the calculus of nilsequences and nilcharacters in several variables with explicit complexity:
  freezing, pullbacks (including additive-triple and block restrictions), splitting along downsets,
  nilcharacter embedding, equivalence, the symbol group and symbol calculus, multilinearisation
  (Layer 1);
- the converse inverse theorem, quantitatively, on `[N]` and `ℤ/N` (Layer 2);
- bracket-linear structure of Freiman homomorphisms on Bohr sets and of graphs with many additive
  quadruples, with rounding (Layer 3);
- correlation structures, Gowers' Cauchy–Schwarz argument and four-fold products, Taylor
  coefficients of bounded sequences, the sunflower and linearisation steps, universal nilmanifolds
  with marked generators and their relative quotients, extraction of the multidegree
  `(1, s − 1)` nilcharacter, symmetrisation, and the inverse theorems (Layers 4–8).

It does not own:

- **NilsequenceEquidistribution:** smooth and rational polynomial sequences, the `C^∞[N]` norm,
  the signed fractional part, the many-shifts lemma, the refined bracket polynomial lemma,
  efficient vertical expansions, factorisations from horizontal characters, the complexity of
  Leibman squares and of derivative sequences, quantitative Leibman equidistribution, Leng's
  equidistribution theorem, the factorisation along a central frequency (LSS, Theorem 5.4 and
  Corollary 5.5), the factorisation theorems, and their transfer to degree–rank and multidegree
  filtrations.
- **NilmanifoldsAndNilsequences:** nilmanifolds and Mal'cev presentations with complexity, metrics,
  Lipschitz functions and partitions of unity, polynomial sequences and horizontal Taylor
  coefficients, nilsequences, vertical frequencies, the vertical Fourier decomposition, existence of
  nilcharacters and the nilcharacter decomposition, and nilsequences on `ZMod N`.
- **PolynomialOrbitsAndCubeGroups:** the Leibman square `G ×_{G_2} G`, its filtration and the square
  of a polynomial sequence, cube nilmanifolds and their Haar measures, and qualitative
  equidistribution. Layer 2 consumes the Leibman square through NilsequenceEquidistribution 2.6.
- **NilpotentLieHeightsAndFiltrations:** height-bounded linear algebra, degree–rank and multidegree
  filtrations of Lie algebras, the free degree–rank and multidegree models, squarefree algebras and
  polarisation, coordinates of the second kind.
- **GowersUniformityNorms:** Gowers norms on measured abelian groups and on finite subsets, their
  inductive and derivative formulas, Fourier control of `U^2`, phase invariance and Freiman
  transport.
- **AlmostPeriodicityAndBohrSets:** Balog–Szemerédi–Gowers, Bohr sets, the quasi-polynomial
  Bogolyubov–Ruzsa lemma and progressions in Bohr sets.
- **ProbabilisticAndMetricNumberTheory §2.5a:** single-scale Weyl sums.
- **ScatteringDiagrams §0.4:** the BCH group of a nilpotent Lie algebra.
- **Mathlib:** Freiman homomorphisms, additive energy, Fourier series on the circle, Bertrand's
  postulate.

The following are outside this roadmap: inverse theorems on finite abelian groups other than cyclic
ones and on `𝔽_p^n` (Bergelson–Tao–Ziegler, Tao–Ziegler, Gowers–Milićević, Candela–Szegedy), on
multidimensional boxes `[N]^k`, and nilspace formulations; the ergodic structure theory of
Host–Kra and Ziegler.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib: `ZMod.val`, `Finset.range`, `Finset.expect` (notation `𝔼`), `round`,
`IsAddFreimanHom`, `IsAddFreimanIso`, `Finset.addEnergy`, `fourierCoeff`,
`Nat.exists_prime_lt_and_le_two_mul`, `Real.exp`, `Real.log`, `Complex.exp`, `starRingEnd`.

### From Tau Ceti

At the pinned Tau Ceti, in 3.1 only: `ZLattice.successiveMin`,
`ZLattice.exists_linearIndependent_gauge_eq_successiveMin` and
`ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`
(TauCeti/Algebra/Module/ZLattice/SuccessiveMinima.lean and
TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean), as used in
AlmostPeriodicityAndBohrSets 7.2.

### From TauCetiRoadmap.NilsequenceEquidistribution

Names of its `Suggested.lean`: `IsSmooth`, `IsRationalSeq`, `cInftyNorm`, `signedFract`,
`refined_bracket_polynomial` (1.2), `exists_horizontalCharacters_of_verticalFrequency` (3.1,
Leng's theorem; LSS, Theorem 5.2), `exists_factorization_of_verticalFrequency` (4.1; LSS,
Theorem 5.4 and Corollary 5.5), `exists_factorization` (4.3), `IsSmooth.mul`. Sections: 0.2 (the
many-shifts lemma), 1.2, 2.2 (smooth and rational sequences, periodicity of rational sequences),
2.4 (efficient vertical expansion), 2.5 (factorisations from horizontal characters), 2.6 (Leibman
squares with complexity, derivative sequences), 3.1, 4.1, 4.5 (transfer to degree–rank and
multidegree filtrations).

### From TauCetiRoadmap.NilmanifoldsAndNilsequences

Names of its `Suggested.lean`: `GroupFiltration`, `AddGroupFiltration`, `IsPolynomialMap`,
`weightedFiltration`, `multidegreeFiltration`, `MalcevPresentation`,
`MalcevPresentation.ComplexityLE`, `MalcevPresentation.nilDist`, `IsNilsequence`,
`HasVerticalFrequency`, `exists_verticalFrequency_decomposition`, `exists_nilcharacter`,
`IsCyclicNilsequence`. Sections: Conventions 2–4, 7, 9; 0.2–0.5 (polynomial maps, Taylor
expansions, horizontal Taylor coefficients); 1.2; 2.4–2.5 (Mal'cev presentations, constructions);
3.2–3.4 (metrics, Lipschitz functions, partitions of unity); 4.1–4.2 (coordinates, basepoint
normalisation); 5.1–5.4 (nilsequences, the nilsequence algebra, vertical Fourier decomposition,
nilcharacters); 6.1–6.3 (nilsequences on `ZMod N`).

### From TauCetiRoadmap.PolynomialOrbitsAndCubeGroups

0.4 (the Leibman square `G^□ = hkCube G_• Unit 1`, its filtration, `mem_hkCube_unit_iff`, the square
of a polynomial sequence) and 4.1 (the square nilmanifold, its lattice `Γ^□`, the quotient by
`Δ(G_s)` and the concatenated Mal'cev basis).

### From TauCetiRoadmap.NilpotentLieHeightsAndFiltrations

Names of its `Suggested.lean`: `DegreeRankLieFiltration`, `canonicalLayer`,
`exists_canonicalDegreeRank`, `IsAdapted`. Sections: 1.2–1.4 (kernels, complements, flag-adapted
bases), 4.2 (degree–rank filtrations), 5.3–5.4 (free multidegree and degree–rank models), 6.1–6.2
(squarefree algebra and polarisation), Layer 8 (coordinates of the second kind).

### From TauCetiRoadmap.GowersUniformityNorms

Names of its `Suggested.lean`: `DiscreteCube.conjPow`, `DiscreteCube.shift`, `mulDeriv`,
`gowersNorm`, `cubes`, `relGowersInner`, `relGowersNorm`, `relGowersNorm_freimanIso`,
`gowersNorm_two_pow_four_finite`, `gowersNorm_add_le`, `gowersNorm_mul_phase`. Sections: 3.2
(inductive formula, nesting, phase invariance), 4.1 (Fourier identity on finite groups), 6.1–6.3
(cubes, relative norms, derivative formula, Freiman invariance).

### From TauCetiRoadmap.AlmostPeriodicityAndBohrSets

Names of its `Suggested.lean`: `balog_szemeredi_gowers`, `BohrSet`, `BohrSet.chordSet`,
`bogolyubov_ruzsa`, `CosetProgression`. Sections: 3.4 (Balog–Szemerédi–Gowers for finite sets),
5.4 (abelian Bohr sets), 5.5 (quasi-polynomial Bogolyubov–Ruzsa), 7.1–7.2 (coset progressions,
progressions in Bohr sets).

### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheory

§2.5a: `weyl_sum_linear_inverse` and the geometric-sum bound in its proof, in 0.3.

### From TauCetiRoadmap.ScatteringDiagrams

§0.4: *BCHGroup* of a nilpotent Lie algebra over `ℝ`, for the universal groups of 7.1.

## Provenance

This roadmap was extracted from a Lean development of Hindman's finite sums-and-products
theorem, part of whose code is derived from openai/math (Apache-2.0, commit `adc7f124`). That
source works on `ZMod N` directly, with nilsequences evaluated at `ZMod.val` and complexity
tracked through logarithmic height budgets. This roadmap instead follows Leng–Sah–Sawhney on
`[N]`, derives the cyclic theorem by the transfer of Layer 0, isolates the nilcharacter calculus
of Green–Tao–Ziegler's Appendix E as a reusable layer with a symbol group, adds the converse
inverse theorem, and leaves equidistribution to NilsequenceEquidistribution. The source is not
prescriptive.

## References

- [LSS] J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds on the inverse theorem for the
  Gowers `U^{s+1}[N]`-norm*, arXiv:2402.17994 (v3): Definition 1.1, Theorems 1.2–1.3; Definitions
  2.15–2.16, 3.4–3.5, 3.14–3.16; Theorems 5.2, 5.4, Corollary 5.5; Definition 6.1, Lemmas 6.2–6.3,
  Theorem 6.4; Lemmas 7.1, 7.2, Definition 7.3, Lemmas 7.4, 7.5, Remark 7.6; Definition 8.1,
  Lemmas 8.2–8.3; Lemma 9.1; Definition 10.3, Lemma 10.4, Definition 10.7, Lemma 10.10; Lemma 11.3;
  Lemma 12.1; Appendix A (Lemmas A.1, A.2, A.4, A.6, Definitions A.3, A.5, A.7); Lemma B.5; Appendix C
  (Lemmas C.1–C.6).
- [GTZ] B. Green, T. Tao and T. Ziegler, *An inverse theorem for the Gowers `U^{s+1}[N]`-norm*,
  Ann. of Math. 176 (2012) 1231–1372, arXiv:1009.3998: Theorem 1.3, Proposition 5.6, Definitions
  6.1, 6.7, 6.19, 6.22, Example 6.11, Theorems 7.1, 7.4, Proposition 7.3, Definitions 9.1, 9.6, §12,
  Appendix E (Lemmas E.3, E.4, E.7, E.8, Corollary E.6, Theorem E.10).
- B. Green and T. Tao, *An inverse theorem for the Gowers `U^3(G)` norm*, Proc. Edinb. Math. Soc. 51
  (2008) 73–153: Propositions 10.5 and 10.8 (as cited in LSS, Lemma A.6).
- B. Green and T. Tao, *Linear equations in primes*, Ann. of Math. 171 (2010) 1753–1850: §11 (as
  cited in GTZ, Proposition 5.6).
- B. Green, T. Tao and T. Ziegler, *An inverse theorem for the Gowers `U^4`-norm*, Glasg. Math. J. 53
  (2011) 1–50 (as cited in LSS, Lemmas 7.1 and A.1).
- T. Sanders, *On the Bogolyubov–Ruzsa lemma*, Anal. PDE 5 (2012) 627–655 (the input to
  AlmostPeriodicityAndBohrSets 5.5).
- openai/math, Apache-2.0, commit `adc7f124` (Provenance).
