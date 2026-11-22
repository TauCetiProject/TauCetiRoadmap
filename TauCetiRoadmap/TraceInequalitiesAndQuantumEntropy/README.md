# Roadmap: Trace inequalities and quantum entropy

**Summary.** This roadmap builds the trace inequalities of matrix analysis and the convexity and
monotonicity theory of quantum relative entropy that rests on them, on Mathlib's functional
calculus of Hermitian matrices, on Tau Ceti's von Neumann entropy, relative entropy and partial
traces, on the operator convex functions and operator means of the roadmap
OperatorMonotoneFunctionsAndMatrixMeans, and on the log-majorization calculus of the roadmap
EigenvalueAndSingularValueInequalities:
- trace functions: monotonicity and convexity of the trace of a matrix function, Peierls's
  inequality on orthonormal bases, the generalized Klein inequality and its derivative form, the
  equality case of Klein's inequality, the Gibbs variational principle and the
  Peierls–Bogoliubov inequality;
- operator perspectives and joint convexity: the theorem that a function is operator convex
  exactly when its operator perspective is jointly convex, the perspective inequality for
  positive maps, the concavity theorems of Lieb and the convexity theorems of Ando in tensor and
  trace form, the Wigner–Yanase–Dyson skew information, and joint convexity and joint
  subadditivity of the relative entropy;
- data processing: invariance under isometries, additivity on tensor products, monotonicity of
  the relative entropy and of the Petz–Rényi quasi-entropies under quantum channels, contraction
  of the trace norm, the quantum Pinsker inequality, mutual information and Holevo's bound;
- purification and continuity: unitary equivalence of purifications, equal entropies of the
  two halves of a pure state, the Araki–Lieb triangle inequality, and the continuity bounds of
  Audenaert for the Shannon entropy and of Fannes and Audenaert for the von Neumann entropy;
- products of positive matrices: the complex calculus of compound matrices, the Cordes
  inequality, the Araki–Lieb–Thirring inequality and the Lieb–Thirring inequality.

