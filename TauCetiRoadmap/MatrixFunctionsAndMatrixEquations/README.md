# Roadmap: matrix functions and matrix equations

**Summary.** A scalar function f that has enough derivatives at the eigenvalues of a square
complex matrix A defines a matrix f(A). Two definitions give the same matrix. In the first,
f(A) is p(A) for a polynomial p that agrees with f, and with its derivatives up to the size of
the largest Jordan block, at each eigenvalue. In the second, f acts block by block on the Jordan
form of A. This roadmap builds this primary matrix function and its basic properties. It then
treats power series of matrices, including convergence on the circle of convergence, the
Cauchy integral, and error bounds for approximating f(A).

The roadmap also covers the Fréchet derivative of A ↦ f(A), in the holomorphic case and for
functions of a real variable, and its block formula. It gives the condition number of a
differentiable map and the derivative of a power series in a Banach algebra. Next come the Padé
approximants of the exponential and the backward error of scaling and squaring. For the
Sylvester equation AX − XB = C it gives the spectrum of the operator, solvability, and the
contour and half-line integral solutions. For the Lyapunov equation it gives the stable case,
positivity, and the reachability Gramian with its characterization of controllability. The last
layer turns to nonlinear eigenvalue problems F(λ)v = 0: Jordan chains, complete systems,
Keldysh's theorem for the principal part of F⁻¹, and the block companion linearization of a
matrix polynomial.

The roadmap rests on three roadmaps on main. From
[BanachAlgebras](../BanachAlgebras/README.md) it uses the holomorphic functional calculus with
its Riesz projections, and the Hermite-jet calculus of an operator on a finite-dimensional
space; it identifies the primary matrix function with that calculus wherever both are defined.
From [LinearSystemsAndControl](../LinearSystemsAndControl/README.md) it uses the reachable
subspace and controllability, and the real Lyapunov theory that the complex statements here
extend. From the spectral-subspace perturbation part of
[OperatorTheory](../OperatorTheory/README.md) it uses the Sylvester operator; that roadmap owns
the self-adjoint Sylvester theory, and this one the general non-normal finite-dimensional
case. It follows the matrix conventions of the numerical-analysis roadmap on matrix
factorizations. A model-reduction roadmap consumes the Gramians and the Lyapunov solution for
balanced truncation, and a roadmap on backward error analysis consumes the relative condition
number of a map.

Layer 1 defines the primary function and proves its properties. Layer 2 treats power series,
the Cauchy integral and approximation bounds, and Layer 3 the Fréchet derivative and
conditioning. Layer 4 treats the Padé approximants and scaling and squaring. Layers 5 and 6
treat the Sylvester and Lyapunov equations, and Layer 7 the nonlinear eigenvalue problem. The
roadmap is a synthesis of Higham's monograph on functions of matrices and the survey of Higham
and Al-Mohy. It also draws on Hackbusch on matrix functions and matrix equations, Stewart and
Sun, Higham's book on accuracy and stability, Benner, Gugercin and Willcox, the survey of
Güttel and Tisseur, Demmel, and Baker and Graves-Morris. It follows none of them section by
section.

## How to read the build

Each layer has numbered subsections. Each subsection lists its targets as bold headlines with
their Lean names. A headline that restates a source result carries a source locator with the
printed page. A corollary or adaptation carries a proof route instead. Checks are sanity checks
of the key definitions and theorems.

Layer 1 is the foundation. Layer 2 uses Layer 1, and §2.2 also uses the BanachAlgebras calculus.
Layer 3 uses §§1.3 and 2.2, except §3.2, which is a statement about any map, and §3.3, which
takes place in a Banach algebra. Layer 4 uses Mathlib's exponential, and Layer 3 only through
§3.3. Layer 5 uses Layer 1 only through the spectrum, and §5.2 uses the circle integrals of
§2.2. Layer 6 specializes Layer 5 and uses the controllability notions of
LinearSystemsAndControl. Layer 7 is independent of Layers 2–6.

## Conventions

The shared conventions of the family are those of MatrixFactorizationsAndSparseElimination
(its Conventions and Layer 1). Here they take the following form.

- **Matrices.** Square matrices are `Matrix n n ℂ` over a finite index type with decidable
  equality, and rectangular ones are indexed likewise. Block matrices (`Matrix.fromBlocks`)
  live on a sum of index types and Jordan forms (`Matrix.blockDiagonal'`) on a sigma type, so a
  general index type is used throughout. The family's indexing by `Fin k` is a special case.
- **Norms.** Matrix norms are Mathlib's scoped instances, opened in the statement that uses
  them. Most statements use the spectral norm. A statement about "every submultiplicative norm"
  is made in a complete normed ℂ-algebra 𝔸, and every scoped matrix norm is an instance of
  that. The condition number is `TauCeti.conditionNumber`, which is ‖Z‖ ‖Z⁻¹‖ for invertible
  Z.
- **Spectra and indices.** The spectrum is Mathlib's `spectrum ℂ A`. The index of μ for A
  (`jordanIndex`) is the multiplicity of μ as a root of the minimal polynomial (`minpoly`,
  `Polynomial.rootMultiplicity`). It is the order of the largest Jordan block for μ, and it is
  0 when μ is not an eigenvalue. The spectral radius is Mathlib's `spectralRadius`, in ℝ≥0∞.
- **Functions on the spectrum.** A function on the spectrum is given by a jet, a function
  `jet μ j` standing for the value of the j-th derivative of f at μ. The primary function
  depends only on the jet at eigenvalues μ below the index. For a function f : ℂ → ℂ, the jet
  is given by Mathlib's iterated derivatives. For f : ℝ → ℂ it is given by the real iterated
  derivatives at the real parts.
- **Integrals.** Contour and half-line integrals of matrices are entrywise, as in
  LinearSystemsAndControl. Each half-line integral comes with an integrability conjunct.
- **Indices from zero.** Indices start at zero. The Taylor coefficients of a matrix function at
  λ (`taylorCoeff`) are the j-th derivatives divided by j!. A Jordan chain of length k is
  v 0, …, v (k − 1).
- **Hypotheses.** Every inverse of a matrix carries a unit, determinant or spectral hypothesis
  that makes it a true inverse. Derivatives appear only under a differentiability or holomorphy
  hypothesis. Quantities that can be infinite (radii of convergence, ν_m, the condition number
  of a map) lie in ℝ≥0∞.

## Layer 1: primary matrix functions

### 1.1 Jordan blocks and the index

Sources: [H08, Def. 1.2 and (1.4), p. 3]; [HJ, Thm. 3.1.11, p. 126].

- **Jordan blocks** (`jordanBlock`, `jordanIndex`, `jetToeplitz`). The Jordan block J_k(μ) has
  μ on the diagonal and 1 on the first superdiagonal. The Toeplitz matrix of a jet c of order k
  is upper triangular with entry c (j − i)/(j − i)! at (i, j) for i ≤ j.
- **Polynomials at a Jordan block** (`aeval_jordanBlock`). p(J_k(μ)) is the Toeplitz matrix of
  the normalized derivatives p⁽ʲ⁾(μ)/j! [H08, (1.4), p. 3]. Route: the binomial theorem for
  μ I + N with N the nilpotent shift.
- **The index of a Jordan block** (`spectrum_jordanBlock`). For k > 0 the spectrum of J_k(μ) is
  {μ} and its index is k. Route: the minimal polynomial is (X − μ)ᵏ, since N^(k−1) ≠ 0 = Nᵏ.
- **The Jordan canonical form** (`exists_jordanForm`). Every A is Z J Z⁻¹, where J is block
  diagonal with Jordan blocks of positive order. The index of each ν is the largest order of a
  block for ν, and it is 0 when no block has ν. This restates [H08, Def. 1.2, p. 3] together
  with [HJ, Thm. 3.1.11, p. 126]. Route: decompose ℂⁿ into the generalized eigenspaces
  (`Module.End.maxGenEigenspace`, `Module.End.iSup_maxGenEigenspace_eq_top`). Take a Jordan
  chain basis of the nilpotent part on each (`Module.End.exists_jordanChainBasis`). The largest
  block size is the nilpotence index, which is the root multiplicity in the minimal polynomial
  (BanachAlgebras §2.2).

