# Roadmap: operator monotone functions and matrix means

**Summary.** This roadmap builds the theory of matrix functions that respect the Loewner order, and
the operator means and norm inequalities that rest on it, on Mathlib's continuous functional
calculus of Hermitian matrices, its Loewner order and its C⋆-algebra order theory, on Tau Ceti's
Pick-function representation and geometric mean, and on the unitarily invariant seminorms of
[OperatorTheory/Majorization](../OperatorTheory/Majorization/README.md):
- operator monotone, convex and concave functions on intervals, with closure properties and the
  standard examples and counterexamples;
- the Jensen-type characterizations: Davis's compression criterion, the Jensen operator
  inequality, the Hansen–Pedersen contraction inequality, the Choi–Davis–Jensen inequality for
  positive unital maps, the equivalence of monotonicity and concavity for nonnegative functions on
  the half-line, and the Bendat–Sherman criterion;
- the differential theory: divided differences, the Daleckii–Krein formula and Loewner's
  criterion by positivity of Loewner matrices;
- Loewner's theorem in its integral and Pick forms, the integral representation on the
  half-line, and its transfer to unital C⋆-algebras;
- Kubo–Ando means: the representation theorem, transposes, the harmonic and arithmetic bounds,
  Ando's inequality for positive maps and joint concavity;
- the weighted geometric mean: its identities, determinant, the harmonic–geometric–arithmetic
  order with its equality case, and the block characterization;
- the geometry of the positive definite cone under the affine-invariant distance: invariance,
  the exponential metric increasing property, geodesics and lengths, the semiparallelogram law,
  completeness and barycenters;
- norm inequalities: Kittaneh's lemma, the matrix arithmetic–geometric mean inequality of Bhatia
  and Kittaneh with its product form `4‖AB‖ ≤ ‖(A + B)²‖`, and the Heinz inequality.