The material is a multi-source synthesis: the quantum entropy theory of Watrous (2018,
Chapter 5), the trace and product inequalities of Bhatia (1997, Chapter IX), the Lieb and Ando
theorems in Simon's monograph on Loewner's theorem (2019, Chapters 38–41), the elementary trace
inequalities of Tropp (2015, Chapter 8), the entropy inequalities collected by Bengtsson and
Życzkowski (2017, Chapter 13), Gibbs states after Bratteli and Robinson (1997, §6.2.3) and
the divergence monotonicity of Hiai (2021, Chapters 2–4) (see [References](#references)).
Headlines that restate a source result carry a theorem, definition, section or equation locator
with its printed page in a text listed under References; corollaries and adaptations are derived
in the proof routes. The nearest roadmaps are
[OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md) (strong subadditivity and the
quantum spin entropy calculus), [RandomMatrices](../RandomMatrices/README.md) (Golden–Thompson and
the exponential form of Lieb's concavity), [CStarAlgebras](../CStarAlgebras/README.md)
(completely positive maps and their dilations),
[PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md) (compound matrices over
a commutative ring), and the two roadmaps named above.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the other headlines (bold or not) are
targets of the same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/Matrix/TraceInequalities/` for Layers 1, 2 and 5 and
`TauCeti/Analysis/Matrix/Entropy/` for Layers 3 and 4, with one file per subsection.

## How to read the build

Layer 1 is elementary: every statement reduces, through the spectral theorem, to a scalar
inequality weighted by the squared overlaps `|⟨uᵢ, vⱼ⟩|²` of two eigenbases, which Tau Ceti
already writes out for the trace of a product of two matrix functions. The equality case of
Klein's inequality and the Gibbs variational principle come from the same double sum.

Layer 2 is the engine. The operator perspective of an operator convex function is jointly convex;
applied to commuting arguments `A ⊗ 1` and `1 ⊗ B` it gives the tensor forms of the Lieb and Ando
theorems, and the identity `Tr (Kᴴ X K Y) = ⟨vec K, (X ⊗ Yᵀ) vec K⟩` turns them into trace forms.
Lieb's trace form at `K = 1` and exponents `(1 - ε, ε)`, divided by `ε`, converges to the relative
entropy, which is therefore jointly convex.

Layer 3 is data processing. A channel in Kraus form is a partial trace after an isometry, so its
monotonicity is isometric invariance plus the partial-trace monotonicity proved in
OperatorAlgebraDynamics, Section D9. Pinsker, mutual information and Holevo's bound are consequences
of monotonicity for well-chosen channels. Layer 4 needs purifications and the eigenvalue
perturbation bound of EigenvalueAndSingularValueInequalities. Layer 5 is independent of Layers 2–4:
the Cordes inequality, carried to compound matrices, gives a log-majorization of eigenvalues, and
the log-majorization transfer of EigenvalueAndSingularValueInequalities turns it into trace
inequalities.

The layers are in build order. Layer 5 may be built right after Layer 1, and Section 4.2 needs
only Layer 1 and Section 3.2.

## Conventions

- **Matrices.** Square matrices are `Matrix ι ι ℂ` over a finite index type with decidable
  equality; `Mat n` is `Matrix (Fin n) (Fin n) ℂ`, used where the statements of
  OperatorMonotoneFunctionsAndMatrixMeans quantify over every size. Bipartite matrices are indexed
  by `ι × κ`, and `⊗ₖ` is the Kronecker product. Empty index types are allowed; every trace over
  them is `0`.
- **Order.** The Loewner order of `open scoped MatrixOrder`: `A ≤ B` iff `(B - A).PosSemidef`.
- **Functional calculus.** A real function acts on a Hermitian matrix through `cfc f A`, with
  `Matrix.IsHermitian.cfc_eq` giving `U diag(f ∘ λ) Uᴴ`; on a non-Hermitian matrix `cfc f A = 0`,
  and every statement assumes Hermitian arguments. `Tr f(A)` in prose is `(cfc f A).trace.re`.
- **Powers.** `A^p` in prose is `cfc (fun x : ℝ ↦ x ^ p) A` with Lean's `rpow`: `A^0 = 1` also
  for singular `A`, and `0^p = 0` for `p ≠ 0`, so negative powers of a singular matrix are junk;
  every headline with a negative exponent assumes positive definite arguments. Watrous writes
  `P^0` for the projection onto the image of `P`; the headlines below hold in both conventions,
  and the Checks say where the values differ.
- **Logarithms and entropies.** Logarithms are natural, with `Real.log 0 = 0`. Watrous uses base
  `2`; his inequalities are converted (Pinsker's constant `1/(2 ln 2)` becomes `1/2`). The von
  Neumann entropy `Matrix.vonNeumannEntropy`, written `S(ρ)`, is `Tr (Real.negMulLog ρ)`, so
  `0 log 0 = 0`. The binary entropy is `Real.binEntropy`, in nats.
- **Relative entropy.** `Matrix.relativeEntropy`, written `D(ρ ‖ σ)`, is `Tr ρ (log ρ - log σ)`
  in `EReal` when the kernel of `σ` lies in the kernel of `ρ`, and `⊤` otherwise. It is never `⊥`.
  Convex combinations are written with real coefficients cast to `EReal`, where `0 * ⊤ = 0`; this
  is why the additivity and convexity headlines need no nonvanishing hypothesis.
- **States and channels.** A density matrix is positive semidefinite with trace `1`. A channel
  is given in Kraus form `X ↦ ∑ⱼ Kⱼ X Kⱼᴴ` with `∑ⱼ Kⱼᴴ Kⱼ = 1`; Choi's theorem that every
  completely positive trace-preserving map has this form is CStarAlgebras, Section 4.3, and is not
  needed for the statements here. The trace norm of a Hermitian `X` is `‖X‖₁ = Tr |X|`, written
  `(cfc (fun x : ℝ ↦ |x|) X).trace.re`.
- **Partial traces.** `Matrix.partialTraceRight` traces out the second factor and
  `Matrix.partialTraceLeft` the first; for `ρ` on `ι × κ`, `ρ_A = partialTraceRight ρ` and
  `ρ_B = partialTraceLeft ρ`.
- **Library and local definitions.** The entropy, the relative entropy and the partial traces are
  Tau Ceti's, imported from `TauCeti.Analysis.Matrix.Entropy`. `IsMatrixConvexOn`,
  `IsOperatorConvexOn`, `msqrt`, `misqrt` and `opMean` are those of
  OperatorMonotoneFunctionsAndMatrixMeans; `Suggested.lean` keeps verbatim local copies of them,
  each naming its owner.
- **Implementation namespace.** The Tau Ceti root namespace. The prototypes in `Suggested.lean` live
  in the roadmap's namespace.

## Layer 1: trace functions

### 1.1 Monotone and convex trace functions

- **Monotone trace functions** (`re_trace_cfc_le_of_le`): if `f` is monotone on `I` and `A ≤ B`
  are Hermitian with spectra in `I`, then `Tr f(A) ≤ Tr f(B)` (Tropp, Prop 8.3.3, p. 181).
- **Peierls's inequality** (`sum_le_re_trace_cfc`): if `f` is convex on `I` and `A` is Hermitian
  with spectrum in `I`, then `∑ᵢ f(⟨uᵢ, A uᵢ⟩) ≤ Tr f(A)` for every orthonormal basis `(uᵢ)`, given
  as the columns of a unitary `U` (Bhatia, Problem IX.8.14, p. 281; Bengtsson–Życzkowski, (13.11),
  p. 358).
- **Convex trace functions** (`convexOn_re_trace_cfc`): if `f` is convex on `I`, then
  `A ↦ Tr f(A)` is convex on Hermitian matrices with spectra in `I` (Bengtsson–Życzkowski,
  (13.24)–(13.25), p. 362).

*Proof route.* Monotone: `λ↓ᵢ(A) ≤ λ↓ᵢ(B)` by eigenvalue monotonicity (PolarDecomposition PD-A52)
and `Tr f(A) = ∑ᵢ f(λᵢ)` by Tau Ceti's `Matrix.IsHermitian.trace_cfc`; the sorted eigenvalues are
Mathlib's, antitone by `Matrix.IsHermitian.eigenvalues₀_antitone`. Peierls: with the eigenbasis
`(vⱼ)` of `A`, `⟨uᵢ, A uᵢ⟩ = ∑ⱼ |⟨uᵢ, vⱼ⟩|² λⱼ` is a convex combination, so scalar Jensen gives
`f(⟨uᵢ, A uᵢ⟩) ≤ ∑ⱼ |⟨uᵢ, vⱼ⟩|² f(λⱼ) = ⟨uᵢ, f(A) uᵢ⟩`; sum over `i`. Convexity: take `(uᵢ)` the
eigenbasis of `(1 - t)A + tB`, use scalar convexity on each `⟨uᵢ, ·uᵢ⟩`, and Peierls for `A` and
`B` (Bengtsson–Życzkowski's argument).

*Needs:* PolarDecomposition PD-A52; Tau Ceti's trace of the functional calculus.

**Checks.**

- `re_trace_cfc_le_of_le` needs monotone `f`: `A = diag(-2, 0) ≤ B = diag(-1, 0)` and `f(x) = x²`
  give `Tr A² = 4 > 1 = Tr B²`.
- `sum_le_re_trace_cfc` needs convex `f`: for `A = [[0, 1], [1, 0]]` in the standard basis,
  `f(x) = x²` gives `0 ≤ 2`, while `f(x) = -x²` gives `0 > -2`.

### 1.2 Klein-type inequalities

- **The generalized Klein inequality** (`re_trace_sum_cfc_mul_cfc_nonneg`): if
  `∑ᵢ fᵢ(a) gᵢ(h) ≥ 0` for all `a, h ∈ I`, then `Tr ∑ᵢ fᵢ(A) gᵢ(B) ≥ 0` for Hermitian `A`, `B` with
  spectra in `I` (Tropp, Prop 8.3.4, p. 182).
- **Klein's inequality with a derivative** (`re_trace_mul_cfc_deriv_le`): for `f` convex on `I`
  with derivative `f'` at every point of `I`, `Tr (f(A) - f(B)) ≥ Tr ((A - B) f'(B))` (Bhatia,
  Problem IX.8.13, (IX.64), p. 281).
- **The equality case of Klein's inequality** (`relativeEntropy_eq_iff`): for positive
  semidefinite `ρ`, `σ`, `D(ρ ‖ σ) = Tr ρ - Tr σ` iff `ρ = σ` (Bratteli–Robinson, Lemma 6.2.21,
  p. 268, for positive definite `σ`; Bengtsson–Życzkowski, (13.8), p. 358). Klein's inequality
  `Tr ρ - Tr σ ≤ D(ρ ‖ σ)` itself is Tau Ceti's.

*Proof route.* Generalized Klein: Tau Ceti's `Matrix.IsHermitian.re_trace_cfc_mul_cfc` writes each
term as `∑ⱼ,ₖ fᵢ(λⱼ) gᵢ(μₖ) |⟨uⱼ, vₖ⟩|²`; sum over `i`. Derivative form: the four pairs
`(f, 1)`, `(1, -f)`, `(-id, f')`, `(1, id · f')` satisfy the hypothesis by the supporting-line
inequality `f(a) ≥ f(h) + (a - h) f'(h)`, which holds for `a, h ∈ I` since `f` is convex on `I`
and differentiable at `h`. Equality case: if the kernel of `σ` is not inside that of `ρ`, the left
side is `⊤`. Otherwise the same double sum gives
`D(ρ ‖ σ) - Tr ρ + Tr σ = ∑ⱼ,ₖ |⟨uⱼ, vₖ⟩|² θ(λⱼ, μₖ)` with
`θ(a, b) = a log a - a log b - a + b ≥ 0`, where pairs with `μₖ = 0` carry weight zero unless
`λⱼ = 0` (the kernel condition), and `θ(a, b) = 0` only for `a = b` when `b > 0`. Vanishing forces
`ρ vₖ = μₖ vₖ` for every `k` (Bratteli–Robinson's argument).

*Needs:* Tau Ceti's trace of products of matrix functions and Klein's inequality.

**Checks.**

- The trace is essential: the operator inequality `A (log A - log B) ≥ A - B` fails for some
  positive definite `2 × 2` pairs (Bhatia, Problem IX.8.12, p. 281), while (IX.63) on the same page
  is the trace form `Tr A (log A - log B) ≥ Tr (A - B)`.
- `relativeEntropy_eq_iff` at a singular `ρ`: `ρ = diag(1, 0)`, `σ = 1` give
  `D(ρ ‖ σ) = 0 > -1 = Tr ρ - Tr σ`; and `D(0 ‖ σ) = 0 > -Tr σ` for every nonzero `σ`, so the
  equation singles out `ρ = σ` also when `ρ` vanishes.

### 1.3 Gibbs states

- **The Gibbs variational principle** (`re_trace_mul_add_vonNeumannEntropy_le`): for Hermitian
  `H` and a density matrix `ρ`, `Tr (ρ H) + S(ρ) ≤ log Tr e^H`, with equality iff
  `ρ = e^H / Tr e^H` (Bratteli–Robinson, Prop 6.2.22, pp. 268–269, with `H` there replaced by
  `-H`).
- **The Peierls–Bogoliubov inequality** (`peierls_bogoliubov`): for Hermitian `H`, `P`,
  `Tr (e^H P) / Tr e^H ≤ log Tr e^(H + P) - log Tr e^H` (Bratteli–Robinson, p. 278).

*Proof route.* Gibbs: `σ = e^H / Tr e^H` is positive definite with `log σ = H - log Tr e^H`, so
`D(ρ ‖ σ) = -S(ρ) - Tr (ρ H) + log Tr e^H`; Klein (Tau Ceti) and its equality case 1.2 at
`Tr ρ = Tr σ = 1` give both parts. Peierls–Bogoliubov: the principle for `H + P` at the Gibbs state
`ρ = e^H / Tr e^H` of `H`, where `Tr (ρ H) + S(ρ) = log Tr e^H`. With an empty index type both
sides are `0`.

*Needs:* 1.2; Tau Ceti's Klein inequality.

**Checks.**

- `re_trace_mul_add_vonNeumannEntropy_le` at `H = diag(0, log 2)`: the Gibbs state is
  `diag(1/3, 2/3)`, `Tr (ρ H) = (2/3) log 2` and `S(ρ) = log 3 - (2/3) log 2`, so the sum is
  `log 3 = log Tr e^H`.
- `peierls_bogoliubov` at `n = 1` is `p ≤ (h + p) - h`, an equality; the inequality is strict for
  noncommuting `2 × 2` pairs.

### Examples

- Peierls with `f = exp` and the standard basis gives `∑ᵢ e^(Aᵢᵢ) ≤ Tr e^A`; with `f(x) = x log x`
  it gives `S(ρ) ≤ H(diag ρ)`, the Shannon entropy of the diagonal.

### Dependencies

Mathlib's functional calculus; Tau Ceti's trace formulas and entropy definitions; PolarDecomposition
PD-A52.

## Layer 2: perspectives and joint convexity

### 2.1 Operator perspectives

- **The Effros–Ebadian–Nikoufar–Gharakhanlu theorem** (`isOperatorConvexOn_Ioi_iff_opMean`): `f` is
  operator convex on `(0, ∞)` iff its operator perspective
  `(C, D) ↦ D^(1/2) f(D^(-1/2) C D^(-1/2)) D^(1/2) = opMean f D C` is jointly convex on pairs of
  positive definite matrices of every size (Simon, Thm 39.1, p. 393).
- **Commuting perspectives.** For commuting positive definite `C`, `D`, `opMean f D C = D f(C D⁻¹)`
  (Tropp, Def 8.6.1 and (8.6.1), p. 194; Simon, Cor 39.2, p. 394, for the joint concavity of this
  form when `f` is operator concave).
- **The perspective under positive maps** (`opMean_map_le_map_opMean`): for `f` operator convex on
  `(0, ∞)`, a positive linear map `Φ : Mat n →ₗ[ℂ] Mat m` and positive definite `A`, `B` with
  `Φ A` positive definite, `opMean f (Φ A) (Φ B) ≤ Φ (opMean f A B)`. This is an adaptation; the
  trace form is the next bullet.
- **Monotonicity of the maximal `f`-divergence.** If moreover `Φ` preserves the trace,
  `Tr opMean f (Φ A) (Φ B) ≤ Tr opMean f A B` (Hiai, Thm 4.4 (i), p. 42, for the dual unital map;
  Hiai, (4.2), p. 41, and p. 42, identifies the maximal `f`-divergence with the trace of the
  operator perspective).

*Proof route.* EENG: Simon's proof, which is the Jensen operator inequality of
OperatorMonotoneFunctionsAndMatrixMeans (its Section 2.2) for the two matrices
`Kᵢ = (θᵢ Dᵢ)^(1/2) D^(-1/2)` with `θ₀ = 1 - t`, `θ₁ = t` and `D = θ₀ D₀ + θ₁ D₁`, which satisfy
`K₀ᴴ K₀ + K₁ᴴ K₁ = 1`; the converse is `D₀ = D₁ = 1`. Positive maps: with
`X = A^(-1/2) B A^(-1/2)` and
`Ψ(Y) = Φ(A)^(-1/2) Φ(A^(1/2) Y A^(1/2)) Φ(A)^(-1/2)`, `Ψ` is positive and unital,
`Ψ(X) = Φ(A)^(-1/2) Φ(B) Φ(A)^(-1/2)`, and the Choi–Davis–Jensen inequality of that roadmap (its
Section 2.3) on `I = (0, ∞)` gives `f(Ψ X) ≤ Ψ(f X)`; conjugate by `Φ(A)^(1/2)`. The same
substitution proves Ando's inequality for means there (its Section 5.4), with the opposite
direction for operator concave `f`. The trace form takes traces.

*Needs:* OperatorMonotoneFunctionsAndMatrixMeans, Sections 2.2, 2.3 and 5.1.

**Checks.**

- `opMean` at `n = 1` is `d f(c/d)`, the scalar perspective, so the EENG theorem at `n = 1` is the
  joint convexity of the scalar perspective of a convex function.
- The theorem is sharp in its hypothesis: `f(x) = x³` is convex but not operator convex on
  `(0, ∞)`, and random positive definite `2 × 2` quadruples violate the joint convexity of its
  perspective.

### 2.2 The concavity theorems of Lieb and the convexity theorems of Ando

- **Lieb, tensor form** (`kronecker_rpow_jointly_concave`): for `p, q ≥ 0` with `p + q ≤ 1`,
  `(A, B) ↦ A^p ⊗ B^q` is jointly concave on positive semidefinite matrices (Bhatia, Thm IX.6.3,
  p. 273, for `q = 1 - p`, and Ex IX.6.4, p. 274; Simon, Thm 38.3, p. 388).
- **Ando, tensor form** (`kronecker_rpow_jointly_convex`): for `α ∈ [-1, 0] ∪ [1, 2]`,
  `(A, B) ↦ A^α ⊗ B^(1 - α)` is jointly convex on positive definite matrices (Simon, Thm 40.1,
  p. 395, for `α ∈ [1, 2]`, and the Notes on p. 396 for `α ∈ [-1, 0]`).
- **Lieb, trace form** (`re_trace_lieb_jointly_concave`): for `p, q ≥ 0` with `p + q ≤ 1` and a
  rectangular `K`, `(A, B) ↦ Tr (Kᴴ A^p K B^q)` is jointly concave on positive semidefinite matrices
  (Bhatia, Thm IX.6.1, p. 271, for square `K` and `q = 1 - p`; Simon, Thm 38.2, p. 387, with the
  rectangular remark on p. 388).
- **Ando, trace form** (`re_trace_ando_jointly_convex`): for `α ∈ [-1, 0] ∪ [1, 2]`,
  `(A, B) ↦ Tr (Kᴴ A^α K B^(1 - α))` is jointly convex on positive definite matrices (Simon,
  Thm 40.1, p. 395, and Notes, p. 396, through (38.17), p. 388).
- **Hasegawa's divergences.** For `α ∈ [-1, 2] \ {0, 1}`,
  `(A, B) ↦ (Tr A^α B^(1 - α) - Tr A) / (α(α - 1))` is jointly convex on positive definite
  matrices (Simon, Notes, p. 396).

*Proof route.* Ando: the operator perspective of `t^α`, operator convex on `(0, ∞)` for these `α`
(OperatorMonotoneFunctionsAndMatrixMeans, Section 2.6), at the commuting pair `C = A ⊗ 1`,
`D = 1 ⊗ B` is `A^α ⊗ B^(1 - α)` by 2.1; joint convexity is the EENG theorem. Lieb with
`q = 1 - p`: the same with the operator convex `-t^p`, extended from positive definite to positive
semidefinite arguments by continuity of `rpow` for `p > 0` (`p = 0` is the concavity of `B^q`).
Lieb with `p + q = r < 1`: `A^p ⊗ B^q = (A^(p/r) ⊗ B^(q/r))^r` because the factors commute, and
`X ↦ X^r` is operator monotone and operator concave (Section 2.6 there), so the composition is
jointly concave (Bhatia's hint to Ex IX.6.4). Trace forms: `Tr (Kᴴ X K Y) = ⟨vec K, (X ⊗ Yᵀ) vec K⟩`
(Simon, (38.17), p. 388), with `vec K` a vector on `ι × κ`; transposition is linear and preserves
the Loewner order. Hasegawa: for `α ∈ (0, 1)` divide Lieb's trace form at `K = 1` by
`α(α - 1) < 0`; for the other `α` divide Ando's by `α(α - 1) > 0`; `-Tr A` is linear.

*Needs:* 2.1; OperatorMonotoneFunctionsAndMatrixMeans, Section 2.6.

**Checks.**

- `kronecker_rpow_jointly_concave` needs `p + q ≤ 1`: at `p = q = 1` and `1 × 1`, `(a, b) ↦ ab`
  is not concave: `(0, 0)` and `(2, 2)` average to `2` against `1 · 1 = 1` at the midpoint.
- `kronecker_rpow_jointly_convex` excludes `α ∈ (0, 1)`: at `α = 1/2` and `1 × 1`, `(1, 4)` and
  `(4, 1)` have values `2` and `2`, while the midpoint `(5/2, 5/2)` has value `5/2 > 2`.
- At `p = 0` Lean's `A^0 = 1` makes `kronecker_rpow_jointly_concave` the concavity of
  `B ↦ 1 ⊗ B^q`; with Watrous's projection convention the statement holds as well.

### 2.3 The Wigner–Yanase–Dyson skew information

- **Skew information** (`wignerYanaseDyson_nonneg_and_convexOn`): for `p ∈ [0, 1]` and Hermitian
  `K`, `Iₚ(ρ, K) = Tr (ρ K²) - Tr (ρ^p K ρ^(1 - p) K)` is nonnegative and convex in the positive
  semidefinite `ρ` (Bhatia, (IX.45)–(IX.46), p. 274, for the concavity of `-Iₚ`, written there
  as `Sₜ(A, K)`; Simon, Notes, p. 391). Nonnegativity is an adaptation, proved in the route.

*Proof route.* Convexity: the second term is Lieb's trace form at `A = B = ρ`, `q = 1 - p`,
restricted to the diagonal, hence concave; the first is linear. Nonnegativity: in the eigenbasis
of `ρ`, `Tr (ρ^p K ρ^(1 - p) K) = ∑ᵢ,ⱼ λᵢ^p λⱼ^(1 - p) |Kᵢⱼ|²`, and the weighted
arithmetic–geometric mean inequality with `|Kᵢⱼ| = |Kⱼᵢ|` bounds it by
`∑ᵢ,ⱼ (p λᵢ + (1 - p) λⱼ) |Kᵢⱼ|² = Tr (ρ K²)`.

*Needs:* 2.2.

**Checks.**

- At `p = 0` and `p = 1` the skew information is `0` in Lean's convention (`ρ^0 = 1`); with the
  projection convention it is `Tr (ρ K (1 - P) K)` at `p = 0`, so the two conventions differ there,
  and both are nonnegative and convex.

### 2.4 Joint convexity of the relative entropy

- **The relative entropy as a derivative** (`tendsto_relativeEntropy`): for positive semidefinite
  `ρ`, `σ`, `D(ρ ‖ σ) = lim_{ε ↓ 0} (Tr ρ - Tr ρ^(1 - ε) σ^ε) / ε` in `EReal`, including the value
  `⊤` (Watrous, Prop 5.28, p. 274, in base `2`).
- **Joint convexity** (`relativeEntropy_jointly_convex`): `D` is jointly convex on pairs of
  positive semidefinite matrices, in `EReal` (Watrous, Cor 5.33, p. 279; Simon, Cor 38.4, p. 389;
  Bhatia, Thm IX.6.5, p. 275).
- **Joint subadditivity** (`relativeEntropy_sum_le`):
  `D(∑ⱼ ρⱼ ‖ ∑ⱼ σⱼ) ≤ ∑ⱼ D(ρⱼ ‖ σⱼ)` for positive semidefinite `ρⱼ`, `σⱼ` (Watrous, Thm 5.32,
  p. 279).
- **Joint convexity of maximal `f`-divergences.** For `f` operator convex on `(0, ∞)`, the maximal
  `f`-divergence, the trace of the operator perspective of 2.1, is jointly convex and jointly
  subadditive on positive definite pairs (Hiai, Thm 4.4 (ii), p. 42, in von Neumann algebras); on
  matrices this is 2.1 after taking traces, with positive homogeneity of the perspective for
  subadditivity. The standard `f`-divergence of Hiai, Chapter 2, whose case `f(t) = t log t` is
  `D`, is a different quantity off the commuting case; its joint convexity is beyond this roadmap.

*Proof route.* Derivative: in eigenbases, `Tr ρ^(1 - ε) σ^ε = ∑ⱼ,ₖ |⟨uⱼ, vₖ⟩|² λⱼ^(1 - ε) μₖ^ε`;
the terms with `λⱼ μₖ > 0` have derivative `-λⱼ (log μₖ - log λⱼ)` at `ε = 0`, while terms with
`μₖ = 0 < λⱼ` drop out for `ε > 0` and contribute `λⱼ |⟨uⱼ, vₖ⟩|² / ε → ∞` exactly when the kernel
condition fails (Watrous's proof). Joint convexity: for each `ε ∈ (0, 1)` the quotient is jointly
convex by Lieb's trace form 2.2 at `K = 1`, `p = 1 - ε`, `q = ε`, and pointwise limits of convex
functions into `EReal` are convex. Subadditivity: joint convexity at `t = 1/2` with
`D(cρ ‖ cσ) = c D(ρ ‖ σ)` for `c > 0`, and induction on the number of terms.

*Needs:* 2.2.

**Checks.**

- `tendsto_relativeEntropy` at `ρ = diag(1, 0)`, `σ = diag(1/2, 1/2)`: the quotient is
  `(1 - 2^(-ε)) / ε → log 2 = D(ρ ‖ σ)`. With the roles exchanged the kernel condition fails, the
  quotient is `(1 - 2^(ε - 1)) / ε → ∞`, and `D = ⊤`.
- `relativeEntropy_jointly_convex` at `t = 1`: the right side is `0 * D(ρ₀ ‖ σ₀) + D(ρ₁ ‖ σ₁)`,
  which is `D(ρ₁ ‖ σ₁)` also when `D(ρ₀ ‖ σ₀) = ⊤`, by `0 * ⊤ = 0` in `EReal`.
- The maximal and the standard divergence differ: for `ρ = [[2, 1], [1, 1]]/3`,
  `σ = diag(1/4, 3/4)` and `f(t) = t log t`, the trace of the operator perspective is `0.6850`
  while `D(ρ ‖ σ) = 0.6388`; for `f(t) = t^(3/2)` they are `1.5248` and
  `Tr ρ^(3/2) σ^(-1/2) = 1.5031`.

### Dependencies

Layer 1; OperatorMonotoneFunctionsAndMatrixMeans, Sections 2.2, 2.3, 2.6 and 5.1.

## Layer 3: data processing

### 3.1 Isometries and tensor products

- **Isometric invariance** (`relativeEntropy_conj_isometry`): for `V` with `Vᴴ V = 1` and positive
  semidefinite `ρ`, `σ`, `D(V ρ Vᴴ ‖ V σ Vᴴ) = D(ρ ‖ σ)` and `S(V ρ Vᴴ) = S(ρ)` (Watrous,
  Prop 5.19, p. 268).
- **Additivity on Kronecker products** (`relativeEntropy_kronecker`): for positive semidefinite
  `ρᵢ`, `σᵢ`, `D(ρ₁ ⊗ ρ₂ ‖ σ₁ ⊗ σ₂) = Tr ρ₂ · D(ρ₁ ‖ σ₁) + Tr ρ₁ · D(ρ₂ ‖ σ₂)` (Watrous, Prop 5.21,
  p. 268, for nonzero `ρ₁`, `ρ₂`; the `EReal` statement needs no such hypothesis).

*Proof route.* Isometries: `cfc f (V X Vᴴ) = V (cfc f X) Vᴴ` for Hermitian `X` whenever `f(0) = 0`,
which holds for `Real.log` and `Real.negMulLog` in Lean; the kernel condition transports along
`V`. Kronecker: the eigenvalues of `ρ₁ ⊗ ρ₂` are the products `λⱼ μₖ`, and on the support
`log(λⱼ μₖ) = log λⱼ + log μₖ`; with `Matrix.trace_kronecker` this gives the formula when both
kernel conditions hold. If `ρ₁ = 0` both sides are `0`; if both `ρᵢ` are nonzero, the kernel
condition for the product holds iff it holds for both factors, and a `⊤` on either side matches a
`⊤` with a positive coefficient on the other.

*Needs:* Layer 1.

**Checks.**

- `relativeEntropy_kronecker` with a zero factor: `ρ₁ = 0`, `ρ₂ = diag(1, 0)`, `σ₂ = diag(0, 1)`
  give `0` on the left and `Tr ρ₂ · D(0 ‖ σ₁) + 0 · ⊤ = 0` on the right.

### 3.2 Monotonicity under channels

- **Data processing for the relative entropy** (`relativeEntropy_kraus_le`): for
  `∑ⱼ Kⱼᴴ Kⱼ = 1` and positive semidefinite `ρ`, `σ`,
  `D(∑ⱼ Kⱼ ρ Kⱼᴴ ‖ ∑ⱼ Kⱼ σ Kⱼᴴ) ≤ D(ρ ‖ σ)` (Watrous, Thm 5.35, p. 280).
- **Petz–Rényi quasi-entropies, `α ∈ [0, 1]`** (`re_trace_rpow_mul_rpow_le_kraus`):
  `Tr ρ^α σ^(1 - α)` does not decrease under a channel (Hiai, Thm 3.2 (8), p. 21, for
  `α ∈ [0, 2]` and unital Schwarz maps, of which the dual of a channel is one).
- **Petz–Rényi quasi-entropies, `α ∈ [1, 2]`** (`re_trace_rpow_mul_rpow_kraus_le`):
  `Tr ρ^α σ^(1 - α)` does not increase under a channel, for positive definite `σ` with positive
  definite image (Hiai, Thm 3.2 (8), p. 21).
- **Petz–Rényi divergences.** Hence `(α - 1)⁻¹ log Tr ρ^α σ^(1 - α)` does not increase under a
  channel for `α ∈ [0, 2] \ {1}`, for density matrices with `Tr ρ^α σ^(1 - α) > 0` when `α < 1`
  and, when `α > 1`, positive definite `σ` with positive definite image (Hiai, Def 3.1, (3.3),
  p. 19, and Thm 3.2 (8), p. 21). For `α ∈ (0, 1)` the positivity says `ρ σ ≠ 0`; without it the
  divergence is `+∞` in Hiai's definition, a value the real logarithm with `log 0 = 0` loses.
- **Contraction of the trace norm** (`re_trace_cfc_abs_map_le`): `‖Φ X‖₁ ≤ ‖X‖₁` for Hermitian `X`
  and every positive trace-preserving linear map `Φ` (Watrous, Cor 3.40 and the Remark after it,
  p. 168).

*Proof route.* Stinespring form: `V = ∑ⱼ Kⱼ ⊗ eⱼ`, a matrix from `ι` to `κ × Fin r`, is an
isometry by `∑ⱼ Kⱼᴴ Kⱼ = 1`, and `∑ⱼ Kⱼ X Kⱼᴴ = partialTraceRight (V X Vᴴ)`. Relative entropy:
3.1 for `V`, then monotonicity of `D` under the partial trace (OperatorAlgebraDynamics, Section
D9, including the support cases). Petz–Rényi: the same reduction; monotonicity of
`Q_α(ρ ‖ σ) = Tr ρ^α σ^(1 - α)` under the partial trace over `Fin r` follows from the joint
concavity (`α ≤ 1`, Lieb 2.2 at `K = 1`) or convexity (`α ≥ 1`, Ando 2.2) and unitary invariance:
averaging `(1 ⊗ W) X (1 ⊗ W)ᴴ` over the `r²` discrete Weyl operators `W` on `ℂ^r` gives
`partialTraceRight X ⊗ (1/r)` (the finite form of Simon, Prop 38.5, p. 389), and
`Q_α(ρ ⊗ (1/r) ‖ σ ⊗ (1/r)) = Q_α(ρ ‖ σ)`; for `α > 1` the singular `V σ Vᴴ` is first replaced by
`V σ Vᴴ + η (1 - V Vᴴ)` and `η ↓ 0` at the end, since Ando's theorem needs positive definite
arguments. Trace norm: `X = X₊ - X₋` with `‖X‖₁ = Tr X₊ + Tr X₋`;
`Φ X = Φ X₊ - Φ X₋` with both terms positive, and the trace norm of a difference of positive
matrices is at most the sum of their traces.

*Needs:* 2.2, 3.1; OperatorAlgebraDynamics, Section D9.

**Checks.**

- `re_trace_rpow_mul_rpow_le_kraus` at `α = 0` reads `Tr σ ≤ Tr Φ(σ)` in Lean's convention, an
  equality because the channel preserves the trace.
- The range of `α` is sharp: at `α = 3` random channels on `2 × 2` matrices increase
  `Tr ρ^3 σ^(-2)`.
- The Petz–Rényi divergences need `Tr ρ^α σ^(1 - α) > 0` for `α < 1`: at `α = 1/2`,
  `ρ = diag(1, 0)`, `σ = diag(0, 1)` and the channel with Kraus operators `e₁e₁ᴴ/√2`, `e₂e₁ᴴ/√2`,
  `e₂e₂ᴴ`, the trace is `0` before the channel, so the real formula gives `-2 log 0 = 0`, and
  `2^(-1/2)` after it, where the divergence is `log 2 > 0`.
- `re_trace_cfc_abs_map_le` needs only positivity, not complete positivity: the transpose is
  positive and trace-preserving and preserves the trace norm.

### 3.3 The quantum Pinsker inequality

- **Quantum Pinsker** (`sq_traceNorm_le_two_mul_relativeEntropy`): for density matrices `ρ`, `σ`,
  `‖ρ - σ‖₁² / 2 ≤ D(ρ ‖ σ)` (Watrous, Thm 5.38, p. 282, as `‖ρ - σ‖₁² / (2 ln 2)` in base `2`).

*Proof route.* Let `P` be the spectral projection of `ρ - σ` for `[0, ∞)`. The measurement
channel with Kraus operators `e₁ uᴴ` (`u` running over an orthonormal basis of the range of `P`)
and `e₂ wᴴ` (`w` over the range of `1 - P`) maps `ρ`, `σ` to `diag(p, 1 - p)`, `diag(q, 1 - q)` with
`2|p - q| = ‖ρ - σ‖₁`. Monotonicity 3.2 reduces to the classical Pinsker inequality on two points,
Tau Ceti's `TauCeti.etvDist_sq_le_two_mul_klDiv`, whose total variation is the `ℓ¹` distance;
the bridge is that the relative entropy of commuting diagonal matrices is the Kullback–Leibler
divergence of their diagonals, through Tau Ceti's finite formulas for that divergence.

*Needs:* 3.2; Tau Ceti's Pinsker inequality.

**Checks.**

- `sq_traceNorm_le_two_mul_relativeEntropy` at `ρ = diag(1, 0)`, `σ = diag(1/2, 1/2)`:
  `‖ρ - σ‖₁ = 1` and `1/2 ≤ log 2 ≈ 0.693`. The constant `1` in place of `1/2` would fail here.
- Near equality the constant is sharp: for `diag(1/2 + h, 1/2 - h)` against `diag(1/2, 1/2)` the
  ratio `D / (‖ρ - σ‖₁² / 2)` tends to `1` as `h → 0`.

### 3.4 Mutual information and Holevo's bound

- **Mutual information as a relative entropy** (`relativeEntropy_kronecker_partialTrace`): for a
  positive semidefinite `ρ` on `ι × κ`, `D(ρ ‖ ρ_A ⊗ ρ_B) = S(ρ_A) + S(ρ_B) - S(ρ)` (Watrous,
  (5.110), p. 270, for density matrices; the support inclusion and the partial-trace identities
  of the route do not use the trace).
- **Monotonicity of mutual information** (`mutualInformation_kraus_le`): the mutual information
  `I(A : B) = S(ρ_A) + S(ρ_B) - S(ρ)` does not increase under a channel `1 ⊗ Φ` on the second
  factor. This is an adaptation of Watrous, Cor 5.37, p. 282, which is the case of a partial
  trace.
- **Holevo's bound** (`holevo_bound`): for an ensemble of density matrices `ρₐ` with probabilities
  `pₐ` and a measurement `(M_b)` with `∑_b M_b = 1`, the classical mutual information of the joint
  law `q(a, b) = pₐ Tr (M_b ρₐ)` is at most the Holevo quantity
  `χ = S(∑ₐ pₐ ρₐ) - ∑ₐ pₐ S(ρₐ)` (Watrous, Thm 5.49, p. 299, with χ in the form (5.260), p. 297).
- `χ ≤ log card ι`, so a `d`-level system carries at most `log d` nats of accessible information
  (Watrous, (5.277) and Cor 5.50, p. 300); this is Tau Ceti's entropy bound `S ≤ log d` and the
  nonnegativity of entropy.

*Proof route.* Identity: `log(ρ_A ⊗ ρ_B) = log ρ_A ⊗ 1 + 1 ⊗ log ρ_B` on the support of
`ρ_A ⊗ ρ_B`, which contains that of `ρ` (Watrous, (5.108)–(5.109), p. 270), and partial traces
turn the traces into `S(ρ_A)` and `S(ρ_B)`. Monotonicity: apply 3.2 to the channel with Kraus
operators `1 ⊗ Kⱼ` at the pair `(ρ, ρ_A ⊗ ρ_B)`; its image is `(ρ', ρ'_A ⊗ ρ'_B)`, and the identity
on both sides. Holevo: the classical–quantum state `σ = ∑ₐ eₐeₐᴴ ⊗ pₐ ρₐ` has `χ = D(σ ‖ σ_A ⊗ σ_B)`
by the identity, and the measurement channel `Y ↦ ∑_b Tr (M_b Y) e_b e_bᴴ` on the second factor maps
it to the diagonal of `q`; 3.2 and the commuting case of the identity finish (Watrous's proof).

*Needs:* 3.2; Tau Ceti's subadditivity and entropy bounds.

**Checks.**

- `relativeEntropy_kronecker_partialTrace` at `ρ = 1/2` on `ℂ² ⊗ ℂ²`, of trace `2`: both sides are
  `-2 log 2`.
- `holevo_bound` for a single state (`k = 1`): the left side is `0` and `χ = 0`.
- For the two orthogonal pure states `diag(1, 0)`, `diag(0, 1)` with `p = (1/2, 1/2)` measured in
  the standard basis, both sides are `log 2`.

### Dependencies

Layers 1 and 2; OperatorAlgebraDynamics, Section D9; Tau Ceti's entropy, subadditivity and
Pinsker inequality.

## Layer 4: purification and continuity

### 4.1 Purifications

- **Purifications exist.** Every positive semidefinite `ρ` on `ι` is `partialTraceRight (u uᴴ)`
  for a vector `u` on `ι × ι`, namely `u = vec ρ^(1/2)` (Watrous, Thm 2.10 and Cor 2.11, p. 71).
- **Unitary equivalence of purifications** (`exists_unitary_of_partialTraceRight_eq`): vectors `u`,
  `v` on `ι × κ` with the same reduction on `ι` satisfy `v = (1 ⊗ U) u` for a unitary `U` on `κ`
  (Watrous, Thm 2.12, p. 72).
- **The two halves of a pure state** (`vonNeumannEntropy_partialTraceRight_vecMulVec`):
  `S(Tr_B u uᴴ) = S(Tr_A u uᴴ)` (Bengtsson–Życzkowski, (13.21), p. 361).
- **The Araki–Lieb inequality** (`abs_sub_vonNeumannEntropy_partialTrace_le`): for a density
  matrix `ρ` on `ι × κ`, `|S(ρ_A) - S(ρ_B)| ≤ S(ρ)` (Watrous, Thm 5.25, p. 271;
  Bengtsson–Życzkowski, (13.32), p. 363).

*Proof route.* Write `u = vec X` with `X : Matrix ι κ ℂ`; then `Tr_B u uᴴ = X Xᴴ` and
`Tr_A u uᴴ = (Xᴴ X)ᵀ`. Unitary equivalence: `X Xᴴ = Y Yᴴ` gives `Y = X U` from the polar
decompositions (PolarDecomposition), and `vec (X U) = (1 ⊗ Uᵀ) vec X`. Halves: `X Xᴴ` and `Xᴴ X`
have the same nonzero eigenvalues (Mathlib's `Matrix.charpoly_mul_comm` up to powers of
the variable), the transpose has the same spectrum, and `Real.negMulLog 0 = 0`. Araki–Lieb:
purify `ρ` on `ι × κ × μ`, apply Tau Ceti's subadditivity to the reduction on `κ × μ`, and replace
`S(ρ_{κμ})` by `S(ρ_ι)` and `S(ρ_μ)` by `S(ρ_{ικ})` with the halves statement (Watrous's proof);
the other inequality exchanges the factors.

*Needs:* PolarDecomposition; Tau Ceti's subadditivity.

**Checks.**

- `abs_sub_vonNeumannEntropy_partialTrace_le` needs trace `1`: for
  `ρ = 10 · (diag(1/2, 1/2) ⊗ diag(1, 0))` the left side is `|-10 log 5 + 10 log 10| ≈ 6.93` while
  `S(ρ) = -10 log 5 ≈ -16.09`; the entropy of an unnormalized matrix scales with an affine
  correction that the triangle inequality does not absorb.
- `exists_unitary_of_partialTraceRight_eq` for `u = e₁ ⊗ e₁` and `v = e₁ ⊗ e₂`: both reductions
  are `diag(1, 0)`, and the swap of `e₁`, `e₂` is the unitary.

### 4.2 Continuity bounds

- **Audenaert's bound for the Shannon entropy** (`abs_sub_shannon_le`): for probability vectors
  `p`, `q` on `n` points and `λ = ‖p - q‖₁ / 2`, `|H(p) - H(q)| ≤ λ log(n - 1) + h(λ)` with `h` the
  binary entropy (Watrous, Thm 5.14, p. 261, for `n ≥ 2`).
- **The Fannes–Audenaert inequality** (`abs_sub_vonNeumannEntropy_le`): for density matrices `ρ`,
  `σ` on `d` levels and `δ = ‖ρ - σ‖₁ / 2`, `|S(ρ) - S(σ)| ≤ δ log(d - 1) + h(δ)` (Watrous,
  Thm 5.26, p. 272, for `d ≥ 2`).

*Proof route.* Audenaert: Watrous's coupling proof, which splits `p - q` into disjointly supported
parts of mass `λ`. For `n = 1` both sides vanish in Lean (`log 0 = 0`, `λ = 0`), and for `n = 0`
there is no probability vector, so no size hypothesis is needed. Fannes–Audenaert (Watrous's proof,
pp. 273–274): the two-sided bound
`∑ₖ |λ↓ₖ(ρ) - λ↓ₖ(σ)| ≤ ‖ρ - σ‖₁ ≤ ∑ₖ |λ↓ₖ(ρ) - λ↑ₖ(σ)|` (Watrous, Lemma 5.27, p. 272, the
trace-norm case of the two-sided gauge bound of EigenvalueAndSingularValueInequalities, its
Section 3.3) gives `δ₀ ≤ δ ≤ δ₁` for the halved classical distances `δ₀` of the decreasing
eigenvalue vectors and `δ₁` of the decreasing against the increasing one. The classical bound holds
at `δ₀` and at `δ₁`, since the Shannon entropy does not see the order of the entries, and
`g(x) = x log(d - 1) + h(x)` is concave, so with `δ = (1 - a) δ₀ + a δ₁`,
`|S(ρ) - S(σ)| ≤ min(g(δ₀), g(δ₁)) ≤ g(δ)`. Monotonicity of `g` alone does not suffice: `g`
decreases on `[1 - 1/d, 1]`, with `g(1) = log(d - 1) < log d`.

*Needs:* EigenvalueAndSingularValueInequalities, Section 3.3.

**Checks.**

- `abs_sub_vonNeumannEntropy_le` is tight at `ρ = diag(1, 0)`, `σ = diag(1/2, 1/2)`: `δ = 1/2` and
  both sides are `log 2`. With the full trace norm `δ = 1` in place of half of it, the right side
  would be `0 + h(1) = 0 < log 2`.
- `abs_sub_shannon_le` is tight for `p = (1 - λ, λ/(n - 1), …, λ/(n - 1))` and `q = (1, 0, …, 0)`.

### Dependencies

Layer 3 for the trace norm; PolarDecomposition; EigenvalueAndSingularValueInequalities,
Section 3.3.

## Layer 5: products of positive matrices

### 5.1 Compound matrices over the complex numbers

The `k`-th compound `∧ᵏA` of a matrix, indexed by `k`-subsets with the `k × k` minors of `A` as
entries, its multiplicativity `∧ᵏ(AB) = ∧ᵏA ∧ᵏB` (Cauchy–Binet) and the unit rule `∧ᵏ 1 = 1` are
those of [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), Section 6.4,
over every commutative ring, consumed here over `ℂ`. What is special to `ℂ` is owned here.

- **The complex compound calculus.** For a complex `n × n` matrix `A` and `k ≤ n`,
  `∧ᵏ(Aᴴ) = (∧ᵏA)ᴴ`; `∧ᵏ` maps Hermitian, positive semidefinite and unitary matrices to matrices
  of the same kind; the eigenvalues of `∧ᵏA` are the products of `k` eigenvalues of `A` over
  `k`-subsets of indices (Bhatia, Section I.5, properties 1–5, p. 18, and the minor formula,
  p. 19); and `∧ᵏ(A^s) = (∧ᵏA)^s` for positive semidefinite `A`.

*Proof route.* Adjoints: the minor of `Aᴴ` on rows `S` and columns `T` is the conjugate of the
minor of `A` on rows `T` and columns `S`. The spectral statements follow from the multiplicativity
of Section 6.4 there and the unitary case applied to the spectral decomposition
`A = U diag(λ) Uᴴ`: `∧ᵏA = ∧ᵏU diag(∏_{i∈S} λᵢ) (∧ᵏU)ᴴ`. Powers: both sides are positive
semidefinite with the same spectral decomposition.

*Needs:* PadicMeasuresIwasawaAlgebras, Section 6.4; Mathlib's spectral theorem.

### 5.2 The Cordes inequality

- **Cordes** (`norm_rpow_mul_rpow_le`): `‖A^s B^s‖ ≤ ‖A B‖^s` in the operator norm, for positive
  semidefinite `A`, `B` and `s ∈ [0, 1]` (Bhatia, Thm IX.2.1, (IX.5), p. 255).
- **Spectral radius form.** `λ₁(A^s B^s) ≤ λ₁(A B)^s` for `s ∈ [0, 1]`, where `λ₁` is the largest
  eigenvalue, and `λ₁(A B)^t ≤ λ₁(A^t B^t)` for `t ≥ 1` (Bhatia, Thm IX.2.6, (IX.7), and Ex IX.2.7,
  (IX.8), p. 257).

*Proof route.* Cordes: the set of `s ∈ [0, 1]` where the inequality holds is closed and contains `0`
and `1`; if it contains `s` and `t` it contains `(s + t)/2`, by `‖X‖² = ‖Xᴴ X‖`, the equality of the
spectral radii of `XY` and `YX`, and the bound of the spectral radius by the norm (Bhatia's proof).
Spectral radius: `A B` has the eigenvalues of `B^(1/2) A B^(1/2)`, and Bhatia's chain of
implications from `λ₁(AB) ≤ 1` through `B ≤ A⁻¹` and the operator monotonicity of `t^s`
(OperatorMonotoneFunctionsAndMatrixMeans, Section 2.6), scaled.

*Needs:* Layer 1; OperatorMonotoneFunctionsAndMatrixMeans, Section 2.6.

**Checks.**

- `norm_rpow_mul_rpow_le` needs `s ≤ 1`: for the projections `A` onto `e₁` and `B` onto
  `(e₁ + e₂)/√2`, `A^s = A` and `B^s = B` for `s > 0` and `‖AB‖ = 1/√2`; at `s = 2` the claim
  `1/√2 ≤ 1/2` fails.
- At `s = 0` Lean's `A^0 = 1` gives `‖1‖ ≤ ‖AB‖^0 = 1`, true also for `AB = 0` by `0^0 = 1`.

### 5.3 The Araki–Lieb–Thirring and Lieb–Thirring inequalities

- **Araki's log-majorization.** For positive semidefinite `A`, `B` and `t ≥ 1`, the decreasing
  eigenvalues of `(B^(1/2) A B^(1/2))^t` are weakly log-majorized by those of `B^(t/2) A^t B^(t/2)`,
  in the sense of EigenvalueAndSingularValueInequalities, Section 1.1, with equal full products;
  for `t ∈ [0, 1]` the order is reversed (Bhatia, Thm IX.2.9, (IX.9)–(IX.10), p. 257, and the proof
  of Thm IX.2.10, p. 258).
- **Araki–Lieb–Thirring** (`araki_lieb_thirring`): for positive semidefinite `A`, `B`, `s ≥ 0` and
  `t ≥ 1`, `Tr (B^(1/2) A B^(1/2))^(st) ≤ Tr (B^(t/2) A^t B^(t/2))^s` (Bhatia, Ex IX.2.11, (IX.13),
  p. 258).
- **The reversed range.** For `t ∈ (0, 1]` the Araki–Lieb–Thirring inequality is reversed.
- **Lieb–Thirring** (`re_trace_mul_pow_le`): `Tr (AB)^m ≤ Tr A^m B^m` for positive semidefinite
  `A`, `B` and every natural `m` (Bhatia, Problem IX.8.1, (IX.62), p. 279).
- **The power family.** `Tr (A^k B^k)^m ≤ Tr (A^m B^m)^k` for positive semidefinite `A`, `B` and
  natural `m ≥ k ≥ 1` (Bhatia, Problem IX.8.1, (IX.61), p. 279).

*Proof route.* Log-majorization: the spectral radius form of 5.2 at `t ≥ 1` bounds the largest
eigenvalue; applied to the compounds `∧ᵏA`, `∧ᵏB` of 5.1, whose largest eigenvalue is the product of
the `k` largest, it bounds every prefix product (Bhatia's proof of Thm IX.2.9); at `k = n` both
sides are `det(A)^t det(B)^t`. Araki–Lieb–Thirring: the transfer to `φ`-sums of
EigenvalueAndSingularValueInequalities, Section 1.1, with `φ(x) = x^s`, which is monotone on
`[0, ∞)` with `φ ∘ exp` convex for `s ≥ 0`, at the full prefix; the reversal substitutes `A^t`,
`B^t` and `1/t` for `A`, `B` and `t`, with `s t` in place of `s`. The power family: (IX.13) for
`A^k`, `B^k` with `t = m/k` and `s = k`, and cyclicity. Lieb–Thirring:
`Tr (AB)^m = Tr (B^(1/2) A B^(1/2))^m` by cyclicity `Tr (XY)^m = Tr (YX)^m` with `X = B^(1/2)`,
`Y = A B^(1/2)`, and Araki–Lieb–Thirring at `s = 1`, `t = m` (`m = 0` is `Tr 1 ≤ Tr 1`).

*Needs:* 5.1, 5.2; EigenvalueAndSingularValueInequalities, Section 1.1.

**Checks.**

- `araki_lieb_thirring` for the projections of 5.2: `B^(1/2) A B^(1/2) = B^(t/2) A^t B^(t/2) = BAB`,
  with eigenvalues `1/2` and `0`, so the claim reads `(1/2)^(st) ≤ (1/2)^s`, true for `t ≥ 1` and
  false for `t = 1/2`, `s = 1` (`0.707 > 0.5`): the reversal below `t = 1` is real.
- `re_trace_mul_pow_le` for the same projections at `m = 2`: `Tr (AB)² = 1/4 ≤ 1/2 = Tr A² B²`.

### Dependencies

Layer 1; PadicMeasuresIwasawaAlgebras, Section 6.4; OperatorMonotoneFunctionsAndMatrixMeans
(Section 2.6) and EigenvalueAndSingularValueInequalities (Section 1.1).

## Worked examples

- **Qubit Gibbs states.** For `H = diag(0, log 2)` the Gibbs state is `diag(1/3, 2/3)` and
  `log Tr e^H = log 3`; any other density matrix `ρ` has `Tr (ρ H) + S(ρ) < log 3` by 1.3, and the
  gap is `D(ρ ‖ diag(1/3, 2/3))`.
- **Classical reduction.** For commuting `ρ = diag(p)`, `σ = diag(q)` every statement of Layers 2–4
  is its classical counterpart: `D` is the Kullback–Leibler divergence, joint convexity is the
  log-sum inequality, data processing under stochastic matrices is the classical one, and
  Fannes–Audenaert is Audenaert's bound.
- **Holevo for the BB84 states.** The four states `|0⟩`, `|1⟩`, `|+⟩`, `|−⟩` with equal weights have
  average `1/2`, so `χ = log 2`, and every measurement extracts at most `log 2` nats.

## Downstream consumers

- [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md), Section D9: its entropy
  calculus for an arbitrary reference and its mixture bounds can use the joint convexity and the
  data-processing inequality of Layers 2–3 for channels beyond partial traces.
- [Subfactors](../Subfactors/README.md), Section 2.6: the relative entropy of finite tracial
  inclusions specializes, on matrix algebras, to the relative entropy of Layer 3, and its
  monotonicity under conditional expectations is the data processing of 3.2 for the pinching
  channel.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **Trace functions.** Monotone and convex trace functions, Peierls's inequality, the generalized
   Klein inequality and its derivative form, the equality case of Klein's inequality, the Gibbs
   variational principle for matrices and the Peierls–Bogoliubov inequality.
2. **Perspectives and joint convexity.** The EENG characterization of operator convexity by joint
   convexity of the operator perspective, the commuting perspective, the perspective inequality
   for positive maps and the monotonicity of maximal `f`-divergences, Lieb's concavity and Ando's
   convexity in tensor and trace form with rectangular `K`, Hasegawa's divergences, the
   Wigner–Yanase–Dyson skew information, the derivative formula for `D`, and joint convexity and
   joint subadditivity of the relative entropy and of maximal `f`-divergences on matrices.
3. **Data processing.** Isometric invariance, additivity on Kronecker products, monotonicity of the
   relative entropy and of the Petz–Rényi quasi-entropies under channels in Kraus form,
   contraction of the trace norm under positive trace-preserving maps, the quantum Pinsker
   inequality, mutual information as a relative entropy and its monotonicity under local
   channels, Holevo's bound and `χ ≤ log d`.
4. **Purification and continuity.** Existence and unitary equivalence of purifications, equal
   entropies of the halves of a pure state, the Araki–Lieb inequality, Audenaert's bound and the
   Fannes–Audenaert inequality.
5. **Products of positive matrices.** The adjoint, positivity and spectral calculus of compound
   matrices over `ℂ`, the Cordes inequality and its spectral radius form, Araki's
   log-majorization, the Araki–Lieb–Thirring inequality and the Lieb–Thirring inequalities.

**Not owned here.**
- The von Neumann entropy, the relative entropy, partial traces, Klein's inequality, positivity of
  the relative entropy for equal traces, `0 ≤ S ≤ log d`, and subadditivity: Tau Ceti,
  `TauCeti/Analysis/Matrix/Entropy.lean` and `TauCeti/LinearAlgebra/Matrix/Trace/Partial.lean`,
  imported.
- Strong subadditivity, monotonicity of the relative entropy under partial traces including the
  support cases, the relative-entropy calculus for an arbitrary reference, entropy concavity and
  the mixture bounds, mean entropy and the infinite-volume variational principle:
  [OperatorAlgebraDynamics](../OperatorAlgebraDynamics/README.md), Section D9. Tau Ceti beyond the
  pin proves strong subadditivity, monotonicity under partial traces for positive definite pairs,
  the operator Jensen inequality for isometries, entropy concavity and the mixture bounds, and trace
  superadditivity `Tr f(A) + Tr f(B) ≤ Tr f(A + B)`; none of these is at the pin, and none is a
  target here.
- Golden–Thompson and the concavity of `A ↦ Tr exp(H + log A)`:
  [RandomMatrices](../RandomMatrices/README.md), Section 2.6. Lieb's concavity of 2.2 is the other
  theorem of Lieb's paper and is owned here.
- Completely positive maps and the Schwarz inequality, Stinespring dilation, Choi's criterion and
  Kraus decompositions: [CStarAlgebras](../CStarAlgebras/README.md), Sections 4.1–4.3. Here channels
  are given in Kraus form and the Stinespring isometry is the explicit matrix of 3.2; Tau Ceti
  beyond the pin has Kraus maps and Stinespring dilations.
- The relative entropy of finite tracial inclusions: [Subfactors](../Subfactors/README.md),
  Section 2.6.
- Operator monotone and operator convex functions, the Jensen and Choi–Davis–Jensen inequalities,
  the operator convex powers and `t log t`, and Kubo–Ando means with Ando's inequality:
  OperatorMonotoneFunctionsAndMatrixMeans, Layers 1, 2 and 5, consumed here.
- Weak log-majorization and its transfer to `φ`-sums, and the two-sided gauge bound of
  Lidskii–Mirsky type: EigenvalueAndSingularValueInequalities, Sections 1.1 and 3.3, consumed here.
  Its exterior powers (Section 2.4) are real, and it leaves exterior powers over `ℂ` beyond its
  scope.
- Compound matrices over a commutative ring, their multiplicativity and the unit rule:
  [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), Section 6.4, consumed
  in 5.1.
- Hölder's inequality for Schatten norms:
  [NoncommutativeIntegration](../NoncommutativeIntegration/README.md), Section 3.3.
- Eigenvalue monotonicity and the polar decomposition:
  [OperatorTheory/PolarDecomposition](../OperatorTheory/PolarDecomposition/README.md) (PD-A52).

## Exact supplier contracts

### From Mathlib

Paths are relative to `Mathlib/`.

- Functional calculus and spectra of Hermitian matrices: `Matrix.IsHermitian.cfc_eq`
  (`Analysis/Matrix/HermitianFunctionalCalculus.lean`); the sorted eigenvalues and
  `Matrix.IsHermitian.eigenvalues₀_antitone` (`Analysis/Matrix/Spectrum.lean`); the Loewner order
  (`Analysis/Matrix/Order.lean`); the operator norm under `open scoped Matrix.Norms.L2Operator`
  (`Analysis/CStarAlgebra/Matrix.lean`).
- Kronecker products and traces: `Matrix.trace_kronecker` (`LinearAlgebra/Matrix/Kronecker.lean`);
  unitaries `Matrix.unitaryGroup`; products in both orders `Matrix.charpoly_mul_comm`.
- Scalar functions: `Real.negMulLog` (`Analysis/SpecialFunctions/Log/NegMulLog.lean`) and
  `Real.binEntropy` (`Analysis/SpecialFunctions/BinaryEntropy.lean`).
- `CompletelyPositiveMap` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean`), the structure the
  Kraus-form statements specialize; this roadmap does not need it in its statements.

No trace-function, perspective or quantum-entropy inequality exists in Mathlib at the pin. This
roadmap defers to Mathlib's names when they land and does not wait for them.

### From Tau Ceti

Paths are relative to `TauCeti/`.

- Traces of the functional calculus: `Matrix.IsHermitian.trace_cfc` and the overlap formula
  `Matrix.IsHermitian.re_trace_cfc_mul_cfc` (`Analysis/Matrix/FunctionalCalculus.lean`).
- Classical Pinsker: `TauCeti.etvDist_sq_le_two_mul_klDiv`
  (`InformationTheory/KullbackLeibler/Pinsker.lean`), with the finite formulas for the
  Kullback–Leibler divergence in `InformationTheory/KullbackLeibler/Finite.lean`.
- Entropy and partial traces, imported from `TauCeti.Analysis.Matrix.Entropy`: the von Neumann
  entropy `Matrix.vonNeumannEntropy`, the relative entropy `Matrix.relativeEntropy`, Klein's
  inequality `Matrix.PosSemidef.re_trace_sub_trace_le_relativeEntropy`, positivity for equal
  traces `Matrix.PosSemidef.relativeEntropy_nonneg`, the bounds
  `Matrix.PosSemidef.vonNeumannEntropy_nonneg` and `Matrix.PosSemidef.vonNeumannEntropy_le_log_card`
  and subadditivity
  `Matrix.PosSemidef.vonNeumannEntropy_le_partialTraceRight_add_partialTraceLeft`
  (`Analysis/Matrix/Entropy.lean`), and the partial traces `Matrix.partialTraceRight`,
  `Matrix.partialTraceLeft` with their trace, Kronecker and positivity lemmas
  (`LinearAlgebra/Matrix/Trace/Partial.lean`).

### From other roadmaps

- **OperatorAlgebraDynamics, Section D9.** Monotonicity of the relative entropy under partial
  traces, with the support cases (used in 3.2); strong subadditivity is not used.
- **PolarDecomposition.** Eigenvalue monotonicity under the Loewner order (PD-A52), used in 1.1, and
  the polar decomposition, used in 4.1.
- **PadicMeasuresIwasawaAlgebras, Section 6.4.** The compound matrix, its multiplicativity and the
  unit rule, used over `ℂ` in 5.1 and 5.3.
- **OperatorMonotoneFunctionsAndMatrixMeans.** Section 1.1
  (`IsMatrixConvexOn`, `IsOperatorConvexOn`, local copies), Section 2.2 (the Jensen operator
  inequality, for 2.1), Section 2.3 (Choi–Davis–Jensen, for 2.1), Section 2.6 (the operator convex
  powers, `t log t` and the operator monotone powers, for 2.2 and 5.2) and Section 5.1 (`msqrt`,
  `misqrt`, `opMean`, local copies).
- **EigenvalueAndSingularValueInequalities.** Section 1.1 (weak log-majorization and its transfer
  to `φ`-sums, for 5.3) and Section 3.3 (the two-sided gauge bound, whose trace-norm case is used in
  4.2).

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Entanglement.** The Peres–Horodecki criterion, positive maps that are not completely positive
  (the transpose, Choi's map), entanglement witnesses and entanglement measures: a roadmap of its
  own on top of 3.2 and CStarAlgebras, Section 4.3.
- **Equality cases and recovery.** Equality in data processing and in strong subadditivity
  (Petz's recovery map, the structure theorem of Hayden, Jozsa, Petz and Winter), and the
  Fawzi–Renner approximate recovery bounds.
- **Sandwiched Rényi divergences and the von Neumann algebra theory.** The sandwiched divergences,
  their monotonicity for `α ≥ 1/2`, and Hiai's standard and maximal `f`-divergences on von Neumann
  algebras (Hiai, Chapters 2–4), with Uhlmann's monotonicity theorem.
- **Multivariate trace inequalities.** The Golden–Thompson refinements with the Lie product
  formula, the multivariate inequalities of Sutter, Berta and Tomamichel, and the Carlen–Lieb
  concavity of `Tr (Bᴴ A^p B)^(1/p)`; three-matrix Lieb–Thirring fails (Bhatia, Problem IX.8.3,
  p. 279).
- **Continuity of conditional entropies.** The Alicki–Fannes–Winter bounds for conditional entropy
  and mutual information.

## Prior formalization

Tau Ceti has, in its pinned source, the von Neumann entropy, the relative entropy in `EReal`,
partial traces, Klein's inequality, positivity and subadditivity of entropy; beyond the pin it
adds strong subadditivity, monotonicity of the relative entropy under partial traces for positive
definite pairs, the operator Jensen inequality for isometries, Kraus maps, Stinespring dilations
and trace superadditivity. Mathlib has completely positive maps on C⋆-algebras and the binary
entropy. No trace-function inequality of Layer 1 beyond the overlap formula, no perspective, Lieb
or Ando theorem, and no product inequality of Layer 5 exists in either library at the pin.

## References

The locators refer to these editions; page numbers are printed page numbers.

- I. Bengtsson and K. Życzkowski, *Geometry of Quantum States: An Introduction to Quantum
  Entanglement*, 2nd ed., Cambridge University Press, 2017. Chapter 13 (Klein's and Peierls's
  inequalities, (13.7)–(13.11), and the entropy inequalities (13.21)–(13.32)).
- R. Bhatia, *Matrix Analysis*, Graduate Texts in Mathematics 169, Springer, 1997. Section I.5
  (antisymmetric tensor powers), Sections IX.2 (products of positive matrices) and IX.6 (Lieb's
  and Ando's theorems), and Problems IX.8.
- O. Bratteli and D. W. Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*, 2nd ed.,
  Springer, 1997. Section 6.2 (Lemma 6.2.21, Prop 6.2.22, and the Peierls–Bogoliubov inequality
  on p. 278).
- F. Hiai, *Quantum f-Divergences in von Neumann Algebras*, Mathematical Physics Studies, Springer,
  2021. Definition 3.1, Theorem 3.2, Definition 4.1 and Theorem 4.4.
- B. Simon, *Loewner's Theorem on Monotone Matrix Functions*, Grundlehren der mathematischen
  Wissenschaften 354, Springer, 2019. Chapters 38–40 (Lieb concavity, the EENG theorem, Ando
  convexity).
- J. A. Tropp, *An Introduction to Matrix Concentration Inequalities*, Foundations and Trends in
  Machine Learning 8, 2015. Chapter 8 (trace functions and the matrix perspective). The locators
  use the numbering and printed pages of this journal edition, in which Proposition 8.3.4 on
  p. 182 is the generalized Klein inequality.
- J. Watrous, *The Theory of Quantum Information*, Cambridge University Press, 2018. Sections 2.1
  and 3.3 (purifications, the trace norm under channels) and Chapter 5 (quantum entropy).