*Needs:* Mathlib `minpoly`, `Polynomial.rootMultiplicity`, `Module.End.maxGenEigenspace`,
`Module.End.iSup_maxGenEigenspace_eq_top`, `Matrix.blockDiagonal'`; Tau Ceti
`Module.End.exists_jordanChainBasis`; BanachAlgebras §2.2 (largest block size = index).

**Checks.**

- The Jordan block of order 1 is the 1 × 1 matrix μ, and the index of a scalar matrix μ I at μ
  is 1 when the index type is nonempty.
- For p = 3z⁵ − 2z³ + z − 7 and μ = 7/10 + (1/5)i, the identity `aeval_jordanBlock` at k = 4
  holds exactly (symbolic computation).
- For N = J_3(μ) − μ I, the matrix N² is nonzero and N³ = 0, so the index of J_3(μ) is 3.
- Negative control: a matrix with blocks J_2(1), J_1(1), J_1(−1/2) has index 2 at 1, while the
  algebraic multiplicity of 1 is 3. Taking the algebraic multiplicity in place of the index
  would ask for one derivative too many in §1.2.

### 1.2 The primary matrix function

Sources: [H08, Def. 1.1, p. 3; Def. 1.2, p. 3; Def. 1.4, p. 5; Thm. 1.12, p. 8];
[Hb, §14.1, pp. 356–358].

- **Hermite interpolants and the primary function** (`IsHermiteInterpolant`,
  `primaryFunction`, `matrixFunction`). A polynomial r interpolates a jet on the spectrum of A
  when its derivatives below the index agree with the jet at every eigenvalue. The primary
  function `primaryFunction A jet` is r(A) for an interpolant r. An interpolant exists by the
  Hermite-interpolation isomorphism of BanachAlgebras §2.2, so the fallback value 0 never
  occurs. `matrixFunction f A` is the primary function of the jet of iterated derivatives of
  f. This is [H08, Def. 1.4, p. 5], with "defined on the spectrum" [H08, Def. 1.1, p. 3] left
  to the hypotheses of the theorems that use it.
- **Independence of the interpolant** (`primaryFunction_eq_aeval`). Every Hermite interpolant
  gives the primary function [H08, Remark 1.5, p. 6]. Route: two interpolants differ by a
  multiple of the minimal polynomial.
- **Dependence on the jet only below the index** (`primaryFunction_eq_iff`). Two jets give the
  same primary function exactly when they agree at every eigenvalue below the index
  [H08, Thm. 1.14, p. 11]. Route: "if" is the previous headline. For "only if", r(A) = 0 forces
  the minimal polynomial to divide r.
- **The Jordan-form definition** (`primaryFunction_eq_conj_blockDiagonal`). For every Jordan
  form A = Z J Z⁻¹ the primary function is Z f(J) Z⁻¹. Here f(J_k(μ)) is the Toeplitz matrix
  of the jet at μ. This is [H08, Def. 1.2, p. 3] and its equivalence with Def. 1.4
  [H08, Thm. 1.12, p. 8]. Route: `aeval_jordanBlock` for an interpolant, block by block.
- **Agreement with the holomorphic calculus.** For f holomorphic on an open set containing the
  spectrum, `matrixFunction f A` is the value at A of the holomorphic functional calculus of
  BanachAlgebras §2.1. It is also the jet formula of BanachAlgebras §2.2, the sum of
  f⁽ʲ⁾(λ)/j! (A − λ)ʲ P_λ over eigenvalues λ and j below the index. Over a general cycle around
  the spectrum this is the Cauchy integral definition [H08, Def. 1.11, p. 8]. Route: both sides
  are r(A) for a Hermite interpolant, by BanachAlgebras §2.2.

*Needs:* 1.1; BanachAlgebras §2.2 (existence of Hermite interpolants, the jet formula) and §2.1
(the holomorphic calculus, for the agreement headline).

**Checks.**

- Let Z be the 4 × 4 upper bidiagonal matrix with ones on the diagonal and the superdiagonal,
  and A = Z diag(J_2(1), J_1(1), J_1(−1/2)) Z⁻¹, that is, A has rows (1, 1, −1, 1),
  (0, 1, 0, 0), (0, 0, 1, −3/2), (0, 0, 0, −1/2). For f = exp the quadratic Hermite interpolant
  r with r(1) = r′(1) = e and r(−1/2) = e^(−1/2) gives r(A) = Z exp(J) Z⁻¹ exactly (symbolic
  computation), and both agree with SciPy's expm to relative error 1.6e−16.
- Negative control: the linear polynomial that interpolates only the values e at 1 and
  e^(−1/2) at −1/2, ignoring the index 2 at 1, gives a matrix whose largest entry difference
  from exp(A) is 0.48 times the largest entry of exp(A).
- The primary function of the jet of the identity (values μ, 1, 0, …) is A, and that of a
  constant jet c is c I.

### 1.3 Properties

Sources: [H08, Thm. 1.13, pp. 10–11].

- **Commutation** (`commute_primaryFunction`). Every X commuting with A commutes with f(A). In
  particular f(A) commutes with A [H08, Thm. 1.13 (a), (e), pp. 10–11]. Proved in
  `Suggested.lean`: f(A) is a polynomial in A.
- **Transposition** (`primaryFunction_transpose`). f(Aᵀ) = f(A)ᵀ [H08, Thm. 1.13 (b), p. 10].
  Route: Aᵀ has the same minimal polynomial and spectrum, and r(Aᵀ) = r(A)ᵀ.
- **Similarity** (`primaryFunction_conj`). f(Z A Z⁻¹) = Z f(A) Z⁻¹ for invertible Z
  [H08, Thm. 1.13 (c), p. 10]. Route: as for transposition.
- **Spectral mapping** (`spectrum_primaryFunction`). The spectrum of f(A) is the image of the
  spectrum of A under μ ↦ jet μ 0 [H08, Thm. 1.13 (d), p. 10]. Route: the spectral mapping
  theorem for polynomials, and r(μ) = jet μ 0 at every eigenvalue because the index is at
  least 1.
- **Block triangular matrices** (`primaryFunction_fromBlocks_zero₂₁`). f of a block upper
  triangular matrix is block upper triangular, with diagonal blocks f(A₁₁) and f(A₂₂)
  [H08, Thm. 1.13 (f), p. 11]. Route: the index of each diagonal block is at most that of the
  whole matrix, so an interpolant for the whole matrix interpolates for each block.
- **Block diagonal matrices** (`primaryFunction_fromBlocks_diagonal`). f(diag(A₁₁, A₂₂)) =
  diag(f(A₁₁), f(A₂₂)) [H08, Thm. 1.13 (g), p. 11]. Route: the previous headline and its
  transpose.

*Needs:* 1.2; Mathlib `Matrix.fromBlocks`, `spectrum.map_polynomial_aeval`.

**Checks.**

- For the 4 × 4 matrix A of §1.2, the eigenvalues of exp(A) are e^(−1/2) = 0.606531 and e
  (three times).
- For the 6 × 6 block upper triangular matrix with diagonal blocks A (of §1.2) and
  [[0, 1], [−1, 0]] and upper right block with rows (1, 0), (0, 1), (1, 1), (0, 1), SciPy's
  expm has lower-left block exactly 0 and diagonal blocks exp(A) (to 1.7e−16) and the rotation
  [[cos 1, sin 1], [−sin 1, cos 1]].
- Negative control: f(A*) = f(A)* fails for f(z) = iz at A = 1. The transposition property
  does not extend to the conjugate transpose [H08, p. 13].

