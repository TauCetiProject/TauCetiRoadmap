# Roadmap: conditioning and perturbation of linear systems and eigenvalues

**Summary.** This roadmap proves the exact-arithmetic perturbation theorems of numerical linear
algebra: how far the solution of a linear system and the eigenvalues of a matrix can move when
the data move, how close an invertible operator is to a non-invertible one, and how small a
change of the data makes an approximate answer exact. The objects are bounded operators on
Banach spaces, square matrices, and elements of C⋆-algebras; the condition number of an
invertible `A` is `κ(A) = ‖A‖ ‖A⁻¹‖`. No rounding model, floating-point format or procedure is a
target: every statement is about the mathematical data.

The headline theorems are these.

- *Perturbed linear systems.* Let `A` be an invertible operator on a Banach space and `ΔA` an
  operator with `‖A⁻¹‖ ‖ΔA‖ < 1`. If `A x = b` and `(A + ΔA) x' = b + Δb`, then
  `‖x' − x‖ ≤ ‖A⁻¹‖ (‖Δb‖ + ‖ΔA‖ ‖x‖) / (1 − ‖A⁻¹‖ ‖ΔA‖)`, and for `x ≠ 0` the relative error
  `‖x' − x‖ / ‖x‖` is at most `κ(A) / (1 − κ(A) ‖ΔA‖/‖A‖)` times
  `‖ΔA‖/‖A‖ + ‖Δb‖/‖b‖`.
- *Distance to singularity (Gastinel–Kahan).* On a nonzero Banach space over `ℝ` or `ℂ`, the
  perturbations `Δ` for which `A + Δ` is not invertible have norms with greatest lower bound
  `1/‖A⁻¹‖`.
- *Bauer–Fike.* If `A` is diagonalized by `V`, that is, `V` carries the coordinate vectors of
  `ℓ^p` to eigenvectors of `A`, then every eigenvalue of `A + Δ` lies within
  `‖V‖ ‖V⁻¹‖ ‖Δ‖` of an eigenvalue of `A`. For a normal element `a` of a C⋆-algebra, every point
  of the spectrum of `a + b` lies within `‖b‖` of the spectrum of `a`.
- *Simple eigenvalues.* If `λ` is a simple eigenvalue of a square matrix `A` over a field, a right
  eigenvector `x` and a left eigenvector `w` (a nonzero row vector with `w A = λ w`) satisfy
  `w x ≠ 0`. Over `ℂ`, writing `w = yᴴ`, for every matrix `E` some eigenvalue of `A + tE` is an
  analytic function of `t` near `0`, equal to `λ` at `0`, with derivative `yᴴ E x / yᴴ x` there.

The roadmap also proves the formulas of Rigal–Gaches and of Oettli–Prager for the normwise and
componentwise backward errors of an approximate solution, and Gershgorin's count of the
eigenvalues in a union of discs that is separated from the other discs.

It builds on Mathlib's normed rings, Neumann series and Hahn–Banach theorem, on its spectral
theory of C⋆-algebras and its Gershgorin theorem; and on Tau Ceti's condition number of a normed
ring, its explicit Neumann-series bounds, its continuity of the roots of polynomials and its
analytic implicit root theorem. The spectral-subspace perturbation theory (Davis–Kahan and its
relatives) belongs to OperatorTheory/SpectralSubspacePerturbation, the self-adjoint analytic
perturbation theory to OperatorTheory/UnboundedOperators, and Weyl's bound for Hermitian matrices
to OperatorTheory/PolarDecomposition; this roadmap treats operators and matrices that need not be
self-adjoint.

Layer 1 below treats linear systems and the distance to singularity; Layer 2 the backward errors;
Layer 3 the inclusion theorems for eigenvalues (Bauer–Fike, normal elements, Gershgorin's count);
Layer 4 simple eigenvalues. Layers 1, 2 and 3 use no other layer, and Layer 4 uses none of them.

## Conventions

- **Scalars and spaces.** `𝕜` is `ℝ` or `ℂ` (an `RCLike` field) where Hahn–Banach is used, and
  any nontrivially normed field in 1.1. Operators are bounded linear maps `E →L[𝕜] E` with the
  operator norm. A Banach space is a complete normed space.
- **Inverses.** `A⁻¹` is Mathlib's `Ring.inverse A`, which is `0` when `A` is not a unit; every
  statement that uses an inverse assumes the operator invertible. In `E →L[𝕜] E` a unit is a
  bounded operator with a bounded inverse.
- **Condition number.** `κ(A)` is Tau Ceti's `TauCeti.conditionNumber A = ‖A‖ ‖A⁻¹‖`, defined in
  any normed ring; it is `0` at a non-unit, a junk value that the statements exclude.
- **Matrices.** Matrices are Mathlib's `Matrix m n K`, vectors `n → K`, `A *ᵥ v` the
  matrix–vector product, `v ᵥ* A` the vector–matrix product and `v ⬝ᵥ w = ∑ᵢ vᵢ wᵢ`. Over a field
  `K`, a left eigenvector of `A` for `λ` is a nonzero `w` with `w ᵥ* A = λ • w`. Over `ℂ` one writes
  `w = yᴴ`: `star y` is the entrywise conjugate, so `star y ⬝ᵥ x = yᴴ x`, and `yᴴ A = λ yᴴ` reads
  `star y ᵥ* A = λ • star y`.
- **Multiplicity.** The eigenvalues of a square matrix over a field are the roots of
  `Matrix.charpoly`, counted with their multiplicity as roots; `λ` is simple when
  `A.charpoly.rootMultiplicity λ = 1`.
- **Coordinates of an eigenbasis.** In Layer 3, `PiLp p (fun _ : ι => ℂ)` is `ℂ^ι` with the
  `ℓ^p` norm, `1 ≤ p ≤ ∞`, and `V : PiLp p (fun _ : ι => ℂ) ≃L[ℂ] E` is a continuous linear
  equivalence; its condition number is `‖V‖ ‖V⁻¹‖`, a mixed norm when `E` carries a norm other
  than `ℓ^p`. A diagonal operator on `ℓ^p` has norm the largest modulus of its diagonal entries,
  which is the only property of the coordinate norm the Bauer–Fike theorem uses.
- **Gershgorin discs.** The disc of row `i` of `A` is the closed disc about `A i i` of radius
  `∑_{k ≠ i} |A i k|`.

## Layer 1: linear systems and the distance to singularity

### 1.1 Perturbed linear systems

Prove `norm_sub_le_of_perturbed_system`: let `E` be a Banach space over a nontrivially normed
field, `A` an invertible operator and `ΔA` an operator with `‖A⁻¹‖ ‖ΔA‖ < 1`. If `A x = b` and
`(A + ΔA) x' = b + Δb`, then

```text
‖x' − x‖ ≤ ‖A⁻¹‖ / (1 − ‖A⁻¹‖ ‖ΔA‖) · (‖Δb‖ + ‖ΔA‖ ‖x‖),
```

and, when `x ≠ 0`,

```text
‖x' − x‖ / ‖x‖ ≤ κ(A) / (1 − κ(A) ‖ΔA‖/‖A‖) · (‖ΔA‖/‖A‖ + ‖Δb‖/‖b‖)
```

(Demmel, Lecture 3 notes, the bound on `norm(dx)/norm(x)`; to first order in the size of the
perturbation, Saad, *Iterative Methods for Sparse Linear Systems*, §1.13.2, equation (1.76),
p. 41).

Route: `A + ΔA` is invertible by Mathlib's `Units.add`, and `(A + ΔA)(x' − x) = Δb − ΔA x`, so
`x' − x = (A + ΔA)⁻¹ (Δb − ΔA x)`. Tau Ceti's `NormedRing.norm_inverse_add_le` gives
`‖(A + ΔA)⁻¹‖ ≤ ‖A⁻¹‖ / (1 − ‖A⁻¹‖ ‖ΔA‖)` (the operator algebra of a nonzero space has
`‖1‖ = 1`; on the zero space both sides vanish). For the relative form, `x ≠ 0` forces the space
to be nonzero, `A ≠ 0` and `b = A x ≠ 0`, and `‖b‖ ≤ ‖A‖ ‖x‖`; the hypothesis reads
`κ(A) ‖ΔA‖/‖A‖ < 1`.