The material is the theory of Bhatia (1997, Chapters V and IX), Simon's monograph on Loewner's
theorem (2019), Zhan (2002, Chapters 1 and 4) and Horn–Johnson (1991, Section 6.6), with the
geometric layer drawn from Terras (2016) and Jost (1997) and the connection axioms checked against
Hiai (2021, Appendix D) (see [References](#references)). Headlines that restate a source result
carry a theorem, definition, section or equation locator with its printed page in a text listed
under References; corollaries and adaptations are derived in the proof routes.

`Suggested.lean` states, against the pinned Mathlib and Tau Ceti, the headlines below that carry
a Lean name, each with every conclusion the README attaches to it, and the definitions those
statements need. It is not an exhaustive acceptance test: the other headlines (bold or not) are
targets of the same standing, stated in prose with their locators or proof routes.

Suggested home: `TauCeti/Analysis/Matrix/OperatorMonotone/`, with one file per subsection.

## How to read the build

Layer 1 fixes the vocabulary and settles what fails: the square is convex but not monotone, the
cube is not convex on the half-line, and all counterexamples are explicit `2 × 2` matrices.
Layer 2 is the engine of the subject. A single dilation trick, which turns a family of contractions
into one unitary block matrix and then compresses, proves the Jensen operator inequality, Davis's
criterion and the Hansen–Pedersen inequality; from these come the Choi–Davis–Jensen inequality,
the equivalence of monotonicity and concavity on the half-line and the Bendat–Sherman criterion.
Layer 3 proves the Daleckii–Krein formula and turns monotonicity into the positivity of the
Loewner matrices, a finite-dimensional condition.

Layer 4 proves Loewner's theorem. The easy direction is a computation with the resolvent
`t ↦ t / (1 + λt)`, and the hard direction is Krein–Milman applied to the compact convex set of
normalized operator monotone functions on `(-1, 1)`, whose extreme points the Layer 2 and Layer 3
results identify. Tau Ceti's Nevanlinna representation turns the integral form into the Pick form,
and the half-line representation is the transfer of the integral form along a Möbius map.

Layers 5–7 are means and geometry. Layer 5 uses the half-line representation to prove the
Kubo–Ando theorem and Ando's inequality, Layer 6 specializes to the powers and recovers Tau Ceti's
geometric mean, and Layer 7 puts a metric on the positive definite cone in which `t ↦ A #ₜ B` is
the geodesic. Layer 8 is independent of Layers 4–7: it uses Layer 1 and Majorization only.

The layers are in build order with one exception: the operator convex range of the powers in 2.6
excludes `r < -1` through the second-order criterion of 3.2, so that one part of 2.6 waits for
Section 3.2. Layer 3 needs only Layer 1, and may be built before Layer 2; Layer 8 may be built
right after Layer 1; Layer 4 needs Layers 2 and 3.

## Conventions

- **Matrices.** `Mat n` is `Matrix (Fin n) (Fin n) ℂ`. Rectangular matrices are
  `Matrix (Fin m) (Fin n) ℂ`. Statements quantify over `n : ℕ`, so `n = 0` is always included;
  every inequality between `0 × 0` matrices holds.
- **Order.** The Loewner order of `open scoped MatrixOrder`: `A ≤ B` iff `(B - A).PosSemidef`
  (`Matrix.le_iff`). Nonnegative elements are the positive semidefinite matrices
  (`Matrix.nonneg_iff_posSemidef`), and strictly positive elements the positive definite ones
  (`Matrix.isStrictlyPositive_iff_posDef`).
- **Functional calculus.** A real function `f` acts on a Hermitian matrix through `cfc f A`
  (Mathlib's instance for Hermitian matrices, with `Matrix.IsHermitian.cfc_eq` giving
  `U diag(f ∘ λ) Uᴴ` for `U = hA.eigenvectorUnitary` and `λ = hA.eigenvalues`). The spectrum of a
  matrix is finite, so `cfc f A` is the spectral value for every `f`, with no continuity side
  condition. On a non-Hermitian matrix `cfc f A = 0`; every statement below assumes Hermitian
  arguments.
- **Spectral domains.** `spectrum ℝ A ⊆ I` replaces the phrase "eigenvalues in `I`". Interval
  hypotheses are `I.OrdConnected`; these are the intervals of any kind, open, closed, half-open,
  unbounded or degenerate.
- **Matrix and operator notions.** `IsMatrixMonotoneOn n f I` quantifies over Hermitian `n × n`
  matrices with spectra in `I`; `IsOperatorMonotoneOn f I` asks it for every `n`. Likewise
  `IsMatrixConvexOn n f I` and `IsOperatorConvexOn f I`, with `IsOperatorConcaveOn f I` defined as
  operator convexity of `-f`. The sources speak of "operator monotone" for all `n` and of "matrix
  monotone of order `n`" (Bhatia, Section V.1, p. 112; Horn–Johnson, Def 6.6.33, p. 536; Simon,
  Chapter 1, the class written there as `M_n(a, b)`).
- **Square roots and inverse square roots.** `msqrt A` is `cfc Real.sqrt A` and `misqrt A` is
  `cfc (fun x ↦ (√x)⁻¹) A`. They are meant for positive semidefinite, respectively positive
  definite, `A`. Lean's `0⁻¹ = 0` makes `misqrt` of a singular matrix the inverse square root on
  the range and `0` on the kernel; no headline uses that value.
- **Powers.** `A ^ t` in prose is `cfc (fun x : ℝ ↦ x ^ t) A`, with Lean's `rpow`. For `t = 0`
  this is the identity matrix also on singular `A` (`0 ^ 0 = 1`), which is the convention of the
  Heinz inequality.
- **Means.** `opMean f A B = A^(1/2) f(A^(-1/2) B A^(-1/2)) A^(1/2)` for positive definite `A`;
  `opMeanPSD f A B` is the limit of `opMean f (A + ε) (B + ε)` as `ε ↓ 0`. The weighted geometric
  mean is `wgm t A B`, written `A #ₜ B` in prose, and `A # B` is `A #ₜ B` at `t = 1/2`.
- **Distance.** `riemDist A B` is the Frobenius norm of `log(A^(-1/2) B A^(-1/2))`, written
  `δ(A, B)` in prose, and `frob` is the Frobenius norm written out entrywise.
- **Unitarily invariant seminorms.** A seminorm `N` on operators between finite-dimensional inner
  product spaces in the sense of Majorization Part B (MAJ-B01). For a matrix `M`, `N.mat M` is `N`
  applied to `Matrix.toEuclideanLin M`. In prose `‖M‖` stands for `N.mat M` for an arbitrary such
  `N`.
- **Implementation namespace.** The Tau Ceti root namespace. The prototypes in `Suggested.lean` live
  in the roadmap's namespace.

## Layer 1: the notions and the basic examples

### 1.1 Matrix and operator monotonicity and convexity

- `IsMatrixMonotoneOn n f I`: for Hermitian `A ≤ B` in `Mat n` with spectra in `I`,
  `cfc f A ≤ cfc f B`. `IsOperatorMonotoneOn f I`: for every `n` (Bhatia, Section V.1, p. 112;
  Horn–Johnson, Def 6.6.33, p. 536).
- `IsMatrixConvexOn n f I`: for Hermitian `A`, `B` in `Mat n` with spectra in `I` and
  `t ∈ [0, 1]`, `cfc f ((1 - t)A + tB) ≤ (1 - t) cfc f A + t cfc f B`. `IsOperatorConvexOn f I`:
  for every `n`; `IsOperatorConcaveOn f I`: `-f` is operator convex (Bhatia, Section V.1,
  p. 112; Horn–Johnson, Def 6.6.47, p. 544).
- Matrix monotonicity of order `n + 1` implies order `n`, by the direct sum with a fixed scalar
  `c ∈ I`, and likewise for convexity. Order `1` is scalar monotonicity and convexity on `I`.
- The cone properties: sums and nonnegative multiples of operator monotone (convex) functions on
  `I` are operator monotone (convex) on `I`; constants are both.
- **Composition** (`IsOperatorMonotoneOn.comp`): if `g` is operator monotone on `I` with
  `g(I) ⊆ J` and `f` is operator monotone on `J`, then `f ∘ g` is operator monotone on `I`.
- **Pointwise limits** (`isOperatorMonotoneOn_of_tendsto`): a pointwise limit on `I` of operator
  monotone functions on `I` is operator monotone on `I`.

*Proof route.* By `Matrix.IsHermitian.cfc_eq`, `cfc f A` depends only on the values of `f` on the
finite set `spectrum ℝ A`. For composition, `cfc (f ∘ g) A = cfc f (cfc g A)` (`cfc_comp`), and
`spectrum ℝ (cfc g A) = g '' spectrum ℝ A ⊆ J`. For limits, `cfc (F k) A → cfc f A` entrywise
because the spectrum is finite, and the positive semidefinite cone is closed. The direct-sum
step uses `Matrix.fromBlocks` with a `1 × 1` block `c`.

*Needs:* Mathlib's matrix functional calculus and Loewner order.

**Checks.**

- `IsMatrixMonotoneOn`: the identity is matrix monotone of every order on `ℝ`. Every `f` is
  matrix monotone of order `0` on every `I`, since `Mat 0` has a single element.
- `IsMatrixMonotoneOn`: `t ↦ t²` is matrix monotone of order `1` on `[0, ∞)` but not of order
  `2` (1.2). Order matters, and a definition that tested only diagonal matrices would accept it.
- `IsMatrixMonotoneOn`: `t ↦ -t` is not matrix monotone of order `1` on any interval with two
  points: `0 ≤ 1` but `-0 > -1`.
- `IsMatrixConvexOn`: `t ↦ t²` is matrix convex of every order on `ℝ` (1.2), and `t ↦ |t|` is
  convex at order `1` on `ℝ` but not at order `2` (1.2). The test at order `1` alone is too weak.
- `IsMatrixConvexOn`: the hypothesis `t ∈ [0, 1]` matters: for `f(t) = t²`, `A = 0`, `B = 1`
  (`1 × 1`) and `t = 2`, the left side `cfc f (2B) = 4` exceeds `(1 - 2) · 0 + 2 · 1 = 2`.
- `IsOperatorConcaveOn`: `Real.log` is operator concave on `(0, ∞)` (2.6), `t ↦ t²` is not operator
  concave on `[0, ∞)` (at order `1`, `(1/2)² = 1/4 < 1/2 = (0² + 1²)/2`), and a constant is both
  operator convex and operator concave.

### 1.2 The inverse and the first examples

- **`-1/t` and `1/t`** (`isOperatorMonotoneOn_neg_inv`): `t ↦ -t⁻¹` is operator monotone and
  `t ↦ t⁻¹` operator convex on `(0, ∞)` (Bhatia, Prop V.1.6, p. 114; Simon, Prop 2.2, p. 12).
- **Square** (`isOperatorConvexOn_sq_and_not_isMatrixMonotoneOn`): `t ↦ t²` is operator convex
  on `ℝ` and not matrix monotone of order `2` on `[0, ∞)` (Bhatia, Ex V.1.2 and Ex V.1.3,
  p. 113).
- **Cube and absolute value** (`not_isMatrixConvexOn_cube_abs`): `t ↦ t³` is not matrix convex of
  order `2` on `[0, ∞)`, and `t ↦ |t|` is not matrix convex of order `2` on `ℝ` (Bhatia,
  Ex V.1.4, p. 114, and Ex V.1.11, p. 116).
- **Exponential**: `exp` is not matrix monotone of order `2` on `ℝ` (Bhatia, Problem V.5.1,
  p. 147).
- The powers `t ↦ t^r`, `0 ≤ r ≤ 1`, are operator monotone on `[0, ∞)` (Bhatia, Thm V.1.9,
  p. 115; Simon, Thm 4.1, p. 33; Zhan, Thm 1.3, p. 5, as a special case of the representation).

*Proof route.* For `-1/t`: `A ≤ B` with `A` positive definite gives `B⁻¹ ≤ A⁻¹`
(`CStarAlgebra.inv_le_inv` on `Mat n` with the C⋆-algebra structure of the conventions), and
`cfc (fun x ↦ -x⁻¹) A = -A⁻¹`. For `1/t`: `CStarAlgebra.convexOn_ringInverse`. For the square,
`((A + B)/2)² ≤ (A² + B²)/2` is `0 ≤ ((A - B)/2)²`, and the general weight is the same
computation. The powers transfer `CFC.monotone_rpow` along `cfc (fun x ↦ x ^ r) A = A ^ r` for
positive semidefinite `A`. The counterexamples are the matrices in the Checks below.

*Needs:* 1.1; Mathlib's C⋆-algebra order lemmas.

**Checks.**

- Square: `A = [[1, 1], [1, 1]]`, `B = [[2, 1], [1, 1]]`. Both are positive semidefinite (`A` has
  eigenvalues `0`, `2`; `B` has determinant `1` and trace `3`), and `B - A = diag(1, 0) ≥ 0`. But
  `B² - A² = [[3, 1], [1, 0]]` has determinant `-1`, so `A² ≰ B²`.
- Cube: `A = [[1, 1], [1, 1]]`, `B = [[3, 1], [1, 1]]`, `t = 1/2`. Then `A³ = [[4, 4], [4, 4]]`,
  `B³ = [[34, 14], [14, 6]]`, `((A + B)/2)³ = [[13, 8], [8, 5]]`, and
  `(A³ + B³)/2 - ((A + B)/2)³ = [[6, 1], [1, 0]]`, of determinant `-1`.
- Absolute value: `A = [[2, 2], [2, 2]]`, `B = diag(0, -2)`, `t = 1/2`. Then `|A| = A`,
  `|B| = diag(0, 2)`, `(|A| + |B|)/2 = [[1, 1], [1, 2]]`, while `(A + B)/2 = [[1, 1], [1, 0]]` has
  `|(A + B)/2| = [[3, 1], [1, 2]]/√5`. The difference has determinant `≈ -0.683` (eigenvalues
  `≈ -0.529` and `1.293`).
- Exponential: the matrices of the square check give `e^B - e^A` with determinant `≈ -1.190`
  (eigenvalues `≈ -0.171` and `6.956`).
- `-1/t` at order `1` is the scalar statement `a ≤ b ⇒ -1/a ≤ -1/b` for `0 < a`; the function
  `1/t` itself is antitone, so it is not operator monotone (a negative control for the sign).

### Examples

- On commuting arguments every scalar monotone `f` is monotone: for diagonal `A ≤ B`,
  `cfc f A ≤ cfc f B` entrywise. The square check shows that commutation is the obstruction.
- Composition of `t ↦ t^(1/2)` with itself gives operator monotonicity of `t ↦ t^(1/4)` on
  `[0, ∞)`.

### Dependencies

Mathlib only.

## Layer 2: Jensen-type characterizations

The dilation step common to this layer: a family `K₁, …, Kₖ` of `m × n` matrices with
`∑ Kⱼᴴ Kⱼ = 1` defines an isometry `V` from `ℂⁿ` to `(ℂᵐ)ᵏ`, and an isometry completes to a
unitary on the direct sum `(ℂᵐ)ᵏ ⊕ ℂⁿ` (Simon, Prop 11.4, p. 120). Compressing a block-diagonal
matrix by that unitary produces `∑ Kⱼᴴ Aⱼ Kⱼ` in a corner.

### 2.1 Davis's isometry criterion

- **Davis's criterion** (`isOperatorConvexOn_iff_isometry`): on an interval `I`, `f` is operator
  convex iff `cfc f (Vᴴ A V) ≤ Vᴴ cfc f A V` for every isometry `V : Matrix (Fin m) (Fin n) ℂ`
  (`Vᴴ V = 1`) and every Hermitian `A` with spectrum in `I` (Bhatia, Ex V.2.2, p. 118; Simon,
  Thm 11.1, (a) ⇔ (c), p. 117).
- Equivalently, for every orthogonal projection `P` and Hermitian `A` with spectrum in `I`, the
  compression of `cfc f A` to the range of `P` dominates `f` of the compression (Bhatia, Ex V.2.2,
  p. 118; Simon, Thm 11.1 (d), pp. 117–118).

*Proof route.* Convex ⇒ isometry: complete `V` to a unitary `U = [[V, W]]`, and use the two
unitaries `U` and `U · diag(1, -1)`: the average of the two conjugates of `A` is the pinching,
whose top-left block is `Vᴴ A V` (Bhatia, Thm V.2.1, p. 117). Operator convexity and
`cfc f (Uᴴ A U) = Uᴴ cfc f A U` give the inequality in the corner. Isometry ⇒ convex: for
`A`, `B` with spectra in `I` and `t ∈ [0, 1]`, compress `diag(A, B)` by the isometry
`[[√(1 - t) · 1], [√t · 1]]`. The spectrum of `Vᴴ A V` lies in the convex hull of the spectrum of
`A`, hence in `I`; this is where `I.OrdConnected` is used.

*Needs:* 1.1; Mathlib's `Matrix.unitaryGroup` and `Matrix.fromBlocks`.

### 2.2 The Jensen operator inequality and the Hansen–Pedersen inequality

- **The Jensen operator inequality** (`cfc_sum_conjTranspose_mul_le`): if `f` is operator convex
  on an interval `I`, `∑ⱼ Kⱼᴴ Kⱼ = 1` and the Hermitian `Aⱼ` have spectra in `I`, then
  `cfc f (∑ Kⱼᴴ Aⱼ Kⱼ) ≤ ∑ Kⱼᴴ cfc f (Aⱼ) Kⱼ` (Simon, Thm 11.1, (a) ⇔ (b), p. 117; Bhatia,
  Thm V.2.3 (iii), p. 119).
- **The Hansen–Pedersen contraction inequality** (`cfc_conjTranspose_mul_le_of_contraction`): if
  `0 ∈ I`, `f` is operator convex on `I` with `f(0) ≤ 0`, and `Kᴴ K ≤ 1`, then
  `cfc f (Kᴴ A K) ≤ Kᴴ cfc f A K` for Hermitian `A` with spectrum in `I` (Bhatia, Thm V.2.3,
  (i) ⇒ (ii), p. 119; Simon, Thm 11.5, p. 121).
- The converse: if the contraction inequality holds for every contraction, then `f` is operator
  convex and `f(0) ≤ 0` (Bhatia, Thm V.2.3, (ii) ⇒ (i), p. 119; take `K = 0` for the sign).

*Proof route.* Jensen: the isometry `V = (K₁, …, Kₖ)` and Davis's criterion applied to
`diag(A₁, …, Aₖ)`. Contraction: the completing block `(1 - Kᴴ K)^(1/2)` is `n × n` while `K` is
`m × n`, so pad both to `(m + n) × n`: `K₁ = [[K], [0]]` with `A₁ = diag(A, 0)` in `Mat (m + n)`,
and `K₂ = [[0], [(1 - Kᴴ K)^(1/2)]]` with `A₂ = 0`. Then `K₁ᴴ K₁ + K₂ᴴ K₂ = 1`, the spectra of
`A₁` and `A₂` lie in `spectrum ℝ A ∪ {0} ⊆ I` (here `0 ∈ I` is used), `K₁ᴴ A₁ K₁ = Kᴴ A K` and
`K₁ᴴ cfc f (A₁) K₁ = Kᴴ cfc f (A) K` because the padded rows of `K₁` vanish. The Jensen inequality
for this family gives `cfc f (Kᴴ A K) ≤ Kᴴ cfc f (A) K + f(0) K₂ᴴ K₂`, and the last term is
`≤ 0` (Simon's argument on p. 122).

*Needs:* 2.1.

### 2.3 The Choi–Davis–Jensen inequality

- **Choi–Davis–Jensen** (`cfc_map_le_map_cfc`): for a positive unital linear map
  `Φ : Mat n →ₗ[ℂ] Mat m` and `f` operator convex on an interval `I`,
  `cfc f (Φ A) ≤ Φ (cfc f A)` for every Hermitian `A` with spectrum in `I` (Zhan, Thm 1.7, p. 7,
  for `I = [0, ∞)`; the general interval is an adaptation).
- The two classical special cases, `Φ(A)² ≤ Φ(A²)` and `Φ(A)⁻¹ ≤ Φ(A⁻¹)` for positive definite
  `A` (Zhan, Lemma 1.5, p. 6), and `Φ(A^r) ≤ Φ(A)^r` for `0 < r ≤ 1` (Zhan, Cor 1.8, p. 7).

*Proof route.* Write `A = ∑ₖ λₖ Pₖ` with the spectral projections `Pₖ` of `A` (Mathlib's spectral
theorem for Hermitian matrices). The `Qₖ = Φ(Pₖ)` are positive semidefinite with `∑ Qₖ = Φ(1) = 1`.
Put `Kₖ = Qₖ^(1/2)`, so `∑ Kₖᴴ Kₖ = 1` and `Φ(A) = ∑ Kₖᴴ (λₖ · 1) Kₖ`,
`Φ(cfc f A) = ∑ Kₖᴴ (f(λₖ) · 1) Kₖ`. The Jensen operator inequality 2.2 with `Aₖ = λₖ · 1` is the
claim. No complete positivity is needed: the positive map is only evaluated on a commuting family.
`Φ(A)` has spectrum in `[min λ, max λ] ⊆ I`.

*Needs:* 2.2; Mathlib's `Matrix.IsHermitian.spectral_theorem`.

### 2.4 Monotone versus concave on the half-line

- **Monotone iff concave** (`isOperatorMonotoneOn_Ici_iff_isOperatorConcaveOn`): a continuous
  `f : [0, ∞) → [0, ∞)` is operator monotone on `[0, ∞)` iff it is operator concave there
  (Bhatia, Thm V.2.5, p. 120; Simon, Thm 10.2, p. 108, and Thm 10.8, p. 110, on `(0, ∞)`).
- An operator monotone function on `[0, ∞)` with values in `[0, ∞)` satisfies
  `f(K A Kᴴ) ≥ K f(A) Kᴴ` for every contraction `K` and positive semidefinite `A` (Bhatia,
  Thm V.2.5, proof, p. 120).

*Proof route.* Monotone ⇒ concave (Bhatia's argument): for a contraction `K`, complete it to a
unitary `U` with top-left block `K` and put `T = diag(A, 0)`. For every `ε > 0` there is `μ` with
`UᴴTU ≤ diag(KᴴAK + ε, μ)`, by the `2 × 2` block lemma. Monotonicity gives
`Uᴴ f(T) U ≤ diag(f(KᴴAK + ε), f(μ))`, whose corner reads
`Kᴴ f(A) K + Lᴴ f(0) L ≤ f(KᴴAK + ε)`; drop `f(0) ≥ 0` and let `ε → 0` by continuity. This is
`f(KᴴAK) ≥ Kᴴ f(A) K`, the Hansen–Pedersen condition 2.2 for `-f`, with `-f(0) ≤ 0`. The
converse: for `0 ≤ A ≤ B` and `0 < λ < 1`, write `λB = λA + (1 - λ)(λ/(1 - λ))(B - A)` and use
concavity with `f ≥ 0` to get `f(λB) ≥ λ f(A)`, then let `λ → 1` with continuity.

*Needs:* 2.2.

### 2.5 The Bendat–Sherman criterion

- **Bendat–Sherman** (`isOperatorConvexOn_Ici_iff`): for continuous `f` on `[0, ∞)`, `f` is
  operator convex on `[0, ∞)` with `f(0) ≤ 0` iff `t ↦ f(t)/t` is operator monotone on `(0, ∞)`
  (Bhatia, Thm V.2.9, p. 122; Simon, Thm 9.9, p. 99, for `C¹` functions with `f(0+) = 0`).

*Proof route.* (⇒) For `0 < A ≤ B`, `K = B^(-1/2) A^(1/2)` is a contraction, as
`KᴴK = A^(1/2) B⁻¹ A^(1/2) ≤ 1`, and Hansen–Pedersen 2.2 gives
`f(A) ≤ A^(1/2) B^(-1/2) f(B) B^(-1/2) A^(1/2)`, that is `A⁻¹ f(A) ≤ B⁻¹ f(B)` after conjugation,
and these are `g(A)`, `g(B)` for `g(t) = f(t)/t`. (⇐) Bhatia's argument through the projection
criterion of 2.1: with `P + ε` in place of the projection `P` and
`A^(1/2)(P + ε)A^(1/2) ≤ (1 + ε)A`, monotonicity of `g` and `ε → 0` give `P f(PAP) ≤ P f(A) P`.

*Needs:* 2.1, 2.2.

### 2.6 Powers and logarithms

- **The powers** (`isOperatorMonotoneOn_rpow_iff`): on `(0, ∞)`, `t ↦ t^r` is operator monotone
  iff `0 ≤ r ≤ 1` (Bhatia, Thm V.2.10, p. 123; Simon, Thm 4.1, p. 33), and operator convex iff
  `-1 ≤ r ≤ 0` or `1 ≤ r ≤ 2` (Bhatia, Ex V.2.11, p. 123, and Problem V.5.4, p. 147).
- **Logarithm and entropy** (`isOperatorMonotoneOn_log`): `log` is operator monotone and operator
  concave on `(0, ∞)` (Simon, Thm 4.1, p. 33), and `t ↦ t log t` is operator convex on `[0, ∞)`
  (Bhatia, Ex V.2.13, p. 123, for `-t log t` on `(0, ∞)`).

*Proof route.* Monotone range: `CFC.monotone_rpow` for `r ∈ [0, 1]`; for `r > 1` the scalar `t^r`
is not concave, and for `r < 0` it is decreasing, so 2.4 excludes both (Bhatia's argument). Convex
range: for `r ∈ [1, 2]` apply 2.5 to `f = t^r` (continuous at `0`, `f(0) = 0`) with
`f(t)/t = t^(r-1)` monotone; for `r ∈ [-1, 0]` compose the operator convex, antitone `t⁻¹` with
the operator monotone, operator concave `t^(-r)` (Bhatia, Cor V.2.6, p. 121); `r ∈ (0, 1)` gives
a strictly concave scalar function, `r > 2` fails 2.5 as `t^(r-1)` is not operator monotone, and
`r < -1` fails by the second-order criterion of 3.2 (Horn–Johnson, Thm 6.6.52, p. 547), as in
Bhatia, Problem V.5.4, p. 147; random `2 × 2` pairs already exhibit the failure for
`r = -3/2, -2, -3`. Logarithm: `CFC.log_monotoneOn` and
`CFC.concaveOn_log` transfer as for the powers; `t log t` is the case `f(t) = t log t`,
`f(t)/t = log t` of 2.5 on `(0, ∞)` extended to `[0, ∞)` by continuity at `0`.

*Needs:* 2.4, 2.5, 3.2.

**Checks.**

- Davis's criterion fails for the cube on `ℝ`: `A = -[[1, 1], [1, 1]]`, `V = e₁`. Then
  `Vᴴ A V = -1` and `f(-1) = -1`, while `A³ = 4A` gives `Vᴴ A³ V = -4`, and `-1 ≰ -4`.
- Hansen–Pedersen needs `f(0) ≤ 0`: `f = 1` is operator convex on `ℝ`, but `K = 0` gives
  `f(0) = 1 ≰ 0 = Kᴴ f(A) K`.
- Jensen needs `∑ Kⱼᴴ Kⱼ = 1` and not only `≤ 1`: with `f = 1`, `k = 1`, `K₁ = 0` the left side is
  `1` and the right side `0`.
- Choi–Davis–Jensen needs a unital map: `Φ(X) = 2X` on `Mat 1` and `f(t) = t²` give `4a²` on the
  left and `2a²` on the right.
- Monotone iff concave needs `f ≥ 0`: `f(t) = -t²` is operator concave on `[0, ∞)` (1.2) but
  decreasing.
- Bendat–Sherman needs `f(0) ≤ 0`: `f = 1` is operator convex, but `f(t)/t = 1/t` is antitone; for
  `f(t) = t²`, `f(t)/t = t` is monotone and `t²` is convex with `f(0) = 0`.
- Power ranges at the boundary: `r = 2` is operator convex and `t ↦ t²/t = t` is monotone;
  `r = 3` is not convex (the cube check of 1.2), and `t²` is not monotone (1.2).

### Examples

- The harmonic-type function `t ↦ t/(1 + t)` is operator monotone and operator concave on
  `[0, ∞)`: it is `1 - (1 + t)⁻¹`, a translate of `-1/t` composed with `t ↦ 1 + t`, and 2.4.
- Choi–Davis–Jensen for the trace state `Φ(A) = (tr A / n) · 1` on `Mat n` gives
  `f(tr A / n) ≤ tr f(A) / n`, the scalar Jensen inequality for the eigenvalues.

### Dependencies

Layer 1 and Section 3.2 for the convex range of the powers.

## Layer 3: the differential theory

### 3.1 Divided differences and the Daleckii–Krein formula

- The first divided difference is Mathlib's `dslope f x y`: `(f y - f x)/(y - x)` for `y ≠ x`
  and `deriv f x` for `y = x`. `loewnerMatrix f x` is the `n × n` matrix of `dslope f (x i) (x j)`
  (Bhatia, Section V.3,
  p. 123; Horn–Johnson, Section 6.6, p. 536; Simon, Chapter 5, p. 43).
- **Daleckii–Krein** (`hasDerivAt_cfc_add_smul`): for `f` of class `C¹` on an open set `I` and
  Hermitian `A`, `H` with the spectrum of `A` in `I`, the derivative of `t ↦ cfc f (A + tH)` at
  `t = 0` is `U (L ⊙ (Uᴴ H U)) Uᴴ`, where `U = hA.eigenvectorUnitary` and `L` is the Loewner
  matrix of `f` at `hA.eigenvalues` (Bhatia, Thm V.3.3, p. 124; Horn–Johnson, Thm 6.6.30,
  p. 533; Simon, Thm 5.6, p. 48).
- The Fréchet form: `A ↦ cfc f A` is Fréchet differentiable on the Hermitian matrices with spectra
  in `I`, with derivative `H ↦ U (L ⊙ (Uᴴ H U)) Uᴴ` (Bhatia, Thm V.3.3, p. 124).

*Proof route.* For polynomials the formula is the telescoping identity
`(A + tH)ᵏ - Aᵏ = ∑ (A + tH)ʲ (tH) Aᵏ⁻¹⁻ʲ` evaluated in the eigenbasis of `A`, which gives the
divided differences of `xᵏ` (Bhatia, Thm V.3.3, proof). For `C¹` functions, approximate `f` and `f'`
uniformly on a compact neighbourhood of the spectrum by a polynomial and its derivative
(Weierstrass), and use that the eigenvalues of `A + tH` stay in that neighbourhood for small `t`:
`A - |t| ‖H‖ ≤ A + tH ≤ A + |t| ‖H‖` and eigenvalue monotonicity (PolarDecomposition PD-A52). The
divided differences converge with `f` and `f'`, uniformly on compacts, by the mean value theorem.

*Needs:* Layer 1; Mathlib's `dslope` and `polynomialFunctions_closure_eq_top`; PolarDecomposition
PD-A52 for the eigenvalue bounds.

### 3.2 Loewner's criterion

- **Loewner's criterion** (`isMatrixMonotoneOn_iff_posSemidef_loewnerMatrix`): for `f` of class
  `C¹` on `(a, b)`, `f` is matrix monotone of order `n` on `(a, b)` iff every Loewner matrix of
  `f` at `n` points of `(a, b)` is positive semidefinite (Horn–Johnson, Thm 6.6.36 (1), p. 536;
  Bhatia, Thm V.3.4, p. 126; Simon, Thm 5.1, p. 43).
- The second-order analogue for convexity: for `f` of class `C²`, matrix convexity of order `n`
  is the positivity of the matrices of second divided differences
  `[x_i, x_k, x_j; f]` for each fixed `k` (Horn–Johnson, Thm 6.6.52, p. 547).

*Proof route.* (⇐) Write `f(B) - f(A) = ∫₀¹ D f(A + t(B - A))(B - A) dt` and use 3.1: each
integrand is `U (L ⊙ Uᴴ(B - A)U) Uᴴ`, a Schur product of positive semidefinite matrices
(`Matrix.PosSemidef.hadamard`), and the integral of positive semidefinite matrices is positive
semidefinite. Points that repeat are covered because the Loewner matrix with repeated points is
the limit of distinct ones. (⇒) At diagonal `A = diag(x)`, monotonicity along `A + t ξξᴴ` gives
`L ⊙ ξξᴴ ≥ 0` for every `ξ`, and `ξ = (1, …, 1)` gives `L ≥ 0` (Horn–Johnson, Thm 6.6.36, proof,
p. 537).

*Needs:* 3.1; Mathlib's `intervalIntegral.integral_eq_sub_of_hasDerivAt` and
`Matrix.PosSemidef.hadamard`.

### 3.3 Regularity

- **`C¹` regularity** (`contDiffOn_of_isMatrixMonotoneOn_two`): a function that is matrix monotone
  of order `2` on `(a, b)` is `C¹` there (Simon, Thm 5.2, p. 43; Bhatia, Thm V.3.6, p. 127, for
  operator monotone functions).
- An operator monotone function on `(a, b)` is `C¹`, and its derivative vanishes at one point only
  if the function is constant (Horn–Johnson, Thm 6.6.36 (2), p. 536).

*Proof route.* Regularize: `f_ε = f * φ_ε` is matrix monotone of order `2` on `(a + ε, b - ε)`,
as a positive mixture of translates. By 3.2 its `2 × 2` Loewner matrices are positive
semidefinite, which bounds the divided differences by the derivatives:
`[x, y; f_ε]² ≤ f_ε'(x) f_ε'(y)`. That bound is uniform in `ε` on compacts and gives
equicontinuity of `f_ε'`; Arzelà–Ascoli and the uniform convergence `f_ε → f` (monotone `f` with
the bound has no jumps) give `f ∈ C¹` (Bhatia's proof of Thm V.3.6, which uses only `2 × 2`
matrices).

*Needs:* 3.2; Mathlib's `ContDiffBump` and `BoundedContinuousFunction.arzela_ascoli`.

**Checks.**

- `loewnerMatrix`: for `f(t) = t²` the entries are `x i + x j`, off the diagonal as slopes and on
  it as `deriv f (x i) = 2 x i`.
- `loewnerMatrix`: for `f = id` every entry is `1`. A convention putting `0` on the diagonal (as
  `x/0` would) gives the matrix `[[0, 1], [1, 0]]` at two points, of eigenvalue `-1`, and would
  wrongly reject the identity in 3.2.
- `loewnerMatrix`: for `f = exp` at the points `0`, `1`, the off-diagonal entry is
  `e - 1 ≈ 1.718`, between the diagonal entries `exp' 0 = 1` and `exp' 1 = e`.
- `loewnerMatrix`: for `√t` at the points `1`, `4`, the matrix is `[[1/2, 1/3], [1/3, 1/4]]` with
  determinant `1/8 - 1/9 = 1/72 > 0`.
- `loewnerMatrix`: for `t²` at `a ≠ b`, the matrix is `[[2a, a + b], [a + b, 2b]]` with
  determinant `-(a - b)² < 0`, matching 1.2.
- `loewnerMatrix`: for `log` at `1`, `e`, the matrix is `[[1, 1/(e - 1)], [1/(e - 1), 1/e]]`, of
  determinant `≈ 0.0292 > 0`.
- `loewnerMatrix` at `n = 1` is `[f'(x)]`, and 3.2 at order `1` is the scalar statement that a
  `C¹` function is monotone iff `f' ≥ 0`.

### Examples

- Daleckii–Krein for `f(t) = t²` reads `D f(A)(H) = AH + HA`: in the eigenbasis,
  `(λᵢ + λⱼ) Hᵢⱼ` is the `(i, j)` entry of `AH + HA`.
- Daleckii–Krein for `f = exp` at `A = 0` gives `D exp(0)(H) = H`, since all divided differences
  of `exp` at `0, 0` equal `1`.

### Dependencies

Layer 1; PolarDecomposition PD-A52; Mathlib's Schur product theorem.

## Layer 4: Loewner's theorem

### 4.1 The integral form on `(-1, 1)`

- **Loewner on `(-1, 1)`** (`isOperatorMonotoneOn_Ioo_iff`): `f` is operator monotone on
  `(-1, 1)` iff there is a unique finite measure `ν` carried by `[-1, 1]` with
  `f(x) = f(0) + ∫ x/(1 + λx) dν(λ)` for `x ∈ (-1, 1)` (Simon, Thm 1.3 (a) ⇔ (b), p. 6, and
  uniqueness Thm 1.5, p. 7; Bhatia, Cor V.4.5, p. 134, for the normalized measure of a nonconstant
  function).

*Proof route.* (⇐) Each `x ↦ x/(1 + λx)` with `λ ∈ [-1, 1]` is a Möbius image of `-1/t` and is
operator monotone on `(-1, 1)`; integrate, using the closure of 1.1 under nonnegative combinations
and pointwise limits (Riemann sums of the integral). (⇒) Bhatia's Krein–Milman argument: the set
`K` of operator monotone `f` on `(-1, 1)` with `f(0) = 0` and `f'(0) = 1` (3.3 gives the
derivative) is convex and compact for pointwise convergence (Bhatia, Lemma V.4.1 and
Prop V.4.2, pp. 131–132), its extreme points are the functions `t/(1 - αt)` with
`α ∈ [-1, 1]` (Bhatia, Prop V.4.3, p. 132, using 2.5 applied to translates), and
`closure_convexHull_extremePoints` with a Choquet-type representation gives the measure. A
constant `f` has `ν = 0`. Uniqueness: the family `λ ↦ x/(1 + λx)` for `x ↓ 0` spans a dense set in
`C([-1, 1])` (Simon, Lemma 1.4, p. 7).

*Needs:* Layers 2 and 3; Mathlib's `closure_convexHull_extremePoints` and
`RealRMK.integral_rieszMeasure`.

### 4.2 The Pick form

- **Loewner, Pick form** (`isOperatorMonotoneOn_Ioo_iff_pick`): for `a < b`, `f` is operator
  monotone on `(a, b)` iff it is the restriction of a function `F`, holomorphic on the union of
  the open upper and lower half-planes and the interval `(a, b)`, with `Im F ≥ 0` on the upper
  half-plane (Simon, Thm 1.6, p. 7; Bhatia, Thm V.4.7, p. 135, and Prop V.4.14, p. 142).
- The transfer between intervals: `f` is matrix monotone of order `n` on `(c, d)` iff `f ∘ T` is
  on `(a, b)`, for an increasing Möbius map `T` of `(a, b)` onto `(c, d)` (Simon, Thm 2.4, p. 13).

*Proof route.* Transfer `(a, b)` to `(-1, 1)` by the affine map and use 4.1. (⇒) The integral
`F(z) = f(0) + ∫ z/(1 + λz) dν(λ)` is holomorphic off `(-∞, -1] ∪ [1, ∞)` and has
`Im F(z) = ∫ Im z/|1 + λz|² dν ≥ 0` (Simon, (1.15), p. 6). (⇐) Tau Ceti's Nevanlinna
representation `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add` and the vanishing theorem
`TauCeti.measure_Icc_eq_zero_of_eq_nevanlinnaKernel_add` show the measure has no mass on compact
subintervals of `(a, b)`, so `F` restricted to `(a, b)` is an integral of operator monotone
resolvents `x ↦ (1 + λx)/(λ - x)` with `λ ∉ (a, b)`, plus `βx` with `β ≥ 0` and a constant.

*Needs:* 4.1; Tau Ceti's Pick-function files.

### 4.3 The half-line representation

- **Half-line representation** (`isOperatorMonotoneOn_Ioi_iff`): a nonnegative function on
  `(0, ∞)` is operator monotone there iff there are unique `α ≥ 0`, `β ≥ 0` and a finite measure
  `ρ` carried by `(0, ∞)` with `f(t) = α + βt + ∫ t(1 + s)/(t + s) dρ(s)` for `t > 0` (Simon,
  Thm 3.11, p. 28, and (3.65), p. 29; Zhan, Thm 1.3, p. 5; Bhatia, (V.53), p. 144; Hiai, (D.1),
  p. 176).
- The data are `α = f(0+)`, `β = lim f(t)/t` as `t → ∞`, and `α + β + ρ(0, ∞) = f(1)`.
- An operator monotone `f ≥ 0` on `(0, ∞)` extends continuously to `[0, ∞)` by `f(0) = α`, and the
  extension is operator monotone on `[0, ∞)` (Simon, Thm 2.9, p. 15).

*Proof route.* Pull back by the Möbius map `t = (1 + x)/(1 - x)` of `(-1, 1)` onto `(0, ∞)` and
use 4.1, or use the half-line Nevanlinna representation
`TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add_of_im_eq_zero` directly: its measure lives
on `(-∞, 0]`, and reflecting `s ↦ -s` and renormalizing the kernel gives the stated form, with
`f ≥ 0` forcing `α ≥ 0`. Uniqueness: the values at `t > 0` determine the Stieltjes transform of
`ρ`, which determines `ρ`; then `α` and `β` are the limits above.

*Needs:* 4.1 or 4.2; Tau Ceti's half-line Nevanlinna representation.

### 4.4 Transfer to unital C⋆-algebras

- **C⋆ transfer** (`cfc_le_cfc_of_isOperatorMonotoneOn`): if `f` is operator monotone on an open
  interval `I`, then `a ≤ b` implies `cfc f a ≤ cfc f b` for self-adjoint `a`, `b` with spectra
  in `I` in a unital C⋆-algebra with its order (Simon, Thm 2.7, p. 14, for bounded operators).
- In particular, an operator monotone function on `(0, ∞)`, such as `log` or `-1/t`, is monotone
  on the strictly positive elements; at `f = log` this is Mathlib's `CFC.log_monotoneOn`.

*Proof route.* The spectra of `a` and `b` are compact, so they lie in a closed subinterval `[c, d]`
of `I`; as `I` is open there are `c' < c` and `d' > d` with `[c', d'] ⊆ I`, and `f` is operator
monotone on `(c', d')` by restriction. Let `T` be the increasing affine map of `(-1, 1)` onto
`(c', d')`; then `g = f ∘ T` is operator monotone on `(-1, 1)` (4.2), and 4.1 gives
`cfc f a = cfc g a₁ = g(0) + ∫ cfc (fun x ↦ x/(1 + λx)) a₁ dν(λ)` with `a₁ = T⁻¹(a)` (`cfc_comp` and
`cfc_integral`; the spectrum of `a₁` lies in `[-r, r]` for some `r < 1`, so
`|x/(1 + λx)| ≤ 1/(1 - r)` uniformly in `λ ∈ [-1, 1]`), and likewise for `b`, with `a₁ ≤ b₁`. For
`λ ≠ 0` the integrand is `(1 - (1 + λx)⁻¹)/λ`, with `1 + λa₁` and `1 + λb₁` strictly positive, so it
is monotone by `CStarAlgebra.inv_le_inv` (for `λ < 0` the order reverses twice); for `λ = 0` it is
`x`. This is the pattern of Mathlib's proof of `CFC.monotone_rpow` through `Real.rpowIntegrand₀₁`.

*Needs:* 4.1, 4.2; Mathlib's `cfc_integral` and C⋆-algebra order.

**Checks.**

- 4.1: `f(x) = x` has `ν = δ₀`; `f(x) = x/(1 - x)` has `ν = δ₋₁`; a constant has `ν = 0`; and
  `f(x) = x²` admits no representation, since every represented `f` is increasing and `x²` is not.
- 4.1, uniqueness on `(-1, 1)` only: `f(x) = x` and the measure `ν = δ₀` on `[-1, 1]` are paired;
  a measure with mass outside `[-1, 1]`, such as `δ₂`, gives `x/(1 + 2x)`, which has a pole at
  `-1/2` inside the interval, so the support condition is not decorative.
- 4.2: `√x` on `(0, 1)` extends by the principal branch, whose imaginary part is nonnegative on
  the upper half-plane; `x²` extends to `z²`, whose imaginary part `2 Re z Im z` is negative at
  `z = -1 + i`.
- 4.3: `f(t) = t/(1 + t)` has `α = β = 0` and `ρ = δ₁/2`, since `t · 2/(t + 1) · 1/2 = t/(1 + t)`;
  `f = 1` has `α = 1`; `f(t) = t` has `β = 1`; `f(t) = t²` grows faster than linearly and has no
  representation, matching 1.2.
- 4.3 needs `f ≥ 0`: `f(t) = -1/t` is operator monotone on `(0, ∞)` but has `f(0+) = -∞`; it is
  represented by the general half-line form of Bhatia's (V.53), not by the nonnegative form.
- 4.4 at `𝒜 = ℂ` is scalar monotonicity on `I`.
- 4.4 needs operator monotonicity, not scalar monotonicity: `t ↦ t²` is monotone on `(0, ∞)`, and
  on `Mat 2` with the C⋆-algebra structure of the conventions the square check of 1.2, shifted
  by `1` to make the matrices strictly positive (`A + 1 ≤ B + 1`, with `(B + 1)² - (A + 1)²` of
  determinant `-1`), violates the conclusion.

### Examples

- The square root: Mathlib's integral `√t = (1/π) ∫ t/(t + s) s^(-1/2) ds` is the case
  `α = β = 0`, `dρ(s) = (1/π) s^(-1/2)/(1 + s) ds` of 4.3, a probability measure as `f(1) = 1`.
- `log` is not nonnegative, but `log(1 + t)` is: it is operator monotone on `(0, ∞)` with
  `α = β = 0` and `dρ(s) = 1_(1, ∞)(s) ds/(s(1 + s))`, as `∫₁^∞ t/(s(t + s)) ds = log(1 + t)`.

### Dependencies

Layers 2–3 (for the hard direction of 4.1); Tau Ceti's Pick functions; Mathlib's Krein–Milman.

## Layer 5: Kubo–Ando means

### 5.1 Representing functions and the formula mean

- `IsMeanFunction f`: `f` is continuous, nonnegative and operator monotone on `[0, ∞)`, with
  `f(1) = 1` (Simon, Thm 37.1, p. 379; Hiai, Appendix D, p. 175).
- `opMean f A B = msqrt A * cfc f (misqrt A * B * misqrt A) * msqrt A` (Simon, Prop 37.5, (37.16),
  p. 381).
- **The formula mean through parallel sums.** For a representing function `f` with the data
  `(α, β, ρ)` of 4.3 and positive definite `A`, `B`,
  `opMean f A B = α A + β B + ∫ ((1 + s)/s) ((sA) : B) dρ(s)`, where
  `(sA) : B = ((sA)⁻¹ + B⁻¹)⁻¹` is the parallel sum; hence `opMean f A B` is jointly monotone on
  positive definite arguments: `A ≤ A'` and `B ≤ B'` give `opMean f A B ≤ opMean f A' B'`
  (Simon, (37.4) in Thm 37.1, p. 379, and Prop 37.5, pp. 381–382).
- `opMeanPSD f A B` is the limit of `opMean f (A + ε) (B + ε)` as `ε ↓ 0`.
- **The regularized limit** (`tendsto_opMean_add_smul_one`): for a representing function `f` and
  positive semidefinite `A`, `B`, the limit exists, and it equals `opMean f A B` when `A` is
  positive definite (Simon, axioms on p. 378; Hiai, Appendix D, p. 175, for the downward
  continuity that defines the extension).

*Proof route.* Parallel sums: with `X = A^(-1/2) B A^(-1/2)`, the kernel of 4.3 gives
`A^(1/2) X (X + s)⁻¹ A^(1/2) = (A⁻¹ + s B⁻¹)⁻¹ = s⁻¹ ((sA) : B)`, since
`A^(-1/2) X⁻¹ A^(-1/2) = B⁻¹`; integrate with `cfc_integral` as in 4.4. Each parallel sum is
monotone in each argument by `CStarAlgebra.inv_le_inv` applied twice. The regularized limit:
`ε ↦ opMean f (A + ε) (B + ε)` is monotone in `ε` by the joint monotonicity, and bounded below
by `0`; a monotone bounded family of Hermitian matrices converges. For positive definite `A` the
formula is continuous in `(A, B)`.

*Needs:* 4.3, 4.4 (the integral under `cfc`).

### 5.2 The Kubo–Ando theorem

- `KuboAndoMean`: a family, over all dimensions `n`, of binary operations on positive
  semidefinite `n × n` matrices that is jointly monotone, satisfies the transformer inequality
  `Cᴴ (A σ B) C ≤ (Cᴴ A C) σ (Cᴴ B C)` for every rectangular `C`, is continuous along decreasing
  sequences, and is normalized by `1 σ 1 = 1` (Simon, axioms (1)–(4), p. 378; Hiai, (I)–(III),
  p. 175).
- **Existence** (`exists_kuboAndoMean`): every representing function `f` defines a Kubo–Ando mean
  whose values on positive semidefinite arguments are `opMeanPSD f A B` (Simon, Prop 37.6,
  p. 382).
- **The Kubo–Ando theorem** (`KuboAndoMean.exists_isMeanFunction`): every Kubo–Ando mean `σ` is
  `opMeanPSD f` for a representing function `f`, unique on `[0, ∞)`, namely
  `f(t) = (1 σ t)` at `n = 1` (Simon, Thm 37.1, p. 379, with Prop 37.4, p. 381, and Prop 37.5,
  p. 381).
- Means are compatible with orthogonal projections commuting with both arguments (Simon,
  Lemma 37.3, p. 380).

*Proof route.* Existence: by 4.3, `opMean f A B` is a nonnegative combination of `A`, `B` and the
parallel sums `(sA) : B = ((sA)⁻¹ + B⁻¹)⁻¹`; each parallel sum satisfies the axioms (Simon,
Thm 36.3, p. 374, Thm 36.4, p. 375, and Prop 36.6, p. 376), and the axioms are preserved under
nonnegative combinations and integrals. Rectangular `C` reduces to square `C` by padding with
zero rows and columns, since `opMeanPSD f (A ⊕ 0) (B ⊕ 0) = opMeanPSD f A B ⊕ 0` (the regularized
corner is `ε f(1) = ε → 0`). Representation: the transformer inequality for invertible `C` and
`C⁻¹` gives equality, so `1 σ (t · 1) = f(t) · 1` (Simon, Prop 37.4); for invertible `A`,
`A σ B = A^(1/2) (1 σ A^(-1/2) B A^(-1/2)) A^(1/2)`, and `1 σ X = f(X)` follows from the
projection compatibility on the spectral projections of `X`. Monotonicity of `σ` makes `f`
operator monotone, and downward continuity at `t = 0` makes `f` continuous at `0`. The rectangular
transformer inequality forces the dimensions to agree: an isometry `V` gives `fₘ ≤ fₙ`, and the
projection `VVᴴ` with the projection compatibility gives the reverse.

*Needs:* 4.3, 5.1.

### 5.3 Transposes and bounds

- **Transpose** (`opMean_swap`): for positive definite `A`, `B`,
  `opMean f B A = opMean (t ↦ t f(1/t)) A B` (Simon, Thm 37.7, pp. 382–383; Hiai, Appendix D,
  p. 175).
- **Symmetric means** (`harmonic_le_opMean_le_arithmetic`): if `t f(1/t) = f(t)` for `t > 0`,
  then `2 (A⁻¹ + B⁻¹)⁻¹ ≤ opMean f A B ≤ (A + B)/2` (Simon, Thm 37.9, p. 383).
- **The parallel sum**: for positive definite `A`, `B`, `opMean (t ↦ t/(1 + t)) A B = (A⁻¹ + B⁻¹)⁻¹`
  (Simon, Thm 36.3, p. 374; Hiai, Appendix D, p. 175).

*Proof route.* Transpose: put `X = A^(-1/2) B A^(-1/2)`; then `B^(1/2)` and `A^(1/2) X^(1/2)` differ
by a unitary factor (polar decomposition), and `X f(X⁻¹) = cfc (t ↦ t f(1/t)) X`. Symmetric bounds:
a symmetric representing function satisfies `f'(1) = 1/2` and, by operator concavity (2.4),
`f(t) ≤ (1 + t)/2`; the transpose of this bound with the inversion `f ↦ 1/f(1/t)` gives
`f(t) ≥ 2t/(1 + t)`; then apply the formula mean, whose dependence on `f` is monotone (Simon's
argument). Parallel sum: `X(1 + X)⁻¹ = (X⁻¹ + 1)⁻¹` and conjugation by `A^(1/2)`.

*Needs:* 5.1, 2.4; PolarDecomposition for the polar factor.

### 5.4 Ando's inequality and joint concavity

- **Ando's inequality** (`map_opMeanPSD_le`): for a positive linear map
  `Φ : Mat n →ₗ[ℂ] Mat m` and positive semidefinite `A`, `B`,
  `Φ(opMeanPSD f A B) ≤ opMeanPSD f (Φ A) (Φ B)`. This is an adaptation: the Jensen-type step is
  Zhan's Thm 1.6, p. 6, for unital maps and operator monotone `f`.
- **Joint concavity** (`opMeanPSD_jointly_concave`):
  `(1 - t)(A σ B) + t(A' σ B') ≤ ((1 - t)A + tA') σ ((1 - t)B + tB')` for `t ∈ [0, 1]` (Simon, Cor
  37.2, p. 380).
- Superadditivity `(A σ C) + (B σ D) ≤ (A + B) σ (C + D)` (Simon, Cor 37.2, (37.7), p. 380); at
  `f = √t` this is Tau Ceti's `TauCeti.geometricMean_add_geometricMean_le`.

*Proof route.* Ando: regularize so that `A` and `Φ(A)` are positive definite (replace `Φ` by
`Φ + ε tr(·)` and `A` by `A + ε`). The map `Ψ(X) = Φ(A)^(-1/2) Φ(A^(1/2) X A^(1/2)) Φ(A)^(-1/2)` is
positive and unital, `opMean f A B = A^(1/2) f(X₀) A^(1/2)` with `X₀ = A^(-1/2) B A^(-1/2)`, and
the inequality becomes `Ψ(f(X₀)) ≤ f(Ψ(X₀))`, the Choi–Davis–Jensen inequality 2.3 for the
operator concave `f` (2.4). Joint concavity: apply Ando to the positive map
`Φ([[X, Y], [Z, W]]) = (1 - t)X + tW` on `Mat (2n)` at the block-diagonal arguments
`diag(A, A')`, `diag(B, B')`, and use that the mean of block-diagonal matrices is block-diagonal
(Simon, Lemma 37.3, p. 380). Superadditivity is joint concavity at `t = 1/2` with homogeneity.

*Needs:* 2.3, 2.4, 5.1, 5.2.

**Checks.**

- `IsMeanFunction`: `√t`, `(1 + t)/2`, `2t/(1 + t)` and the constants `1` are representing
  functions; each is continuous, nonnegative, operator monotone on `[0, ∞)` and takes `1` at `1`.
- `IsMeanFunction`: `t²` fails operator monotonicity (1.2) though it is continuous and `1` at `1`.
- `IsMeanFunction` needs continuity at `0`: the support function `f(0) = 0`, `f(t) = 1` for `t > 0`
  is operator monotone on `[0, ∞)` with `f(1) = 1`, but its mean violates downward continuity at
  `n = 1`: `1 σ (1/k) = f(1/k) = 1` for all `k`, while `1 σ 0 = f(0) = 0`.
- `opMean`: `f = 1` gives `A`, `f = id` gives `B` (not `A`: the order of the arguments is fixed by
  `1 σ t = f(t)`), and at `n = 1` it is `a f(b/a)`.
- `opMean`: for `f = √t`, `A = diag(1, 4)` and `B = 1`, `opMean f A B = A^(1/2) = diag(1, 2)`; for
  `A = diag(1, 4)`, `B = [[2, 1], [1, 2]]` the value `≈ [[1.393, 0.486], [0.486, 2.656]]` satisfies
  `X A⁻¹ X = B`, while the naive product `A^(1/2) B^(1/2) ≈ [[1.366, 0.366], [0.732, 2.732]]` is not
  Hermitian.
- `opMeanPSD` versus `opMean` at a singular `A`: `opMean id 0 B = 0` because `msqrt 0 = 0`, while
  `opMeanPSD id 0 B = B`, the limit of `B + ε`. The formula mean is junk on singular `A`.
- `opMeanPSD`: for `f = √t`, `A = 0` and `B = 1` (`1 × 1`) the regularized value is
  `√(ε(1 + ε)) → 0`; for `A = B = 0` it is `ε f(1) = ε → 0`.
- `KuboAndoMean`: the arithmetic mean `(A + B)/2` and the left mean `A` satisfy all axioms.
- `KuboAndoMean`: `(A, B) ↦ (A² + B²)/2` satisfies normalization but not the transformer
  inequality: at `n = 1`, `C = 1/2`, `A = B = 1` the left side is `1/4` and the right side `1/16`.
- `KuboAndoMean`: the rectangular transformer inequality is stronger than the square one; with
  `C` the `2 × 1` column `e₁`, it compares the `1 × 1` mean with the corner of the `2 × 2` mean,
  which fixes the same `f` in all dimensions.
- Symmetric bounds need symmetry: the left mean `A` at `A = 1`, `B = 3` (`1 × 1`) is `1`, below
  the harmonic mean `2/(1 + 1/3) = 1.5`.

### Examples

- The parallel sum is the mean of `t/(1 + t)`; its double `2t/(1 + t)` is the harmonic mean
  `2(A⁻¹ + B⁻¹)⁻¹`.
- The logarithmic mean `(t - 1)/log t` is a symmetric representing function; it lies between the
  geometric mean `√t` and the arithmetic mean `(1 + t)/2`.

### Dependencies

Layers 2 and 4.

## Layer 6: the weighted geometric mean

### 6.1 Definition and identification

- `wgm t A B = opMean (x ↦ x^t) A B`, written `A #ₜ B` (Simon, (36.9), p. 376, at `t = 1/2`).
- **Weight one half** (`wgm_half_eq_geometricMean`): for positive definite `A` and positive
  semidefinite `B`, `A #₁/₂ B = TauCeti.geometricMean A B`.
- `A # B` is the unique positive semidefinite solution of `X A⁻¹ X = B` (Simon, Prop 36.7,
  pp. 376–377; Tau Ceti's `TauCeti.eq_geometricMean_of_mul_ringInverse_mul`, with its matrix form
  `Matrix.PosDef.existsUnique_posSemidef_mul_mul`), and `A # B = B # A`
  (Simon, Cor 36.8, p. 377; `TauCeti.geometricMean_comm`).

*Proof route.* Both sides are `A^(1/2) (A^(-1/2) B A^(-1/2))^(1/2) A^(1/2)`: Tau Ceti defines the
geometric mean through `CFC.conjSqrt`, and `cfc (fun x ↦ x ^ (1/2)) = cfc Real.sqrt` on positive
semidefinite matrices.

*Needs:* 5.1; Tau Ceti's geometric mean.

### 6.2 Identities

- **Exchange, inversion, congruence** (`wgm_symm_inv_congr`): for positive definite `A`, `B` and
  real `t`, `A #ₜ B = B #₁₋ₜ A`, `(A #ₜ B)⁻¹ = A⁻¹ #ₜ B⁻¹`, and
  `Xᴴ (A #ₜ B) X = (Xᴴ A X) #ₜ (Xᴴ B X)` for invertible `X` (the transpose rule of Simon, Thm 37.7,
  pp. 382–383, for the function `t^s`, whose transpose is `t^(1-s)`).
- **Commuting case and determinant** (`wgm_of_commute_and_det`): if `A` and `B` commute then
  `A #ₜ B = A^(1-t) B^t`, and always `det(A #ₜ B) = det(A)^(1-t) det(B)^t`.

*Proof route.* Exchange is 5.3 with `t · (1/t)^s = t^(1-s)`. Inversion: with
`X = A^(-1/2) B A^(-1/2)`, `(A #ₜ B)⁻¹ = A^(-1/2) X^(-t) A^(-1/2)`, and
`A^(1/2) B⁻¹ A^(1/2) = X⁻¹` gives the formula for `A⁻¹ #ₜ B⁻¹` after a unitary change (the polar
factor of `A^(-1/2) B^(1/2)`). Congruence: `(XᴴAX)^(1/2) = Xᴴ A^(1/2) W` for a unitary `W` (polar
decomposition of `A^(1/2) X`), and the unitary passes through `cfc`. Commuting case: simultaneous
diagonalization. Determinant: multiplicativity of `det` and `det(X^t) = det(X)^t` for positive
definite `X`.

*Needs:* 6.1, 5.3; PolarDecomposition.

### 6.3 The harmonic–geometric–arithmetic order

- **HGA order** (`harmonic_le_wgm_le_arithmetic`): for positive definite `A`, `B` and
  `t ∈ [0, 1]`, `((1 - t) A⁻¹ + t B⁻¹)⁻¹ ≤ A #ₜ B ≤ (1 - t) A + t B`; for `0 < t < 1` equality in
  either inequality holds iff `A = B`. This is an adaptation: the scalar inequality
  `x^t ≤ (1 - t) + tx` (Bhatia, p. 87, the weighted arithmetic–geometric mean inequality from
  the convexity of `-log`) lifted by the formula mean.

*Proof route.* Put `X = A^(-1/2) B A^(-1/2)`. The scalar inequalities
`((1 - t) + t x⁻¹)⁻¹ ≤ x^t ≤ (1 - t) + t x` for `x > 0` give
`((1 - t) + t X⁻¹)⁻¹ ≤ X^t ≤ (1 - t) + t X` by the functional calculus, and congruence by
`A^(1/2)` gives the claim. Equality forces equality of the scalar functions on the spectrum of
`X`, so `spectrum X = {1}`, `X = 1` and `A = B`; strictness of the scalar inequality for `x ≠ 1`
and `0 < t < 1` is the strict concavity of `log`.

*Needs:* 6.1.

### 6.4 Block maximality

- **Block maximality** (`isGreatest_geometricMean`): for positive definite `A`, `B`, `A # B` is the
  greatest positive semidefinite `X` for which `[[A, X], [X, B]]` (`Matrix.fromBlocks`) is
  positive semidefinite (Simon, Thm 36.9 (b), p. 377, with Thm 36.1, p. 374).

*Proof route.* By the Schur complement (Simon, Thm 36.1), the block matrix is positive semidefinite
iff `X B⁻¹ X ≤ A`; by Simon's Prop 36.7, `Y A⁻¹ Y ≤ B` implies `Y ≤ A # B` through the operator
monotone square root (`CFC.sqrt_le_sqrt`), and the two forms are exchanged by `A # B = B # A`. The
mean itself is Hermitian (`Matrix.isHermitian_geometricMean`), positive semidefinite, and attains
the bound because `(A # B) A⁻¹ (A # B) = B`.

*Needs:* 6.1; Mathlib's Schur complement criterion `Matrix.PosDef.fromBlocks₁₁`.

**Checks.**

- `wgm`: `t = 0` gives `A`, `t = 1` gives `B`, and at `n = 1` it is `a^(1-t) b^t`.
- `wgm` at `A = diag(1, 4)`, `B = 1`, `t = 1/2`: `diag(1, 2)`, the entrywise geometric mean of the
  diagonals, between the harmonic `diag(1, 1.6)` and the arithmetic `diag(1, 2.5)`.
- `wgm` against the naive formula: at `A = diag(1, 4)`, `B = [[2, 1], [1, 2]]`, `t = 1/2`, the
  product `A^(1/2) B^(1/2)` is not Hermitian (Layer 5 checks), so the commuting-case formula of 6.2
  needs its hypothesis.
- Equality case needs `0 < t < 1`: at `t = 0`, `A #₀ B = A = (1 - 0)A + 0B` for every `B`.
- Determinant at `n = 1`: `a^(1/2)(b/a)^t a^(1/2) = a^(1-t) b^t`.

### Examples

- For `A = 1`, `A #ₜ B = B^t`; the HGA order reads `((1 - t) + tB⁻¹)⁻¹ ≤ B^t ≤ (1 - t) + tB`.
- Riccati: for `A = diag(1, 4)` and `B = [[2, 1], [1, 2]]`, `X = A # B` satisfies `X A⁻¹ X = B`
  numerically to machine precision.

### Dependencies

Layer 5; Tau Ceti's geometric mean.

## Layer 7: the geometry of the positive definite cone

### 7.1 The affine-invariant distance

- `frob M` is `√(∑ |Mᵢⱼ|²)`, and `riemDist A B` is `frob (cfc log (A^(-1/2) B A^(-1/2)))`, written
  `δ(A, B)`. For positive definite `A`, `B`, `δ(A, B)² = ∑ (log λᵢ)²` over the eigenvalues
  `λᵢ` of `A⁻¹B` (Terras, (1.11), p. 12, for the arc length of the invariant metric on real
  positive definite matrices).
- **Invariance** (`riemDist_congr_inv_symm`): `δ(XᴴAX, XᴴBX) = δ(A, B)` for invertible `X`,
  `δ(A⁻¹, B⁻¹) = δ(A, B)`, and `δ(B, A) = δ(A, B)`.
- **The infinitesimal bound**: for Hermitian `H`, `K`,
  `‖e^(-H/2) (D exp(H)(K)) e^(-H/2)‖_F ≥ ‖K‖_F`, where `D exp(H)` is the derivative of 3.1 for
  `f = exp`. Equivalently, along a `C¹` path `γ = exp(η)` with Hermitian `η`, the invariant speed
  `‖γ^(-1/2) γ' γ^(-1/2)‖_F` is at least `‖η'‖_F`. This is an adaptation, through the
  Daleckii–Krein formula 3.1.

*Proof route.* Invariance: the eigenvalues of `A⁻¹B` are those of `A^(-1/2) B A^(-1/2)` and are
unchanged by `A ↦ XᴴAX`, `B ↦ XᴴBX` (`Matrix.charpoly_mul_comm`); inversion maps them to their
inverses, and symmetry to their inverses as well; `(log λ)²` is invariant under `λ ↦ 1/λ`.
Infinitesimal bound: in the eigenbasis of `H`, with eigenvalues `hᵢ`, 3.1 gives
`D exp(H)(K)ᵢⱼ = Kᵢⱼ (e^(hᵢ) - e^(hⱼ))/(hᵢ - hⱼ)`, so conjugation by `e^(-H/2)` multiplies `Kᵢⱼ` by
`sinh(uᵢⱼ)/uᵢⱼ ≥ 1` with `uᵢⱼ = (hᵢ - hⱼ)/2` (the value `1` on the diagonal), and the Frobenius
norm is unitarily invariant. For the path form, `γ' = D exp(η)(η')` and `γ^(-1/2) = e^(-η/2)`.

*Needs:* 3.1; Mathlib's `Matrix.charpoly_mul_comm`.

### 7.2 Lengths, the metric and geodesics

- `pathLength γ` is `∫₀¹ ‖γ(t)^(-1/2) γ'(t) γ(t)^(-1/2)‖_F dt`.
- **Length** (`riemDist_le_pathLength_and_pathLength_wgm`): every `C¹` path of positive definite
  matrices from `A` to `B` has length at least `δ(A, B)`, and the path `t ↦ A #ₜ B` has length
  exactly `δ(A, B)` (Terras, Thm 1.1.1, pp. 17–18, and (1.11), p. 12).
- **Exponential metric increasing** (`frob_log_sub_log_le_riemDist`):
  `‖log A - log B‖_F ≤ δ(A, B)`. This is an adaptation, through the infinitesimal bound of 7.1.
- **Metric** (`riemDist_triangle`): `δ(A, C) ≤ δ(A, B) + δ(B, C)`, and `δ(A, B) = 0` iff `A = B`.
- **Geodesic** (`riemDist_wgm`): for `t ∈ [0, 1]`, `δ(A, A #ₜ B) = t δ(A, B)` and
  `δ(A #ₜ B, B) = (1 - t) δ(A, B)`; and `A #ₜ B` is the only positive definite `X` with these two
  distances (Terras, Thm 1.1.1, pp. 17–18, for real positive definite matrices).

*Proof route.* The items are proved in the order listed. Reduction: the speed satisfies
`‖γ^(-1/2) γ' γ^(-1/2)‖_F² = tr((γ⁻¹γ')²)`, which is unchanged by `γ ↦ XᴴγX` for invertible `X`,
so `pathLength` is congruence invariant, as is `δ` (7.1); and `A #ₜ B` is congruence covariant
(6.2). Congruence by `A^(-1/2)` therefore reduces Length and Geodesic to `A = 1`, where
`A #ₜ B = B^t` and `δ(1, B) = ‖log B‖_F`.
Length: along `γ(t) = B^t`, `γ^(-1/2) γ' γ^(-1/2) = log B`, so the length is `‖log B‖_F`. Lower
bound: for a `C¹` path `γ` from `1` to `B`, `η = log γ` is `C¹` (3.1 for `log` on `(0, ∞)`), and
by the infinitesimal bound of 7.1 the length is at least `∫ ‖η'‖_F ≥ ‖η(1) - η(0)‖_F = ‖log B‖_F`
(`intervalIntegral.integral_eq_sub_of_hasDerivAt`).
Exponential metric increasing: apply the infinitesimal bound to the geodesic `γ(t) = A #ₜ B` itself,
with `η = log γ` (no congruence reduction, since `‖log A - log B‖_F` is not congruence
invariant): `δ(A, B) = pathLength γ ≥ ∫ ‖η'‖_F ≥ ‖log B - log A‖_F`.
Triangle: reparametrize the geodesic paths from `A` to `B` and from `B` to `C` by
`s ↦ 3s² - 2s³`, whose derivative vanishes at both ends, and concatenate; the result is `C¹`,
reparametrization does not change length, and Length gives
`δ(A, C) ≤ δ(A, B) + δ(B, C)`. Definiteness: `δ = 0` forces all eigenvalues of the Hermitian
`A^(-1/2) B A^(-1/2)` to be `1`, so it is `1` and `B = A`.
Geodesic: at `A = 1`, `δ(1, B^t) = ‖t log B‖_F` and `δ(B^t, B) = ‖(1 - t) log B‖_F`. Uniqueness: if
`X` has both distances, then `‖log X‖_F = δ(1, X) = t ‖log B‖_F`, and the exponential metric
increasing property gives `‖log B - log X‖_F ≤ δ(X, B) = (1 - t) ‖log B‖_F`. The Euclidean
triangle inequality for the Frobenius inner product is then an equality, so `log X` and
`log B - log X` are nonnegatively proportional, and `log X = t log B`, that is `X = B^t`.

*Needs:* 7.1, 6.1, 6.2; Mathlib's `intervalIntegral.integral_eq_sub_of_hasDerivAt`.

### 7.3 Nonpositive curvature

- **Semiparallelogram law** (`riemDist_wgm_sq_le`): for positive definite `A`, `B`, `C` and
  `t ∈ [0, 1]`,
  `δ(C, A #ₜ B)² ≤ (1 - t) δ(C, A)² + t δ(C, B)² - t(1 - t) δ(A, B)²` (Jost, Def 2.3.1, p. 54,
  for the inequality as the definition of nonpositive curvature in the sense of Alexandrov). The
  statement for this cone is an adaptation.

*Proof route.* Midpoint first: congruence moves `A # B` to `1`, so `B = A⁻¹` and
`δ(A, B) = 2‖log A‖_F`. With `a = log A`, `c = log C`, the exponential metric increasing property
(7.2) gives `δ(C, A) ≥ ‖c - a‖_F` and `δ(C, B) ≥ ‖c + a‖_F`, while `δ(C, 1) = ‖c‖_F`; the Euclidean
parallelogram law `‖c - a‖² + ‖c + a‖² = 2‖c‖² + 2‖a‖²` gives the midpoint inequality. General `t`:
the midpoint inequality and the geodesic identity of 7.2 imply the weighted one for dyadic `t` by
induction, and continuity of `t ↦ A #ₜ B` gives all `t`.

*Needs:* 7.1, 7.2.

### 7.4 Completeness and barycenters

- **Completeness** (`exists_tendsto_riemDist_of_cauchy`): a `δ`-Cauchy sequence of positive
  definite matrices converges in `δ` to a positive definite matrix.
- **Karcher barycenter** (`existsUnique_barycenter`): for positive definite `A₁, …, Aₘ` and positive
  weights `w` with sum `1`, there is a unique positive definite minimizer of
  `X ↦ ∑ wᵢ δ(X, Aᵢ)²` (Jost, Thm 3.2.1, p. 65, for global nonpositively curved spaces).

*Proof route.* Completeness: by the exponential metric increasing property (7.2), `log uₖ` is Cauchy
in the Frobenius norm, hence converges to a Hermitian `L`; the eigenvalues of `uₖ` stay in a compact
subset of `(0, ∞)`, and `δ(uₖ, exp L) → 0` by continuity of `δ` on such sets. Barycenter: the
function is continuous and coercive (a closed `δ`-ball is compact by the same eigenvalue bounds), so
a minimizer exists; uniqueness from 7.3: for two minimizers `X ≠ Y`, the midpoint `X # Y` has a
strictly smaller value, because each `δ(X # Y, Aᵢ)²` is at most the average minus `δ(X, Y)²/4`.

*Needs:* 7.1, 7.2, 7.3.

**Checks.**

- `frob`: `frob 1 = √n` (so `frob` of the `2 × 2` identity is `√2`, not the operator norm `1`),
  and `frob diag(3, 4) = 5`.
- `frob` is not a trace: `frob diag(1, -1) = √2` while the trace is `0`.
- `riemDist`: `δ(1, diag(1, 4)) = log 4 ≈ 1.386`; `δ(a, b) = |log(b/a)|` at `n = 1`.
- `riemDist` is not the Frobenius distance: `δ(1, 2 · 1) = √2 log 2 ≈ 0.980` on `2 × 2` matrices,
  while `frob(2 · 1 - 1) = √2`; and `δ(A, cA) = √n |log c|` does not depend on `A`.
- `riemDist` uses `log`, not a power: `δ(1, e · 1) = √2` for `2 × 2` matrices.
- `pathLength`: a constant path has length `0`; at `n = 1` the segment from `1` to `4` has length
  `∫₀¹ 3/(1 + 3t) dt = log 4 = δ(1, 4)`.
- `pathLength` of a segment is not minimal in general: from `diag(1, 4)` to `diag(4, 1)`, the
  segment has length `≈ 2.086`, while `δ = √2 log 4 ≈ 1.961`.
- Semiparallelogram at `n = 1`: `δ` is `|log b - log a|`, and the law is the Euclidean identity
  with equality.

### Examples

- The barycenter of `A` and `B` with weights `1 - t`, `t` is `A #ₜ B`, by 7.2 and 7.3.
- At `n = 1` the barycenter of `a₁, …, aₘ` is the weighted geometric mean `exp(∑ wᵢ log aᵢ)`.

### Dependencies

Layers 3 and 6.

## Layer 8: norm inequalities

`N` is a unitarily invariant seminorm on operators of `EuclideanSpace ℂ (Fin n)`, used on matrices
through `UnitarilyInvariantSeminorm.mat`. The operator norm, the Frobenius norm, the Schatten
norms and the Ky Fan norms are examples (Majorization Part B, concrete rectangular seminorms).

### 8.1 Kittaneh's lemma

- **Kittaneh's lemma** (`UnitarilyInvariantSeminorm.mat_mul_le_re`): if `AB` is Hermitian, then
  `‖AB‖ ≤ ‖Re(BA)‖` with `Re Y = (Y + Yᴴ)/2` (Bhatia, Prop IX.1.2, p. 254; Zhan, Lemma 4.21,
  p. 72).

*Proof route.* The eigenvalues of `BA` equal those of `AB` (`Matrix.charpoly_mul_comm`), so they are
real, and the singular values of the Hermitian `AB` are their absolute values. Triangularize
`BA = U T Uᴴ` (Schur); the diagonal of `Uᴴ Re(BA) U` is the vector of eigenvalues of `BA`. The sum
of the `k` largest `|λⱼ|` is at most the Ky Fan `k`-sum of `Re(BA)` by the Ky Fan variational
bound (Majorization MAJ-A28), and Fan dominance (MAJ-B21) gives every `N`.

*Needs:* Majorization MAJ-A26, MAJ-A28, MAJ-B21.

### 8.2 The matrix arithmetic–geometric mean inequality

- **Bhatia–Kittaneh** (`singularValues_conjTranspose_mul_le`): for all `A`, `B`,
  `s_j(AᴴB) ≤ s_j(AAᴴ + BBᴴ)/2` for every `j`, and `2‖AᴴB‖ ≤ ‖AAᴴ + BBᴴ‖` for every unitarily
  invariant seminorm (Bhatia, Thm IX.4.2, p. 262, and Cor IX.4.4, p. 263).

*Proof route.* With `X = [[A, B], [0, 0]]`, `XXᴴ = diag(AAᴴ + BBᴴ, 0)` and `XᴴX` has off-diagonal
blocks `AᴴB` and `BᴴA`. The unitary `diag(1, -1)` gives
`XᴴX - diag(1, -1) XᴴX diag(1, -1) = 2 [[0, AᴴB], [BᴴA, 0]]`, whose eigenvalues are `± 2 s_j(AᴴB)`.
Since `diag(1, -1) XᴴX diag(1, -1) ≥ 0`, eigenvalue monotonicity (PolarDecomposition PD-A52) gives
`2 s_j(AᴴB) ≤ λ_j(XᴴX) = λ_j(XXᴴ) = s_j(AAᴴ + BBᴴ)`. The seminorm form follows from the Ky Fan
sums and Fan dominance (MAJ-B21).

*Needs:* Majorization MAJ-A26, MAJ-B19, MAJ-B21; PolarDecomposition PD-A52.

### 8.3 The Bhatia–Davis and Heinz inequalities

- **Bhatia–Davis**: for positive semidefinite `A`, `B` and every `X`,
  `2‖A^(1/2) X B^(1/2)‖ ≤ ‖AX + XB‖` (Bhatia, Thm IX.4.5, p. 263; Zhan, Thm 4.19, p. 71). It is the
  case `t = 1/2` of the Heinz inequality below.
- The function `t ↦ ‖A^(1+t) X B^(1-t) + A^(1-t) X B^(1+t)‖` is convex on `[-1, 1]` and minimal at
  `t = 0` (Bhatia, Thm IX.4.8, p. 265).
- **Heinz** (`UnitarilyInvariantSeminorm.mat_heinz_le`): for positive semidefinite `A`, `B`, every
  `X` and `t ∈ [0, 1]`, `‖A^t X B^(1-t) + A^(1-t) X B^t‖ ≤ ‖AX + XB‖` (Bhatia, Cor IX.4.10, p. 265).

*Proof route.* Bhatia–Davis for `A = B` and Hermitian `X`: with `P = A^(1/2)`, the product
`P · (XP)` is Hermitian, so Kittaneh's lemma 8.1 gives
`‖P X P‖ ≤ ‖Re(X P · P)‖ = ‖AX + XA‖/2`. General `X`: the Hermitian dilation
`[[0, X], [Xᴴ, 0]]` with `diag(A, A)`; general `A ≠ B`: `T = diag(A, B)` and `Y = [[0, X], [0, 0]]`,
for which `T^(1/2) Y T^(1/2)` and `TY + YT` have the single blocks `A^(1/2) X B^(1/2)` and
`AX + XB`. Block sums are handled by Majorization's orthogonal block sums. Convexity: the
Bhatia–Davis inequality applied to `A^(1+t)`, `B^(1+t)`-type substitutions gives midpoint convexity
of the function `g`; `g` is continuous and even, hence convex with minimum at `0`. Heinz: `g` at
`ν = 2t - 1`, with `A`, `B` replaced by `A^(1/2)`, `B^(1/2)`, is at most `g(1)`.

*Needs:* 8.1; Majorization Part B.

### 8.4 The product inequality

- **Bhatia–Kittaneh, product form** (`UnitarilyInvariantSeminorm.four_mul_mat_mul_le`): for positive
  semidefinite `A`, `B`, `4‖AB‖ ≤ ‖(A + B)²‖` (Zhan, Thm 4.25, p. 77, attributed there to Bhatia and
  Kittaneh, p. 78).

*Proof route.* Zhan's proof: by Bhatia–Davis applied to `A^(1/2) (A^(1/2) B^(1/2)) B^(1/2) = AB`,
`2‖AB‖ ≤ ‖A^(3/2) B^(1/2) + A^(1/2) B^(3/2)‖`. With `X = [[A^(1/2), 0], [B^(1/2), 0]]` and
`T = XXᴴ`, `T` is unitarily equivalent to `XᴴX = diag(A + B, 0)`, and the off-diagonal block of `T²`
is `A^(3/2) B^(1/2) + A^(1/2) B^(3/2)`; the off-diagonal block lemma of 8.2 gives
`2 s_j(A^(3/2) B^(1/2) + A^(1/2) B^(3/2)) ≤ s_j((A + B)²)`.

*Needs:* 8.2, 8.3.

**Checks.**

- `UnitarilyInvariantSeminorm.mat` for the operator norm: `diag(3, -4)` has value `4`, and the
  nilpotent `[[0, 1], [0, 0]]` has value `1`, not its spectral radius `0`.
- `UnitarilyInvariantSeminorm.mat` for the Frobenius norm: `diag(3, -4)` has value `5`; for the
  Ky Fan `1`-norm the value of `[[0, 1], [0, 0]]` is `1`.
- `UnitarilyInvariantSeminorm.mat` is unitarily invariant on both sides: `[[0, 1], [1, 0]]` and
  `1` have the same value for every `N`, as they differ by a permutation unitary.
- Kittaneh needs `AB` Hermitian: `A = [[0, 1], [0, 0]]`, `B = [[0, 0], [0, 1]]` give
  `AB = [[0, 1], [0, 0]]` of operator norm `1`, while `BA = 0`.
- Bhatia–Kittaneh at `A = B` is equality: `s_j(AᴴA) = s_j(A)² = s_j(2AAᴴ)/2`. At
  `A = diag(1, 0)`, `B = [[0, 0], [1, 0]]`, `AᴴB = 0` while `AAᴴ + BBᴴ = 1`.
- Heinz at `n = 1` is the scalar `a^t b^(1-t) + a^(1-t) b^t ≤ a + b`: at `a = 4`, `b = 1`,
  `t = 1/2` it reads `4 ≤ 5`.
- The product inequality at `A = diag(1, 0)`, `B = [[1/2, 1/2], [1/2, 1/2]]` in the operator norm:
  `4‖AB‖ = 2√2 ≈ 2.828` and `‖(A + B)²‖ ≈ 2.914`; in the trace norm `2.828 ≤ 3`.

### Examples

- For the operator norm and `X = 1`, Heinz gives `‖A^t B^(1-t) + A^(1-t) B^t‖ ≤ ‖A + B‖`.
- Bhatia–Kittaneh for the Frobenius norm gives `2‖AᴴB‖_F ≤ ‖AAᴴ + BBᴴ‖_F`.

### Dependencies

Layer 1, OperatorTheory/Majorization, OperatorTheory/PolarDecomposition.

## Downstream consumers

- [RandomMatrices](../RandomMatrices/README.md), Section 2.6: Lieb concavity has a proof through
  joint concavity of operator means and Ando's inequality (5.4), and Golden–Thompson uses the
  operator monotonicity of `log` (2.6).
- [OptimalTransport](../OptimalTransport/README.md), Layer 5.3: the Bures formula for Gaussian
  `W₂` uses the geometric mean that Layer 6 identifies with `A #₁/₂ B`; its barycenter problems use
  the cone geometry of Layer 7.
- [CStarAlgebras](../CStarAlgebras/README.md), Section 1.1: its matrix-order examples are the
  `2 × 2` checks of Layer 1 in C⋆ form, and the C⋆ transfer 4.4 extends its consumption of
  `CFC.sqrt_le_sqrt` to every operator monotone function on an open interval.

## Scope and ownership

The roadmap is complete when Tau Ceti proves all of the following.

1. **The notions.** Matrix and operator monotonicity, convexity and concavity of a real function
   on a set, through the functional calculus of Hermitian matrices; composition and pointwise
   limits; the powers, the inverse and the logarithm as examples; the square, the cube, the
   absolute value and the exponential as counterexamples.
2. **Jensen-type characterizations.** Davis's isometry criterion, the Jensen operator inequality
   for families with `∑ Kⱼᴴ Kⱼ = 1`, the Hansen–Pedersen contraction inequality, the
   Choi–Davis–Jensen inequality, monotone versus concave on the half-line, the Bendat–Sherman
   criterion, the exact operator monotone and operator convex ranges of the powers, and the
   operator convexity of `t log t`.
3. **The differential theory.** Divided differences, Loewner matrices, the Daleckii–Krein
   derivative of `t ↦ f(A + tH)`, Loewner's positivity criterion and the `C¹` regularity of
   matrix monotone functions of order two.
4. **Loewner's theorem.** Integral representation on `(-1, 1)` with a unique measure, the Pick
   characterization on bounded open intervals, the representation of nonnegative operator
   monotone functions on the half-line with unique data, and monotonicity on self-adjoint
   elements of unital C⋆-algebras with spectra in an open interval.
5. **Kubo–Ando means.** Representing functions, the formula mean, its extension to positive
   semidefinite arguments, the axioms, the representation theorem with uniqueness, transposes,
   the bounds for symmetric means, Ando's inequality and joint concavity.
6. **The weighted geometric mean.** The identification with Tau Ceti's geometric mean at weight
   one half, exchange, inversion and congruence, the commuting case and the determinant, the
   harmonic–geometric–arithmetic order with equality only on the diagonal, and block
   maximality.
7. **The positive definite cone.** The affine-invariant distance, its invariances, the
   exponential metric increasing property, the metric axioms, geodesics with uniqueness, the
   length of paths, the semiparallelogram law, completeness and the Karcher barycenter.
8. **Norm inequalities.** Kittaneh's lemma, the Bhatia–Kittaneh inequality for singular values and
   for every unitarily invariant seminorm, the Bhatia–Davis inequality, the Heinz inequality and
   the Bhatia–Kittaneh product inequality `4‖AB‖ ≤ ‖(A + B)²‖`.

**Not owned here.**
- Majorization, Ky Fan sums, unitarily invariant seminorms, Fan dominance and the block-sum
  calculus of those seminorms: OperatorTheory/Majorization, Parts A and B (see the Summary for the
  link). This roadmap consumes them and keeps a local copy of the seminorm structure.
- Operator monotonicity of the square root on C⋆-algebras: Mathlib's `CFC.sqrt_le_sqrt`, which
  [CStarAlgebras](../CStarAlgebras/README.md) consumes in its Section 1.1. This roadmap consumes it
  as well.
- Golden–Thompson and Lieb concavity: [RandomMatrices](../RandomMatrices/README.md), Section 2.6.
- Trace inequalities, operator perspectives used for quantum entropy, relative entropies and
  their monotonicity: Beyond.
- Completely positive maps, Stinespring dilation and the Kadison–Schwarz inequality in C⋆-algebras:
  [CStarAlgebras](../CStarAlgebras/README.md). The matrix inequalities of Layer 2 are proved here
  for positive maps between matrix algebras without that machinery.
- The Riemannian-manifold structure of the cone of real positive definite matrices (the metric
  tensor `tr(X⁻¹UX⁻¹W)` as a Riemannian metric, its Riemannian distance as the metric-space
  structure, the exponential map, completeness of that manifold): the roadmap
  ManifoldOptimization, catalogue item O0.3. Layer 7 here owns the closed-form distance `δ` on
  complex positive definite matrices and its matrix-analytic theory (7.1–7.4); the path-length
  statement of 7.2 identifies `δ` with the least length of a `C¹` path, and it is the input for
  the distance formula and the geodesic midpoint of O0.3. The connection, curvature and
  Cartan–Hadamard on the complex cone are Beyond.

## Exact supplier contracts

### From Mathlib

Paths are relative to `Mathlib/`.

- Order and functional calculus of matrices: `Matrix.le_iff`, `Matrix.nonneg_iff_posSemidef`,
  `Matrix.isStrictlyPositive_iff_posDef` (`Analysis/Matrix/Order.lean`);
  `Matrix.IsHermitian.cfc_eq` with the instance for Hermitian matrices
  (`Analysis/Matrix/HermitianFunctionalCalculus.lean`); `Matrix.IsHermitian.eigenvectorUnitary`,
  `Matrix.IsHermitian.eigenvalues` and the spectral theorem `Matrix.IsHermitian.spectral_theorem`
  (`Analysis/Matrix/Spectrum.lean`); the C⋆-algebra structure on matrices under
  `open scoped Matrix.Norms.L2Operator` (`Analysis/CStarAlgebra/Matrix.lean`).
- Schur products: `Matrix.PosSemidef.hadamard` (`Analysis/Matrix/Order.lean`).
- Products in both orders: `Matrix.charpoly_mul_comm` (`LinearAlgebra/Matrix/Charpoly/Basic.lean`).
- Block matrices, unitaries and Euclidean operators: `Matrix.fromBlocks`, `Matrix.unitaryGroup`,
  `Matrix.toEuclideanLin`; the Schur complement criterion `Matrix.PosDef.fromBlocks₁₁`
  (`LinearAlgebra/Matrix/PosDef.lean`).
- Singular values: `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean`).
- C⋆-algebra order: `CFC.monotone_rpow` and `CFC.concaveOn_rpow` for exponents in `[0, 1]`, and
  `CFC.sqrt_le_sqrt` (`Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Order.lean`);
  `CFC.log_monotoneOn` and `CFC.concaveOn_log` (`…/ExpLog/Order.lean`); `CStarAlgebra.inv_le_inv`
  (`Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Order.lean`);
  `CStarAlgebra.convexOn_ringInverse` (`…/Rpow/RingInverseOrder.lean`); `CFC.conjSqrt`
  (`…/Rpow/ConjSqrt.lean`).
- Integral representation of the powers: `Real.rpowIntegrand₀₁`
  (`…/Rpow/IntegralRepresentation.lean`), the model for 4.4.
- Calculus under the functional calculus: `cfc_comp`, and `cfc_integral`
  (`Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Integral.lean`).
- Divided differences: `dslope` (`Analysis/Calculus/DSlope.lean`), the slope off the diagonal and
  `deriv f a` on it.
- Approximation and compactness: Weierstrass approximation `polynomialFunctions_closure_eq_top`
  (`Topology/ContinuousMap/Weierstrass.lean`); `ContDiffBump` for mollifiers
  (`Analysis/Calculus/BumpFunction/Basic.lean`); Arzelà–Ascoli
  `BoundedContinuousFunction.arzela_ascoli` (`Topology/ContinuousMap/Bounded/ArzelaAscoli.lean`).
- Integration: the fundamental theorem `intervalIntegral.integral_eq_sub_of_hasDerivAt`
  (`MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`); Riesz–Markov–Kakutani
  `RealRMK.integral_rieszMeasure` (`MeasureTheory/Integral/RieszMarkovKakutani/Real.lean`).
- Krein–Milman: `closure_convexHull_extremePoints` (`Analysis/Convex/KreinMilman.lean`).

No operator monotone or operator convex predicate exists in Mathlib or Tau Ceti at the pin; Mathlib
has the C⋆-algebra statements for the powers, the logarithm and the square root listed above. This
roadmap defers to Mathlib's names for the general notion when they land and does not wait for
them.

### From Tau Ceti

Paths are relative to `TauCeti/`.

- Geometric mean in a C⋆-algebra setting: `TauCeti.geometricMean`, its symmetry
  `TauCeti.geometricMean_comm`, the Riccati identity
  `TauCeti.geometricMean_mul_ringInverse_mul_geometricMean` and its uniqueness
  `TauCeti.eq_geometricMean_of_mul_ringInverse_mul`, and joint superadditivity
  `TauCeti.geometricMean_add_geometricMean_le`
  (`Analysis/SpecialFunctions/ContinuousFunctionalCalculus/GeometricMean.lean`).
- Matrix specialization: the Riccati uniqueness `Matrix.PosDef.existsUnique_posSemidef_mul_mul`
  (used in 6.1) and `Matrix.isHermitian_geometricMean` (used in 6.4)
  (`Analysis/Matrix/GeometricMean.lean`).
- Pick functions: `TauCeti.nevanlinnaKernel` and the Nevanlinna representation
  `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add`
  (`Analysis/Complex/Pick/Nevanlinna.lean`);
  the Stieltjes–Perron vanishing theorem `TauCeti.measure_Icc_eq_zero_of_eq_nevanlinnaKernel_add`
  and its half-line form `TauCeti.exists_isFiniteMeasure_eq_nevanlinnaKernel_add_of_im_eq_zero`
  (`Analysis/Complex/Pick/Boundary.lean`).

### From other roadmaps

- **OperatorTheory/Majorization.** Part A: Ky Fan sums (MAJ-A26) and the Ky Fan variational upper
  bound (MAJ-A28). Part B: the structure of unitarily invariant seminorms (MAJ-B01), determination
  by singular values (MAJ-B19), Fan dominance (MAJ-B21) and the orthogonal block sums.
  `Suggested.lean` keeps a local copy of the structure, named after the owner's.
- **OperatorTheory/PolarDecomposition.** Eigenvalue monotonicity under the Loewner order
  (PD-A52) and the polar decomposition of square matrices.
- **CStarAlgebras.** Section 1.1, for the compression criterion `pTp ≤ T ↔ Commute p T` that
  pairs with Davis's criterion in 2.1.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Holomorphic functional calculus of general matrices.** The resolvent-contour calculus and its
  derivative for non-normal matrices; nothing here uses it, and it belongs with Banach algebras.
- **Trace inequalities and quantum entropy.** Lieb–Ruskai strong subadditivity, relative entropy
  monotonicity, operator perspectives and the trace inequalities of matrix analysis: a later
  roadmap that consumes Layers 2 and 5.
- **Loewner's theorem on unions of intervals.** The Chandler and Rosenblum–Rovnyak extensions
  (Simon, Thm 1.7 and Thm 1.8, p. 8): extra work on Pick functions with gaps.
- **Finite-order Loewner theory.** The local characterization of `M_n` by Hankel matrices and
  Heinävaara's localization (Simon, Thm 9.3, p. 98): needed only for finite `n`.
- **Operator monotone functions of unbounded operators** and the form order (Simon, Thm 2.9,
  p. 15, in the unbounded sense): requires unbounded functional calculus.
- **The Riemannian manifold of complex positive definite matrices.** The metric tensor
  `g_A(H, K) = tr(A⁻¹HA⁻¹K)` on the complex cone, its Levi-Civita connection and curvature, and
  Cartan–Hadamard; Layer 7 proves the metric statements without the manifold structure, and the
  real cone is ManifoldOptimization's (see Scope and ownership).
- **Norm inequalities beyond Heinz.** Ando's inequalities `‖f(A) - f(B)‖ ≤ ‖f(|A - B|)‖` for
  operator monotone `f` (Simon, Thm 43.1, p. 409) and Zhan's general family (Zhan, Thm 4.24,
  p. 76): natural sequels to Layer 8.

## Prior formalization

No operator monotone or operator convex predicate exists in Mathlib or Tau Ceti at the pin. The
existing partial coverage is: the spectral form of the functional calculus, the Loewner–Heinz
inequality for exponents in `[0, 1]`, the inverse order and the logarithm (Mathlib), and the
Pick-function half of Loewner's theorem and the unweighted geometric mean with its Riccati
characterization, symmetry and inversion (Tau Ceti). Mathlib proves the operator monotonicity
and concavity of `rpow` for exponents in `[0, 1]` through the Loewner-style integral
`Real.rpowIntegrand₀₁`, which is the model for 4.4.

## References

The locators refer to these editions; page numbers are printed page numbers.

- R. Bhatia, *Matrix Analysis*, Graduate Texts in Mathematics 169, Springer, 1997. Chapter V
  (operator monotone and operator convex functions: Sections V.1–V.5) and Chapter IX (Sections
  IX.1 and IX.4, arithmetic–geometric mean inequalities); p. 87 for the weighted
  arithmetic–geometric mean inequality.
- F. Hiai, *Quantum f-Divergences in von Neumann Algebras*, Mathematical Physics Studies,
  Springer, 2021. Appendix D (operator connections and the representation (D.1)).
- R. A. Horn and C. R. Johnson, *Topics in Matrix Analysis*, Cambridge University Press, 1991.
  Section 6.6 (the chain rule for matrix functions, monotone and convex matrix functions).
- J. Jost, *Nonpositive Curvature: Geometric and Analytic Aspects*, Lectures in Mathematics ETH
  Zürich, Birkhäuser, 1997. Chapter 2 (Alexandrov's definition) and Chapter 3 (centers of mass).
- B. Simon, *Loewner's Theorem on Monotone Matrix Functions*, Grundlehren der mathematischen
  Wissenschaften 354, Springer, 2019. Chapters 1–5 (statements, Möbius transfer, Herglotz
  representations, powers, Loewner matrices), 9–11 (convexity and the Hansen–Jensen–Pedersen
  inequality), 36–37 (operator means and the Kubo–Ando theorem), 43 (for Beyond).
- A. Terras, *Harmonic Analysis on Symmetric Spaces — Higher Rank Spaces, Positive Definite
  Matrix Space and Generalizations*, 2nd ed., Springer, 2016. Section 1.1 (the invariant arc
  length and the geodesics of the space of positive definite matrices).
- X. Zhan, *Matrix Inequalities*, Lecture Notes in Mathematics 1790, Springer, 2002. Chapter 1
  (operator monotone functions and positive maps: Thm 1.3, Lemma 1.5, Thm 1.6, Thm 1.7, Cor 1.8)
  and Section 4.3 (arithmetic–geometric mean inequalities).