## Layer 2: power series, the Cauchy integral and approximation

### 2.1 Power series

Sources: [H08, Thm. 4.7, p. 76]; [Hb, Lemma 14.5, p. 357].

- **The series jet** (`seriesJet`). For a power series Σ a_k (z − α)ᵏ, the jet at μ is the sum
  of the series differentiated termwise j times. Off the closed disc of convergence that sum
  diverges and the value is the junk 0, which no statement uses.
- **The convergence criterion** (`summable_smul_sub_pow_iff`). Σ a_k (A − αI)ᵏ is summable
  exactly when every eigenvalue μ satisfies one of two conditions. Either |μ − α| is less than
  the radius of convergence. Or |μ − α| equals the radius and the series differentiated
  index − 1 times is summable at μ. The radius is that of
  `FormalMultilinearSeries.ofScalars`, in ℝ≥0∞. This restates [H08, Thm. 4.7, p. 76],
  with Mathlib's unconditional summability in place of Hensel's ordinary convergence.
  Summability is absolute convergence in finite dimension, and both sides use it. Route:
  reduce to Jordan blocks by `exists_jordanForm`; by `aeval_jordanBlock` the (i, j) entries of
  the partial sums are partial sums of the (j − i)-th derivative series. Absolute convergence
  of the highest derivative series on the circle gives that of the lower ones.
- **The sum** (`hasSum_smul_sub_pow`). When the series is summable, its sum is the primary
  function of the series jet. Route: entrywise on Jordan blocks, as above.

*Needs:* 1.1–1.2; Mathlib `FormalMultilinearSeries.ofScalars`, `FormalMultilinearSeries.radius`,
`Summable`.

**Checks.**

- For a_k = 1/(k + 1)² (radius 1) and A = J_2(1), the (0, 1) entry of the partial sums is the
  harmonic-type sum Σ 1/(k + 2), which grows: 5.84 after 10³ terms and 10.45 after 10⁵. The
  (0, 0) entry tends to π²/6 = 1.6449. So the series diverges, while at J_1(1) it converges.
- Negative control: for a_k = (−1)ᵏ/(k + 1) at J_1(1), the scalar series converges
  conditionally but is not summable. Ordinary convergence and Mathlib's summability differ on
  the circle, and the criterion is stated for summability on both sides.
- Radius 0 and A = αI + N with N nilpotent: the series is a finite sum and is summable. The
  criterion holds through its equality branch, since 0ᵏ vanishes for k ≥ 1.
- For a_k = 1/k!, α = 0 and the 4 × 4 matrix A of §1.2, the partial sum of 40 terms agrees with
  SciPy's expm to 4.5e−16.

### 2.2 The Cauchy integral

Sources: [H08, Def. 1.11 and Thm. 1.12, p. 8]; [Hb, Lemma 14.8, p. 358].

- **The circle formula** (`matrixFunction_eq_circleIntegral`). Let f be holomorphic on a disc,
  continuous on its closure, with the spectrum of A inside the disc. Then f(A) is (2πi)⁻¹ times
  the entrywise contour integral of f(ζ) (ζI − A)⁻¹ over the boundary circle (`circleIntegral`)
  [H08, Def. 1.11, p. 8]. Route: on a Jordan block the resolvent is the Toeplitz matrix of
  (ζ − μ)^(−j−1), and the Cauchy formula for derivatives gives the jet. Over a general cycle,
  the formula is the agreement headline of §1.2.

*Needs:* 1.1–1.2; Mathlib `circleIntegral`, `DiffContOnCl`, the Cauchy integral formula for
derivatives.

**Checks.**

- For f = exp, A = J_3(0.3) and the unit circle, a 4000-point trapezoidal rule reproduces
  exp(A) to 3.8e−15.
- Negative control: with the spectrum outside the disc (A = 2I, unit circle), the integral is
  0 and not e² I. The hypothesis on the spectrum is needed.

### 2.3 Approximation bounds

Sources: [Hb, Thm. 14.10, p. 359; Thm. 14.13, p. 361].

- **The resolvent bound on a circle** (`norm_matrixFunction_sub_le`). In the spectral norm,
  ‖f(A) − g(A)‖ is at most (2π)⁻¹ times the integral over the circle of
  |f − g| ‖(ζI − A)⁻¹‖ |R| dθ [Hb, Thm. 14.13, p. 361]. Route: §2.2 and the norm bound for
  integrals.
- **The diagonalizable bound** (`norm_primaryFunction_sub_le_of_diagonal`). For A = Z diag(d)
  Z⁻¹, ‖f(A) − g(A)‖₂ is at most κ₂(Z) times the largest |f(dᵢ) − g(dᵢ)|
  [Hb, Thm. 14.10, p. 359]. The supremum is over the finite index type and is 0 when it is
  empty.
- **Normal matrices** (`norm_primaryFunction_sub_le_of_isStarNormal`). For normal A the factor
  κ₂(Z) is 1 and the maximum runs over the spectrum. Route: a unitary diagonalization and the
  previous headline.

*Needs:* 2.2; Tau Ceti `TauCeti.conditionNumber`; Mathlib `Matrix.Norms.L2Operator`,
`intervalIntegral.norm_integral_le_integral_norm`.

**Checks.**

- For Z with rows (1, 2, 0), (0, 1, 1), (1, 0, 1) (determinant 3), d = (0.3, −0.2, 0.5),
  f = exp and g = 1 + z + z²/2, the left side of the diagonalizable bound is 0.02627 and the
  right side κ₂(Z) · 0.02372 = 2.879 · 0.02372 = 0.06830.
- In the normal case, A = Q diag(d) Qᵀ with Q the orthogonal matrix with rows (1, 1, 0)/√2,
  (1, −1, 0)/√2, (0, 0, 1), the bound is attained up to rounding: 0.0237213 on both sides,
  because the norm of a normal matrix is its spectral radius.
- For A = J_3(0.3) on the unit circle, the left side of the resolvent bound is 0.1886 and the
  right side 0.4556.
- Negative control: for the Z and d of the first Check, the largest |f(dᵢ) − g(dᵢ)| is 0.02372,
  below the left side 0.02627. The factor κ₂(Z) cannot be dropped for non-normal A.

## Layer 3: the Fréchet derivative and the condition number

### 3.1 The Fréchet derivative

Sources: [H08, Thm. 3.6, p. 58; Thm. 3.8 and (3.16), p. 60].

- **Holomorphic functions** (`exists_hasFDerivAt_matrixFunction`). Let f be holomorphic on an
  open set D containing the spectrum of A. Then X ↦ f(X) is Fréchet differentiable at A. Its
  derivative L is the (1, 2) block of f at the block matrix [[A, E], [0, A]]
  [H08, Thm. 3.8 and (3.16), p. 60]. Route: the spectrum is upper semicontinuous, so f(X) is
  the Cauchy integral of §2.2 near A. Differentiate the resolvent. The block formula is §2.2
  applied to the block matrix.
- **Functions of a real variable** (`realMatrixFunction`,
  `exists_hasFDerivWithinAt_realMatrixFunction`). Let D ⊆ ℝ be open, A have spectrum in D,
  and f : ℝ → ℂ be 2N − 1 times continuously differentiable on D, where N is the order of A.
  Then the derivative exists within the matrices with spectrum in D, with the same block
  formula [H08, Thm. 3.6, p. 58; Thm. 3.8, p. 60]. The source takes perturbations along
  curves inside that set. Route: Mathias's argument. f(X) is p(X) for the Hermite interpolant
  p of f on the spectrum of X ⊕ X, whose block matrix has index at most 2N. Its derivatives up
  to order 2N − 1 depend continuously on X, by the confluent divided differences.

*Needs:* 1.2–1.3, 2.2; Mathlib `HasFDerivAt`, `HasFDerivWithinAt`, `ContDiffOn`,
`Matrix.fromBlocks`, upper semicontinuity of the spectrum.

**Checks.**