- The same two library facts bound the change of the inverse itself: Mathlib's
  `Ring.inverse_sub_inverse` gives `(A + ΔA)⁻¹ − A⁻¹ = −(A + ΔA)⁻¹ ΔA A⁻¹`, hence
  `‖(A + ΔA)⁻¹ − A⁻¹‖ ≤ ‖A⁻¹‖² ‖ΔA‖ / (1 − ‖A⁻¹‖ ‖ΔA‖)` in every complete normed ring with
  `‖1‖ = 1` (Demmel, Lecture 3 notes, the lemma bounding `norm(inv(A−E) − Z)`).

**Checks.**
- In `ℝ` with `A = 1`, `ΔA = −q` (`0 ≤ q < 1`), `x = b = 1` and `Δb = δ ≥ 0`: `x' = (1 + δ)/(1 − q)`
  and `x' − x = (δ + q)/(1 − q)`, which equals both bounds (`κ = 1`). The bounds are attained.
- The condition number is what the relative bound sees, not the eigenvalues: in the `∞`-norm,
  `A = [[1, 100], [0, 1]]` has both eigenvalues `1` and `κ∞(A) = 101² = 10201`, since
  `A⁻¹ = [[1, −100], [0, 1]]` (Saad, Example 1.5, p. 42, has the family `I + α e₁ eₙᵀ`).
- The hypothesis `‖A⁻¹‖ ‖ΔA‖ < 1` is needed: in `ℝ` with `A = 1`, `ΔA = −1`, the perturbed
  equation `0 · x' = b + Δb` has no solution unless `b + Δb = 0`, and then every `x'` solves it.

*Needs:* Mathlib `Units.add`, `ContinuousLinearMap.le_opNorm`; Tau Ceti
`NormedRing.norm_inverse_add_le`, `TauCeti.conditionNumber`,
`ContinuousLinearMap.norm_le_norm_ringInverse_mul_norm_apply`; for the bound on the inverse also
Mathlib `Ring.inverse_sub_inverse`. (Demmel, Lecture 3 notes; Saad, §1.13.2, p. 41.)

### 1.2 The distance to the non-invertible operators

Prove `isGLB_norm_of_not_isUnit_add`: on a nonzero Banach space `E` over `𝕜 = ℝ` or `ℂ`, for an
invertible operator `A`, the set of norms `‖Δ‖` of operators `Δ` with `A + Δ` not invertible has
greatest lower bound `‖A⁻¹‖⁻¹` (Demmel 1987, Theorem 1, p. 257, attributed there to Gastinel for
an arbitrary norm and to Eckart and Young for the Euclidean one, stated for matrices).