- For A with rows (1, 2, 0), (0, 1 + i, 1), (1/2, 0, −1) and E with rows (0, 1, 0), (1, 0, 1),
  (0, 1, 0), the block formula agrees with central differences (h = 10⁻⁶) to 1.1e−9 for exp and
  2.6e−10 for sin.
- For f(x) = x^(5/2), the real-spectrum matrix [[2, 1, 0], [0, 2, 1], [0, 0, 3]] and the same E,
  the block formula agrees with central differences (h = 10⁻⁵) to 7.9e−10.
- Negative control: for f(x) = |x| on D = ℝ and the 1 × 1 matrix A = 0, X ↦ |X| has no
  derivative at 0 within the real matrices. The hypothesis of class C^(2N − 1) = C¹ fails, and
  so does the conclusion.

### 3.2 The condition number

Sources: [H08, (3.2), p. 55; (3.7) and Thm. 3.1, p. 56].

- **The relative condition number** (`relativeCondition`). For a map F between normed spaces,
  the relative condition number at x is the limit superior, as ε → 0⁺, of the largest relative
  change ‖F(x + h) − F(x)‖/(ε‖F(x)‖) over ‖h‖ ≤ ε‖x‖, in ℝ≥0∞ [H08, (3.2), p. 55]. When
  F(x) = 0 every quotient is the junk 0, so the condition number is 0; the source assumes
  F(x) ≠ 0.
- **Rice's formula** (`relativeCondition_eq`). If F has Fréchet derivative L at x, the largest
  relative change converges and the relative condition number is ‖L‖ ‖x‖/‖F(x)‖
  [H08, Thm. 3.1, p. 56]. At F(x) = 0 both sides are the junk value 0, so the statement needs
  no hypothesis F(x) ≠ 0. Route: the sup of ‖L h‖ over the ball of radius r is r‖L‖ over ℝ or
  ℂ, and the remainder is o(ε).

*Needs:* Mathlib `HasFDerivAt`, `ContinuousLinearMap.opNorm`, `Filter.limsup`, `ENNReal.ofReal`.

**Checks.**

- For f = exp at the A of §3.1 in the Frobenius norm, ‖L‖ = 7.2434 (the largest singular value
  of the Kronecker form of L) and the formula gives 3.06034. Along the top right singular
  direction the relative change is 3.05580 at ε = 10⁻³ and 3.06029 at ε = 10⁻⁵.
- At x = 0 both sides are 0: the ball ‖h‖ ≤ 0 contains only h = 0.
- For F(x) = x − 1 on ℝ at x = 1, F(x) = 0: every quotient, the condition number and the right
  side ‖L‖ ‖x‖/‖F(x)‖ = 1/0 are all the junk value 0. A definition that divided by ε‖F(x)‖ only
  when it is nonzero and returned ⊤ otherwise would make the two sides differ there.

### 3.3 Power series in a Banach algebra

Sources: [H08, Problem 3.6, p. 70; Thm. 4.7, p. 76].

- **The derivative of a power series** (`hasFDerivAt_tsum_smul_pow`). In a complete normed
  ℂ-algebra, for ‖x‖ below the radius of convergence, y ↦ Σ a_k yᵏ has derivative E ↦ Σ_k
  a_(k+1) Σ_(j≤k) xʲ E x^(k−j). Its norm is at most Σ (k + 1)|a_(k+1)| ‖x‖ᵏ
  [H08, Problem 3.6, p. 70]. Route: termwise differentiation of a locally uniformly convergent
  series. The norm bound needs no ‖1‖ = 1, since a factor x⁰ only multiplies E.
- **The value bound** (`norm_tsum_smul_pow_le`). With ‖1‖ = 1, ‖Σ a_k xᵏ‖ ≤ Σ |a_k| ‖x‖ᵏ.
  Route: the triangle inequality termwise.

*Needs:* Mathlib `FormalMultilinearSeries.ofScalars`, `HasFDerivAt`, `NormOneClass`,
`norm_tsum_le_tsum_norm`.

**Checks.**

- For exp and the A and E of §3.1, the series formula for L(A, E) truncated at 45 terms agrees
  with the block formula to 2.0e−15. With the Frobenius norm on matrices, which is
  submultiplicative, ‖L‖ = 7.2434 ≤ e^‖A‖_F = 20.934.
- Negative control (Frobenius norm, ‖I‖ = √3 for n = 3): ‖e⁰‖_F = 1.732 > e⁰ = 1, and
  ‖e^(0.1 I)‖_F = 1.914 > e^‖0.1 I‖_F = 1.189. The value bound fails without ‖1‖ = 1.

## Layer 4: Padé approximants of the exponential and scaling and squaring

### 4.1 The Padé approximants

Sources: [H08, §4.4.2, p. 79; (10.23)–(10.24), p. 241]; [BGM, §1.2, pp. 8–10; Thm. 1.4.3,
p. 28]; [HA, (5.3), p. 176].

- **The approximants** (`padeNum`, `padeDen`). p_km(x) is the sum over j ≤ k of
  (k + m − j)! k!/((k + m)! (k − j)! j!) xʲ. q_km(x) = p_mk(−x) [H08, (10.23)–(10.24), p. 241].
- **The order condition** (`le_analyticOrderAt_padeDen_mul_exp_sub_padeNum`). q_km(z) eᶻ −
  p_km(z) vanishes to order at least k + m + 1 at 0 (`analyticOrderAt`)
  [BGM, §1.2, pp. 8–10]; [H08, (4.12), p. 79].
- **Uniqueness** (`eq_padeNum_of_le_analyticOrderAt`). A pair (p, q) with deg p ≤ k,
  deg q ≤ m, q(0) = 1 and the order condition is (p_km, q_km) [BGM, Thm. 1.4.3, p. 28].
  Route: the cross product q p_km − q_km p has degree at most k + m and vanishes to order
  k + m + 1. p_km and q_km are coprime, since the Padé table of exp is normal [BGM, §1.2].

*Needs:* Mathlib `analyticOrderAt`, `Complex.exp`, `Polynomial.natDegree`.

**Checks.**

- [1/1] = (2 + z)/(2 − z) [BGM, Table 1.1.2, p. 8].
- For (k, m) = (0, 0), (1, 0), (0, 1), (1, 1), (2, 3), (3, 3), the coefficients of q eᶻ − p
  vanish through order k + m. The coefficient of order k + m + 1 is
  (−1)ᵐ k! m!/((k + m)! (k + m + 1)!): 1, 1/2, −1/2, −1/12, −1/7200, −1/100800.
- Negative control: without q(0) = 1, the pair (2p_km, 2q_km) satisfies the degree and order
  conditions, so uniqueness needs the normalization.

### 4.2 Scaling and squaring

Sources: [H08, Thm. 10.19, p. 242; (10.29)–(10.31), p. 243; (1.1), p. 2]; [HA, Ω_m and
Lemma 5.1 with (5.4), p. 177].

- **The approximant in a Banach algebra** (`padeRadius`, `padeApprox`, `logOneAdd`,
  `padeResidualCoeff`). ν_m is the least modulus of a zero of q_mm, in ℝ≥0∞. r_m(X) is
  q_mm(X)⁻¹ p_mm(X), with `Ring.inverse`. The logarithm is the series log(1 + G) = Σ_(k≥1)
  (−1)^(k+1) Gᵏ/k [H08, (1.1), p. 2]. c_i is the i-th Taylor coefficient of e^(−x) r_m(x) − 1
  at 0.
- **The residual vanishes to order 2m + 1** (`padeResidualCoeff_eq_zero`). c_i = 0 for i ≤ 2m
  [H08, (10.29), p. 243]. Route: the order condition of §4.1 with k = m.
- **Exactness for a perturbed argument** (`padeApprox_pow_eq_exp`). Put X = 2⁻ˢ A and
  G = e^(−X) r_m(X) − 1, and let ρ(G) < 1. Then r_m(X)^(2ˢ) = e^(A + ΔA), where
  ΔA = 2ˢ log(1 + G), and ΔA commutes with A [HA, Lemma 5.1, p. 177]. As printed, the lemma
  puts A itself in Ω_m and omits the factor 2ˢ in ΔA; the condition is on 2⁻ˢ A, and the
  factor is needed (see the negative control below). The source's second
  condition ρ(X) < ν_m is not needed: if q_mm(X) is not invertible, r_m(X) is the junk 0,
  G = −1 and ρ(G) = 1 in a nonzero algebra. Route: G commutes with X, and the exponential of
  the logarithm series is 1 + G when ρ(G) < 1. So r_m(X) = e^X e^(log(1+G)) = e^(X + log(1+G)),
  then raise to the power 2ˢ.
- **The backward error bound** (`norm_padeBackwardError_le`). Put θ = ‖2⁻ˢ A‖ and
  F = Σ |c_i| θⁱ in ℝ≥0∞, and let F < 1. Then ρ(G) < 1 and ρ(2⁻ˢ A) < ν_m, and
  ‖ΔA‖/‖A‖ ≤ −log(1 − F)/θ, for every submultiplicative norm
  [H08, Thm. 10.19, p. 242; (10.30)–(10.31), p. 243]. The source's θ < ν_m and θ > 0 are not
  needed. F < 1 forces θ < ν_m, because Σ|c_i| tⁱ diverges at the nearest pole t = ν_m. At
  A = 0 both sides are 0. Route: G = Σ c_i Xⁱ for ‖X‖ < ν_m, so ‖G‖ ≤ F, and
  ‖log(1 + G)‖ ≤ −log(1 − ‖G‖).

*Needs:* 4.1, 3.3; Mathlib `NormedSpace.exp`, `spectralRadius`, `Ring.inverse`, the Gelfand
formula `spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius`.

**Checks.**

- ν_1 = 2, ν_2 = 2√3 = 3.4641, ν_3 = 4.6444, ν_7 = 9.9436.
- c_3 = 1/12 for m = 1, and c_7 = 1/100800 for m = 3. All lower coefficients vanish.
- For A with rows (1, 2, 0, 0), (0, 1, 2, 0), (0, 0, 1, 2), (1, 0, 0, 1), s = 3 and m = 3, in the
  spectral norm: θ = 0.35846, F = 7.58e−9, the bound −log(1 − F)/θ is 2.12e−8 and the actual
  ‖ΔA‖₂/‖A‖₂ is 1.41e−8. r_3(X)⁸ and e^(A + ΔA) agree to 1.3e−13, A ΔA − ΔA A is 9.1e−15, and
  ρ(G) = 4.7e−9.
- Negative control: the printed form e^(A + log(1 + G)), without the factor 2ˢ, is off from
  r_3(X)⁸ by 2.0e−7, far above rounding.
- At A = 0, r_m(0) = 1 and G = 0 exactly.

## Layer 5: the Sylvester equation

### 5.1 The Sylvester operator

Sources: [SS, Thm. V.1.3, p. 222; Cor. V.1.4, p. 223]; [H96, (15.1), p. 310; (15.3), p. 311];
[Hb, Lemma 15.1, p. 370].

- **The Sylvester map** (`sylvesterMap`). X ↦ A X − X B on m × n matrices, as the difference
  of `mulLeftLinearMap` and `mulRightLinearMap`. It is the matrix form of
  `ContinuousLinearMap.sylvester`.
- **Its spectrum** (`spectrum_sylvesterMap`). The spectrum is the set of differences λ − μ for
  λ an eigenvalue of A and μ one of B [SS, Cor. V.1.4, p. 223]. Route: the vectorized
  operator I ⊗ A − Bᵀ ⊗ I [H96, (15.3), p. 311]. Triangularize A and Bᵀ simultaneously.
- **Unique solvability** (`bijective_sylvesterMap_iff`). The equation has a unique solution for
  every right side exactly when the spectra are disjoint [SS, Thm. V.1.3, p. 222];
  [Hb, Lemma 15.1, p. 370], with B replaced by −B. Route: the previous headline, since an
  endomorphism of a finite-dimensional space is bijective exactly when 0 is not in its
  spectrum.

*Needs:* 1.1 (triangularization through the Jordan form); Mathlib `mulLeftLinearMap`,
`mulRightLinearMap`, `Matrix.kroneckerMap`, `spectrum`; Tau Ceti `ContinuousLinearMap.sylvester`
(for the identification).

**Checks.**

- For A with rows (1, 1, 0), (0, 2, 1), (0, 0, 3) and B with rows (−1, 1), (0, −2), the
  Kronecker form I ⊗ A − Bᵀ ⊗ I has eigenvalues 2, 3, 3, 4, 4, 5 (symbolic computation), the six
  differences λ − μ.
- Negative control: A = diag(1, 2) and B = diag(2, 3) share the eigenvalue 2, and the
  Kronecker form has determinant 0.
- With m or n empty, the space of matrices is zero, its endomorphism spectrum is empty, the set of
  differences is empty, and the map is bijective.

### 5.2 The contour solution

Sources: [Hb, Lemma 15.4 and (15.4), p. 372].

- **The circle formula** (`sylvesterMap_circleIntegral`). If the spectrum of A lies inside a
  circle and that of B outside the closed disc, the solution of A X − X B = C is (2πi)⁻¹ times
  the entrywise integral of (ζI − A)⁻¹ C (ζI − B)⁻¹ over the circle. This adapts
  [Hb, Lemma 15.4, p. 372], stated for A X + X B = C. Route: A(ζ − A)⁻¹ = ζ(ζ − A)⁻¹ − I and
  the same for B. The two integrals that remain are C and 0, by §2.2 and Cauchy's theorem
  outside the spectrum of B.
- **General cycles.** The same formula holds for any cycle that winds once around the spectrum
  of A and zero times around that of B, with the cycles of BanachAlgebras §2.1. Route: as
  above.

*Needs:* 2.2, 5.1; Mathlib `circleIntegral`, Cauchy's integral theorem on a disc; BanachAlgebras
§2.1 (cycles, for the general-cycle headline).

**Checks.**

- For the A and B of §5.1, C with rows (1, 0), (0, 1), (1, 1) and the circle of centre 2 and
  radius 3/2 (which encloses 1, 2, 3 and leaves −1, −2 outside the closed disc), a 4000-point
  trapezoidal rule gives a largest residual entry |AX − XB − C| of 2.2e−15.
- For scalars a inside and b outside, the formula gives c/(a − b) by the residue at a. With
  the roles reversed it gives 0, so the orientation of the separation matters.

### 5.3 The half-line solution

Sources: [Hb, Lemma 15.1 and Remark 15.2 (c), p. 370].

- **The integral formula** (`sylvesterMap_integral`). Let the eigenvalues of A have positive
  real part and those of B negative real part. Then the integrand e^(−tA) C e^(tB) is
  integrable on (0, ∞), and its integral solves A X − X B = C. This adapts [Hb, (15.3),
  p. 370] from A X + X B = C with B replaced by −B. Route: the integrand decays exponentially
  (bound on e^(−tA) by the Jordan form), and its derivative is −(A Y − Y B) for Y the
  integrand.

*Needs:* 5.1; Mathlib `NormedSpace.exp`, `hasDerivAt_exp_smul_const`,
`MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`, `MeasureTheory.IntegrableOn`.

**Checks.**

- For the A, B and C of §5.2, adaptive quadrature of the half-line integral gives a largest
  residual entry of 2.4e−15.
- For scalars, the integral of e^(−ta) c e^(tb) is c/(a − b), with a = 1 and b = −1 giving c/2.
- Negative control: for a = b = 0 the integrand is the constant c, which is not integrable on
  (0, ∞). The strict real-part conditions are needed for the integrability conjunct.

## Layer 6: the Lyapunov equation and the reachability Gramian