Route. Lower bound: if `‖Δ‖ < ‖A⁻¹‖⁻¹`, then `A + Δ` is a unit by Mathlib's `Units.add`.
Approximation: for `ε > 0` pick `y` with `‖A⁻¹ y‖ ≥ (1 − ε) ‖A⁻¹‖ ‖y‖`, put `x = A⁻¹ y`, take a
functional `g` with `‖g‖ = 1` and `g x = ‖x‖` (Mathlib's `exists_dual_vector`), and set
`Δ z = −(g z / ‖x‖) y`. Then `(A + Δ) x = y − y = 0` with `x ≠ 0`, so `A + Δ` is not injective,
and `‖Δ‖ = ‖y‖ / ‖x‖ ≤ ((1 − ε) ‖A⁻¹‖)⁻¹`. On a nonzero space `‖A⁻¹‖ > 0`.

- In finite dimension the greatest lower bound is a minimum: some `Δ` with `‖Δ‖ = ‖A⁻¹‖⁻¹`
  makes `A + Δ` singular (Demmel 1987, Theorem 1 and its proof, p. 257). The `Δ` with `A + Δ`
  not invertible form a nonempty closed set (Mathlib's `nonunits.isClosed`, translated by `A`;
  `Δ = −A` belongs to it), the space of operators is finite-dimensional and hence proper, and a
  nonempty closed subset of a proper space contains a point nearest to `0`
  (`IsClosed.exists_infDist_eq_dist`); its norm is the greatest lower bound above.
- In terms of Tau Ceti's approximation numbers, for `d = dim E ≥ 1` the previous item says that
  the approximation number of index `d − 1` of `A` (the distance from `A` to the maps of rank at
  most `d − 1`) equals `‖A⁻¹‖⁻¹`, since a map of rank at most `d − 1` is exactly a singular one.
  The inequality `‖A⁻¹‖⁻¹ ≤ a_(d−1)(A)` is also Tau Ceti's coercive lower bound
  `ContinuousLinearMap.le_singularValue_of_lt_rank` applied to the whole space.

**Checks.**
- On the zero space every operator is invertible, the set is empty and no real number is its
  greatest lower bound: the hypothesis that `E` is nonzero is needed.
- For `A = 2 · 1` on any nonzero space: `‖A⁻¹‖⁻¹ = 2`, and `Δ = −2 · 1` attains it; a `Δ` of norm
  below `2` leaves `A + Δ` invertible.
- `A = [[1, 1], [0, 1]]`: in the `∞`-norm `‖A⁻¹‖∞ = 2`, and `Δ = [[−1/2, 0], [1/2, 0]]` has
  `‖Δ‖∞ = 1/2` and `A + Δ = [[1/2, 1], [1/2, 1]]` singular. In the Euclidean norm the distance is
  the smallest singular value `(√5 − 1)/2 ≈ 0.618`. The two norms give different distances, so a
  statement in one norm does not give the other.

*Needs:* Mathlib `Units.add`, `exists_dual_vector`, `ContinuousLinearMap.smulRight`,
`ContinuousLinearMap.le_opNorm`; for the minimum in finite dimension also `nonunits.isClosed`,
`FiniteDimensional.complete`, `IsClosed.exists_infDist_eq_dist`. (Demmel 1987, Theorem 1,
p. 257, for matrices; the Banach-space form is proved here.)

### Examples

- For a diagonal matrix `diag(d₁, …, dₙ)` with nonzero entries, in any `ℓ^p` operator norm,
  `κ = max |dᵢ| / min |dᵢ|`, and replacing a smallest `dᵢ` by `0` gives a nearest singular
  matrix.

### Dependencies

1.1 uses Mathlib's `Units.add` and Tau Ceti's `NormedRing.norm_inverse_add_le` and condition
number. 1.2 uses Mathlib's `Units.add` and Hahn–Banach theorem, and in finite dimension the
closedness of the non-units. No other layer is used.

## Layer 2: backward errors

### 2.1 The normwise backward error

Prove `isLeast_normwise_backwardError`: let `X` and `Y` be normed spaces over `𝕜 = ℝ` or `ℂ`,
`A : X →L[𝕜] Y`, `y ∈ X`, `b ∈ Y`, and let `α, β ≥ 0` be tolerances such that
`α ‖y‖ + β = 0` only when `y` already solves `A y = b`. The least `ε ≥ 0` for which some `ΔA` and
`Δb` with `‖ΔA‖ ≤ ε α` and `‖Δb‖ ≤ ε β` make `y` an exact solution, `(A + ΔA) y = b + Δb`, is
`‖b − A y‖ / (α ‖y‖ + β)`, read as `0` when `α ‖y‖ + β = 0`. This is the formula of Rigal and
Gaches; with `α = ‖A‖` and `β = ‖b‖` it is the relative normwise backward error.

Route: any admissible pair gives `b − A y = ΔA y − Δb`, of norm at most `ε (α ‖y‖ + β)`. With
`r = b − A y` and `δ = (α ‖y‖ + β)⁻¹`, take a functional `g` with `‖g‖ = 1` and `g y = ‖y‖`
(`exists_dual_vector`, for `y ≠ 0`), `ΔA z = δ α g(z) r` and `Δb = −δ β r`; for `y = 0` take
`ΔA = 0` and `Δb = −r`; when `α ‖y‖ + β = 0`, `r = 0` and `ε = 0` is admissible with `ΔA = 0`,
`Δb = 0`.

- Two special cases are classical: `β = 0` with the Euclidean norm (Demmel, Lecture 3 notes, the
  theorem on the smallest `E` with `(A + E) x' = b`: its norm is `‖r‖ / ‖x'‖`), and the
  eigenpair case `Y = X`, `A − γ`, `b = 0`, `α = 1`, `β = 0`: the least `‖ΔA‖` making a unit
  vector `u` an eigenvector of `A − ΔA` for `γ` is `‖A u − γ u‖` (Saad, *Numerical Methods for
  Large Eigenvalue Problems*, Proposition 3.4, p. 66).

**Checks.**
- In `ℝ` with `A = 1`, `y = 1`, `b = 3`, `α = β = 1`: `r = 2` and the backward error is `1`,
  attained by `ΔA = 1`, `Δb = −1`, since `(1 + 1) · 1 = 3 − 1`.
- With `α = β = 0` and `r ≠ 0` no `ε` works and the set is empty: the hypothesis tying a zero
  denominator to `A y = b` is needed. With `α = β = 0` and `r = 0` every `ε ≥ 0` works and the
  least is `0`, the value of the formula with `0/0` read as `0`.
- With `y = 0`, `β > 0`: the perturbation of `A` has no effect and the value is `‖b‖ / β`.

*Needs:* Mathlib `exists_dual_vector`, `ContinuousLinearMap.smulRight`,
`ContinuousLinearMap.le_opNorm`. (Attributed to Rigal and Gaches; proved here. Demmel, Lecture 3
notes, and Saad, Proposition 3.4, p. 66, for the special cases above.)

### 2.2 The componentwise backward error

Prove `isLeast_componentwise_backwardError`: let `A` be an `m × n` matrix over `𝕜 = ℝ` or `ℂ`,
`y ∈ 𝕜^n`, `b ∈ 𝕜^m`, and let `E ≥ 0` (an `m × n` real matrix) and `f ≥ 0` (a real vector) be
entrywise tolerances such that every row `i` with `(E |y| + f)ᵢ = 0` has residual
`(b − A y)ᵢ = 0`. The least `ε ≥ 0` for which some `ΔA`, `Δb` with `|ΔA i j| ≤ ε E i j` and
`|Δb i| ≤ ε f i` give `(A + ΔA) y = b + Δb` is `maxᵢ |(b − A y)ᵢ| / (E |y| + f)ᵢ`, a row with zero
denominator contributing `0`, and `0` when there are no rows. This is the theorem of Oettli and
Prager; with `E = |A|` and `f = |b|` it is the componentwise relative backward error.

Route: row `i` of an admissible pair gives `|rᵢ| ≤ ε (E |y| + f)ᵢ`. With
`dᵢ = rᵢ / (E |y| + f)ᵢ` (and `dᵢ = 0` on a row with zero denominator), take
`ΔA i j = dᵢ E i j · conj(y j)/|y j|` (and `0` when `y j = 0`) and `Δb i = −dᵢ f i`; then
`(ΔA y − Δb)ᵢ = dᵢ (E |y| + f)ᵢ = rᵢ` on every row.

- The hypothesis on the rows with zero denominator is the convention usually attached to the
  formula, which reads `0/0` as `0` and assigns the value `∞` when `rᵢ ≠ 0`; Lean's division
  gives the first case, and a real-valued statement leaves out the second, in which no `ε`
  works.

**Checks.**
- `A = I₂`, `y = (1, 1)`, `b = (2, 1)`, `E = |A|`, `f = |b|`: `r = (1, 0)`,
  `E |y| + f = (3, 2)`, and the value is `1/3`. The relative normwise error of 2.1 in the
  `∞`-norms is `‖r‖∞ / (‖A‖∞ ‖y‖∞ + ‖b‖∞) = 1/3` as well.
- A zero row is allowed: `A = [[1, 0], [0, 0]]`, `y = (1, 1)`, `b = (2, 0)`, `E = |A|`, `f = |b|`
  gives `E |y| + f = (3, 0)` and `r = (1, 0)`; the value is `1/3`, attained with `ΔA` and `Δb`
  zero on the second row.
- A row with `(E |y| + f)ᵢ = 0` and `rᵢ ≠ 0` cannot be repaired by any admissible perturbation,
  so the set is empty: the hypothesis on such rows is needed.
- Nonnegativity of `E` is needed: if `E i j < 0` at an index with `y j = 0`, row `i` can keep
  `(E |y| + f)ᵢ > 0`, but `|ΔA i j| ≤ ε E i j` is impossible for `ε > 0`, so the set is contained
  in `{0}` while the formula can be positive. The same holds for `f`.
- With no rows the conditions are empty, the least `ε` is `0`, and the supremum over the empty
  index set is `0` in Mathlib.

*Needs:* Mathlib `Matrix.mulVec`, `iSup`, `ciSup_le` and `le_ciSup` for the maximum over a finite
index set. (Attributed to Oettli and Prager; proved here.)

### Examples

- For `y = 0` both backward errors measure only the right-hand side: 2.1 gives `‖b‖ / β` and 2.2
  gives `maxᵢ |bᵢ| / fᵢ`, a row with `fᵢ = 0` (where then `bᵢ = 0`) contributing `0`.

### Dependencies

2.1 uses Mathlib's Hahn–Banach theorem; 2.2 uses only finite sums and maxima. No other layer is
used.

## Layer 3: inclusion of eigenvalues

### 3.1 The Bauer–Fike theorem

Prove `exists_norm_sub_le_cond_mul_norm_of_mem_spectrum`: let `E` be a complex normed space,
`A` an operator on `E`, `ι` a finite type, `1 ≤ p ≤ ∞`, and `V : ℓ^p(ι) ≃L E` a continuous linear
equivalence sending the `i`-th coordinate vector to an eigenvector of `A` with eigenvalue
`lam i`. For every operator `Δ`, every `μ` in the spectrum of `A + Δ` satisfies

```text
|lam i − μ| ≤ ‖V‖ ‖V⁻¹‖ ‖Δ‖
```

for some `i` (Bauer and Fike; Saad, *Numerical Methods for Large Eigenvalue Problems*,
Theorem 3.6, p. 59, proves the residual form below for `ℂ^n` with the Euclidean norm and `p = 2`).

Route: `E` is finite-dimensional, being isomorphic to `ℂ^ι`, hence complete. If `μ = lam i` for
some `i` there is nothing to prove. Otherwise `A − μ = V (D − μ) V⁻¹` with `D` the diagonal
operator of the `lam i`, and `‖(D − μ)⁻¹‖ = (minᵢ |lam i − μ|)⁻¹` on `ℓ^p`, so
`‖(A − μ)⁻¹‖ ≤ ‖V‖ ‖V⁻¹‖ / minᵢ |lam i − μ|`. If `‖V‖ ‖V⁻¹‖ ‖Δ‖ < minᵢ |lam i − μ|`, then
`A + Δ − μ = (A − μ) + Δ` is invertible by Mathlib's `Units.add`, and `μ` is not in the spectrum.

- Residual form: for every `u ∈ E` with `‖u‖ = 1` and every `μ ∈ ℂ` some `i` satisfies
  `|lam i − μ| ≤ ‖V‖ ‖V⁻¹‖ ‖A u − μ u‖` (Saad, Theorem 3.6, p. 59, Euclidean case). It follows
  from the theorem with the rank-one `Δ z = −g(z) (A u − μ u)`, `g` a functional with `‖g‖ = 1`
  and `g u = 1` (`exists_dual_vector`): then `(A + Δ) u = μ u` and `‖Δ‖ = ‖A u − μ u‖`.
- When `ι` is empty, `E` is zero, every operator is invertible, the spectrum is empty and the
  statement is vacuous.

**Checks.**
- `A = [[1, 100], [0, 2]]` is diagonalized by `V = [[1, 100], [0, 1]]` (eigenvalue `1` on `e₁`,
  eigenvalue `2` on `(100, 1)`), with `κ∞(V) = 101² = 10201` and Euclidean condition number
  about `10002`.
- With these `A` and `V` and `Δ = [[0, 0], [0.01, 0]]`, the eigenvalues of `A + Δ` are
  `3/2 ± √(1/4 + 1) = (3 ± √5)/2`, about `0.382` and `2.618`: each has moved by about `0.618`,
  about 62 times `‖Δ‖`, within the bound `102.01` in the `∞`-norm. For a normal matrix with the
  same eigenvalues the move would be at most `0.01` (3.2).
- In the residual form, `u = e₁` and `μ = 1` give the residual `0` and the eigenvalue `1` itself.

*Needs:* Mathlib `PiLp`, `WithLp.toLp`, `ContinuousLinearEquiv`, `ContinuousLinearMap.le_opNorm`,
`Units.add`, `FiniteDimensional.complete`; the norm of a diagonal operator on `ℓ^p`, proved here
from `PiLp.norm_eq_sum` and `PiLp.norm_eq_ciSup`; for the residual form also
`exists_dual_vector`. (Bauer and Fike; Saad, Theorem 3.6, p. 59, Euclidean residual case; the
`ℓ^p` and mixed-norm form is proved here.)

### 3.2 Perturbation of normal elements

Prove `exists_mem_spectrum_norm_sub_le_of_isStarNormal`: in a C⋆-algebra, if `a` is normal and
`b` is any element, every `μ` in the spectrum of `a + b` lies within `‖b‖` of some point of the
spectrum of `a`. For complex matrices with the Euclidean operator norm this is the Bauer–Fike
theorem for a unitarily diagonalizable `A`, whose eigenvector matrix has condition number `1`
(Saad, Corollary 3.3, p. 61, gives the residual form for Hermitian matrices).

Route: if every point of the spectrum of `a` were at distance more than `‖b‖` from `μ`, then,
the spectrum being compact, `a − μ` would be invertible and normal, and `‖(a − μ)⁻¹‖` would be
its spectral radius, the largest `|l − μ|⁻¹` over the spectrum (Mathlib's
`IsStarNormal.spectralRadius_eq_nnnorm` and `spectrum.map_inv`), which is less than `‖b‖⁻¹`;
then `a + b − μ = (a − μ) + b` would be invertible by `Units.add`.

- The algebra of operators on a finite-dimensional complex inner product space is a C⋆-algebra,
  and there the spectrum of a normal `A` is the set of eigenvalues of an orthonormal eigenbasis
  (Tau Ceti's `LinearMap.exists_orthonormalBasis_apply_eq_smul_of_isStarNormal`).

**Checks.**
- Normality is needed: `a = [[0, 1], [0, 0]]` and `b = [[0, 0], [δ, 0]]` with `0 < δ < 1` give
  `a + b` the eigenvalues `±√δ`, at distance `√δ > δ = ‖b‖` from the spectrum `{0}` of `a`.
- For `a` self-adjoint and `b` self-adjoint, the bound also follows from Weyl's inequality; the
  statement here allows any `b`, for instance `a = 0` and `b = [[0, δ], [0, 0]]`, where it gives
  the spectrum `{0}` of `b`, within `δ` of `0`.

*Needs:* Mathlib `CStarAlgebra`, `IsStarNormal.spectralRadius_eq_nnnorm`, `spectrum.map_inv`
(spectral mapping for the inverse), `spectrum.isCompact`, `Units.add`, `spectrum.nonempty`.
(Saad, Corollary 3.3, p. 61, Hermitian residual case; the C⋆-algebra statement is proved here.)

### 3.3 Gershgorin's count

Prove `card_roots_charpoly_filter_mem_gershgorinDiscs`: let `A` be a complex square matrix and
`I` a set of row indices such that every Gershgorin disc of a row in `I` is disjoint from every
Gershgorin disc of a row outside `I`. Then the union `S` of the discs of the rows in `I` contains
exactly `#I` eigenvalues of `A`, counted with algebraic multiplicity (Saad, Theorem 3.12, p. 78).

Route: let `A(t) = D + t H` for `t ∈ [0, 1]`, with `D` the diagonal and `H` the off-diagonal part
of `A`. The discs of `A(t)` have the same centres and radii scaled by `t`, so they lie inside
those of `A`, and by Gershgorin's theorem (Mathlib's `eigenvalue_mem_ball`) every root of
`charpoly A(t)` lies in `S` or in the union `S′` of the other discs. These are disjoint compact
sets, at some distance `δ > 0` (any `δ > 0` if one of them is empty). The coefficients of
`charpoly A(t)` are polynomials in `t` and its degree is `n`, so by Tau Ceti's continuity of
roots (`Polynomial.eventually_rel_roots_norm_sub_lt`, with `ε = δ`) the roots of `charpoly A(s)`
for `s` near `t` are matched, with multiplicity, to those of `charpoly A(t)` at distance less than
`δ`; matched roots lie on the same side, so the number of roots in `S` is locally constant on
`[0, 1]`, hence constant. At `t = 0` the roots are the diagonal entries, and `A i i` lies in `S`
exactly when `i ∈ I`, since `A j j ∈ S′` for `j ∉ I`; the count is `#I`. Rouché's theorem on small
circles about the roots (Tau Ceti's `TauCeti.rouche`) gives the same local constancy.

**Checks.**
- `A = [[0, 1], [1, 10]]`: the discs `|z| ≤ 1` and `|z − 10| ≤ 1` are disjoint and the
  eigenvalues `5 ± √26`, about `−0.099` and `10.099`, lie one in each.
- The disjointness is needed: `A = [[0, 1], [−1, 0]]` has both discs `|z| ≤ 1`, and with
  `I = {first row}` the union contains both eigenvalues `±i`, two rather than one.
- With `I` empty the count is `0`; with `I` all rows it is `n`, the degree of the characteristic
  polynomial, every root lying in the union of all discs.

*Needs:* Mathlib `eigenvalue_mem_ball`, `Matrix.charpoly`, `Matrix.charpoly_degree_eq_dim`,
`Polynomial.roots`, `Matrix.mem_spectrum_iff_isRoot_charpoly`, `Matrix.spectrum_toLin'`,
`Module.End.hasEigenvalue_iff_mem_spectrum`, `IsAlgClosed.card_roots_eq_natDegree`; Tau Ceti
`Polynomial.eventually_rel_roots_norm_sub_lt` (or `TauCeti.rouche`). (Saad, Theorems 3.11 and
3.12, pp. 77–78.)

### Examples

- A diagonal matrix plus a perturbation `Δ` with zero diagonal: 3.3 places one eigenvalue in each
  disc about a diagonal entry whose disc is separated from the others, while 3.1 with `V = I` and
  `p = ∞` places every eigenvalue within `‖Δ‖∞` of a diagonal entry.

### Dependencies

3.1 uses Mathlib's `ℓ^p` spaces and `Units.add`. 3.2 uses Mathlib's spectral theory of
C⋆-algebras. 3.3 uses Mathlib's Gershgorin theorem and Tau Ceti's continuity of roots. No other
layer is used.

## Layer 4: simple eigenvalues

### 4.1 Left and right eigenvectors of a simple eigenvalue

Prove `dotProduct_ne_zero_of_rootMultiplicity_eq_one`: let `λ` be a simple eigenvalue of a square
matrix `A` over a field `K`. If `x ≠ 0` satisfies `A x = λ x` and `w ≠ 0` satisfies `w A = λ w`,
then `w x ≠ 0` (Saad, *Numerical Methods for Large Eigenvalue Problems*, §3.3.1, p. 71, where it
is recalled for complex matrices with `w = yᴴ`; Example 1.2, p. 17, normalizes `wᴴ u = 1` for a
simple eigenvalue).

Route: since `λ` is simple, the generalized eigenspace of `λ` has dimension `1` (Mathlib's
`LinearMap.finrank_maxGenEigenspace_eq`: its dimension is the root multiplicity). So `x` does
not lie in the range of `A − λ`: otherwise `x = (A − λ) z` gives `(A − λ)² z = 0` with `z` not a
multiple of `x`, and the generalized eigenspace would have dimension at least `2`. The kernel of
`A − λ` is the line through `x`, so its range has dimension `n − 1`, and `w` vanishes on it; if
`w x = 0` as well, `w` vanishes on all of `K^n` and `w = 0`.

**Checks.**
- Simplicity is needed: the Jordan block `[[0, 1], [0, 0]]` has `x = e₁`, `w = e₂` and
  `w x = 0`.
- `A = [[1, 100], [0, 2]]` over `ℂ` and `λ = 1`: `x = e₁`, `w = yᴴ` with `y = (1, −100)`,
  `yᴴ x = 1`.
- No conjugation is involved: over `𝔽₂`, `A = [[1, 1], [0, 0]]` has the simple eigenvalue `1`
  (characteristic polynomial `t (t − 1)`), with `x = e₁`, `w = (1, 1)` and `w x = 1`.

*Needs:* Mathlib `Matrix.charpoly`, `Polynomial.rootMultiplicity`,
`Module.End.maxGenEigenspace`, `LinearMap.finrank_maxGenEigenspace_eq`,
`LinearMap.finrank_range_add_finrank_ker`. (Saad, §3.3.1, p. 71.)

### 4.2 First-order perturbation of a simple eigenvalue

Prove `exists_eigenvalue_branch_hasDerivAt`: with `A` a complex square matrix, `λ` a simple
eigenvalue, `x ≠ 0` with `A x = λ x` and `y ≠ 0` with `yᴴ A = λ yᴴ`, and any complex matrix `E`,
there is a function `f : ℂ → ℂ`, analytic at `0`, with `f(0) = λ`, `f(t)` an eigenvalue of
`A + t E` for every `t` near `0`, and

```text
f'(0) = yᴴ E x / yᴴ x
```

(Saad, §3.3.1, pp. 70–71, and the analyticity of a simple eigenvalue branch, §3.1.5, p. 57).

Route: `p(t, z) = det(z − A − t E)` is a polynomial in `z` whose coefficients are polynomials in
`t`, so it is jointly analytic (Tau Ceti's
`TauCeti.Polynomial.analyticAt_eval_of_analyticAt_coeff`),
with `p(0, λ) = 0` and `∂p/∂z (0, λ) = charpoly′(λ) ≠ 0` since `λ` is a simple root. Tau Ceti's
analytic implicit root theorem (`AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`) gives `f`
analytic at `0` with `f(0) = λ` and `p(t, f(t)) = 0` for `t` near `0`; differentiating,
`f′(0) = −(∂p/∂t) / (∂p/∂z)` at `(0, λ)`. By Jacobi's formula at the singular matrix `λ − A`
(Tau Ceti's `Matrix.fderiv_det_apply_adjugate`), `∂p/∂z = tr adj(λ − A)` and
`∂p/∂t = −tr(adj(λ − A) E)`. Since `(λ − A) adj(λ − A) = adj(λ − A) (λ − A) = 0` and the kernel
and left kernel of `λ − A` are the lines through `x` and `yᴴ`, `adj(λ − A) = c x yᴴ`, with
`c yᴴ x = charpoly′(λ) ≠ 0`; hence `f′(0) = yᴴ E x / yᴴ x`, whose denominator 4.1 also shows to be
nonzero.

- Consequence, by Cauchy–Schwarz: in Euclidean norms `|f′(0)| ≤ ‖E‖ ‖x‖ ‖y‖ / |yᴴ x|`, with
  equality for `E = y xᴴ / (‖x‖ ‖y‖)`. The factor `‖x‖ ‖y‖ / |yᴴ x|`, the reciprocal of the
  cosine of the angle between `x` and `y`, is the condition number of the eigenvalue (Saad,
  Definition 3.1, p. 71); for a normal matrix one may take `y = x`, and it is `1`.

**Checks.**
- `A = [[1, 100], [0, 2]]`, `λ = 1`, `E` the matrix unit at position `(2, 1)`: the eigenvalues of
  `A + t E` are `3/2 ± √(1/4 + 100 t)`, and the branch through `1` has derivative `−100` at `0`;
  the formula gives `yᴴ E x / yᴴ x = −100` with `y = (1, −100)`. The condition number is
  `√(1 + 100²) ≈ 100.005`.
- Simplicity is needed: for the Jordan block `[[0, 1], [0, 0]]` and `E` the matrix unit at
  `(2, 1)`, the eigenvalues of `A + t E` are `±√t`, and no branch is differentiable at `0`.
- `x ≠ 0` and `y ≠ 0` are needed: with `y = 0` both sides of the quotient are `0`, and Lean's
  `0/0 = 0` would assert the false value `f′(0) = 0` in the example above.

*Needs:* 4.1; Mathlib `Matrix.charpoly`, `Polynomial.rootMultiplicity`, `Matrix.adjugate`; Tau
Ceti `TauCeti.Polynomial.analyticAt_eval_of_analyticAt_coeff`,
`AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`, `Matrix.fderiv_det_apply_adjugate`.
(Saad, §3.3.1, pp. 70–71.)

### Examples

- For a Hermitian `A` and Hermitian `E`, one may take `y = x`, and 4.2 gives
  `f′(0) = xᴴ E x / xᴴ x`, the first-order term that OperatorTheory/UnboundedOperators 5.5 proves
  for self-adjoint families.

### Dependencies

4.2 uses 4.1. Both use Mathlib's characteristic polynomial; 4.2 also Tau Ceti's analytic implicit
root theorem and Jacobi's formula. No other layer is used.

## Scope and ownership

This roadmap owns the theorems stated above: the perturbation bound for solutions of linear
systems on Banach spaces, absolute and relative; the distance from an invertible operator to the
non-invertible ones on Banach spaces, with its attainment in finite dimension; the normwise and
componentwise backward error formulas; the Bauer–Fike theorem for `ℓ^p` eigenvector coordinates,
with its residual form; the spectral perturbation bound for normal elements of a C⋆-algebra;
Gershgorin's count of eigenvalues in separated discs; the non-orthogonality of left and right
eigenvectors of a simple eigenvalue and the first-order perturbation of such an eigenvalue.

Already in the libraries and therefore not targets:

- Tau Ceti's condition number `TauCeti.conditionNumber`, with `κ ≥ 1` for units when `‖1‖ = 1`,
  and the Neumann bound `‖(u + t)⁻¹‖ ≤ ‖u⁻¹‖ / (1 − ‖u⁻¹‖ ‖t‖)`
  (`NormedRing.norm_inverse_add_le`). With Mathlib's `Ring.inverse_sub_inverse` it gives the
  perturbation bound for the inverse, `‖(a + e)⁻¹ − a⁻¹‖ ≤ ‖a⁻¹‖² ‖e‖ / (1 − ‖a⁻¹‖ ‖e‖)`, in two
  steps; that bound is recorded in 1.1 and is not a target.
- Tau Ceti's analytic implicit root theorem (`AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`)
  and its form for polynomial families (`TauCeti.Polynomial.analyticAt_eval_of_analyticAt_coeff`,
  `TauCeti.Polynomial.analyticAt_of_eventually_isRoot`): a simple root of an analytic family of
  polynomials moves analytically. They give the existence and analyticity of the branch in 4.2;
  4.2 adds the value of its derivative.
- Tau Ceti's continuity of the roots of polynomial families
  (`Polynomial.eventually_rel_roots_norm_sub_lt`) and Rouché's theorem (`TauCeti.rouche`), used in
  3.3.
- Mathlib's Gershgorin theorem `eigenvalue_mem_ball` (every eigenvalue lies in a disc) and the
  invertibility of strictly diagonally dominant matrices; 3.3 adds the count.
- Weyl's eigenvalue bound for Hermitian matrices and symmetric operators
  (`Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`,
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`, Tau Ceti), owned as a target by
  OperatorTheory/PolarDecomposition, Part A, PD-A53 (Weyl's perturbation bound), and the
  Hoffman–Wielandt inequality
  (`Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq`, Tau Ceti).
  3.2 differs: `a` is normal rather than self-adjoint, `b` is arbitrary, and the conclusion
  is an inclusion of spectra, not a matching of ordered eigenvalues.
- Tau Ceti's inverse bound for a self-adjoint element of a C⋆-algebra with a spectral gap about
  `0` (`IsSelfAdjoint.isUnit_and_norm_ringInverse_le`); the route of 3.2 needs the normal case,
  at a non-real point as well.
- Tau Ceti's approximation numbers (`ContinuousLinearMap.singularValue`), their coercive lower
  bound (`ContinuousLinearMap.le_singularValue_of_lt_rank`) and the Eckart–Young identification
  with singular values in finite-dimensional inner product spaces
  (`ContinuousLinearMap.singularValue_eq_linearMap_singularValues`), owned as targets by
  OperatorTheory/OperatorIdeals (OI-A01, OI-A32 and OI-A49, the Eckart–Young identification;
  §1.5 in its sectioned numbering). Together with the identity `σ_min = ‖A⁻¹‖⁻¹` they give the
  finite-dimensional case of 1.2 for the Euclidean norm; 1.2 holds for every norm and does not
  depend on that roadmap.

Left to other roadmaps:

- OperatorTheory/ToeplitzOperators 4.2 (coordinate compressions and condition numbers) owns the
  condition numbers of finite sections of an operator and the elementary properties
  `κ(A⁻¹) = κ(A†) = κ(A)`, `κ(cA) = κ(A)` and `κ(AB) ≤ κ(A) κ(B)`; they are not restated.
- OperatorTheory/SpectralSubspacePerturbation owns the perturbation of spectral and singular
  subspaces: Sylvester equations, the Davis–Kahan `sin Θ`, `tan Θ`, `sin 2Θ` and `tan 2Θ`
  theorems, the Hermitian dilation and the singular-subspace bounds of its Part D (Layer 4 in its
  sectioned numbering). Nothing here is about subspaces; Wedin's theorem for singular subspaces
  is not treated here.
- OperatorTheory/UnboundedOperators 5.5 (local analytic perturbation and isolated spectral
  branches, UO-E04a) owns analytic perturbation of isolated eigenvalues of self-adjoint operators
  under relatively bounded symmetric perturbations, with `λ′(0) = ⟨u₀, B u₀⟩`. 4.2 is about a
  matrix that need not be normal and a direction `E` that need not be Hermitian, with a left
  eigenvector in the formula; for Hermitian data it reduces to that first-order term.
- OperatorTheory/Majorization owns majorization, the forward Schur–Horn inequality, Ky Fan sums
  and unitarily invariant seminorms; OperatorTheory/OperatorIdeals owns Weyl's bound for
  approximation numbers (OI-A50).

Outside the scope: floating-point arithmetic and rounding errors, and the stability of any
procedure; componentwise condition numbers of solutions (Skeel); perturbation of eigenvectors and
invariant subspaces; pseudospectra; the Kahan–Parlett–Jiang two-sided backward error; the
perturbation of eigenvalues of a defective matrix through its Jordan form; least-squares
problems.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Normed/Ring/Units.lean`: `Units.add` (for a unit `x` and `‖t‖ < ‖x⁻¹‖⁻¹`,
  `x + t` is a unit), `nonunits.isClosed` (the non-units of a complete normed ring form a closed
  set). `Mathlib/Algebra/Ring/Invertible.lean`: `Ring.inverse_sub_inverse`
  (`a⁻¹ − b⁻¹ = a⁻¹ (b − a) b⁻¹` when `a` and `b` are both units or both not).
- `Mathlib/Analysis/Normed/Module/HahnBanach.lean`: `exists_dual_vector` (over `ℝ` or `ℂ`, for
  `x` of nonzero norm a functional `g` with `‖g‖ = 1` and `g x = ‖x‖`).
- `Mathlib/Analysis/Normed/Operator/Basic.lean`: `ContinuousLinearMap.le_opNorm`
  (`‖T x‖ ≤ ‖T‖ ‖x‖`), `ContinuousLinearMap.opNorm_le_bound` (a pointwise bound `‖T x‖ ≤ M ‖x‖`
  with `M ≥ 0` bounds `‖T‖`). `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`:
  `ContinuousLinearMap.smulRight` (the rank-one operator `z ↦ g z • y`).
- `Mathlib/Analysis/Normed/Lp/PiLp.lean`: `PiLp`, `WithLp.toLp`, `PiLp.norm_eq_sum`,
  `PiLp.norm_eq_ciSup` (the `ℓ^p` norm on a finite product).
- `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`: `FiniteDimensional.complete` (a
  finite-dimensional space over `ℝ` or `ℂ` is complete).
  `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`: `IsClosed.exists_infDist_eq_dist` (a
  nonempty closed set in a proper space contains a point nearest to a given point).
- `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.hasEigenvalue_iff_mem_spectrum` (in
  finite dimension the spectrum is the set of eigenvalues), `Module.End.maxGenEigenspace` (the
  generalized eigenspace). `Mathlib/LinearAlgebra/Eigenspace/Zero.lean`:
  `LinearMap.finrank_maxGenEigenspace_eq` (its dimension is the root multiplicity of the
  characteristic polynomial). `Mathlib/LinearAlgebra/Eigenspace/Matrix.lean`:
  `Matrix.spectrum_toLin'`. `Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean`:
  `LinearMap.finrank_range_add_finrank_ker` (rank–nullity).
- `Mathlib/Analysis/CStarAlgebra/Spectrum.lean`: `IsStarNormal.spectralRadius_eq_nnnorm` (for a
  normal element of a C⋆-algebra the spectral radius is the norm); `CStarAlgebra`;
  `spectrum.map_inv` (`Mathlib/Algebra/Algebra/Spectrum/Basic.lean`: the spectrum of `a⁻¹` is the
  set of inverses of the spectrum of a unit `a`); `spectrum.isCompact`
  (`Mathlib/Analysis/Normed/Algebra/Spectrum.lean`) and `spectrum.nonempty`
  (`Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`: in a nontrivial complex Banach algebra
  the spectrum is nonempty).
- `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`: `eigenvalue_mem_ball` (every eigenvalue of a
  square matrix lies in the disc about some diagonal entry with radius the sum of the moduli of
  the other entries of its row).
- `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean` and `Charpoly/Eigs.lean`: `Matrix.charpoly`,
  `Matrix.mem_spectrum_iff_isRoot_charpoly`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`:
  `Matrix.charpoly_degree_eq_dim`; `Mathlib/LinearAlgebra/Matrix/Adjugate.lean`:
  `Matrix.adjugate`.
- `Mathlib/Algebra/Polynomial/Roots.lean` and `Mathlib/FieldTheory/IsAlgClosed/Basic.lean`:
  `Polynomial.roots`, `Polynomial.rootMultiplicity`, `IsAlgClosed.card_roots_eq_natDegree` (over
  `ℂ` a polynomial has as many roots, with multiplicity, as its degree).
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.mulVec`, `Matrix.vecMul`, `dotProduct`.
- `Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`: `ciSup_le`, `le_ciSup`.

### From Tau Ceti

- `TauCeti/Analysis/Normed/Ring/StableSequence.lean`: `TauCeti.conditionNumber`
  (`‖a‖ ‖Ring.inverse a‖`, `0` at a non-unit), `TauCeti.one_le_conditionNumber` (`κ ≥ 1` for a
  unit when `‖1‖ = 1`).
- `TauCeti/Analysis/Normed/Ring/Units.lean`: `NormedRing.norm_inverse_add_le` (in a normed ring
  with `‖1‖ = 1` and summable geometric series, for a unit `u` with `‖u⁻¹‖ ‖t‖ < 1`,
  `‖(u + t)⁻¹‖ ≤ ‖u⁻¹‖ / (1 − ‖u⁻¹‖ ‖t‖)`).
- `TauCeti/Analysis/Normed/Operator/Basic.lean`:
  `ContinuousLinearMap.norm_le_norm_ringInverse_mul_norm_apply` (an invertible operator satisfies
  `‖x‖ ≤ ‖A⁻¹‖ ‖A x‖`).
- `TauCeti/Analysis/InnerProductSpace/NormalOperator.lean`:
  `LinearMap.exists_orthonormalBasis_apply_eq_smul_of_isStarNormal` (a normal operator on a
  finite-dimensional complex inner product space has an orthonormal eigenbasis), named in 3.2.
- `TauCeti/Analysis/Polynomial/ContinuityOfRoots/Basic.lean`:
  `Polynomial.eventually_rel_roots_norm_sub_lt` (for a family of polynomials of fixed degree with
  coefficients continuous at `x₀`, the roots at nearby parameters are matched with multiplicity
  to those at `x₀`, matched roots at distance less than a given `ε`).
- `TauCeti/Analysis/Complex/Conformal/Rouche.lean`: `TauCeti.rouche` (if `f` and `g` are
  holomorphic on a closed disc and `‖f − g‖ < ‖f‖` on its boundary circle, they have the same
  number of zeros in the open disc, with multiplicity).
- `TauCeti/Analysis/Analytic/Inverse.lean`: `AnalyticAt.exists_analyticAt_eventually_eq_zero_iff`
  (the analytic implicit root theorem: near a zero of an analytic `f(w, z)` with `∂f/∂z ≠ 0`, the
  zeros form the graph of a function of `w` analytic at the base point).
- `TauCeti/Analysis/Polynomial/SimpleRoots/Covering.lean`:
  `TauCeti.Polynomial.analyticAt_eval_of_analyticAt_coeff` (a polynomial family with analytic
  coefficients and bounded degree is jointly analytic in the parameter and the variable);
  `TauCeti.Polynomial.analyticAt_of_eventually_isRoot`, cited in the scope.
- `TauCeti/Analysis/Calculus/FDeriv/Det.lean`: `Matrix.fderiv_det_apply_adjugate` (Jacobi's
  formula `D det(A) H = tr(adj(A) H)` at every matrix, singular ones included).
- Cited in the scope only: `Matrix.IsHermitian.abs_eigenvalues₀_sub_le_norm`
  (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`),
  `LinearMap.IsSymmetric.abs_eigenvalue_sub_eigenvalue_le_norm`
  (`TauCeti/Analysis/InnerProductSpace/CourantFischer.lean`),
  `Matrix.IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq`
  (`TauCeti/Analysis/Matrix/HoffmanWielandt.lean`), `IsSelfAdjoint.isUnit_and_norm_ringInverse_le`
  (`TauCeti/Analysis/CStarAlgebra/SelfAdjointGapInverse.lean`), `ContinuousLinearMap.singularValue`,
  `ContinuousLinearMap.le_singularValue_of_lt_rank` and
  `ContinuousLinearMap.singularValue_eq_linearMap_singularValues`
  (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/`).

## References

- Yousef Saad, *Numerical Methods for Large Eigenvalue Problems*, 2nd edition, SIAM (2011),
  available from the author's page at the University of Minnesota: Example 1.2 (p. 17), §3.1.5
  (p. 57), Theorem 3.6 (p. 59), Corollary 3.3 (p. 61), Proposition 3.4 (p. 66), §3.3.1 and
  Definition 3.1 (pp. 70–71), Theorems 3.11 and 3.12 (pp. 77–78).
- Yousef Saad, *Iterative Methods for Sparse Linear Systems*, 2nd edition, SIAM (2003),
  available from the author's page: §1.13.2 and equation (1.76) (p. 41), Example 1.5 (p. 42).
- James W. Demmel, *On condition numbers and the distance to the nearest ill-posed problem*,
  Numerische Mathematik 51 (1987), 251–289, available from the author's course page at Berkeley:
  Theorem 1 (p. 257).
- James W. Demmel, notes for Math 221, Lecture 3, dated 10 September 2024, from the author's
  course page at Berkeley. Its lemmas are unnumbered; cited above are, in their order in the
  notes, the lemma bounding `norm(inv(A−E) − Z)` (the third lemma on the Neumann series), the
  bound on `norm(dx)/norm(x)` for the perturbed system, and the theorem on the smallest `E` with
  `(A + E) x' = b`.
- Attributions made in prose without a locator: F. L. Bauer and C. T. Fike (the Bauer–Fike
  theorem); N. Gastinel and W. Kahan (the distance to singularity); J. L. Rigal and J. Gaches (the
  normwise backward error); W. Oettli and W. Prager (the componentwise backward error);
  S. Gerschgorin (the disc theorem and the count).