### 6.1 The Lyapunov operator

Sources: [H96, §15.2.1, p. 316]; [SS, Cor. V.1.4, p. 223].

- **Unique solvability** (`bijective_sylvesterMap_neg_conjTranspose_iff`). X ↦ A X + X Aᴴ is
  bijective exactly when λ + μ̄ ≠ 0 for all eigenvalues λ and μ of A [H96, §15.2.1, p. 316].
  Route: §5.1 with B = −Aᴴ, whose spectrum is the negated conjugate of that of A.
- **Hermitian solutions** (`isHermitian_of_lyapunov`), a proved Check. When the operator is
  bijective, the solution for a Hermitian right side is Hermitian: Xᴴ solves the same
  equation, and the operator is injective.

*Needs:* 5.1; Mathlib `Matrix.conjTranspose`, `Matrix.IsHermitian`.

**Checks.**

- Negative control: A = diag(1, −1) has 1 + (−1) = 0, and the Kronecker form of the Lyapunov
  operator has determinant 0.
- For stable A every λ + μ̄ has negative real part, so the operator is bijective.

### 6.2 The stable case

Sources: [BGW, (3.15), p. 501]; [H96, §15.2.1, p. 316].

- **The Lyapunov integral** (`lyapunovIntegral`, `lyapunovIntegral_spec`). Let A be stable,
  that is, let its eigenvalues have negative real part. Then the integrand e^(tA) C e^(tAᴴ)
  is integrable on (0, ∞). Its entrywise integral is the unique solution of
  A X + X Aᴴ + C = 0. This is the complex form of LinearSystemsAndControl §5.2, which treats
  real matrices and the equation Aᵀ P + P A = −Q. Route: as there, with the conjugate
  transpose.
- **Positivity** (`posSemidef_lyapunovIntegral`). For stable A, positive semidefinite
  (definite) C gives a positive semidefinite (definite) solution. Route: xᴴ X x is the integral
  of ‖C^(1/2) e^(tAᴴ) x‖², and for C positive definite the integrand is positive near t = 0.

*Needs:* 5.3, 6.1; LinearSystemsAndControl §5.2 (the real argument followed here); Mathlib
`Matrix.PosSemidef`, `Matrix.PosDef`, `Matrix.exp_conjTranspose`.

**Checks.**

- For A with rows (−1, 2, 0), (0, −1 + i, 1), (0, 0, −2) (eigenvalues −1, −1 + i, −2) and
  C = M Mᴴ with M of rows (1, 0), (1, 1), (0, 1) (positive semidefinite, eigenvalues 0, 1, 3),
  quadrature of the integral gives residual 7.0e−16, Hermitian defect 2.5e−16 and eigenvalues
  0.0521, 0.5718, 4.7345 of the solution.
- Negative control: for A = 0 the integral of C diverges, and the equation 0 = −C has no
  solution for C ≠ 0.

### 6.3 The reachability Gramian

Sources: [BGW, (3.10), p. 500; (3.15), p. 501]; LinearSystemsAndControl §§1.1 and 4.1.

- **The Gramian** (`reachabilityGramian`, `reachabilityGramian_spec`). For stable A and B of
  size n × q, P = ∫₀^∞ e^(tA) B Bᴴ e^(tAᴴ) dt is positive semidefinite. It is the unique
  solution of A P + P Aᴴ + B Bᴴ = 0 [BGW, (3.10), p. 500; (3.15) and the paragraph after it,
  p. 501]. Route: §6.2 with C = B Bᴴ.
- **Controllability** (`reachableSubspace`, `IsControllable`,
  `posDef_reachabilityGramian_iff`). For stable A, P is positive definite exactly when (A, B)
  is controllable in the sense of LinearSystemsAndControl §1.1. Route: as for the finite-time
  Gramian of LinearSystemsAndControl §4.1. xᴴ P x = 0 exactly when x is orthogonal to
  e^(tA) B for all t ≥ 0. Differentiating at t = 0 gives x orthogonal to Aᵏ B for every k.

*Needs:* 6.2; LinearSystemsAndControl §1.1 (definitions, copied) and §4.1 (the real argument
followed here).

**Checks.**

- A = −I, B = e₁ is not controllable. The Gramian is diag(1/2, 0), of rank 1.
- A = [[−1, 1], [0, −2]], B = e₂ is controllable (rank [B, AB] = 2). The Gramian has
  eigenvalues 0.0488 and 0.285, and the residual is 3.5e−15.
- With n empty, the Gramian is the empty matrix, positive definite, and every pair is
  controllable.

## Layer 7: nonlinear eigenvalue problems

### 7.1 Jordan chains

Sources: [GT, Def. 1.1, p. 2; Thm. 2.1, p. 7; Def. 2.3, p. 9].

- **Taylor coefficients and chains** (`taylorCoeff`, `IsJordanChain`, `IsLeftJordanChain`). For
  F holomorphic near λ, the Taylor coefficient F_j is the j-th derivative at λ divided by j!,
  entrywise. A right Jordan chain of length k ≥ 1 has v 0 ≠ 0 and Σ_(j≤i) F_j v (i − j) = 0 for
  i < k. A left chain satisfies the same identities with wᴴ on the left [GT, Def. 2.3, p. 9].
- **Complete systems** (`IsCompleteJordanSystem`). A complete system at λ is d chains whose
  heads form a basis of the kernel of F(λ). Each chain has maximal length among the chains
  whose head lies outside the span of the earlier heads. The lengths are the partial
  multiplicities [GT, Def. 2.3, p. 9].
- **Existence** (`exists_isCompleteJordanSystem`). If F is holomorphic at λ and det F does not
  vanish to infinite order there, a complete system exists, with d the geometric multiplicity.
  Route: chain lengths are bounded by the order of det F at λ [GT, Thm. 2.1, p. 7], and the
  heads are chosen greedily.

*Needs:* Mathlib `iteratedDeriv`, `AnalyticAt`, `analyticOrderAt`, `Matrix.det`,
`LinearIndependent`.

**Checks.**

- For F(z) = J_2(0) − zI, the chain v₀ = e₁, v₁ = e₂ satisfies F(0)v₀ = 0 and
  F(0)v₁ + F′(0)v₀ = 0. The left chain w₀ = −e₂, w₁ = −e₁ satisfies the transposed identities.
- For F(z) = diag(z², z) at 0 the partial multiplicities are 2 and 1, and det F = z³ has order
  3.
- Negative control: F ≡ 0 has chains of every length, and its determinant vanishes to infinite
  order, which the existence theorem excludes.

### 7.2 Keldysh's theorem

Sources: [GT, Thm. 2.5 with (2.4), p. 10; (2.7)–(2.9), pp. 12–13; Thm. 2.8, p. 14].

- **Simple eigenvalues** (`keldysh_simple`). Let F be holomorphic on an open set Ω whose
  eigenvalues in Ω form a finite set Λ, each a simple zero of det F. Then there are right and
  left eigenvectors v_λ, w_λ with w_λᴴ F′(λ) v_λ = 1, and a holomorphic R on Ω, such that
  F(z)⁻¹ = Σ_λ v_λ w_λᴴ/(z − λ) + R(z) off Λ [GT, Thm. 2.8, p. 14, simple case]. Route: the
  local statement below with all lengths 1. The regularity of F that the source assumes
  follows from the finiteness of Λ.
- **One eigenvalue** (`keldysh_local`). For a complete system v at λ there are left chains w
  such that F(z)⁻¹ minus a principal part is holomorphic at λ. The principal part is the sum
  over chains j and 1 ≤ k ≤ m_j of (z − λ)^(−k) Σ_(l ≤ m_j − k) v j l (w j (m_j − k − l))ᴴ
  [GT, Thm. 2.5, p. 10; (2.7)–(2.9), pp. 12–13]. Route: the local Smith form of F at λ
  [GT, Thm. 2.1, p. 7] and the explicit inverse of its diagonal part. The normalization of the
  left chains is (2.4) of [GT].
- **The global form.** On a compact set containing finitely many eigenvalues, F(z)⁻¹ =
  V(zI − J)⁻¹Wᴴ + R(z) with V and W the matrices of all right and left chains and J the Jordan
  matrix of the partial multiplicities [GT, Thm. 2.8, p. 14]. Route: the sum of the local
  statements.

*Needs:* 7.1; Mathlib `AnalyticOnNhd`, `analyticOrderAt`, `Matrix.vecMulVec`, removable
singularities.

**Checks.**

- For F(z) = [[z − 1, z], [1, z² − 4 + z]], det F = (z − 2)(z² + 2z − 2) has three simple zeros.
  The normalized vectors give w_λᴴ F′(λ) v_λ = 1, and F⁻¹ − Σ v_λ w_λᴴ/(z − λ) is exactly 0.
- For F(z) = J_2(0) − zI and the chains of §7.1, the principal part −(I/z + e₁e₂ᵀ/z²) equals
  F⁻¹.
- Negative control: replacing w by −w changes the principal part by −2(I/z + e₁e₂ᵀ/z²). The
  normalization fixes the sign of the left chains.

### 7.3 The block companion linearization

Sources: [GT, (6.18)–(6.20) and Table 6.6, pp. 76–77; Thm. 6.7, p. 78]; [D, Def. 4.10, p. 182;
p. 183].

- **The pencil** (`matrixPolyEval`, `blockCompanionPencil`). P(z) = Σ_(j ≤ ℓ) zʲ D_j with
  ℓ = d + 1. The pencil L(z) has first block row (D₀, …, D_(ℓ−2), D_(ℓ−1) + z D_ℓ). Each lower
  block row i has −zI in block column i − 1 and I in block column i. It is linear in z, over
  any commutative ring. This is a block-column variant of the companion forms of
  [D, p. 183] and [GT, (6.20), p. 77], chosen so that the kernel vectors are b(λ) ⊗ v with
  b(λ) = (1, λ, …, λ^(ℓ−1)). The leading coefficient is folded into the last block column, so a
  polynomial of degree ℓ has a pencil of ℓ block rows.
- **The pencil on b ⊗ v** (`blockCompanionPencil_mulVec`). L(z)(b(z) ⊗ v) = e₁ ⊗ P(z)v. Route:
  multiply out.
- **Determinants** (`det_blockCompanionPencil`). det L(z) = det P(z) over every commutative
  ring. Over K[X] with z = X this is the equality of the two determinant polynomials, so the
  eigenvalues and algebraic multiplicities agree [GT, Thm. 6.7, p. 78]. Route: block
  elimination of the lower block rows, whose diagonal blocks are I.
- **Kernels** (`blockCompanionPencil_mulVec_eq_zero_iff`, `finrank_ker_blockCompanionPencil`).
  Over a field, the kernel of L(λ) consists of the vectors b(λ) ⊗ v with P(λ)v = 0. The
  geometric multiplicities are equal. Route: the lower block rows force x_i = λⁱ x₀, and the
  first block row is then P(λ)x₀.
- **Left vectors** (`vecMul_blockCompanionPencil_eq_zero`). A nonzero left null vector of L(λ)
  has a nonzero first block, and that block is a left null vector of P(λ). Route: the block
  columns from the last to the first express each block of y through the first.

*Needs:* Mathlib `Matrix.det`, `Matrix.mulVec`, `Matrix.vecMul`, `LinearMap.ker`,
`Module.finrank`.

**Checks.**

- For ℓ = 3 and n = 2 with symbolic coefficients, det L − det P expands to 0. L(z)(b ⊗ v) −
  e₁ ⊗ P v is identically 0.
- For P(z) = [[z², 1], [0, z²]] (ℓ = 2), det L = det P = z⁴. rank L(0) = 3 and rank P(0) = 1,
  so both kernels have dimension 1. The left null vector of L(0) is (0, 1, 0, 0), with first
  block (0, 1), a left null vector of P(0).
- For the scalar P(z) = 3z² − 5z − 2, det L = 3z² − 5z − 2.
- With the leading coefficient D_ℓ = 0, P has degree less than ℓ and det L still equals det P.
  The identity needs no regularity.
- Negative control: for the scalar P above and its root λ = 2, b(2) = (1, 2) spans the kernel
  of L(2) = [[−2, 1], [−2, 1]], while the reversed vector (2, 1) is not in it.

## Downstream consumers

- Model reduction by balanced truncation and interpolation consumes the reachability Gramian
  and its characterization (§6.3), the Lyapunov solution (§6.2) and the Sylvester solution
  (Layer 5).
- Exponential integrators for stiff differential equations consume the primary function, the
  series criterion, and the Padé approximants with scaling and squaring (Layers 1, 2 and 4).
- Contour-integral eigensolvers and the analysis of nonlinear eigenvalue algorithms consume
  Keldysh's theorem and the linearization (§§7.2–7.3). Backward error analysis of matrix
  functions consumes the Fréchet derivative and Rice's formula (Layer 3).

## Scope and ownership

The roadmap is complete when Tau Ceti proves every statement of `Suggested.lean` and the prose
targets of the layers above.

Inputs:
- [BanachAlgebras](../BanachAlgebras/README.md) §2.1: the holomorphic functional calculus by
  cycle integrals, its uniqueness, its agreement with polynomials and power series, spectral
  mapping and Riesz projections.
- [BanachAlgebras](../BanachAlgebras/README.md) §2.2, for a finite-dimensional space: the
  generalized eigenspace projections, the Hermite-interpolation isomorphism with truncated
  polynomial rings, the jet formula for holomorphic f, Jordan-chain bases with the largest
  block size equal to the nilpotence index, and similarity transport.
- [LinearSystemsAndControl](../LinearSystemsAndControl/README.md) §1.1, for the reachable
  subspace and controllability. Its §§4.1 and 5.2 give the real finite-time Gramian and the real
  Lyapunov integral, whose arguments §§6.2–6.3 follow for complex matrices and the infinite
  horizon.
- [OperatorTheory](../OperatorTheory/README.md), its SpectralSubspacePerturbation roadmap, Part
  B: the Sylvester operator (B.1) and the self-adjoint and coercive Sylvester theory
  (B.2–B.19).
- Mathlib's generalized eigenspaces, minimal polynomials, exponential, circle integrals,
  analytic order and formal multilinear series.

Owned here:
- the primary matrix function of a jet, its two definitions and their equivalence, and its
  properties for general (non-normal) complex matrices;
- the Jordan form as a matrix statement;
- the convergence criterion for matrix power series on the circle of convergence;
- the circle Cauchy formula for the primary function and the approximation bounds;
- the Fréchet derivative of matrix functions with its block formula, in the holomorphic and the
  real case;
- the relative condition number of a map and Rice's formula, and the derivative of a power
  series in a Banach algebra;
- the Padé approximants of the exponential and the backward error of scaling and squaring;
- the Sylvester and Lyapunov equations for general complex matrices: spectrum, solvability,
  and the contour and integral solutions;
- the infinite-horizon complex reachability Gramian and its characterization of
  controllability;
- Jordan chains of holomorphic matrix functions, complete systems, Keldysh's theorem, and the
  block companion linearization of matrix polynomials.

Not owned:
- the holomorphic functional calculus and the finite-dimensional jet calculus as such
  (BanachAlgebras §§2.1–2.2). §1.2 states the agreement of the primary function with them;
- the Sylvester theory for self-adjoint operators, Rosenblum's theorem and the norm bounds for
  separated spectra (OperatorTheory, SpectralSubspacePerturbation Part B);
- the Daleckii–Krein formula and the Fréchet derivative of `A ↦ cfc f A` on Hermitian matrices
  for f of class C¹
  ([OperatorMonotoneFunctionsAndMatrixMeans](../OperatorMonotoneFunctionsAndMatrixMeans/README.md)
  §3.1); §3.1 here treats general matrices with real spectrum, for f of class C^(2N − 1);
- the real Lyapunov and Stein equations, the finite-time Gramian and the Kalman criteria
  (LinearSystemsAndControl §§1.1–5.5);
- the condition number of a matrix (Tau Ceti's `TauCeti.conditionNumber`) and the conditioning
  of linear systems and eigenvalues (the roadmap ConditioningAndPerturbation, Layers 1–4);
- the φ-functions of exponential integrators on a complete normed algebra (the roadmap
  ExponentialIntegrators, Layer 2);
- the scalar companion pencil of a polynomial of degree at most d in d + 1 rows, with its
  determinant (Tau Ceti's `TauCeti.companionPencil`, `TauCeti.det_companionPencil`); §7.3 is the
  block pencil of a matrix polynomial, of a different shape, and does not use it;
- the shared matrix conventions (MatrixFactorizationsAndSparseElimination, Conventions and
  Layer 1).

Boundary in one sentence: functions of one general complex matrix, linear matrix equations in
two such matrices, and the local theory of holomorphic matrix functions near an eigenvalue are
here. Normal, Hermitian and self-adjoint special cases with norm bounds belong to OperatorTheory
and OperatorMonotoneFunctionsAndMatrixMeans. Real control theory belongs to
LinearSystemsAndControl.

The condition number of a map (§3.2) is general. It is stated here because Layer 3 is its first
use in the family, and the backward-error roadmap of the family consumes it.

## Exact supplier contracts

### From Mathlib

- `Module.End.maxGenEigenspace` and `Module.End.iSup_maxGenEigenspace_eq_top` for the
  generalized eigenspace decomposition; `minpoly` and `Polynomial.rootMultiplicity` for the
  index.
- `Matrix.fromBlocks`, `Matrix.blockDiagonal'`, `mulLeftLinearMap`, `mulRightLinearMap`.
- `circleIntegral`, `FormalMultilinearSeries.ofScalars` with `FormalMultilinearSeries.radius`,
  `NormedSpace.exp`, `spectralRadius`, `analyticOrderAt`, `Ring.inverse`, `Matrix.PosDef`.

### From Tau Ceti

- `TauCeti.conditionNumber`, in `TauCeti/Analysis/Normed/Ring/StableSequence.lean`.
- `Module.End.exists_jordanChainBasis`, in `TauCeti/LinearAlgebra/End/JordanChain/Basic.lean`.
- `ContinuousLinearMap.sylvester`, in `TauCeti/Analysis/InnerProductSpace/Sylvester.lean`.

### From BanachAlgebras

- §2.1: for a complex Banach algebra element with spectrum inside an open set U, the
  holomorphic calculus on germs on U by cycle integrals. It is unital, multiplicative, and
  agrees with polynomials and with power series on discs containing the spectrum.
- §2.2: for an endomorphism T of a finite-dimensional complex normed space, the projections P_λ
  and the indices r_λ. The Hermite-interpolation isomorphism of ℂ[X]/∏(X − λ)^(r_λ) with the
  product of truncated polynomial rings. f(T) = Σ_λ Σ_(j<r_λ) f⁽ʲ⁾(λ)/j! (T − λ)ʲ P_λ for f
  holomorphic near the spectrum. r_λ is the largest Jordan block size.

### From LinearSystemsAndControl

- §1.1: `reachableSubspace A B`, the supremum over k of the ranges of Aᵏ B, and
  `IsControllable A B`, that it is everything. Both are over any field and are copied verbatim
  into `Suggested.lean` with docstrings naming the owner (§6.3).
- §§4.1 and 5.2: the real finite-time Gramian and the real Lyapunov integral, whose arguments
  the routes of §§6.2–6.3 follow; no statement of them is consumed.

### Conventions shared with MatrixFactorizationsAndSparseElimination

- Conventions and Layer 1: the matrix conventions (norms from Mathlib's scoped instances, the
  condition number `TauCeti.conditionNumber` under `IsUnit`, zero-based indices, inverses with a
  hypothesis that makes them genuine), followed here (§2.3 and throughout); no definition is
  copied.

### From OperatorTheory (SpectralSubspacePerturbation)

- B.1: the Sylvester operator `ContinuousLinearMap.sylvester`, X ↦ A X − X B, of which
  `sylvesterMap` is the matrix form.

## Beyond this roadmap

- The local Smith form of a holomorphic matrix function as a standalone theory: uniqueness of
  the partial multiplicities and their sum equal to the order of det F [GT, Thm. 2.1, p. 7].
  The routes of §§7.1–7.2 use only its existence at one point. A roadmap on analytic matrix
  functions would own the rest.
- Structured linearizations (palindromic, symmetric, the vector spaces L₁ and L₂ of
  linearizations) and their conditioning [GT, §6].
- Algorithms for f(A) (Schur–Parlett, the inverse scaling and squaring for the logarithm,
  Newton iterations for the square root and the sign function) and their stability analysis
  [H08, Chs. 5–11].
- The Bartels–Stewart and Hessenberg–Schur algorithms and low-rank methods for large Lyapunov
  equations [H96, Ch. 15]; [BGW, §3].
- The perturbation theory of the Sylvester equation and the separation of two matrices
  [H96, §15.3, p. 318].

## Prior formalization

[lean-NASC](https://github.com/bjbraams/lean-NASC) (Apache-2.0), by the author of this roadmap,
at commit 92a6dba, proves without `sorry` the following entrywise forms of §§1.1 and 2.1, in
`NASC/MatrixFunctions.lean`:
- §1.1: the entries of Jordan blocks, of their powers and of polynomials in them, the entries of
  p(J) being the normalized derivatives (NASC.jordanBlock_apply, NASC.pow_jordanBlock_apply,
  NASC.aeval_jordanBlock_apply, NASC.aeval_jordanBlock_apply_hasseDeriv); this is the content of
  `aeval_jordanBlock` for a single block;
- §2.1: the summability of a power series at a Jordan block, characterized entrywise by the
  derivative series up to the block size (NASC.summable_smul_pow_jordanBlock_iff), the
  Jordan-block step of the route of `summable_smul_sub_pow_iff`.

Its statements of Hermite interpolation, the circle-integral matrix function on a Jordan block,
the derivative block formula, the Sylvester spectrum, the Sylvester and Lyapunov integrals
(`NASC/MatrixFunctions.lean`), Keldysh's theorem at a simple eigenvalue and the block companion
determinant and kernel (`NASC/EigenvalueMethods.lean`) have admitted proofs and are not credited.
The module is a cited source, not the specification.

## References

- [BGM] G. A. Baker, Jr. and P. Graves-Morris, *Padé Approximants*, 2nd ed., Cambridge
  University Press, 1996.
- [BGW] P. Benner, S. Gugercin and K. Willcox, A survey of projection-based model reduction
  methods for parametric dynamical systems, *SIAM Review* 57 (2015), 483–531.
- [D] J. W. Demmel, *Applied Numerical Linear Algebra*, SIAM, 1997.
- [GT] S. Güttel and F. Tisseur, The nonlinear eigenvalue problem, *Acta Numerica* 26 (2017),
  1–94.
- [H96] N. J. Higham, *Accuracy and Stability of Numerical Algorithms*, SIAM, 1996.
- [H08] N. J. Higham, *Functions of Matrices: Theory and Computation*, SIAM, 2008.
- [HA] N. J. Higham and A. H. Al-Mohy, Computing matrix functions, *Acta Numerica* 19 (2010),
  159–208.
- [Hb] W. Hackbusch, *Hierarchical Matrices: Algorithms and Analysis*, Springer, 2015.
- [HJ] R. A. Horn and C. R. Johnson, *Matrix Analysis*, Cambridge University Press, 1985.
- [SS] G. W. Stewart and J.-G. Sun, *Matrix Perturbation Theory*, Academic Press, 1990.
